# Tinytest Account Fixture Meteor Package

Create a fixture account for running tests that require being logged in and
then remove the account when complete.

[![Build Status](https://travis-ci.org/numtel/tinytest-fixture-account.svg?branch=master)](https://travis-ci.org/numtel/tinytest-fixture-account)

## Installation
The `accounts-password` package must be installed to use this package.

```bash
$ meteor add accounts-password numtel:tinytest-fixture-account
```

## Example in Coffeescript

```coffee
if Meteor.isClient
  Tinytest.addAsync 'needs an account to run', (test, done) ->
    fixtureAccount done, {}, (error, cleanup) ->
      # Error will be thrown if username exists
      throw error if error 

      # ... Perform test while logged in

      # Remove fixture account, done() is called automatically
      cleanup()
```

## Run Tests

```bash
$ git clone https://github.com/numtel/tinytest-fixture-account.git
$ cd tinytest-fixture-account
$ meteor test-packages ./
```

Open your browser to `http://localhost:3000/`

## License

MIT
