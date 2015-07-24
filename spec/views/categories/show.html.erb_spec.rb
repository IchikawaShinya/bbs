require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(:category_name => "新規カテゴリ1",:order_num => 1))
    
    # 投稿件数
    thread_count = 50
    thread_count.times do |i|
      assign(:thread_boards, [
        ThreadBoard.create!(:category_id => 1,:thread_name => "新規スレッド"+i.to_s,:user_ipaddress => "192.168.0.1",:delete_pass=>"0000")
      ])
    end
    
  end

  it "renders attributes in <p>" do
    @thread_boards = ThreadBoard.without_soft_destroyed.where("category_id = ?", 1).page(params[:page])
    render_template("show")
  end
end
