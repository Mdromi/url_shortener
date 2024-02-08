class LinksController < ApplicationController
    before_action :set_link, only: [:show, :edit, :update, :destroy]

    def index
      @links = Link.recent_first
      @link ||= Link.new
    end

    def show
        
    end

    def create
      @link = Link.new(link_params)
      if @link.save
        redirect_to root_path, notice: "Link has been created successfully."
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
      redirect_to root_path, notice: "Link has been deleted successfully."
    end
    

    private

    def link_params
        params.require(:link).permit(:url)
    end
end