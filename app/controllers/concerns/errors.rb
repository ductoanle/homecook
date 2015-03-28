require 'active_support/concern'

module Errors
  extend ActiveSupport::Concern

  def unprocessable_entity_error(msg)
    render json: Oj.dump(error: msg), status: :unprocessable_entity and return
  end

  def unauthorized_error(msg)
    render json: Oj.dump(error: msg), status: :unauthorized and return
  end
end
