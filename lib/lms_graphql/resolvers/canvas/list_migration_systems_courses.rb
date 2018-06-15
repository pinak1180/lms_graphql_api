require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/migrator"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMigrationSystemsCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasMigrator], null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].proxy(
            "LIST_MIGRATION_SYSTEMS_COURSES",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end