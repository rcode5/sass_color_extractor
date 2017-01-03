require 'sass'
module SassColorExtractor
  class VariableEvaluator < Sass::Tree::Visitors::Base
    def visit_variable(node)
      @environment ||= Sass::Environment.new
      begin
        val = node.expr.perform(@environment)
      rescue Sass::SyntaxError
        val = node.expr
      end
      @environment.set_local_var(node.name, val)
      [node.name, node.expr.perform(@environment)]
    end
  end
end
