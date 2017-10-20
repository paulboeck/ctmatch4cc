---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - javascript

toc_footers:
  - <a href="http://www.ci4cc.org/">CI4CC</a>
  - <a href="https://forteresearch.com">Forte</a>

includes:
  - errors

search: true
---

# CTmatch4CC

This is the API documentation for the [CTmatch4CC Initiative](http://www.ci4cc.org/initiatives/ctmatch4cc). Any server that represents a registry supporting this initiative should be accessible using the following API methods.



# Authentication

The CTmatch4CC endpoint is a public endpoint, so no further authorization is needed to access the registry data. Individual servers may rate-limit requests, so clients should check and react to an HTTP 429 status (Too Many Requests) response from the server.


## Patients

```shell
curl "http://example.com/api/patients"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

The main endpoint to retrieve subject counts for a given set of query parameters.

### HTTP Request

`GET http://example.com/api/patients`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
anatomical-site-desc | true | The name of the anatomical site to search for
min-age | false | If set, limits results to only participants of the given age or older
max-age | false | If set, limits results to only participants of the given age or younger
gender | false | If set, limits results to only participants of the given gender
zip | false | If set, limits results to only participants living in the given zip code
details | false | If set, to "Y" returns more details about the participant set

<aside class="notice">
Getting detailed information about participants is dependant on ...?
</aside>

