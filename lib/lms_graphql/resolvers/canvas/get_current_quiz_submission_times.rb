require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetCurrentQuizSubmissionTime < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, quiz_id:, id:, get_all: false)
          result = context[:canvas_api].call("GET_CURRENT_QUIZ_SUBMISSION_TIMES").proxy(
            "GET_CURRENT_QUIZ_SUBMISSION_TIMES",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end