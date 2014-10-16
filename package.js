// tinytest-fixture-account
// MIT License ben@latenightsketches.com

Package.describe({
  name: 'numtel:tinytest-fixture-account',
  summary: 'Tinytest fixture to create a user account for client-side tests',
  version: '0.0.1',
  git: 'https://github.com/numtel/tinytest-fixture-account.git',
  debugOnly: true
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@0.9.3.1');
  api.use('coffeescript');
  api.use('accounts-password');

  api.addFiles('lib/fixtureAccount.coffee');
  api.export('fixtureAccount', 'client');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('accounts-password');
  api.use('coffeescript');
  api.use('numtel:tinytest-fixture-account');
  api.addFiles('test/fixtureAccount.coffee');
});
