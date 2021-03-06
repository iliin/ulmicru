formDisplay = (component) ->
  if component.props.tagType == 'none'
    return 'none'
  else
    return 'block'

init_select2 = (component) ->
  $('.select2-tags').each ->
    if component.props.tagType == 'string'
      dataType = 'string'
    else
      dataType = component.props.targetType
    if $(this).hasClass dataType
      url = ''
      switch dataType
        when 'string'
          url = Routes.api_admin_tags_path()
        when 'member'
          url = Routes.api_admin_members_path()
        when 'event'
          url = Routes.api_admin_events_path()
        when 'team'
          url = Routes.api_admin_teams_path()
        when 'activity_line'
          url = Routes.api_admin_activity_lines_path()
      $(this).select2 {
        ajax: {
          url: url
          data: (term, page) ->
            {
              q: term
              page: page
            }
          dataType: 'json'
          delay: 250
          processResults: (data) ->
            tags_results = []
            $(data).each ->
              switch dataType
                when 'string'
                  tags_results.push {
                    id: @.text
                    text: @.text
                  }
                when 'member'
                  tags_results.push {
                    id: @.id
                    text: "#{@.ticket} | #{@.first_name} #{@.last_name}"
                  }
                when 'event', 'team', 'activity_line'
                  tags_results.push {
                    id: @.id
                    text: @.title
                  }
            {
              results: tags_results
            }
        }
        minimumInputLength: 2
      }

formDisplay = (component) ->
  if component.props.tagType == 'none'
    return 'none'
  else
    return 'block'

targetTypeInput = (component) ->
  unless component.props.targetType == 'none'
    targetType = component.props.targetType.camelize()
    `<div className='input hidden tag_target_type'>
        <input className='hidden' type='hidden' name='tag[target_type]' id='tag_target_type' value={targetType} />
      </div>`

hiddenInputs = (component) ->
  recordType = component.props.recordType.camelize()
  `<div>
    <div className='input hidden tag_tag_type'>
      <input className='hidden' type='hidden' name='tag[tag_type]' id='tag_tag_type' value={component.props.tagType} />
    </div>
    <div className='input hidden tag_record_type'>
      <input value='News' className='hidden' type='hidden' name='tag[record_type]' id='tag_record_type' value={recordType} />
    </div>
    <div className='input hidden tag_record_id'>
      <input value={component.props.record.id} className='hidden' type='hidden' name='tag[record_id]' id='tag_record_id' />
    </div>
    {targetTypeInput(component)}
  </div>`

tagSelectDisplay = (targetType, type, component) ->
  if targetType == type
    return 'block'
  else
    return 'none'

linkSelect = (type) ->
  classes = "select optional select2-tags #{type}"
  `<div className='input select optional tag_target_id'>
    <select className={classes} name='tag[target_id]' id='tag_target_id' data-type={type} style={{width: '100%'}}/>
  </div>`

getSelectToView = (component) ->
  switch component.props.tagType
    when 'string'
      if component.state.stringInputVisible == 'hidden'
        `<div className='input select optional tag_text'>
          <select className='select optional select2-tags string' name='tag[text]' id='tag_text' data-type='string' style={{width: '100%'}}/>
        </div>`
    when 'link'
      linkSelect component.props.targetType

newStringTagInput = (component) ->
  if component.props.tagType == 'string' && component.state.stringInputVisible == 'visible'
    `<div className='input text'>
      <input className='form-control input text' name='tag[text]' id='tag_text' />
    </div>`

newStringTagButton = (component) ->
  if component.props.tagType == 'string'
    `<a onClick={component.stringTagForm} className='btn btn-xs btn-warning' id='add_new_string_tag' href='#'>Создать новый</a>`

@TagOptionForm = React.createClass
  getInitialState: ->
    {
      stringInputVisible: 'hidden'
      targetId: ''
    }
  changeValue: (inputId) ->
    this.setState { targetId: $("##{inputId}").val() }
  stringTagForm: (e) ->
    e.preventDefault()
    if this.state.stringInputVisible == 'visible'
      @.setState { stringInputVisible: 'hidden' }
    else
      @.setState { stringInputVisible: 'visible' }
  componentDidUpdate: ->
    init_select2 this
    component = this
    $('.tag_form').on 'ajax:success', component.props.onTagSubmit
  render: ->
    display = formDisplay @
    `<form className='tag_form' action={Routes.api_admin_tags_path()} onSubmit={this.props.onTagSubmit} data-remote='true' method='post' style={{display}}>
      {hiddenInputs(this)}
      {getSelectToView(this)}
      {newStringTagInput(this)}
      <input type='submit' name='commit' value='Добавить тег' className='button btn btn-xs btn-success' />
      {newStringTagButton(this)}
    </form>`
