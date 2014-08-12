require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context 'when user is valid' do
      before(:each) do
        @user = FactoryGirl.create(:user)
      end

      it "login as a user" do
        #post 'create', user: FactoryGirl.attributes_for(:user)
        post 'create', email: "user@test.com", password: "password"
        expect(session[:user_id]).to eq(1)
      end
      it "redirects to the home page" do
        post 'create', email: "user@test.com", password: "password"
        expect(response).to redirect_to(root_path)
      end
      it "shows the notice" do
        post 'create', email: "user@test.com", password: "password"
        expect(flash[:notice]).to eq("您已经成功登录!")
      end
    end

    context 'when user is invalid  with nil email' do
      before(:each) do
        @user = FactoryGirl.create(:user)
      end

      it "cannot create a new user" do
        post 'create', email: "user1@test.com", password: "password"
        expect(session[:user]).to_not eq(User.find_by(id:1))
      end
      it "redirects to the login page" do
        post 'create', email: "user1@test.com", password: "password"
        expect(response).to render_template(:new)
      end
      it "shows the notice" do
        post 'create', email: "user1@test.com", password: "password"
        expect(flash[:notice]).to eq("帐号名或者密码错误")
      end
    end
  end
end
