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

class Store < ApplicationRecord
	has_many :products
	enum statu: { neighbor: 1, principal: 0 }
	# validates :name, :kind, presente: :true


end
