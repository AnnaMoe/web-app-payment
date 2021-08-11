Subscription.destroy_all

premium = Subscription.create(
  plan: "Premium",
  price: 19.96
)

basis = Subscription.create(
  plan: "Basis",
  price: 15.96
)

puts "subscriptions created"

anna = User.create(email: "anna@web.de", password: "123456")

puts "users created"