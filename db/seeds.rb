User.create!([
  {email: "asdf1@asdf.com", encrypted_password: "$2a$10$GC44C/YUiL10yAasXUaX4.XSUvn4xKdhwiiot5XN1t4OZPad70c76", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-04-28 02:24:43", last_sign_in_at: "2016-04-28 02:24:43", current_sign_in_ip: "::1", last_sign_in_ip: "::1", admin: nil},
  {email: "chrisbon315@gmail.com", encrypted_password: "$2a$10$k/CTp79u/sWGpPLZPftop.zPPKLAdD1GTr.05iJyWAx.PIVTWS2eS", reset_password_token: "451acedd3bf2ea1855c0e16683f060756ae2b552c723b09437e3a4f60edfac7f", reset_password_sent_at: "2016-04-28 04:11:51", remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-04-28 04:11:39", last_sign_in_at: "2016-04-28 04:11:39", current_sign_in_ip: "::1", last_sign_in_ip: "::1", admin: nil},
  {email: "test@email.com", encrypted_password: "$2a$11$NzKN/NFB6okfNz8DpUAspu2X3lsBZ/te3qX8PKzPf5PSEXGS6xrgW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2016-05-03 02:33:28", sign_in_count: 4, current_sign_in_at: "2016-05-04 01:26:50", last_sign_in_at: "2016-05-04 01:26:50", current_sign_in_ip: "::1", last_sign_in_ip: "::1", admin: nil}
])
CartedProduct.create!([
  {product_id: 1, order_id: 9, quantity: 1},
  {product_id: 2, order_id: 9, quantity: 1},
  {product_id: 3, order_id: 9, quantity: 1},
  {product_id: 2, order_id: 9, quantity: 1}
])
CategorizedProduct.create!([
  {category_id: 2, product_id: 1},
  {category_id: 5, product_id: 2},
  {category_id: 3, product_id: 3},
  {category_id: 4, product_id: 3}
])
Category.create!([
  {name: "String"},
  {name: "Ethnic"},
  {name: "Wind"},
  {name: "Percussion"},
  {name: "Electronic"}
])
Image.create!([
  {url: "http://www.knightmusicacademy.com/wp-content/uploads/2013/05/Cordoba-C5-classical-guitar-400x400.jpg", product_id: 1},
  {url: "https://upload.wikimedia.org/wikipedia/commons/d/dd/Alboka._Euskal_Herria.jpg", product_id: 3},
  {url: "https://upload.wikimedia.org/wikipedia/commons/f/fd/Balafoon.jpg", product_id: 2}
])
Order.create!([
  {user_id: 1, subtotal: "320.0", tax: "28.8", total: "348.8", completed: nil, product_id: nil},
  {user_id: 3, subtotal: "-3323.43", tax: "-290.8", total: "-3614.23", completed: false, product_id: 1}
])
Product.create!([
  {name: "Balafon", price: "168.44", description: "wooden xylophone from Mali, West Africa", supplier_id: 2, stocked: true},
  {name: "Alboka", price: "402.89", description: "A Basque single-reed woodwind instrument", supplier_id: 2, stocked: true},
  {name: "Guitar", price: "302.13", description: "Twingy twingry twang", supplier_id: 2, stocked: true}
])
Supplier.create!([
  {name: "Traditional Instruments Supplier", email: "traditional@email.com", phone_number: "123-2345"},
  {name: "Rare Instruments Supplier", email: "rare@email.com", phone_number: "449-6622"},
  {name: "Ethnic Instruments Supplier", email: "ethnic@email.com", phone_number: "234-2345"}
])
