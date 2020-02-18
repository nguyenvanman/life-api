module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found 
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid 
    rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique
  end

  def record_not_found exception
    render_error(exception, 404)
  end

  def record_invalid exception
    render_error(exception, 422)
  end

  def record_not_unique exception 
    render_error(exception, 422)
  end

  def render_error exception, code
    render json: ErrorSerializer.new(exception), status: code
  end

end