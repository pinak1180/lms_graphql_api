require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListTodoItem < CanvasBaseResolver
        type Boolean, null: false
        argument :include, String, required: false
        def resolve(include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_TODO_ITEMS").proxy(
            "LIST_TODO_ITEMS",
            {
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end