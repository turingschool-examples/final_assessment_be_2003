require "rails_helper"

RSpec.describe Patient, type: :model do
  describe "relationships" do
    it {should belong_to :doctor}
  end

end
