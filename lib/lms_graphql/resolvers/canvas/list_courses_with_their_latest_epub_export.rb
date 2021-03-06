require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course_epub_export"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListCoursesWithTheirLatestEpubExport < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCourseEpubExport], null: false
        argument :get_all, Boolean, required: false

        def resolve(get_all: false)
          result = context[:canvas_api].call("LIST_COURSES_WITH_THEIR_LATEST_EPUB_EXPORT").proxy(
            "LIST_COURSES_WITH_THEIR_LATEST_EPUB_EXPORT",
            {
            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end