require "spec_helper"

describe BankBooksController do
  describe "routing" do

    it "routes to #index" do
      get("/bank_books").should route_to("bank_books#index")
    end

    it "routes to #new" do
      get("/bank_books/new").should route_to("bank_books#new")
    end

    it "routes to #show" do
      get("/bank_books/1").should route_to("bank_books#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bank_books/1/edit").should route_to("bank_books#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bank_books").should route_to("bank_books#create")
    end

    it "routes to #update" do
      put("/bank_books/1").should route_to("bank_books#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bank_books/1").should route_to("bank_books#destroy", :id => "1")
    end

  end
end
