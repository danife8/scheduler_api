class ErrorsController < ApplicationController
  def not_found
    render status: :not_found, message: 'Record not found'
  end

  def internal_server_error
    render status: :internal_server_error, message: 'Internal server error'
  end
end
