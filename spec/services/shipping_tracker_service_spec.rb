require 'rails_helper'

describe ShippingTrackerService do
  let(:tracking_numbers) do
    {
      data: [
        {
          tracking_number: '779766864720',
          carrier: 'FEDEX'
        },
        {
          tracking_number: '568838414941',
          carrier: 'FEDEX'
        },
        {
          tracking_number: '920241085725456',
          carrier: 'FEDEX'
        }
      ]
    }
  end
  let(:service) { ShippingTrackerService.new }

  describe '#perform' do
    context 'with valid tracking numbers' do
      it 'should return a response message' do
        response = service.perform(tracking_numbers)

        expect(response).to respond_to(:success?)
      end

      it 'should return multiple objects' do
        response = service.perform(tracking_numbers)

        expect(response).to respond_to(:success?)
      end

      it 'should contain status tracking' do
        response = service.perform(tracking_numbers)

        expect(response).to respond_to(:success?)
      end
    end

    context 'with invalid tracking numbers' do
      let(:tracking_numbers) do
        {
          data: [
            {
              tracking_number: '123',
              carrier: 'FEDEX'
            }
          ]
        }
      end

      it 'should return empty values' do
        response = service.perform(tracking_numbers)

        expect(response.data).to be_empty
      end
    end
  end
end
