module.exports = (robot) ->
  robot.respond /decide "(.*)"/i, (msg) ->
    options = msg.match[1].split('" "')
    msg.reply("Definitely #{msg.random options}.")

  robot.respond /decide ([^"]+)/i, (msg) ->
    options = msg.match[1].split(' ')
    msg.reply("Definitely #{msg.random options}.")
