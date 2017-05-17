class Item < ApplicationRecord
  # Direct associations

  belongs_to :project

  # Indirect associations

  has_one    :company,
             :through => :project,
             :source => :companies

  # Validations

end
