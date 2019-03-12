RSpec.describe JustAllTheSame do
  it "has a version number" do
    expect(JustAllTheSame::VERSION).not_to be nil
  end

  describe "all_nil?" do
    subject { array.all_nil? }
    context "ALL nil" do
      let(:array) { [nil, nil, nil] }
      it { is_expected.to be true }
    end
  end
end
