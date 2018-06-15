require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/module_item"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteModuleItem < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :module_id, ID, required: true
        argument :id, ID, required: true
        field :module_item, LMSGraphQL::Types::Canvas::CanvasModuleItem, null: false
        def resolve(course_id:, module_id:, id:)
          ctx[:canvas_api].proxy(
            "DELETE_MODULE_ITEM",
            {
              "course_id": course_id,
              "module_id": module_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end