class Admin::DashboardController < ApplicationController
    include Admin::DashboardHelper
    before_action :get_all_links
    before_action :authenticate_user! # Ensure user is authenticated
    before_action :authorize_admin!    # Ensure user is authorized as an admin
  
    def index
      @registered_users_amount = registered_users_amount
      @guest_user_links_amount = guest_user_links_amount
      @all_users_amount = all_users_amount
      @links ||= Link.all
    
      # Initialize a hash to store total views for each day
      @link_views_data = Hash.new(0)
    
      # Iterate over each link and aggregate views for each day
      @links.each do |link|
        link.views.group_by_day(:created_at, range: 2.weeks.ago..Time.now, expand_range: true).count.each do |day, views|
          @link_views_data[day] += views
        end
      end
    end
    
    

    def show 
    end

    def links 
      @pagy, @links = paginate_resource(@links)
    end
  
    def users
      @pagy, @users = paginate_resource(User.order(created_at: :desc))
    end
    
  
    def guest_user_links
      @pagy, @guest_user_links = paginate_resource(Link.where(user_id: nil).order(created_at: :desc))
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
