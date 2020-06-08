require 'rails_helper'

RSpec.describe Hospital do
  describe 'Relationships' do
    it {should have_many :doctors}
  end
  #
  # describe 'Validations' do
  # end
end
