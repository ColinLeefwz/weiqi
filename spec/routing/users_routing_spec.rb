require 'rails_helper'

RSpec.describe "routing to users", :type => :routing do
  it "routes /user/:id to user#show" do
    expect(get: "/users/1").to route_to(
      action: "show",
      controller: "users",
      id: "1"
    )
  end

  it "exposes a list of users" do
    expect(:get => "/users").to be_routable
  end
end
