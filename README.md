Requirements
====

* Bundler 10.x
* Ruby 2.x

Set up
===

`$ bundle install`

Running tests
===

`$ rspec spec`

How to use
===

```bash
$ bin/parser logs/webserver.log

/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits

/help_page/1 23 unique views
/contact 23 unique views
/home 23 unique views
/index 23 unique views
/about/2 22 unique views
/about 21 unique views
```
