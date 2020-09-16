class CreateGnsBannersBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :gns_banners_banners do |t|
      t.string :title
      t.string :img_url
      t.string :link_target

      t.timestamps
    end
  end
end