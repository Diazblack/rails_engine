# README
# Rails Engine

Rails Engine is an Rails  application (Rails v 5.1.6.1) to deliver information for it database in Json format.

## Instalation

1. Fork and Clone repo
2. Run a bundle
3. Create the database and run the migrations

``` ruby
rake db:{create, migrate}
```

4. Run the following rake task to populate the database
```ruby
rake import:seeds
```
__note:__ While the rake task is running it will display how many entries has been created in the db.
