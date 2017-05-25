class ProductSerializer < ActiveModel::Serializer
  attributes :name,:price,:quantity,:size, :color,:model,:store_id
  has_one :category
end
