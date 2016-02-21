class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: -> { head :not_found }
end
