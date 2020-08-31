# frozen_string_literal: true
#
class ShippingTrackerService
  include Fedex

  attr_accessor :client, :results

  def initialize
    fedex_keys = Rails.application.credentials[Rails.env.to_sym][:fedex_access_key]
    @client = Fedex::Shipment.new(fedex_keys)
    @results = []
  end

  def perform(tracking_numbers)
    tracking_numbers.each do |tracking_number|
      request_tracker(tracking_number)
    end

    results
  end

  private

  def request_tracker(tracking_number)
    current_tracking = tracking_number.dup

    response = client.track(tracking_number).first
  rescue Fedex::RateError => error
    Errors::Resolver.new(error, current_tracking).resolve
  else
    results << ValueMapper.new(response.to_json).mapping
  end
end
