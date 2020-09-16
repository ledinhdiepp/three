class CreateGnsBannersCatabanners < ActiveRecord::Migration[5.2]
  def change
    create_table :gns_banners_catabanners do |t|
      t.string :name
      t.float :width
      t.float :height
      t.string :position
      t.string :thumb_resize

      t.timestamps
    end
  end
end
