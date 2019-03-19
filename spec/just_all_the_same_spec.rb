RSpec.describe JustAllTheSame do
  it "has a version number" do
    expect(JustAllTheSame::VERSION).not_to be nil
  end

  describe "system check" do
    it { expect(Array.new.respond_to?(:all_nil?)).to be_truthy }
  end

  describe "all_nil?" do
    subject { array.all_nil? }

    (1..100).each do |i|
      context "ALL nil(#{i})" do
        let(:array) { [nil]*i }
        it { is_expected.to be true }
      end
    end
  end
end
