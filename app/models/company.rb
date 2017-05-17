class Company < ApplicationRecord
  # Direct associations

  has_many   :clients,
             :dependent => :destroy

  # Indirect associations

  has_many   :designers,
             :through => :projects,
             :source => :designers

  # Validations

end
