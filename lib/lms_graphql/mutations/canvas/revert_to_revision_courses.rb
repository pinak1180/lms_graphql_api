require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/page_revision"
module LMSGraphQL
  module Mutations
    module Canvas
      class RevertToRevisionCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :url, String, required: true
        argument :revision_id, ID, required: true
        field :page_revision, LMSGraphQL::Types::Canvas::CanvasPageRevision, null: false
        def resolve(course_id:, url:, revision_id:)
          context[:canvas_api].call("REVERT_TO_REVISION_COURSES").proxy(
            "REVERT_TO_REVISION_COURSES",
            {
              "course_id": course_id,
              "url": url,
              "revision_id": revision_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end