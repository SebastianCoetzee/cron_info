describe CronInfo::Parser do
  let(:parser) { CronInfo::Parser.new }

  describe "#parse method" do
    it "should call parse_single for each of the cron strings" do
      expect(parser).to receive(:parse_single).with("1").and_return([1])
      expect(parser).to receive(:parse_single).with("2").and_return([2]).twice
      expect(parser).to receive(:parse_single).with("3").and_return([3])
      expect(parser.parse("3,2,2,1")).to eq([1,2,3])
    end
  end

  describe "#parse_single function" do
    describe "for an array of range inputs" do
      let(:inputs) { [
        [["1-15"], (1..15).to_a],
        [["*/15"], [0,15,30,45]],
        [["1-31/15"], [1,16,31]],
        [["*"], (0..59).to_a],
        [["10"], [10]]
      ] }

      it "should return the correct result" do
        allow(parser).to receive(:min_value).and_return(0)
        allow(parser).to receive(:max_value).and_return(59)
        inputs.each do |input|
          expect(parser.parse_single(*input.first)).to eq(input.last)
        end
      end
    end
  end

  describe "#parse_every_time_interval function" do
    describe "for an array of range inputs" do
      let(:inputs) { [
        [["*/15", 0, 59], [0,15,30,45]],
        [["*/2", 1, 11], [1,3,5,7,9,11]],
        [["0-30/15", 0, 59], [0,15,30]],
        [["30/15", 0, 59], [30]]
      ] }

      it "should return the correct result" do
        inputs.each do |input|
          expect(described_class.new.parse_every_time_interval(*input.first)).to eq(input.last)
        end
      end
    end
  end

  describe "#parse_range function" do
    describe "for an array of range inputs" do
      let(:inputs) { [
        ["1-5", [1,2,3,4,5]],
        ["4-5", [4,5]],
        ["5-5", [5]]
      ] }

      it "should return the correct result" do
        inputs.each do |input|
          expect(described_class.new.parse_range(input.first)).to eq(input.last)
        end
      end
    end
  end

  describe "#is_every_time_interval? function" do
    describe "for an array of inputs" do
      let(:inputs) { [
        ["*/15", true],
        ["1/15", true],
        ["1-30/15", true],
        ["Tue", false],
        ["1", false],
        ["*", false]
      ] }

      it "should return the correct result" do
        inputs.each do |input|
          expect(described_class.new.is_every_time_interval?(input.first)).to eq(input.last)
        end
      end
    end
  end

  describe "#is_range? function" do
    describe "for an array of inputs" do
      let(:inputs) { [
        ["1-5", true],
        ["4-5", true],
        ["1", false],
        ["*", false]
      ] }

      it "should return the correct result" do
        inputs.each do |input|
          expect(described_class.new.is_range?(input.first)).to eq(input.last)
        end
      end
    end
  end

  describe "#is_numeric? function" do
    describe "for an array of inputs" do
      let(:inputs) { [
        ["1", true],
        ["4", true],
        ["a", false],
        ["*", false]
      ] }

      it "should return the correct result" do
        inputs.each do |input|
          expect(described_class.new.is_numeric?(input.first)).to eq(input.last)
        end
      end
    end
  end

  describe "#is_word_range? function" do
    describe "for an array of inputs" do
      let(:inputs) { [
        ["Mon-Sun", true],
        ["Jan-Mar", true],
        ["1-2", false],
        ["*", false]
      ] }

      it "should return the correct result" do
        inputs.each do |input|
          expect(described_class.new.is_word_range?(input.first)).to eq(input.last)
        end
      end
    end
  end

  describe "#is_word? function" do
    describe "for an array of inputs" do
      let(:inputs) { [
        ["Mon", true],
        ["Jan", true],
        ["1", false],
        ["4", false]
      ] }

      it "should return the correct result" do
        inputs.each do |input|
          expect(described_class.new.is_word?(input.first)).to eq(input.last)
        end
      end
    end
  end
end
