require 'active_support/concern'

module Errors
  extend ActiveSupport::Concern

  def unprocessable_entity_error(msg)
    render json: Oj.dump(error: msg), status: :unprocessable_entity
  end

  def unauthorized_error(msg)
    render json: Oj.dump(error: msg), status: :unauthorized
  end
end
