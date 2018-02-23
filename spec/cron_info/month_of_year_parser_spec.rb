describe CronInfo::MonthOfYearParser do
  let(:parser) { CronInfo::MonthOfYearParser.new }

  describe "#parse_single function" do
    describe "for an array of range inputs" do
      let(:inputs) { [
        [["1-5"], (1..5).to_a],
        [["*/4"], [1,5,9]],
        [["1-6/4"], [1,5]],
        [["*"], (1..12).to_a],
        [["Jan"], [1]],
        [["Sep-Dec"], [9,10,11,12]],
        [["10"], [10]]
      ] }

      it "should return the correct result" do
        inputs.each do |input|
          expect(parser.parse_single(*input.first)).to eq(input.last)
        end
      end
    end
  end

end
