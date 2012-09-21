# Description:
#   "A simple set of endpoints that allow you to authenticate with instagram, once you've done so, all instagram's you post will automatically be inserted into the channel"
#
# Dependencies:
#   "querystring": "0.1.0"
#   "instagram-node-lib": "0.1.0"
#
# Configuration:
#   None
#
# Commands:
#   None
#
# URLs:
#   GET /instagram
#     Initiates oauth handshake.
#   GET /instagram/callback
#     Finishes oauth handshake.
#   GET /instagram/hook
#     Approves oauth connection.
#   POST /instagram/hook
#     Receives webhooks for new images.
#
# Authors:
#   adelcambre

querystring = require('querystring')
# Instagram = require('instagram-node-lib')

module.exports = (robot) ->
  robot.hear /instagram/, (msg) ->
    msg.send "Sup! It's instagram!"

  robot.router.get "/instagram", (req, res) ->
    query = querystring.parse(req._parsedUrl.query)

    user = {}
    user.room = query.room if query.room
    user.type = query.type if query.type

    robot.send(user, query.message)

    res.end "Said #{query.message}"
