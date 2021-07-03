class Department < ApplicationRecord
  LIST = ["Marketing", "Operations", "Finance", "Sales", "Human Resource", "Purchase"]

  validates :name, presence: true, uniqueness: true

end
