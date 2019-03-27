RSpec.describe JustAllTheSame do
  let(:origin) { array.all?(false) }

  describe "implements all_false?" do
    it { expect(Array.new.respond_to?(:all_false?)).to be_truthy }
    it { expect{ Array.new.all_false?(1) }.to raise_error ArgumentError }
  end

  describe "all_false?" do
    subject { array.all_false? }

    context "size 0" do
      let(:array) { [] }
      it { is_expected.to be origin }
    end

    context "size 1" do
      context "nil" do
        let(:array) { [false] }
        it { is_expected.to be origin }
      end
      context "other" do
        let(:array) { [1] }
        it { is_expected.to be origin }
      end
    end

    (2..20).each do |i|
      context "ALL nil(size=#{i})" do
        let(:array) { [false]*i }
        it { is_expected.to be origin }
      end
    end

    context "last is not nil" do
      (2..20).each do |i|
        context "nil((size=#{i}) and last is 1)" do
          let(:array) { [false]*(i-1) << 1 }
          it { is_expected.to be origin }
        end
      end
    end
  end
end
