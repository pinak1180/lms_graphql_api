require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grader"
module LMSGraphQL
  module Resolvers
    module Canvas
      class DetailsForGivenDateInGradebookHistoryForThisCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGrader], null: false
        argument :course_id, ID, required: true
        argument :date, String, required: true
        def resolve(course_id:, date:)
          context[:canvas_api].proxy(
            "DETAILS_FOR_GIVEN_DATE_IN_GRADEBOOK_HISTORY_FOR_THIS_COURSE",
            {
              "course_id": course_id,
              "date": date            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end