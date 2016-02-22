# Description
#   Harness the full power of Pivotal Tracker's search
#
# Configuration:
#   HUBOT_PIVOTAL_TOKEN
#   HUBOT_PIVOTAL_PROJECTS
#
# Commands:
#   hubot piv|pivotal <string> - returns list of matching Pivotal Tracker stories
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Mat Harden <matharden@gmail.com>


module.exports = (robot) ->

  robot.respond /(piv|pivotal) (.*)/i, (msg) ->
    token = process.env.HUBOT_PIVOTAL_TOKEN
    query = encodeURIComponent(msg.match[2])
    projects = JSON.parse process.env.HUBOT_PIVOTAL_PROJECTS

    for project in projects
      msg.http("https://www.pivotaltracker.com/services/v5/projects/#{project.id}/stories?filter=#{query}").headers("X-TrackerToken": token).get() (err, res, body) ->
        if err
          msg.send "Pivotal says: #{err}"
          return
        if res.statusCode != 500
          results = []
          stories = JSON.parse body
          for story in stories
            result = "#{story.id} #{story.name}"
            result += " (#{story.current_state})" if story.current_state
            result += " - #{story.url}"
            results.push result
          msg.send results.join("\n")
