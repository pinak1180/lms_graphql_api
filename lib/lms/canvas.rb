require "graphql"
require_relative "utils"
require_relative "graphql/types/canvas_forward_declarations"
require_all(File.absolute_path(__FILE__), "graphql/resolvers/canvas/")
require_all(File.absolute_path(__FILE__), "graphql/types/canvas/")

module LMS
end
