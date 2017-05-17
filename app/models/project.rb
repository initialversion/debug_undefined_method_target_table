class Project < ApplicationRecord
  # Direct associations

  has_many   :engagements,
             :dependent => :destroy

  has_many   :assignments,
             :dependent => :destroy

  has_many   :items,
             :dependent => :destroy

  # Indirect associations

  has_many   :companies,
             :through => :clients,
             :source => :company

  has_many   :designers,
             :through => :assignments,
             :source => :designer

  # Validations

end
