class Company < ApplicationRecord
  # Direct associations

  has_many   :clients,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
