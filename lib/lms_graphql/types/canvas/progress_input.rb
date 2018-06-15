require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
        class ProgressWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "queued"
          value "running"
          value "completed"
          value "failed"
        end
      class CanvasProgressInput < BaseInputObject
        description "Progress. API Docs: https://canvas.instructure.com/doc/api/progress.html"
        argument :id, ID, "the ID of the Progress object.Example: 1", required: false
        argument :context_id, ID, "the context owning the job..Example: 1", required: false
        argument :context_type, String, "Example: Account", required: false
        argument :user_id, ID, "the id of the user who started the job.Example: 123", required: false
        argument :tag, String, "the type of operation.Example: course_batch_update", required: false
        argument :completion, Int, "percent completed.Example: 100", required: false
        argument :workflow_state, ProgressWorkflowStateEnum, "the state of the job one of 'queued', 'running', 'completed', 'failed'.Example: completed", required: false
        argument :created_at, LMSGraphQL::Types::DateTimeType, "the time the job was created.Example: 2013-01-15T15:00:00Z", required: false
        argument :updated_at, LMSGraphQL::Types::DateTimeType, "the time the job was last updated.Example: 2013-01-15T15:04:00Z", required: false
        argument :message, String, "optional details about the job.Example: 17 courses processed", required: false
        argument :results, String, "optional results of the job. omitted when job is still pending.Example: 123", required: false
        argument :url, String, "url where a progress update can be retrieved.Example: https://canvas.example.edu/api/v1/progress/1", required: false

      end
    end
  end
end