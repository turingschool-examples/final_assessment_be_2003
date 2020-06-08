class Patient < ApplicationRecord
  validates_presence_of :name, :age
  
end