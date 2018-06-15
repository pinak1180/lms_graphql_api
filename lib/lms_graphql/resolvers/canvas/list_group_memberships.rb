require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group_membership"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGroupMembership < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGroupMembership], null: false
        argument :group_id, ID, required: true
        argument :filter_states, String, required: false
        def resolve(group_id:, filter_states: nil)
          context[:canvas_api].proxy(
            "LIST_GROUP_MEMBERSHIPS",
            {
              "group_id": group_id,
              "filter_states": filter_states            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end