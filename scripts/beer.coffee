module.exports = (robot) ->
  robot.respond /is it beer o clock ?\?/i, (msg) ->
    date = new Date()
    hours = date.getUTCHours() + 2

    if hours < 18 and hours > 6
      msg.reply("no :(")
    else
      msg.reply("YES :beer:")
