require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/page"
module LMSGraphQL
  module Mutations
    module Canvas
      class DuplicatePage < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :url, String, required: true
        field :page, LMSGraphQL::Types::Canvas::Page, null: false
        def resolve(course_id:, url:)
          ctx[:canvas_api].proxy(
            "DUPLICATE_PAGE",
            {
              "course_id": course_id,
              "url": url            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end