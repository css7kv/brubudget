Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 895513370520702, "eb4780e64b9bc4e77bf3a0f4984a36dc"
end

OmniAuth.config.on_failure = Proc.new do |env|
  UsersController.action(:omniauth_failure).call(env)
  #this will invoke the omniauth_failure action in UsersController.
end