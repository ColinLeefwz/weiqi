require "rails_helper"

feature "user sign up" do
  scenario "creates a new user successfully" do
    visit "/users/new"

    fill_in "user[email]", with: "user@test.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "注册"

    expect(page).to have_content("您已经成功注册!")
  end
  scenario "failed to create a new user" do
    visit "/users/new"

    fill_in "user[email]", with: "user@test.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password1"
    click_button "注册"

    expect(page).to have_content("您的信息填写有误，请重新填写！")
  end
end
