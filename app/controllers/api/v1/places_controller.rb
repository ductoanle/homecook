module Api
  module V1
    class PlacesController < ApplicationController
      def areas
        areas = Place.uniq.pluck(:area)
        render json: Oj.dump(areas, mode: :compat),status: :ok
      end
    end
  end
end
