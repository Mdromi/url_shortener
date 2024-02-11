module Admin::DashboardHelper

    def registered_users_amount
        User.count
    end

    def find_links_by_user_id(user_id)
        Link.where(user_id: user_id)
    end
    
    def guest_user_links_amount
        count_guest_user = 0
        link_user_hashmap = {}
        @links.each do |link|
          if link.user_id.nil? && (link.ip_address.nil? || !link_user_hashmap[link.ip_address])
            count_guest_user += 1
            link_user_hashmap[link.ip_address] = true if link.ip_address
          end
        end
        count_guest_user
    end

    def user_signups_data(previous_days = nil)
        start_date = (previous_days.present? ? previous_days.days.ago.beginning_of_day : 1.month.ago.beginning_of_day)
        end_date = Time.now.end_of_day
        
        user_counts = User.where(created_at: start_date..end_date).group_by_day(:created_at).count
        guest_user_counts = Link.where(user_id: nil, created_at: start_date..end_date).group_by_day(:created_at).count
        
        cumulative_user_counts = user_counts.transform_values.with_index { |count, index| user_counts.values[0..index].sum }
        cumulative_guest_user_counts = guest_user_counts.transform_values.with_index { |count, index| guest_user_counts.values[0..index].sum }
        
        # Merge both user and guest user counts
        cumulative_counts = cumulative_user_counts.merge(cumulative_guest_user_counts) { |date, users, guests| users + guests }
    end

    
    def all_users_amount
        guest_user_links_amount + registered_users_amount
    end
end
