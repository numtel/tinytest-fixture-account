# tinytest-fixture-account
# MIT License ben@latenightsketches.com
# lib/fixtureAccount.coffee
# Create a fixture account and remove it when done

# @param {func} done - pass through tinytest's onComplete callback
# @param {obj} data - Specify data for user beyond default
# @param {func} callback(error, cleanup) - 
#               Perform test while logged in, call cleanup() when done
@fixtureAccount = (done, data, callback) ->
  data = _.defaults data || {},
    username: 'testUser5'
    password: 'password1'
  Accounts.createUser data, (error) ->
    if error
      callback? error
      return done?()
    cleanup = ->
      Meteor.call 'fixtureAccountRemove', (error, result) ->
        done?()
    callback? undefined, cleanup

if Meteor.isServer
  Future = Npm.require 'fibers/future'
  Meteor.methods
    fixtureAccountRemove: () ->
      fut = new Future()
      Meteor.users.remove this.userId, (error)->
        throw error if error
        fut.return()
      return fut.wait()
