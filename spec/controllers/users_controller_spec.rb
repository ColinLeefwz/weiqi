require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get 'new'
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context 'when user is valid' do
      it "creates a new user" do
        #post 'create', user: {id: 1, email: "lilonglong@weiqi.com", user_name: "lilonglong", password: "123123123"}
        post 'create', user: FactoryGirl.attributes_for(:user)
        expect(assigns(:user)).to eq(User.find_by(id:1))
      end
      it "redirects to the home page" do
        post 'create', user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to(root_path)
      end
      it "shows the notice" do
        post 'create', user: FactoryGirl.attributes_for(:user)
        expect(flash[:notice]).to eq("您已经成功注册!")
      end
    end

    context 'when user is invalid  with nil email' do
      it "cannot create a new user" do
        #post 'create', user: {id: 1, email: "", user_name: "lilonglong", password: "123123123"}
        post 'create', user: FactoryGirl.attributes_for(:user, email: "")
        expect(assigns(:user)).to_not eq(User.find_by(id:1))
      end
      it "redirects to the sign up page" do
        post 'create', user: FactoryGirl.attributes_for(:user, email: "")
        expect(response).to render_template(:new)
      end
      it "shows the notice" do
        post 'create', user: FactoryGirl.attributes_for(:user, email: "")
        expect(flash[:notice]).to eq("您的信息填写有误，请重新填写！")
      end
    end
  end

  describe "GET #show/:id" do
    before :each do
      #@user = User.create!(id: 1, email: "lilonglong@weiqi.com", user_name: "lilonglong", password: "123123123")
      @user = FactoryGirl.create(:user)
    end

    it "responds successfully with an HTTP 200 status code" do
      get 'show', id: @user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads the created user" do
      get 'show', id: @user.id
      expect(assigns(:user)).to eq(@user)
    end
  end
end
