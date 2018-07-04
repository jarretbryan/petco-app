class Pet < ApplicationRecord
  belongs_to :owner
  validates :name, presence: true
  validates :species, presence: true

  def self.search(search)
    Pet.all.select do |pet|
      pet.species.downcase == search.downcase
    end
  end

end
