require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/blueprint_template"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetBlueprintInformation < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasBlueprintTemplate, null: false
        argument :course_id, ID, required: true
        argument :template_id, ID, required: true
        def resolve(course_id:, template_id:, get_all: false)
          result = context[:canvas_api].call("GET_BLUEPRINT_INFORMATION").proxy(
            "GET_BLUEPRINT_INFORMATION",
            {
              "course_id": course_id,
              "template_id": template_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end