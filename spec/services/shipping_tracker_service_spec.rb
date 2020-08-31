require 'rails_helper'

describe ShippingTrackerService do
  let(:tracking_numbers) do
    [
      {
        tracking_number: '449044304137821',
        carrier: 'FEDEX'
      },
      {
        tracking_number: '920241085725456',
        carrier: 'FEDEX'
      },
      {
        tracking_number: '568838414941',
        carrier: 'FEDEX'
      }
    ]
  end
  let(:service) { ShippingTrackerService.new }

  describe '#perform' do
    context 'with valid tracking numbers' do
      it 'should return a response message' do
        response = service.perform(tracking_numbers)

        expect(response).not_to be_empty
      end

      it 'should return multiple objects' do
        response = service.perform(tracking_numbers)

        expect(response.size).to be > 2
      end

      it 'should contain status tracking' do
        response = service.perform(tracking_numbers)

        expect(response.first.keys).to include(:status)
      end
    end
  end
end
