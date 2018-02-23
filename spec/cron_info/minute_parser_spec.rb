describe CronInfo::MinuteParser do
  let(:parser) { CronInfo::MinuteParser.new }

  describe "#parse_single function" do
    describe "for an array of range inputs" do
      let(:inputs) { [
        [["1-5"], (1..5).to_a],
        [["*/15"], [0,15,30,45]],
        [["1-6/4"], [1,5]],
        [["*"], (0..59).to_a],
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
