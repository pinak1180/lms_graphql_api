require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateEntryGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :topic_id, ID, required: true
        argument :id, ID, required: true
        argument :message, String, required: false
        field :return_value, Boolean, null: false
        def resolve(group_id:, topic_id:, id:, message: nil)
          context[:canvas_api].call("UPDATE_ENTRY_GROUPS").proxy(
            "UPDATE_ENTRY_GROUPS",
            {
              "group_id": group_id,
              "topic_id": topic_id,
              "id": id
            },
            {
              "message": message
            },
          ).parsed_response
        end
      end
    end
  end
end