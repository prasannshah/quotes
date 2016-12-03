class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  attr_accessor :current_user

  protected

  def not_found
    api_error(status: 404, errors: 'Not found')
  end

  def invalid_resource!(errors = [])
    api_error(status: 422, errors: errors)
  end

  def api_error(status: 500, errors: [])
    unless Rails.env.production?
      puts errors.full_messages if errors.respond_to? :full_messages
    end
    head status: status and return if errors.empty?

    render json: jsonapi_format(errors).to_json, status: status
  end

  private

  def jsonapi_format(errors)
    return errors if errors.is_a? String
    errors_hash = {}
    errors.messages.each do |attribute, error|
      array_hash = []
      error.each do |e|
        array_hash << {attribute: attribute, message: e}
      end
      errors_hash.merge!({ attribute => array_hash })
    end

    errors_hash
  end

end
