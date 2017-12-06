User.create! name: "Thinh Bui", email: "thinhducbui94@gmail.com",
  password: "thinhchuot", password_confirmation: "thinhchuot", admin: true,
  activated: true, activated_at: Time.zone.now

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name:  name, email: email,
    password: password, password_confirmation: password,
    activated: true, activated_at: Time.zone.now
end
