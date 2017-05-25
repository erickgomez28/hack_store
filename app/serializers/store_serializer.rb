# == Schema Information
#
# Table name: stores
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  kind       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  statu      :integer
#

class StoreSerializer < ActiveModel::Serializer
  attributes :name, :kind
  has_many :products
end
