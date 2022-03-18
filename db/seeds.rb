# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@a', password: '123456')
Product.create(product_name: 'テストA', price: '300', max_quantity: '25', product_status: 'on_sale')
Product.create(product_name: 'テストB', price: '300', max_quantity: '25', product_status: 'discontinued')
Customer.create(name: "山田花子", telephone_number: "09012345678", email: "sample@a", encrypted_password: "123456", is_active: "false")
Order.create(customer_id: "1", order_system: "0", time: "14:00", note: "", order_status: "0")