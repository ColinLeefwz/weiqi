# encoding: utf-8
require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  it "renders _user partial for each event" do
    assign(:users, [FactoryGirl.create(:user, email: 'user1@test.com', id: 1), FactoryGirl.create(:user, email: 'user2@test.com', id: 2)])
    render
    expect(view).to render_template(partial: "_user", count: 2)
  end
end
