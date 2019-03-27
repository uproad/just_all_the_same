RSpec.describe JustAllTheSame do
  let(:origin) { array.all?(true) }

  describe "implements all_true?" do
    it { expect(Array.new.respond_to?(:all_true?)).to be_truthy }
    it { expect{ Array.new.all_true?(1) }.to raise_error ArgumentError }
  end

  describe "all_true?" do
    subject { array.all_true? }

    context "size 0" do
      let(:array) { [] }
      it { is_expected.to be origin }
    end

    context "size 1" do
      context "nil" do
        let(:array) { [true] }
        it { is_expected.to be origin }
      end
      context "other" do
        let(:array) { [1] }
        it { is_expected.to be origin }
      end
    end

    (2..20).each do |i|
      context "ALL nil(size=#{i})" do
        let(:array) { [true]*i }
        it { is_expected.to be origin }
      end
    end

    context "last is not nil" do
      (2..20).each do |i|
        context "nil((size=#{i}) and last is 1)" do
          let(:array) { [true]*(i-1) << 1 }
          it { is_expected.to be origin }
        end
      end
    end
  end
end
