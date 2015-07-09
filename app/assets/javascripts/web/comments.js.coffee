$ ->
  comment_template = (comment) ->
    "<div class='row comment'><F2>
      <div class='small-2 columns'>
        <img src='#{comment.image}' alt='Small muptah5vzqy' />
      </div>
      <div class='small-10 columns text'>
        <h4>
          #{comment.name}
        </h4>
          #{comment.text}
      </div>
    </div>"

  append_comment = (comment) ->
    $last_comment = $('.comment').last()
    $last_comment.after comment_template comment
    return

  $('.new_comment').on('ajax:success', (xhr, data) ->
    append_comment data
    return
  ).on 'ajax:error', (xhr, data) ->
    alert 'error'
    return
