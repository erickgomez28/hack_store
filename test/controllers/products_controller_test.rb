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
#  buy_url            :string
#

require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_index_url
    assert_response :success
  end

  test "should get edit" do
    get products_edit_url
    assert_response :success
  end

  test "should get new" do
    get products_new_url
    assert_response :success
  end

  test "should get show" do
    get products_show_url
    assert_response :success
  end

end
