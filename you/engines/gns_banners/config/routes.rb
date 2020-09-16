GnsBanners::Engine.routes.draw do
    # namespace :backend, module: "backend", path: "backend/banners" do
    #     resources :banners do
    #         # collection do
    #         #     post 'list'
    #         #     get 'select2'
    #         # end
    #     end
    # end

    namespace :backend , module: "backend" do
        resources :banners
        
        resources :catabanners do
            collection do
                post 'list'
                get 'select2'
            end
        end
    end

    # scope "(:locale)", locale: /en|vi/ do
    #     namespace :banners , module: "banners" do
    #         resources :banners
    #     end
    # end
end
