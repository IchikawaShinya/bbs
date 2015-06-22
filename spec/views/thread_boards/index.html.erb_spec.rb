require 'rails_helper'

RSpec.describe "thread_boards/index", type: :view do
  before(:each) do
    assign(:thread_boards, [
      ThreadBoard.create!(:category_id => 1,:thread_name => "thread",:delete_pass=>"0000")
    ])
  end

  it "renders a list of thread_boards" do
    render
  end
end
