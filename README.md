# Hooky

Hooky is a Ruby gem that provides a simple way to test webhooks.

By storing example request data and configuration in a `.hooky` directory in your Rails root directory, you can easily
test webhooks by running `hooky <webhook_name>`.

You can create as many webhooks as you required but they must be named like so:

- `.hooky/<webhook_name>/data.json`
- `.hooky/<webhook_name>/config.json`

The `config.json` file contains details such as the URL, HTTP Method and any headers. For example:

```json
{
  "url": "https://example.com/webhooks/order.created",
  "method": "GET",
  "headers": {
    "Content-Type": "application/json"
  }
}
```

The `data.json` file will be the request body that is sent. For example:

```json
{
  "id": 123,
  "name": "John Doe"
}
```

## Installation

Install the gem by running `gem install hookyrb`.

## Usage

```bash
# To add the hooky gem to your Gemfile, create a .hooky directory and create an example webhook, run:
hookyrb init

# To test a webhook, run:
hookyrb hook <webhook_name>
```

To add the gem to your Rails app and create an example webhook, run `bundle exec hooky init`. This will create a `.hooky` directory.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/hooky.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
