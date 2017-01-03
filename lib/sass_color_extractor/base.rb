module SassColorExtractor
  class Base
    DEFAULT_SYNTAX = 'scss'

    def self.parse_colors(sass_file)
      engine = Sass::Engine.for_file(sass_file, syntax: :sass)
      colors = VariableEvaluator.visit(engine.to_tree).compact.reject{|entry| entry.flatten.empty?}
      colors.map{|name, color| [ name, color.to_s.gsub(/^#/,'') ]}
    end

  end
end
