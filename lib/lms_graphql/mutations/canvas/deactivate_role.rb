require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/role"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeactivateRole < CanvasBaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        argument :role_id, ID, required: true
        argument :role, String, required: false
        field :role, LMSGraphQL::Types::Canvas::CanvasRole, null: false
        def resolve(account_id:, id:, role_id:, role: nil)
          ctx[:canvas_api].proxy(
            "DEACTIVATE_ROLE",
            {
              "account_id": account_id,
              "id": id,
              "role_id": role_id,
              "role": role            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end