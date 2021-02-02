# Category.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Category.delete_all
# Category.create([{name: 'One Time Need', color: 'blue'}, {name: 'Material Need', color: 'green'}])
help = Help.find(1)
help.category_id = 4
help.save

