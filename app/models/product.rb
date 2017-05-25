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

class Product < ApplicationRecord
  belongs_to :store
  belongs_to :category

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }#default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
