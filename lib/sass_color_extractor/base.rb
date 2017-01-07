require 'byebug'
module SassColorExtractor
  class Base
    DEFAULT_SYNTAX = :scss

    def self.parse_colors(sass_file)
      syntax = guess_syntax(sass_file)
      engine = Sass::Engine.for_file(sass_file, syntax: syntax)
      colors = VariableEvaluator.visit(engine.to_tree).compact.reject{|entry| entry.flatten.empty?}
      Hash[colors.map{|name, color| [ name, color.to_s.gsub(/^#/,'') ]}]
    end

    class << self
      private
      def guess_syntax(file)
        guess = File.extname(file)[1..-1].to_sym
        [:sass, :scss].include?(guess) ? guess : DEFAULT_SYNTAX
      end
    end
  end
end
