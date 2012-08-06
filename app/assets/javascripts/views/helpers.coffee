#= require jquery

App.helpers =
  nameToInitials: (name) ->
    return '' unless name
    name = name.toUpperCase()
    name = $.trim(name)
    initials = (word[0] for word in name.split(' ')[0..1])
    initials.join('')

  gravatarImg: (hash, options={}) ->
    size = 42
    """
      <img class='#{options.class}' src="http://www.gravatar.com/avatar/#{hash}?s=#{size}"></img>
    """
