describe CronInfo::DayOfWeekParser do
  let(:parser) { CronInfo::DayOfWeekParser.new }

  describe "#parse_single function" do
    describe "for an array of range inputs" do
      let(:inputs) { [
        [["1-5"], (1..5).to_a],
        [["*/4"], [1,5]],
        [["1-6/4"], [1,5]],
        [["*"], (1..7).to_a],
        [["Mon"], [1]],
        [["Fri-Sun"], [5,6,7]],
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
