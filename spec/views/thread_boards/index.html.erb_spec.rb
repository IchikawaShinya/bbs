require 'rails_helper'

RSpec.describe "thread_boards/index", type: :view do
  before(:each) do
    assign(:thread_boards, [
      ThreadBoard.create!(),
      ThreadBoard.create!()
    ])
  end

  it "renders a list of thread_boards" do
    render
  end
end
