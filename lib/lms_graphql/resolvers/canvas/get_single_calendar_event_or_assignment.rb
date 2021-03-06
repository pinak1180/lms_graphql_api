require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/calendar_event"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleCalendarEventOrAssignment < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasCalendarEvent, null: false
        argument :id, ID, required: true
        def resolve(id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_CALENDAR_EVENT_OR_ASSIGNMENT").proxy(
            "GET_SINGLE_CALENDAR_EVENT_OR_ASSIGNMENT",
            {
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end