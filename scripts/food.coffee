# Description:
#   hubot suggests a place to go for food
#
# Dependencies:
#   node-foursquare-venues
#
# Configuration:
#   configure your foursquare client id and secret and your location
#
# Commands:
#   hubot food - returns a foursquare suggestion
#


# get it from: https://foursquare.com/developers/apps
clientId = 'RISTAJYHPWLYCH0SRJ4CS5FYZSPBD0JIR5CNB0T3VEJCMU1K'
clientSecret = 'EZZGTAGUSLB23FVMTXNGPNED0BGELR1KDGTWZJAAIIN5W5BE'
ll = '52.524694, 13.388904'

foursquare = new require('node-foursquare-venues')(clientId, clientSecret)

module.exports = (robot) ->
  robot.respond /food|lunch/i, (msg) ->
    search = {
      'limit': 50,
      'radius': '500',
      'query': 'food',
      'openNow': true,
      'll': ll
    }

    foursquare.venues.explore search, (err, response) ->
      if response.meta.code != 200
        return
      items = response.response.groups[0].items
      factor = Math.floor(Math.random() * items.length)
      suggestion = items[Math.floor(factor - (factor / 2))]
      venue = suggestion.venue
      name = venue.name
      address = venue.location.address
      url = "https://foursquare.com/v/#{venue.id}"
      text = "how about: #{name}"
      if address
        text = text + " on #{address}"
      text = text + " - #{url}"

      msg.send text
