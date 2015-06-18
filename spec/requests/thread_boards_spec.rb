require 'rails_helper'

RSpec.describe "ThreadBoards", type: :request do
  describe "GET /thread_boards" do
    it "works! (now write some real specs)" do
      get thread_boards_path
      expect(response).to have_http_status(200)
    end
  end
end
