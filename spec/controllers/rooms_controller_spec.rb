require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  it 'handles a missing room correctly' do
    get :show, locale: 'en', id: 'not-here'

    expect(response).to redirect_to(rooms_path)

    message = 'The room you were looking for could not be found.'
    expect(flash[:alert]).to eq message
  end
end
