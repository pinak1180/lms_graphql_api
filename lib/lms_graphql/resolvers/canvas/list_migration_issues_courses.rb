require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/migration_issue"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMigrationIssuesCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasMigrationIssue], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :content_migration_id, ID, required: true
        def resolve(course_id:, content_migration_id:, get_all: false)
          result = context[:canvas_api].call("LIST_MIGRATION_ISSUES_COURSES").proxy(
            "LIST_MIGRATION_ISSUES_COURSES",
            {
              "course_id": course_id,
              "content_migration_id": content_migration_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end