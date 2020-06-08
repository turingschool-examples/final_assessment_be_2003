class Patient < ApplicationRecord
  belongs_to :doctor
  has_many :doctors

  validates_presence_of :name,
                        :age
end
