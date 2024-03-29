class LinksController < ApplicationController
    before_action :get_all_links
    before_action :set_link, only: [:show, :edit, :update, :destroy]
    before_action :check_if_editable, only: [:edit, :update, :destroy]

    def index
      @pagy, @links = paginate_resource(@links)
      @link ||= Link.new
      rescue Pagy::OverflowError
        redirect_to root_path
    end

    def show
        
    end

    def create
      @link = Link.new(link_params.merge(ip_address: request.remote_ip).with_defaults(user: current_user))
    
      if @link.save
        respond_to do |format|
          format.html { redirect_to root_path, notice: "Link has been created successfully." }
          format.turbo_stream { render turbo_stream: turbo_stream.prepend("links", @link) }
        end
      else
        index
        render :index, status: :unprocessable_entity
      end
    end
    
    
    def update
      if @link.update(link_params)
        redirect_to @link, notice: "Link has been updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
    def destroy
      @link.destroy
      redirect_url = params[:redirect_to] == 'current_page' ? request.referer : root_path
      redirect_to redirect_url, notice: "Link has been deleted successfully."
    end
    

    private

    def link_params
        params.require(:link).permit(:url)
    end

    def check_if_editable
      unless @link.editable_by?(current_user)
        redirect_to @link, alert: "You aren't allowed to do that."
      end
    end
    
end