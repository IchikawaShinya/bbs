require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(:category_name => "新規カテゴリ1",:order_num => 1))
    
    @categories = {
                  :id => 1,
                  :category_name => "カテゴリ1",
                  :order_num => 1,
                  :created_at => "Fri, 03 Jul 2015 09:02:08 UTC +00:00",
                  :updated_at => "Wed, 08 Jul 2015 07:33:39 UTC +00:00",
                  :deleted_at => nil},{
                  :id => 2,
                  :category_name => "カテゴリ2",
                  :order_num => 2,
                  :created_at => "Fri, 03 Jul 2015 09:02:24 UTC +00:00",
                  :updated_at => "Wed, 08 Jul 2015 05:05:21 UTC +00:00",
                  :deleted_at => nil},{
                  :id => 3,
                  :category_name => "カテゴリ3",
                  :order_num => 3,
                  :created_at => "Fri, 03 Jul 2015 09:02:38 UTC +00:00",
                  :updated_at => "Wed, 08 Jul 2015 05:05:26 UTC +00:00",
                  :deleted_at => nil
                  }
    
    # @categories = assign(:category, Category.create!(@cateList[0]))
  end

  it "renders a list of categories" do
    render
  end
end
