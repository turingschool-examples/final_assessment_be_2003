require 'rails_helper'

describe Patient do
  describe 'Relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end
end
