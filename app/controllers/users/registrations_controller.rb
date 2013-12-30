class Users::RegistrationsController < Devise::RegistrationsController
	skip_before_filter :require_no_authentication
	authorize_resource :class => false

  def create
    build_resource(sign_up_params)

    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        respond_to do |format|
	      format.html { redirect_to users_url }
	      format.json { head :no_content }
	    end
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

end