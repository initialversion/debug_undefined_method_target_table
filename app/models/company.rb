class Company < ApplicationRecord
  # Direct associations

  has_many   :clients,
             :dependent => :destroy

  # Indirect associations

  has_many   :items,
             :through => :projects,
             :source => :items

  has_many   :projects,
             :through => :clients,
             :source => :projects

  has_many   :designers,
             :through => :projects,
             :source => :designers

  # Validations

end
