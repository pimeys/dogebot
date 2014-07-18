module.exports = (robot) ->
  robot.respond /(weather|w) (.*)/i, (msg) ->
    query = msg.match[2]
    robot.http("http://api.openweathermap.org/data/2.5/find")
      .query({
        units: 'metric'
        q: query
      })
      .get() (err, res, body) ->
        response    = JSON.parse(body)

        unless response?
          msg.send "Couldn't fetch weather for "#{query}\""
          return

        weather     = response['list'][0]

        unless weather?
          msg.send "Couldn't fetch weather for "#{query}\""
          return

        place        = weather['name']
        temperature  = weather['main']['temp']
        description  = weather['weather'][0]['description']
        country_code = weather['sys']['country']

        msg.send "#{place}, #{country_code}: #{temperature}ºC, #{description}"
