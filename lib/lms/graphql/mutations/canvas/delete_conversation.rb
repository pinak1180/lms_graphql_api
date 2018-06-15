require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteConversation < CanvasBaseMutation
          argument :id, ID, required: true
          field :return_value, Boolean, null: false
          def resolve(id:)
            ctx[:canvas_api].proxy(
              "DELETE_CONVERSATION",
              {
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end