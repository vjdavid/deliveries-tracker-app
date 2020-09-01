# Deliveries Tracker App

  - Return specific errors by tracking numbers
  - Request multiple tracking_numbers at the same time
  - Convert status codes formats between to specifc codes

### Installation

Install the dependencies and start the server.

```sh
$ cd deliveries-tracker-app
$ bundle install
$ rails s
```
### Usage

The application only serves an endpoint where you can find all details of a requested tracking numbers.

```sh
$ curl --location --request POST 'localhost:3000/shipping_tracks' \
--header 'Content-Type: application/json' \
--data-raw '{ 
    "data": [
      {
        "tracking_number": "333333333333",
        "carrier": "FEDEX"
      }
    ]
}' 
```

### Todos

- Implement all supported error messages by Fedex Web Service
- Implement timeout errors
- Fix Travis bundle error 
