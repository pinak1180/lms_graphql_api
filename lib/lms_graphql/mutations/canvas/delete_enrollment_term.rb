require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/enrollment_term"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteEnrollmentTerm < CanvasBaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        field :enrollment_term, LMSGraphQL::Types::Canvas::CanvasEnrollmentTerm, null: false
        def resolve(account_id:, id:)
          ctx[:canvas_api].proxy(
            "DELETE_ENROLLMENT_TERM",
            {
              "account_id": account_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end