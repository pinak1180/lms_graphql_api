require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/originality_report"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowOriginalityReportSubmission < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasOriginalityReport, null: false
        argument :assignment_id, ID, required: true
        argument :submission_id, ID, required: true
        argument :id, ID, required: true
        def resolve(assignment_id:, submission_id:, id:, get_all: false)
          result = context[:canvas_api].call("SHOW_ORIGINALITY_REPORT_SUBMISSIONS").proxy(
            "SHOW_ORIGINALITY_REPORT_SUBMISSIONS",
            {
              "assignment_id": assignment_id,
              "submission_id": submission_id,
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