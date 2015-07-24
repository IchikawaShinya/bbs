require 'rails_helper'
require 'application_helper'

RSpec.describe "thread_boards/index", type: :view do
  before(:each) do
    assign(:thread_boards, [
      ThreadBoard.create!(:category_id => 1,:thread_name => "thread",:delete_pass=>"0000")
    ])
    
    #  投稿件数
    thread_count = 25
    thread_count.times do |i|
      thread_attributes = {
        "category_id" => "1",
        "thread_name" => "新規スレッド"+i.to_s,
        "user_ipaddress" => "192.168.0.1",
        "delete_pass" => "0000"
      }
      thread_board = ThreadBoard.create! thread_attributes
    end
  end

  it "renders a list of thread_boards" do
    @thread_boards = ThreadBoard.without_soft_destroyed.all.page(params[:page])
    render_template("index")
  end
end
