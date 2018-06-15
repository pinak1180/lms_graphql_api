require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/license"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListLicensesCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasLicense], null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].proxy(
            "LIST_LICENSES_COURSES",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end