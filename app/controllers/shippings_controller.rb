class ShippingsController < ApplicationController

  def track
    trackings = ShippingTrackerService.new.perform(tracking_numbers)

    render json: trackings, status: 200
  end

  private

  def tracking_numbers
    params.permit(data: [:tracking_number, :carrier])[:data]
  end
end
