require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListEnabledFeaturesCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, ID, required: true
          def resolve(course_id:)
            context[:canvas_api].proxy(
              "LIST_ENABLED_FEATURES_COURSES",
              {
                "course_id": course_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end