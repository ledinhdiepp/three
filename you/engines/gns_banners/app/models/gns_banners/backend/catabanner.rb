module GnsBanners::Backend
  class Catabanner < ApplicationRecord
    # # update contact cache search
    # after_save :update_cache_search
		# def update_cache_search
		# 	str = []
		# 	str << name.to_s.downcase.strip
		# 	str << thumb_resize.to_s.downcase.strip

		# 	self.update_column(:cache_search, str.join(" ") + " " + str.join(" ").to_ascii)
		# end
    
    # Filters

    after_save :update_cache_search
		def update_cache_search
			str = []
			str << name.to_s.downcase.strip
      str << position.to_s.downcase.strip
      str << thumb_resize.to_s.downcase.strip

			self.update_column(:cache_search, str.join(" ") + " " + str.join(" ").to_ascii)
		end
    def self.filter(query, params)
      params = params.to_unsafe_hash
      
      # filter by roles
      if params[:role_ids].present?
        query = query.joins(:roles).where(gns_banner_roles_catabanners: {role_id: params[:role_ids]})
      end
      
      # single keyword
      if params[:keyword].present?
				keyword = params[:keyword].strip.downcase
				keyword.split(' ').each do |q|
					q = q.strip
					query = query.where('LOWER(gns_banner_catabanner.cache_search) LIKE ?', '%'+q.to_ascii.downcase+'%')
				end
			end

      return query
    end
    
    # search
    def self.search(params)
      query = self.all
      query = self.filter(query, params)

      # order
      if params[:sort_by].present?
        order = params[:sort_by]
        order += " #{params[:sort_direction]}" if params[:sort_direction].present?

        query = query.order(order)
      end

      return query
    end
    
    # get select2 records
    def self.select2(params)
      per_page = 10
      page = 1      
      data = {results: [], pagination: {more: false}}
      
      query = self.order(:email)
      
      # keyword
      if params[:q].present?
        query = query.where('LOWER(gns_banner_catabanners.cache_search) LIKE ?', '%'+params[:q].to_ascii.downcase+'%')
      end
      
      # pagination
      page = params[:page].to_i if params[:page].present?
      query = query.limit(per_page).offset(per_page*(page-1))
      data[:pagination][:more] = true if query.count >= per_page
      
      # render items
      query.each do |catabanner|
        data[:results] << {text: catabanner.position, text: catabanner.name}
      end
      
      return data
    end
  end
end
