# frozen_string_literal: true

class ValueMapper
  # https://www.fedex.com/us/developer/downloads/pdf/2020/FedEx_WebServices_DevelopersGuide_v2020.pdf

  MAPPING_VALUES = {
    'OC' => 'CREATED',
    'IT' => 'ON_TRANSIT',
    'DL' => 'DELIVERED',
    'DE' => 'EXCEPTION'
  }.freeze

  attr_accessor :tracking_detail

  def initialize(tracking_detail)
    @tracking_detail = JSON.parse(tracking_detail, object_class: OpenStruct)
  end

  def mapping
    code = tracking_detail.status_code
    return tracking_detail unless MAPPING_VALUES.key?(code)

    tracking_detail.status = MAPPING_VALUES.dig(code)
    tracking_detail.to_h
  end
end
