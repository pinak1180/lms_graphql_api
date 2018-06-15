require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class CloseOpenedPollSession < CanvasBaseResolver
          type Boolean, null: false
          argument :poll_id, ID, required: true
          argument :id, ID, required: true
          def resolve(poll_id:, id:)
            context[:canvas_api].proxy(
              "CLOSE_OPENED_POLL_SESSION",
              {
                "poll_id": poll_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end