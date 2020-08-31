module Errors
  class NotImplemented < Errors::StandardError
    def initialize
      super(
        title: 'Not Implemented',
        status: 501,
        detail: 'Sorry at this time we dont have implemented this functionalitity.',
        source: 'This feature is not available yet.'
      )
    end
  end
end
