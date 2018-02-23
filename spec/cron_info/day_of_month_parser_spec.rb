describe CronInfo::DayOfMonthParser do
  let(:parser) { CronInfo::DayOfMonthParser.new }

  describe "#parse_single function" do
    describe "for an array of range inputs" do
      let(:inputs) { [
        [["1-5"], (1..5).to_a],
        [["*/10"], [1,11,21,31]],
        [["1-6/4"], [1,5]],
        [["*"], (1..31).to_a],
        [["4"], [4]]
      ] }

      it "should return the correct result" do
        inputs.each do |input|
          expect(parser.parse_single(*input.first)).to eq(input.last)
        end
      end
    end
  end

end
