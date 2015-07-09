require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(:category_name => "新規カテゴリ1",:order_num => 1))
  end

  it "renders attributes in <p>" do
    render
  end
end
