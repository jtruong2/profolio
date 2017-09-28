require 'rails_helper'
RSpec.describe 'user adds links' do
  it "profile links save to user" do
    user = create(:user)
    github = Profile.new(link: "https://github.com/jtruong2", user_id: user.id)



    visit root_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: 'password'
    click_on "Login"
    click_on "Add Profile"
    select "Github", from: "profile_select"
    fill_in "profile[link]", with: github.link
    click_on "Add Profile"

    expect(page).to have_content("Profile Added.")
    expect(current_path).to eq(new_profile_path)
  end
end
