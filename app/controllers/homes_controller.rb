class HomesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home]
  
  def home
    if user_signed_in?
      if current_user.admin?
        redirect_to homes_admin_path
    #   elsif current_user.prophent?
    #     redirect_to prophents_path
      else
        redirect_to homes_index_path
      end
    end
  end

  def index
      
  end
end
