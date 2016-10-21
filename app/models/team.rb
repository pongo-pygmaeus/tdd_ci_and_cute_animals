class Team < ApplicationRecord
   belongs_to :league

   belongs_to :captain, 
              class_name: "User"

   has_many   :memberships, dependent: :destroy

   has_many   :members, 
              through: :memberships, 
              source: :member
end