describe CronInfo::HourParser do
  let(:parser) { CronInfo::HourParser.new }

  describe "#parse_single function" do
    describe "for an array of range inputs" do
      let(:inputs) { [
        [["1-5"], (1..5).to_a],
        [["*/4"], [0,4,8]],
        [["1-6/4"], [1,5]],
        [["*"], (0..11).to_a],
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
