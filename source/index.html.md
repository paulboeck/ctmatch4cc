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

<aside class="notice">
The Forte-hosted server can be accessed at <tt>https://dev01.nimblify.com/nimblify-api-web/public/patients</tt>
</aside>

# Authentication

The CTmatch4CC endpoint is a public endpoint, so no further authorization is needed to access the registry data. Individual servers may rate-limit requests, so clients should check and react to an HTTP 429 status (Too Many Requests) response from the server.


## Patients

```shell
curl "http://example.com/api/patients?anatomical-site-desc=lung"
```

```javascript
$.ajax({
  url: 'http://example.com/api/patients',
  type: 'get',
  data: {
    'anatomical-site-desc': 'lung'
  },
  success: function(data, status, jqXHR) {
    console.log(data);
  }
});
```

> The above command returns JSON structured like this:

```json
[
    {
        "orgName": "Outstanding Research Center",
        "patientCount": 131
    },
    {
        "orgName": "Fabulous Research Site",
        "patientCount": 128
    },
    {
        "orgName": "Amazing Institution",
        "patientCount": 6338
    }
]
```

The main endpoint to retrieve subject counts for a given set of query parameters.

### HTTP Request

`GET http://example.com/api/patients`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
`anatomical-site-desc` | true | The name of the anatomical site to search for. Should be an item from the [CTRP Anatomic Sites](https://wiki.nci.nih.gov/display/CTRPdoc/Anatomic+Sites) list.
`min-age` | false | If set, limits results to only participants of the given age or older
`max-age` | false | If set, limits results to only participants of the given age or younger
`gender` | false | If set, limits results to only participants of the given gender
`zip` | false | If set, limits results to only participants living in the given zip code
`details` | false | If set, to "Y" returns more details about the participant set

The `anatomical-site-desc` parameter is a wildcard search; it will return a match for all anatomical sites that have the supplied value anywhere in their description.

### Detailed result set

```shell
curl "http://example.com/api/patients?anatomical-site-desc=lung&details=Y"
```

```javascript
$.ajax({
  url: 'http://example.com/api/patients',
  type: 'get',
  data: {
    'anatomical-site-desc': 'lung',
    'details': 'Y'
  },
  success: function(data, status, jqXHR) {
    console.log(data);
  }
});
```

> The above command returns JSON structured like this:

```json
[
    {
        "orgName": "EVAL Patch org",
        "patientCount": 76,
        "patients": [
            {
                "mrn": "8713",
                "race": "White",
                "gender": "M",
                "siteDesc": "Lung",
                "siteCode": "C34.9",
                "dob": "06/14/2007",
                "age": 10
            },
            {
                "mrn": "11781",
                "race": "White",
                "gender": "F",
                "siteDesc": "Lung",
                "siteCode": "C34.9",
                "dob": "07/12/1958",
                "age": 59
            },
            {
                "mrn": "11852",
                "race": "White",
                "gender": "M",
                "siteDesc": "Lung",
                "siteCode": "C34.9",
                "dob": "09/18/1963",
                "age": 54
            },
            {
                "mrn": "11879",
                "race": "White",
                "gender": "F",
                "siteDesc": "Lung",
                "siteCode": "C34.9",
                "dob": "11/02/1983",
                "age": 34
            },
            {
                "mrn": "12777",
                "race": "White",
                "gender": "F",
                "siteDesc": "Lung",
                "siteCode": "C34.9",
                "dob": "08/19/1990",
                "age": 27
            }
        ]
    },
    {
        "orgName": "Test Customer 2 upload org",
        "patientCount": 1198,
        "patients": [
            {
                "mrn": "1132",
                "race": "Black",
                "gender": "M",
                "siteDesc": "Lung",
                "siteCode": "162.0",
                "dob": "08/06/1954",
                "age": 63
            },
            {
                "mrn": "1133",
                "race": "White",
                "gender": "F",
                "siteDesc": "Lung",
                "siteCode": "162.0",
                "dob": "12/24/1955",
                "age": 62
            },
            {
                "mrn": "1134",
                "race": "White",
                "gender": "M",
                "siteDesc": "Lung",
                "siteCode": "162.0",
                "dob": "10/19/1974",
                "age": 43
            },
            {
                "mrn": "1135",
                "race": "White",
                "gender": "F",
                "siteDesc": "Lung",
                "siteCode": "162.0",
                "dob": "03/21/1978",
                "age": 40
            },
            {
                "mrn": "1136",
                "race": "Black",
                "gender": "F",
                "siteDesc": "Lung",
                "siteCode": "162.0",
                "dob": "04/14/1966",
                "age": 52
            }
        ]
    }
]
```

If the `details` parameter is set to 'Y' when requesting a Participant list, more information is returned about each individual Participant in the result set.


Parameter | Description
--------- | -----------
`mrn` | The MRN number of the Participant.
`race` | Ethnicity grouping of the Participant.
`gender` | `M` or `F` to designate the Participant's gender.
`siteDesc` | The exact anatomical site description
`siteCode` | The anatomical site code
`dob` | Date of Birth of the Participant (given as MM/DD/YYYY)
`age` | Age of the Participant

