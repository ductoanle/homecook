class ErrorsController < ApplicationController
  def index
    unauthorized_error('Unauthorized Access')
  end
end
