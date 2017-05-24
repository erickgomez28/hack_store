class StoreSerializer < ActiveModel::Serializer
  attributes :name, :kind
  has_many :products
end
