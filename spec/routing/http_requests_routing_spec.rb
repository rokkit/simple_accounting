require "spec_helper"

describe HttpRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/http_requests").should route_to("http_requests#index")
    end

    it "routes to #new" do
      get("/http_requests/new").should route_to("http_requests#new")
    end

    it "routes to #show" do
      get("/http_requests/1").should route_to("http_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/http_requests/1/edit").should route_to("http_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/http_requests").should route_to("http_requests#create")
    end

    it "routes to #update" do
      put("/http_requests/1").should route_to("http_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/http_requests/1").should route_to("http_requests#destroy", :id => "1")
    end

  end
end
