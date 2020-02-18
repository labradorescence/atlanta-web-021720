require 'pry'

def game_hash
  {  #top-level hash = game_hash
    home: { # top-level key
      team_name: "Brooklyn Nets", # team-level key/value pairs 
      colors: ["Black", "White"], # look, an array as a value
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end


def num_points_scored(player_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            return player[:points]
          end
        end
      end
    end
  end
end

p "Jeff's scored these points:"  
p num_points_scored("Jeff Adrien")

p "Bismak's scored these points:" 
p num_points_scored("Bismak Biyombo")


# def shoe_size(player_name)
#   game_hash.each do |place, team|
#     team.each do |attribute, data|
#       if attribute == :players
#         data.each do |player|
#           if player[:player_name] == player_name
#             return player[:shoe]
#           end
#         end
#       end
#     end
#   end
# end

def shoe_size(player_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute[:players] == player_name
        return attribute[:players][:shoe]
      end
    end
  end
end

p "Reggie wears this shoe size:" 
p shoe_size("Reggie Evans")

p "Jason wears this shoe size:" 
p shoe_size("Jason Terry") 


def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

p "The Nets' colors are:"
p team_colors("Brooklyn Nets")

p "The Hornets' colors are:"
p team_colors("Charlotte Hornets")


def team_names
  game_hash.map do |place, team|
    return team[:team_name]
    end
end

p "The first team name is the:"
p team_names


#This one is wrong. How would we test and refactor? 
def player_numbers(team_name)
  game_hash.map do |place, team|
    if team[:team_name] == team_name
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player|
            player[:number]
          end
        end
      end
    end
  end
end

p "For the Brooklyn Nets, their player numbers are:"
p player_numbers("Brooklyn Nets")



# Also wrong! Let's test, refactor, and fix.
def player_stats(player_name)
  new_hash = {}

  game_hash.each do |place, team| 
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name] == player_name
            new_hash = player
          end
        end
      end 
    end
  end
end

p "For Jeff Adrien, his stats are:"
p player_stats("Jeff Adrien")


