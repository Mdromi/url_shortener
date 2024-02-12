class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_and_links, only: :show

  def show
    if current_user.admin? || current_user == @user
      render 'show'
    else
      redirect_to root_path, alert: "You are not authorized to view this profile."
    end
  end

  private

  def set_user_and_links
    @user = User.find(params[:id])
    @pagy, @user_links = pagy(Link.where(user_id: @user.id))
  end
end
