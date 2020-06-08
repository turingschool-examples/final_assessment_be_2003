require 'rails_helper'

RSpec.describe Doctor do
  describe "Validations" do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:specialty) }
    it { should validate_presence_of(:education) }
  end
end