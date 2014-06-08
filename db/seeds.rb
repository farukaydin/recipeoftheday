# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create username: 'gencosman', email: 'genc@osman.com', password: 11111111
recipe = user.recipes.new title: 'Example Recipe', body: 'Lorem ipsum dolor sit amet'
recipe.tag_list.add('tomato', 'potato')
recipe.save