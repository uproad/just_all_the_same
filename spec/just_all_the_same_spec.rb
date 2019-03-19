RSpec.describe JustAllTheSame do
  it "has a version number" do
    expect(JustAllTheSame::VERSION).not_to be nil
  end

  describe "system check" do
    it { expect(Array.new.respond_to?(:all_nil?)).to be_truthy }
  end

  describe "all_nil?" do
    subject { array.all_nil? }

    context "size 1" do
      context "nil" do
        let(:array) { [nil] }
        it { is_expected.to be_truthy }
      end
      context "other" do
        let(:array) { [1] }
        it { is_expected.to be_falsey }
      end
      context "0x8(Qnil's Integer)" do
        let(:array) { [8] }
        it { is_expected.to be_falsey }
      end
    end

    (2..20).each do |i|
      context "ALL nil(size=#{i})" do
        let(:array) { [nil]*i }
        it { is_expected.to be_truthy }
      end
    end
    context "ALL nil(100_000_000)" do
      let(:array) { [nil]*100_000_000 }
      it { is_expected.to be_truthy }
    end

    context "last is not nil" do
      (2..20).each do |i|
        context "nil((size=#{i}) and last is 1)" do
          let(:array) { [nil]*(i-1) << 1 }
          it { is_expected.to be_falsey }
        end
      end
    end

    (2..20).each do |i|
      context "ALL same but not nil(size=#{i})" do
        let(:array) { [1]*(i) }
        it { is_expected.to be_falsey }
      end
    end
  end
end
