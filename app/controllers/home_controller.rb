class HomeController < ApplicationController

  # before_action :authenticate_user!

  def index

    @products = []
    rest = RestClient.get('192.168.1.108:3000/products.json')
    payload = JSON.parse(rest) if rest
    # buy = payload['url']
    # buy = RestClient.post(buy, quantity: 2)
    # render json: buy
    payload.each do |product|
      payload.map!(&:symbolize_keys!)
      product.slice!(:name, :quantity, :category)
      @products.push(Product.new(product))
    end

  end
end
