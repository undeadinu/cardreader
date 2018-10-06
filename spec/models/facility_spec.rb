require 'rails_helper'

RSpec.describe Facility, type: :model do
  it { should belong_to(:district) }
  it { should have_many(:patients).inverse_of(:facility).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it {
    should validate_uniqueness_of(:name)
                     .scoped_to(:district_id)
                     .case_insensitive
                     .with_message("should be unique per district")
  }
end