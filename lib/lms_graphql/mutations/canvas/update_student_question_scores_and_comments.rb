require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateStudentQuestionScoresAndComment < BaseMutation
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :id, ID, required: true
        argument :attempt, Int, required: true
        argument :fudge_points, Float, required: false
        argument :questions, String, required: false
        field :return_value, Boolean, null: false
        def resolve(course_id:, quiz_id:, id:, attempt:, fudge_points: nil, questions: nil)
          context[:canvas_api].call("UPDATE_STUDENT_QUESTION_SCORES_AND_COMMENTS").proxy(
            "UPDATE_STUDENT_QUESTION_SCORES_AND_COMMENTS",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "id": id,
              "attempt": attempt,
              "fudge_points": fudge_points,
              "questions": questions            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end