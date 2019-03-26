RSpec.describe JustAllTheSame do
  let(:origin) { array.all?(nil) }

  describe "implements all_nil?" do
    it { expect(Array.new.respond_to?(:all_nil?)).to be_truthy }
  end

  describe "all_nil?" do
    subject { array.all_nil? }

    context "size 0" do
      let(:array) { [] }
      it { is_expected.to be origin }
    end

    context "size 1" do
      context "nil" do
        let(:array) { [nil] }
        it { is_expected.to be origin }
      end
      context "other" do
        let(:array) { [1] }
        it { is_expected.to be origin }
      end
      context "0x8(Qnil's Integer)" do
        let(:array) { [8] }
        it { is_expected.to be origin }
      end
    end

    (2..20).each do |i|
      context "ALL nil(size=#{i})" do
        let(:array) { [nil]*i }
        it { is_expected.to be origin }
      end
    end
    context "ALL nil(1_000_000)" do
      let(:array) { [nil]*1_000_000 }
      it { is_expected.to be origin }
    end

    context "last is not nil" do
      (2..20).each do |i|
        context "nil((size=#{i}) and last is 1)" do
          let(:array) { [nil]*(i-1) << 1 }
          it { is_expected.to be origin }
        end
      end
    end

    (2..20).each do |i|
      context "ALL same but not nil(size=#{i})" do
        let(:array) { [1]*(i) }
        it { is_expected.to be origin }
      end
    end

    it "work like real code" do
      array = []

      100.times { array << nil }

      expect(array.all_nil?).to be array.all?(nil)

    end
  end
end
