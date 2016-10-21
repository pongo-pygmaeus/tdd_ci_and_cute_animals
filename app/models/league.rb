class League < ApplicationRecord
   belongs_to :creator, 
              class_name: "User"
              
   has_many   :teams, dependent: :destroy
end
