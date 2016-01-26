require 'rails_helper'

RSpec.feature 'Users can delete rooms' do
  before(:all) do
    @user = FactoryGirl.create :user
    login_as(@user, :scope => :user)
  end
  let(:room) {FactoryGirl.create(:room, user_id: @user.id)}
  before(:each) do
    visit "/en/rooms/#{room.id}"
    click_link 'Delete'
  end

  scenario 'successfully' do
    expect(page).to have_content 'Room was successfully deleted.'
    expect(page.current_url).to eq rooms_url(:locale => :en)
  end
end
