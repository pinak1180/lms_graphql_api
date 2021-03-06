require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListRubricsAccount < CanvasBaseResolver
        type Boolean, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("LIST_RUBRICS_ACCOUNTS").proxy(
            "LIST_RUBRICS_ACCOUNTS",
            {
              "account_id": account_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end