# frozen_string_literal: true

module Decidim
  module Petitions
    describe Petition do
      subject { petition }

      let(:petition) { build(:petition) }

      it { is_expected.to be_valid }

      include_examples "authorable"
      include_examples "has component"
      include_examples "publicable"
      include_examples "resourceable"

      it "return community_name" do
        expect(subject.community_name).to eq(subject.title["en"])
      end

      it "return community_id" do
        expect(subject.community_id).not_to be nil
      end

      it "return body en" do
        expect(subject.body).to eq(subject.title)
      end

      it "return attribute_id" do
        expect(subject.attribute_id).to match(subject.title["en"].parameterize)
      end

      context "when petition is closed" do
        let(:petition) { build(:petition, :open) }

        it { expect(subject.opened?).to be true }
      end
    end
  end
end
