require "rails_helper"

RSpec.describe ThreadBoardsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/thread_boards").to route_to("thread_boards#index")
    end

    it "routes to #new" do
      expect(:get => "/thread_boards/new").to route_to("thread_boards#new")
    end

    it "routes to #show" do
      expect(:get => "/thread_boards/1").to route_to("thread_boards#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/thread_boards/1/edit").to route_to("thread_boards#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/thread_boards").to route_to("thread_boards#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/thread_boards/1").to route_to("thread_boards#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/thread_boards/1").to route_to("thread_boards#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/thread_boards/1").to route_to("thread_boards#destroy", :id => "1")
    end

  end
end
