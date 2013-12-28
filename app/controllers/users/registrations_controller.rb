class Users::RegistrationsController < Devise::RegistrationsController
	authorize_resource :class => false
end