require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListExternalToolsAccount < CanvasBaseResolver
        type Boolean, null: false
        argument :account_id, ID, required: true
        argument :search_term, String, required: false
        argument :selectable, Boolean, required: false
        argument :include_parents, Boolean, required: false
        def resolve(account_id:, search_term: nil, selectable: nil, include_parents: nil, get_all: false)
          result = context[:canvas_api].call("LIST_EXTERNAL_TOOLS_ACCOUNTS").proxy(
            "LIST_EXTERNAL_TOOLS_ACCOUNTS",
            {
              "account_id": account_id,
              "search_term": search_term,
              "selectable": selectable,
              "include_parents": include_parents            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end