Meteor.startup ->
  Template.mediaQueryBreakpoints = new Blaze.ReactiveVar
    small: 0
    medium: 640
    large: 1200
    xlarge: 1440
    xxlarge: 1920

  initializedQueries = []

  Tracker.autorun ->
    initializedQueries.forEach (query) -> query.mediaQueryList.removeListener query.listener
    initializedQueries = []

    breakpoints = Template.mediaQueryBreakpoints.get()

    Object.keys(breakpoints).forEach (screensize, index, screensizes) ->
      prevScreensize = screensizes[index - 1]
      nextScreensize = screensizes[index + 1]
      minWidth = if prevScreensize then " and (min-width: #{breakpoints[screensize]}px)" else ''
      maxWidth = if nextScreensize then " and (max-width: #{breakpoints[nextScreensize] - 1}px)" else ''
      mediaQueryString = "only screen#{minWidth}#{maxWidth}"

      mediaQueryList = window.matchMedia mediaQueryString
      if mediaQueryList.matches then Session.set 'screensize', screensize

      listener = (e) -> if e.matches then Session.set 'screensize', screensize
      mediaQueryList.addListener listener
      initializedQueries.push mediaQueryList: mediaQueryList, listener: listener

  Template.registerHelper 'screensize', (screensize) ->
    Session.equals 'screensize', screensize
