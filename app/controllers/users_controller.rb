class UsersController < ApplicationController
	def omniauth_failure
		redirect_to auth_failure_path
	end
end
