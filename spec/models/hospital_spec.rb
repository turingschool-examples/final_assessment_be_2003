require 'rails_helper'

RSpec.describe Hospital, type: :model do 
  describe "relationships" do
    it { should have_many :doctors}
  end

  describe "methods" do
    before(:each) do
      @hospital1 = Hospital.create(name: "Banner Desert", address: "123 Medical Dr", city: "Mesa", state: "AZ", zip: "80202")
      
      @doc1 = @hospital1.doctors.create(name: "John Matrix", specialty: "Cardiology", education: "Arizona State University")
      @doc2 = @hospital1.doctors.create(name: "Doug Quiad", specialty: "Neurology", education: "Metro State University")
      @doc3 = @hospital1.doctors.create(name: "Harry Tasker", specialty: "Pulmonology", education: "Arizona State University")
    end

    it "#doc_count" do
      expect(@hospital1.doc_count).to eq(3) 
    end

    it "#doc_universities" do
      expect(@hospital1.doc_universities).to eq(["Arizona State University", "Metro State University"]) 
    end
  end
end