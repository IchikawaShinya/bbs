require 'rails_helper'

RSpec.describe "thread_boards/show", type: :view do
  before(:each) do
    @thread_board = assign(:thread_board, ThreadBoard.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
