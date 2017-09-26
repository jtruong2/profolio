require 'rails_helper'
RSpec.describe "User can create an account" do
  it "manual login" do
    user = Build(:user)

    visit root_path
    click_on "Register"
    fill_in "user[first_name]", with: user.first_name
    fill_in "user[last_name]", with: user.last_name
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    fill_in "user[password_confirmation]", with: user.password
    click_on "Signup"

    expect(page).to have_content("Welcome, #{user.first_name}")
  end
end
