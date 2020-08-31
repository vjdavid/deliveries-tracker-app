# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shippings', type: :request do
  context 'with valid trac'
  it 'show all tracking numbers' do
    tracking_numbers = { 'data': [
      {
        tracking_number: '449044304137821',
        carrier: 'FEDEX'
      }
    ] }

    post '/shipping_tracks', params: tracking_numbers
    expect(response).to have_http_status(200)
  end

  context 'with invalid tracking numbers' do
    it 'show error messaage of unproccessable entity' do
      tracking_numbers = { 'data': [
        {
          tracking_number: '4490',
          carrier: 'FEDEX'
        }
      ] }

      post '/shipping_tracks', params: tracking_numbers
      expect(response).to have_http_status(422)
    end
  end
end
