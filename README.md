# CannedHam

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

### Ruby version
`2.4`


### Install Postgresql
`brew doctor`
`brew update`
`brew install postgresql`

If you upgraded Postgresql and you see and error like this:
```.sh
15:29:56 db.1   | 2017-10-27 22:29:56.816 GMT [42035] LOG:  skipping missing configuration file "/usr/local/var/postgres/postgresql.auto.conf"
15:29:56 db.1   | 2017-10-27 15:29:56.817 PDT [42035] FATAL:  database files are incompatible with server
15:29:56 db.1   | 2017-10-27 15:29:56.817 PDT [42035] DETAIL:  The data directory was initialized by PostgreSQL version 9.3, which is not compatible with this version 10.0.
```
**Danger** `rm -rf` incoming
`rm -rf /usr/local/var/postgres && initdb /usr/local/var/postgres -E utf8`



* Configuration

* Database creation

### Database initialization
`rake db:setup`
`rake db:seed RAILS_ENV=test`

### Testing with Rspec
`bundle exec rake spec`

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
