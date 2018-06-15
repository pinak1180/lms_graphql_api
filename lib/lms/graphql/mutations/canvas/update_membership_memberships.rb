require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/group_membership"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateMembershipMembership < CanvasBaseMutation
          argument :group_id, ID, required: true
          argument :membership_id, ID, required: true
          argument :workflow_state, String, required: false
          argument :moderator, String, required: false
          field :group_membership, LMS::GraphQL::Types::Canvas::GroupMembership, null: false
          def resolve(group_id:, membership_id:, workflow_state: nil, moderator: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_MEMBERSHIP_MEMBERSHIPS",
              {
                "group_id": group_id,
                "membership_id": membership_id,
                "workflow_state": workflow_state,
                "moderator": moderator              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end