module Errors
  class Invalid < Errors::StandardError
    def initialize(options = {})
      super(
        title: 'Invalid Record',
        status: 422,
        detail: options[:error_message] || 'The tracking number is incorrect.',
        source: options[:tracking_number] || 'You should review your tracking number please.'
      )
    end
  end
end
