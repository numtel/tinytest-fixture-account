# tinytest-fixture-account
# MIT License ben@latenightsketches.com
# test/fixtureAccount.coffee

if Meteor.isClient
  Tinytest.addAsync 'account created + deleted', (test, done) ->
    # Create an account then cleanup, then do it with same username again to 
    # make sure account is deleted.

    secondAccount = ->
      fixtureAccount done, {}, (error, cleanup) ->
        throw error if error
        user = Meteor.user()
        test.equal user.username, 'testUser5'
        cleanup()

    fixtureAccount secondAccount, {}, (error, cleanup) ->
      throw error if error
      user = Meteor.user()
      test.equal user.username, 'testUser5'
      cleanup()
