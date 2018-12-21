require 'spec_helper'

describe SassColorExtractor::Base do
  FIXTURE_PATH = "spec/fixtures"
  describe ".parse_colors" do

    context "given a Sass file" do
      let(:file) { File.expand_path( File.join(FIXTURE_PATH, "test_colors.sass") ) }
      it 'returns a list of the parsed colors' do
        colors = described_class.parse_colors(file)
        expect(colors).to eql({
                                "black" => "000",
                                "white" => "ffffff",
                                "red" => "ff0000",
                                "yellr" => "fc2",
                                "dynamic-color" => "yellow",
                                "light_yellr" => "ffe488",
                                "orangey" => "rgba(200, 100, 10, 0.2)",
                                "dark_yellr" => "eeb700"
                              })
      end
    end

    context "given an Scss file" do
      let(:file) { File.expand_path( File.join(FIXTURE_PATH, "test_colors.scss") ) }
      it "returns a list of the parsed colors" do
        colors = described_class.parse_colors(file)
        expect(colors).to eql({
                                "black" => "000",
                                "white" => "ffffff",
                                "red" => "ff0000",
                                "yellr" => "fc2",
                                "dynamic-color" => "yellow",
                                "light_yellr" => "ffe488",
                                "orangey" => "rgba(200, 100, 10, 0.2)",
                                "dark_yellr" => "eeb700",
                              })
      end
    end

  end
end
