require 'rails_helper'

RSpec.describe Patient, type: :model do
  subject(:patient) { build(:patient) }

  describe "#formatted_treatment_number=" do
    it "adds leading zeroes" do
      patient.treatment_number = 1234
      expect(patient.formatted_treatment_number).to eq("2018-00001234")
    end

    it "doesn't add too many leading zeroes" do
      patient.treatment_number = 123456789
      expect(patient.formatted_treatment_number).to eq("2018-123456789")
    end

    it "does not format non-integers" do
      patient.treatment_number = "2018-00005555"
      expect(patient.formatted_treatment_number).to eq("2018-00005555")
    end
  end

  describe "#treatment_number_prefix" do
    it "adds leading zeroes" do
      patient.treatment_number = 1234
      expect(patient.treatment_number_prefix).to eq("2018-0000")
    end

    it "doesn't add too many leading zeroes" do
      patient.treatment_number = 123456789
      expect(patient.treatment_number_prefix).to eq("2018-")
    end

    it "does not format non-integers" do
      patient.treatment_number = "2018-00005555"
      expect(patient.treatment_number_prefix).to eq("")
    end
  end
end
