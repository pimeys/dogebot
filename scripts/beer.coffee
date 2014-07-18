module.exports = (robot) ->
  robot.respond /is it beer o clock ?\?/i, (msg) ->
    date = new Date()
    hours = date.getUTCHours() + 2

    if hours >= 18
      msg.reply("YES :beer:")
    else
      msg.reply("no :(")
