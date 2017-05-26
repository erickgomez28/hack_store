# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string           not null
#  price              :decimal(7, 2)    not null
#  quantity           :integer          not null
#  size               :integer          not null
#  color              :string           not null
#  model              :string           not null
#  store_id           :integer          not null
#  category_id        :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class ProductSerializer < ActiveModel::Serializer
  attributes :name, :price, :quantity
  has_one :category
  attribute :category_name
  attribute :description
  
  def category_name
    object.category.name
  end
  def description
		{
			model: object.model,
			color: object.color,
			size: object.size
		}
  end

end
