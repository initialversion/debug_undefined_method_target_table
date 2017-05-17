class Project < ApplicationRecord
  # Direct associations

  has_many   :assignments,
             :dependent => :destroy

  has_many   :items,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
