module Errors
  class Resolver
    attr_reader :error_message, :tracking_number

    def initialize(error_message, tracking_number)
      @error_message = error_message
      @tracking_number = tracking_number
    end

    def resolve
      case error_message.to_s
      when 'Invalid tracking numbers. Please check the following numbers and resubmit.'
        raise Errors::Invalid.new(full_message)
      when 'This tracking number cannot be found. Please check the number or contact the sender.'
        raise Errors::NotFound.new(full_message)
      else
        raise Errors::NotImplemented
      end
    end

    def full_message
      { error_message: error_message.to_s, tracking_number: tracking_number.to_h }
    end
  end
end
