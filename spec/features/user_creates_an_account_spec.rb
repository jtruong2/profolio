require 'rails_helper'
RSpec.describe "User can create an account" do
  it "manual login" do
    user = build(:user)

    visit root_path
    click_on "Register"
    fill_in "user[first_name]", with: user.first_name
    fill_in "user[last_name]", with: user.last_name
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_on "Register"

    expect(page).to have_content("Account successfully created.")
  end
end
