class Engagement < ApplicationRecord
  # Direct associations

  belongs_to :client

  belongs_to :project

  # Indirect associations

  # Validations

end
