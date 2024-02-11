class ApplicationController < ActionController::Base
    include Pagy::Backend
    
    def get_all_links
        @links ||= Link.recent_first
      rescue StandardError => e
        logger.error "Error fetching links: #{e.message}"
        @links = Link.none # Return an empty ActiveRecord::Relation to prevent nil
      end
      

    def set_link
        @link = Link.find_by_short_code(params[:id])
    end

    def paginate_resource(resource)
        pagy, paginated_resource = pagy(resource)
        [pagy, paginated_resource]
    end
end
