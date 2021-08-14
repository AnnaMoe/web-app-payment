Order.destroy_all
Subscription.destroy_all

Subscription.create(
  plan_type: "Premium",
  price: 19.96,
  duration_in_months: 12,
  choice_of_payment: "Vorauszahlung"
)

Subscription.create(
  plan_type: "Premium",
  price: 24.96,
  duration_in_months: 12,
  choice_of_payment: "Monatszahlung"
)

Subscription.create(
  plan_type: "Premium",
  price: 27.96,
  duration_in_months: 6,
  choice_of_payment: "Vorauszahlung"
)

Subscription.create(
  plan_type: "Premium",
  price: 34.95,
  duration_in_months: 6,
  choice_of_payment: "Monatszahlung"
)

Subscription.create(
  plan_type: "Basis",
  price: 29.95,
  duration_in_months: 6,
  choice_of_payment: "Monatszahlung"
)

Subscription.create(
  plan_type: "Basis",
  price: 19.95,
  duration_in_months: 12,
  choice_of_payment: "Monatszahlung"
)

Subscription.create(
  plan_type: "Basis",
  price: 23.96,
  duration_in_months: 6,
  choice_of_payment: "Vorauszahlung"
)

Subscription.create(
  plan_type: "Basis",
  price: 15.96,
  duration_in_months: 12,
  choice_of_payment: "Vorauszahlung"
)

puts "subscriptions created"

anna = User.create(email: "anna@web.de", password: "123456")

puts "users created"