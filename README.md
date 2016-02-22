# hubot-pivotal-search

Harness the full power of Pivotal Tracker's search from the comfort of your chat client.

See [`src/pivotal-search.coffee`](src/pivotal-search.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-pivotal-search --save`

Then add **hubot-pivotal-search** to your `external-scripts.json`:

```json
[
  "hubot-pivotal-search"
]
```

Set the following environment variables:

```shell
HUBOT_PIVOTAL_TOKEN    # API token found on https://www.pivotaltracker.com/profile
HUBOT_PIVOTAL_PROJECTS # Get from project URL, save as JSON like this [{"id":"1234567"}, {"id":"1234568"}]
```

## Sample Interaction

```
user1>> hubot pivotal mobile
hubot>> 12345678 As a mobile user I want… so I can… (unscheduled) - https://www.pivotaltracker.com/story/show/12345678

user1>> hubot piv owner:mh state:unstarted
hubot>> 12345679 As a user I want… so I can… (unstarted) - https://www.pivotaltracker.com/story/show/12345679
        12345680 As a Internet Explorer user I want… so I can… (unstarted) - https://www.pivotaltracker.com/story/show/12345680
```

See [Pivotal Tracker search help](https://www.pivotaltracker.com/help/faq#howcanasearchberefined) for more parameters.
