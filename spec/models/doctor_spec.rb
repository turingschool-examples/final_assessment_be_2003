require 'rails_helper'

RSpec.describe Doctor do
  describe 'Relationships' do
    it {should belong_to :hospital}
    it {should have_many(:patients).through(:doctor_patients)}
  end
  #
  # describe 'Validations' do
  # end
end
