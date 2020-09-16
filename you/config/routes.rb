Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount GnsCore::Engine => "/", as: 'gns_core'
  mount GnsArea::Engine => "/", as: 'gns_area'
  mount GnsBanners::Engine => "/", as: 'gns_banners'
end
