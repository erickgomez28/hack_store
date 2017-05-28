class HomeController < ApplicationController

  # before_action :authenticate_user!

  def index
    @products = []
    @stores = Store.where(statu: 1)
    
    @stores.each do |store|
      if store.statu != 0
        rest = RestClient.get(store.url) 

        # rest = RestClient.get('192.168.1.108:9292/stores.json') 
        json = JSON.parse(rest)['products'] if rest
        
        json.each do |product|
          product.symbolize_keys!
          product[:store] = { name: store.name, kind: store.kind }

          @products << product
        end
      end
    end

  end
end
