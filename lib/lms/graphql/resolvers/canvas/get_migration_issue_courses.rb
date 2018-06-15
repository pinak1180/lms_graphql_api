require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/migration_issue"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetMigrationIssueCourse < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::MigrationIssue, null: false
          argument :course_id, ID, required: true
          argument :content_migration_id, ID, required: true
          argument :id, ID, required: true
          def resolve(course_id:, content_migration_id:, id:)
            context[:canvas_api].proxy(
              "GET_MIGRATION_ISSUE_COURSES",
              {
                "course_id": course_id,
                "content_migration_id": content_migration_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end