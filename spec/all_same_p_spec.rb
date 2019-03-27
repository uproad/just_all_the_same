RSpec.describe JustAllTheSame do
  let(:origin) { array.all?(val) }

  describe "implements all_same?" do
    it { expect(Array.new.respond_to?(:all_same?)).to be_truthy }
    it { expect{ Array.new.all_same? }.to raise_error ArgumentError }
    it { expect{ Array.new.all_same?(1, 1) }.to raise_error ArgumentError }
  end

  describe "all_same?(val)" do
    subject { array.all_same?(val) }

    context 'val = 0' do
      let(:val) { 0 }

      context "size 0" do
        let(:array) { [] }
        it { is_expected.to be origin }
      end

      context "size 1" do
        context "val" do
          let(:array) { [val] }
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
        context "ALL val(size=#{i})" do
          let(:array) { [val]*i }
          it { is_expected.to be origin }
        end
      end
      context "ALL val(1_000_000)" do
        let(:array) { [val]*1_000_000 }
        it { is_expected.to be origin }
      end

      context "last is not val" do
        (2..20).each do |i|
          context "val((size=#{i}) and last is 1)" do
            let(:array) { [val]*(i-1) << 1 }
            it { is_expected.to be origin }
          end
        end
      end

      (2..20).each do |i|
        context "ALL same but not val(size=#{i})" do
          let(:array) { [1]*(i) }
          it { is_expected.to be origin }
        end
      end

      it "work like real code" do
        array = []

        100.times { array << val }

        expect(array.all_same?(val)).to be array.all?(val)

      end
    end
  end

end
