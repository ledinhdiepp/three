class AddCacheSearchToCatabanner < ActiveRecord::Migration[5.2]
  def change
    add_column :gns_banners_catabanners, :cache_search, :string
  end
end
