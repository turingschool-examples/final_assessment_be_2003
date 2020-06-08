require 'rails_helper'

RSpec.describe Doctor do
  describe 'Relationships' do
    it {should belong_to :hospital}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe 'Validations' do
    it {should validate_presence_of :name }
    it {should validate_presence_of :speciality }
    it {should validate_presence_of :education }
  end
end
