require "rails_helper"

feature "User edit profile info" do
  let(:user) { create(:user) }
  text = Faker::Lorem.sentence(20)

  scenario "User cancels account" do
    login_as(user)
    visit edit_info_path(user)
    attach_file("Image", "spec/support/images/image.jpg")
    fill_form(:user, description: text)
    click_button "Save"
    expect(page).to have_content("Profile updated")
    visit user_path(user)
    expect(page).to have_content(text)
  end
end
