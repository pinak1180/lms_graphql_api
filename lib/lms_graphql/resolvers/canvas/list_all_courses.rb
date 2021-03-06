require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAllCourse < CanvasBaseResolver
        type Boolean, null: false
        argument :search, String, required: false
        argument :public_only, Boolean, required: false
        argument :open_enrollment_only, Boolean, required: false
        def resolve(search: nil, public_only: nil, open_enrollment_only: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ALL_COURSES").proxy(
            "LIST_ALL_COURSES",
            {
              "search": search,
              "public_only": public_only,
              "open_enrollment_only": open_enrollment_only            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end