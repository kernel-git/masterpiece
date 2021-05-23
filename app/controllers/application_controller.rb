# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :null_session

  rescue_from Pundit::NotAuthorizedError, with: :access_denied
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::RoutingError, with: :not_found
  rescue_from AbstractController::ActionNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :request_invalid

  def access_denied(_exception)
    redirect_to static_pages_url(page: 'access-denied')
  end

  def not_found(_exception)
    redirect_to static_pages_url(page: 'not-found-404')
  end

  def request_invalid(_exception)
    redirect_to static_pages_url(page: 'request-invalid')
  end
end
