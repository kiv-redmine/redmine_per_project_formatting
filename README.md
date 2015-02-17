Redmine per project formatting plugin
=======================

[![Build Status](https://travis-ci.org/kiv-redmine/redmine_per_project_formatting.svg?branch=testing)](https://travis-ci.org/kiv-redmine/redmine_per_project_formatting) [![Inline docs](http://inch-ci.org/github/kiv-redmine/redmine_per_project_formatting.svg?branch=master)](http://inch-ci.org/github/kiv-redmine/redmine_per_project_formatting)

This plugin enables text formatting settings per project.
It also be able to change text format per project module. (e.g. issue_tracking, wiki, news, board...)

Plugin installation and setup
-----------------------------

1. Copy the plugin directory into the plugins directory (make sure the name is redmine_per_project_formatting)
1. Execute migration

        rake redmine:plugins:migrate RAILS_ENV=production

1. Start Redmine
1. Configure text formatting per project in project settings screen

How to run build on travis?
---------------------------
First of all try to run tests in your environment:

```ruby
ruby plugins/redmine_more_blocks_extension/test/**/*.rb
```

If everyhting is ok, push your changes into master branch and run merge script, which merge master into testing and push to remote (github):

```bash
./push_for_test.sh
```


