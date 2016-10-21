class User < ApplicationRecord

# ******************* HAS MANY LEAGUES ASSOCIATION *******************
#
# The following association is obvious to AR. There is a "League" 
# class, so we don't have to specify a class name
#
# However, because the way the "User" instsnace is not identified as 
# user_id" inside of the "League" class we have to explicity define 
# what the name of the FK pointing to the "User" instance is inside 
# of the "League" class
#
   has_many :leagues, 
            foreign_key: "creator_id", # <--- We need this!
                                      # There's no field called
                                      # user_id inside of the 
                                      # leagues table!
            dependent: :destroy


# ************** HAS ONE CAPTAIN POSITION ASSOCIATION **************
# This association, is NOT obvious to AR. There is no class named 
# "CaptainPosition" or table called "captain_positions" so we need 
# to be explicit and use the "class_name" and "foreign_key" 
# attributes to demystify the association. 

   has_one  :captain_position, 

# We're saying "Go look in the 'Team'" class for this association...
            class_name: "Team", 
# ...then, just like in the "leagues" association we have to 
# explicity define what the name  of the FK pointing to the "User" 
# instance is inside of the "Team" class
            foreign_key: "captain_id",
            dependent: :destroy

# **************** HAS MANY MEMBERSHIPS ASSOCIATION ****************
# In a similar fashion to how we did the leagues association, 
# "memberships" is clear to AR since we have a class called 
# "Membership". But again there is no "user_id" FK in the 
# "memberships" table, so we have to make it obvious to the 
# User class what the FK is called

   has_many :memberships,
# FK inside of "memberships" table pointing to an instance of "User".
            foreign_key: "member_id",
            dependent: :destroy

# ************ HAS MANY TEAMS/JOINED TEAMS ASSOCIATION *************
# Based on the test specs, we have to have an association called
# "joined_teams", but we've added a "teams" association just to 
# compare the "joined_teams" to a basic "has many, through:"
# relationship.

# So, here we need to access instances of the "Team" class, but
# the only way we can do that is by routing our queries through
# the "memberships" table. "has_many :teams" is unambiguous to 
# ActiveRecord since there is a "Team" class. Since we've
# defined a "memberships" association (which instances of the "User"
# class can access via the memberships:member_id FK), we can leverage
# the "memberships" association to access the "team_id" FK.

   has_many :teams,
            through: :memberships

# Same idea as the above association, however, there is no table called
# "joined_teams", so we need to explicitly state which column from the
# "memberships" association through which the "User" can access the 
# other table. 

   has_many :joined_teams, # <--- Name of User association
            through: :memberships,  #<--- Name of join table
            source: :team  # <--- Column in join table since
                           #      there isn't a "joined_team_id"
                           #      inside "memberships"

   has_one  :created_league, 
            class_name: "League", 
            foreign_key: "creator_id",
            dependent: :destroy
end
