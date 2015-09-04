require "spec_helper"

RSpec.feature "User register", type: :feature do
  scenario "Create a new user" do
    visit "/sign_up"

    fill_in "user_email", with: "1@g.cn"
    fill_in "user[password]", with: "123123"
    fill_in "user[password_confirmation]", with: "123123"
    click_button "注册"

    expect(page).to have_text("Hello, world!")
  end
end

RSpec.feature "User sessions", type: :feature do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  describe "Log in" do
    it "User login in log_in page" do
      visit "/log_in"
      puts "#{@user.email}"
      puts "#{@user.password}"

      fill_in "email", with: @user.email
      fill_in "password", with: "password"
      click_button "登录"

      expect(page).to have_text("Hello, world!")
    end

    it "User login in home page" do
      visit "/"

      fill_in "email", with: @user.email
      fill_in "password", with: "password"
      click_button "登录"

      expect(page).to have_text("Hello, world!")
    end
  end
end

##RSpec.feature "User log out", type: :feature do
##  scenario "User log out" do
##    visit "/"

##    click_button "Log out"

##    expect(page).to have_text("Hello, world!")
##  end
##end
