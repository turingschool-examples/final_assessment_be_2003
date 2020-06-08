require 'rails_helper'

RSpec.describe Patient do

  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'Relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

end
