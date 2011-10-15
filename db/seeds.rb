# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(
  :email                 => 'dev.kato+001@gmail.com',
  :password              => 'naruhaya',
  :password_confirmation => 'naruhaya'
)

project = Project.create(
  :name        => 'First Project',
  :description => 'Hello World!',
  :user        => user
)

Table.create([
  {:name => 'Table1-1', :description => 'hogehoge', :user => user, :project => project},
  {:name => 'Table1-2', :description => 'hogehoge', :user => user, :project => project},
  {:name => 'Table1-3', :description => 'hogehoge', :user => user, :project => project}
])

project = Project.create(
  :name        => 'Second Project',
  :description => 'Hello World!',
  :user        => user
)

Table.create([
  {:name => 'Table2-1', :description => 'hogehoge', :user => user, :project => project},
  {:name => 'Table2-2', :description => 'hogehoge', :user => user, :project => project}
])

