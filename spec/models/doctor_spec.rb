require "rails_helper"
RSpec.describe Doctor, type: :model do
  describe "relationships" do
    it {should have_many :patients}
    it {should belong_to :hospital}
  end
end
