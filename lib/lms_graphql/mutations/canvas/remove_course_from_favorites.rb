require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/favorite"
module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveCourseFromFavorite < CanvasBaseMutation
        argument :id, ID, required: true
        field :favorite, LMSGraphQL::Types::Canvas::CanvasFavorite, null: false
        def resolve(id:)
          ctx[:canvas_api].proxy(
            "REMOVE_COURSE_FROM_FAVORITES",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end