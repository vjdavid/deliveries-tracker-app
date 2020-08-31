require 'rails_helper'

describe ValueMapper do
  let(:map_values) { ValueMapper.new(status_codes).mapping }

  describe '#mapping' do
    context 'with status code OC' do
      let(:status_codes) { { status_code: 'OC' }.to_json }

      it 'should convert value to created' do
        expect(map_values).to include(status: 'CREATED')
      end
    end

    context 'with status code IT' do
      ValueMapper::MAPPING_VALUES.each do |key, value|
        let(:status_codes) { { status_code: key }.to_json }

        it 'should convert value to on transit' do
          expect(map_values).to include(status: value)
        end
      end
    end

    context 'with status code DL' do
      let(:status_codes) { { status_code: 'DL' }.to_json }

      it 'should convert value to delivered' do
        expect(map_values).to include(status: 'DELIVERED')
      end
    end

    context 'with status code DE' do
      let(:status_codes) { { status_code: 'DE' }.to_json }

      it 'should convert value to exception' do
        expect(map_values).to include(status: 'EXCEPTION')
      end
    end
  end
end
