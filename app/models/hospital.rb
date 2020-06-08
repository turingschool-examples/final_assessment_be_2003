class Hospital < ApplicationRecord
  has_many :doctors

  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip
end
