# create demo driver
User.create(
  user_type: :driver,
  devise_token: ENV.fetch('DEVISE_TOKEN')
)
