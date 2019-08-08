class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails

  validates :name, presence: true
  validates :name, uniqueness: true
end
