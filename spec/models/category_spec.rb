require 'rails_helper'

RSpec.describe Category, type: :model do
  
  describe 'category' do 
    it 'overlap_order_num  successful' do
      categories = Array.new
      categories[0] = {"id"=> "1", "category_name"=>"カテゴリ1", "order_num"=>"1"}
      categories[1] = {"id"=> "2", "category_name"=>"カテゴリ2", "order_num"=>"2"}
      
      validateFlg = Category.overlap_order_num(categories)
      expect(validateFlg).to eq true
    end
    
    it 'overlap_order_num  failure' do
      categories = Array.new
      categories[0] = {"id"=> "1", "category_name"=>"カテゴリ1", "order_num"=>"1"}
      categories[1] = {"id"=> "2", "category_name"=>"カテゴリ2", "order_num"=>"1"}
      
      validateFlg = Category.overlap_order_num(categories)
      expect(validateFlg).to eq false
    end
  end
end
