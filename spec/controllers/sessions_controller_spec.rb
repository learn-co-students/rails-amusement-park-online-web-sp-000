require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #signin" do
    it "returns http success" do
      get :signin
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #signout" do
    it "returns http success" do
      get :signout
      expect(response).to have_http_status(:success)
    end
  end

end
