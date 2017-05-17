class Designer < ApplicationRecord
  # Direct associations

  has_many   :assignments,
             :dependent => :destroy

  # Indirect associations

  has_many   :companies,
             :through => :projects,
             :source => :companies

  has_many   :clients,
             :through => :projects,
             :source => :clients

  has_many   :projects,
             :through => :assignments,
             :source => :project

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
