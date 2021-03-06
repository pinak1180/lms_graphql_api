require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment_override"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAssignmentOverride < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAssignmentOverride], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        def resolve(course_id:, assignment_id:, get_all: false)
          result = context[:canvas_api].call("LIST_ASSIGNMENT_OVERRIDES").proxy(
            "LIST_ASSIGNMENT_OVERRIDES",
            {
              "course_id": course_id,
              "assignment_id": assignment_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end