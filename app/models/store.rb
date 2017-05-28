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
#  url        :string
#

class Store < ApplicationRecord
	has_many :products
	enum statu: [ :principal, :neighbour ]
	# validates :name, :kind, presente: :true
	before_create :add_statu

	private
	def add_statu
		
		self.statu = 1
	end

end
