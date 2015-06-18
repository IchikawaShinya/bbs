require 'rails_helper'

RSpec.describe "thread_boards/new", type: :view do
  before(:each) do
    assign(:thread_board, ThreadBoard.new())
  end

  it "renders new thread_board form" do
    render

    assert_select "form[action=?][method=?]", thread_boards_path, "post" do
    end
  end
end
