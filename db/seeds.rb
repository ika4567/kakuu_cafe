# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@a', password: '123456')
Product.create(product_name: 'プレーンマフィン', price: '300', max_quantity: '25', product_status: '1')
Product.create(product_name: 'テストB', price: '300', max_quantity: '25', product_status: '0')