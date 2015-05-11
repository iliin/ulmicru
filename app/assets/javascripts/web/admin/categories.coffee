$ -> 
  $("#sample_category_tree").treed()

$.fn.extend treed: (o) ->
  openedClass = 'glyphicon-minus-sign'
  closedClass = 'glyphicon-plus-sign'
  if typeof o != 'undefined'
    if typeof o.openedClass != 'undefined'
      openedClass = o.openedClass
    if typeof o.closedClass != 'undefined'
      closedClass = o.closedClass
  #initialize each of the top levels
  tree = $(this)
  tree.addClass 'tree'
  tree.find('li').has('ul').each ->
    branch = $(this)
    #li with children ul
    branch.prepend '<i class=\'indicator glyphicon ' + closedClass + '\'></i>'
    branch.addClass 'branch'
    branch.on 'click', (e) ->
      if this == e.target
        icon = $(this).children('i:first')
        icon.toggleClass openedClass + ' ' + closedClass
        $(this).children().children().toggle()
      return
    branch.children().children().toggle()
    return
  #fire event from the dynamically added icon
  tree.find('.branch .indicator').each ->
    $(this).on 'click', ->
      $(this).closest('li').click()
      return
    return
  #fire event to open branch if the li contains an anchor instead of text
  tree.find('.branch>a').first().each ->
    $(this).on 'click', (e) ->
      $(this).closest('li').click()
      e.preventDefault()
      return
    return
  #fire event to open branch if the li contains a button instead of text
  tree.find('.branch>button').each ->
    $(this).on 'click', (e) ->
      $(this).closest('li').click()
      e.preventDefault()
      return
    return
  return
