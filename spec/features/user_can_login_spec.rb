require 'rails_helper'
RSpec.describe "User logs in" do
  it "with manual login" do
    user = create(:user)

    visit root_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: 'password'
    click_on "Login"

    expect(page).to have_content("Welcome back, #{user.first_name}")
    expect(User.all.count).to eq(1)
  end

  it "logs in with linkedin" do
    stub_linkedin

    visit root_path
    within('.linkedin') do
      click_link
    end

    expect(page).to have_content("Welcome back, Jimmy")
    expect(User.all.count).to eq(1)
  end
end
