module Errors
  class NotFound < Errors::StandardError
    def initialize(options = {})
      super(
        title: 'Record not Found',
        status: 404,
        detail: options[:error_message] || 'We could not find the object you were looking for.',
        source: options[:tracking_number] || 'Please review your tracking number.'
      )
    end
  end
end
