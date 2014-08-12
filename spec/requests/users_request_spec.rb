require 'rails_helper'

RSpec.describe "home page", :type => :request do
  it "displays the user's email after successful login" do
    @user = FactoryGirl.create(:user)
    get '/sign_up'
    assert_select '.form-signup' do
      assert_select 'input[name=?]', 'user[email]'
      assert_select 'input[name=?]', 'user[password]'
      assert_select 'input[type=?]', 'submit'
    end

  end
end
