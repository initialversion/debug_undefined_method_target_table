class Assignment < ApplicationRecord
  # Direct associations

  belongs_to :project

  belongs_to :designer

  # Indirect associations

  # Validations

end
