require 'rails_helper'

RSpec.feature 'Users can create new rooms' do
  before(:all) do
    user = FactoryGirl.create :user
    login_as(user, :scope => :user)
  end
  before(:each) do
    visit '/'
    click_link 'Post a new room'
  end

  let(:room) {FactoryGirl.build(:room)}

  scenario 'with valid attributes' do
    %w(price deposit internet furnished smoking couples_ok gender closest_station zone description).each do |field|
      fill_in "room_#{field}", with: room.send(field.to_sym)
    end
    
    click_button 'Create Room'
    expect(page).to have_content 'Room was successfully created.'
  end

  scenario 'with missing attributes' do
    fill_in 'room_description', with: "Some random description. All other fields are missing."
    click_link 'Post a new room'
    expect(page).to have_content 'errors prohibited this room from being saved'
  end
end
