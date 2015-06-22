require 'rails_helper'

RSpec.describe "thread_boards/edit", type: :view do
  before(:each) do
    @thread_board = assign(:thread_board, ThreadBoard.create!(:category_id => 1,:thread_name => "thread",:delete_pass=>"0000"))
  end

  it "renders the edit thread_board form" do
    render

    assert_select "form[action=?][method=?]", thread_board_path(@thread_board), "post" do
    end
  end
end
