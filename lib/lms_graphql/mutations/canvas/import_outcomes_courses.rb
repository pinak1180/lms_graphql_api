require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_import"
module LMSGraphQL
  module Mutations
    module Canvas
      class ImportOutcomesCourse < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :import_type, String, required: false
        argument :attachment, String, required: false
        argument :extension, String, required: false
        field :outcome_import, LMSGraphQL::Types::Canvas::OutcomeImport, null: false
        def resolve(course_id:, import_type: nil, attachment: nil, extension: nil)
          ctx[:canvas_api].proxy(
            "IMPORT_OUTCOMES_COURSES",
            {
              "course_id": course_id,
              "import_type": import_type,
              "attachment": attachment,
              "extension": extension            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end