Package.describe({
  name: 'sunstory:meteor-template-breakpoints',
  summary: 'Reactive template media breakpoints.',
  version: '1.1.0',
  git: 'https://github.com/sunstorymvp/meteor-template-breakpoints.git'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1.0.3');
  api.use('coffeescript');
  api.addFiles('meteor-template-breakpoints.coffee', 'client');
});
