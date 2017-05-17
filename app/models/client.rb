class Client < ApplicationRecord
  # Direct associations

  has_many   :engagements,
             :dependent => :destroy

  belongs_to :company

  # Indirect associations

  has_many   :projects,
             :through => :engagements,
             :source => :project

  has_many   :designers,
             :through => :projects,
             :source => :designers

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
