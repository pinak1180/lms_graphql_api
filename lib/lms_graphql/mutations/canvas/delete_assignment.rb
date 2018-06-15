require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteAssignment < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        field :assignment, LMSGraphQL::Types::Canvas::CanvasAssignment, null: false
        def resolve(course_id:, id:)
          ctx[:canvas_api].proxy(
            "DELETE_ASSIGNMENT",
            {
              "course_id": course_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end