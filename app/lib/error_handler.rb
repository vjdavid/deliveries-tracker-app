module ErrorHandler
  extend ActiveSupport::Concern

  ERRORS = {
    'ActiveRecord::RecordNotFound' => 'Errors::NotFound',
    'ActiveRecord::RecordInvalid' => 'Errors::Invalid'
  }

  included do
    rescue_from(StandardError, with: lambda { |e| handle_error(e) })
  end

  private

  def handle_error(e)
    mapped = map_error(e)
    mapped ||= Errors::StandardError.new
    render_error(mapped)
  end

  def map_error(e)
    error_klass = e.class.name
    return e if ERRORS.values.include?(error_klass)
    ERRORS[error_klass].constantize.new
  end

  def render_error(error)
    render json: ErrorSerializer.new(error), status: error.status
  end
end
