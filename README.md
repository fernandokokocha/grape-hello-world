# Hello world in Grape

## Setup

```
bundle install
rackup
```

This should generate a simple JSON served under following URL:

`http://localhost:9292/api/v1/hello`

## Swagger

JSON for Swagger is generated by `grape-swagger` gem under following URL:

`http://localhost:9292/api/v1/swagger_doc`

HTML root for Swagger lives in `doc/index.html`.

## RSpec

To run tests, issue: `rspec`.
