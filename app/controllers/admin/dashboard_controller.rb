class Admin::DashboardController < ApplicationController
    include Admin::DashboardHelper
    before_action :get_all_links
    before_action :authenticate_user! # Ensure user is authenticated
    before_action :authorize_admin!    # Ensure user is authorized as an admin
  
    def index
        @registered_users_amount = registered_users_amount
        @guest_users_amount = guest_users_amount
        @all_users_amount = all_users_amount
    end

    def show 
    end

    def links 
      @pagy, @links = paginate_resource(@links)
    end
  
    def users
      @pagy, @users = paginate_resource(User.order(created_at: :desc))
    end
    
  
    def guest_users
    end
  
    def destroy_user
      user = User.find(params[:id])
      user.destroy
      redirect_to admin_dashboard_path, notice: 'User was successfully deleted.'
    end
  
    private
  
    def authorize_admin!
      unless current_user.admin?
        flash[:alert] = "You are not authorized to access this page."
        redirect_to root_path
      end
    end
end
