require 'pry'

def game_hash #build the big hash
{ # contains keys of home and away
    home: { # which poiny to hashes
      team_name: "Brooklyn Nets", #key team_name points to string
      colors: ["Black", "White"], #key colors points to array
      players: [ #key players points to array of hashes
        { player_name: "Alan Anderson", #hashes contains player stats
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        { player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        { player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        { player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        { player_name: "Jason Terry",
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

    away: { #away key
      team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players: [
          { player_name: "Jeff Adrien",
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2
          },
          { player_name: "Bismack Biyombo",
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 22,
            blocks: 15,
            slam_dunks: 10
          },
          { player_name: "DeSagna Diop",
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5
          },
          { player_name: "Ben Gordon",
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0
          },
          { player_name: "Kemba Walker",
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 7,
            blocks: 5,
            slam_dunks: 12
          }
        ]
    }
  }
end

def num_points_scored(name) #takes in name
  game_hash.each do |home_away, team_info| #digs into array first variable is home or away second is player colors teamname
    team_info[:players].each do |player| #selects players key
      if player[:player_name] == name # if player_name = name
        return player[:points] # return that players points
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |home_away, team_info| #digs into array first variable is home or away second is player colors team
    team_info[:players].each do |player| #selects players key
      if player[:player_name] == name # if player_name = name
        return player[:shoe] # return that players shoe
      end
    end
  end
end

def team_colors(team_name)

if team_name == "Brooklyn Nets" # if name provided equals Brooklyn nets
  return game_hash[:home][:colors] # print home teams colors
else
  return game_hash[:away][:colors] # else print away teams colors
  end
end

def team_names()
  game_hash.map do |team, team_info|  #dig into hash for variables home away and team info
    team_info[:team_name] # change these values to be the team names returning an array of team names
  end
end

def player_numbers(input) # takes in argument of team returns all players jersey numbers
  array = [] #create new array which will be full of player numbers
  game_hash.each do |team, team_info| #split the game hash into keys team and team info and iterate through them
   if input == team_info[:team_name] # if the input matches the team_name: value for either team
      team_info[:players].map do |player| #for index in the array players
        player[:number] #add each player number to the array
        end
      end
    end
    array #return array
end

def player_stats(input)
  game_hash.each do |team, team_info| #split the game hash into keys team and team info and iterate through them
    team_info.each do |key, value| # split the team info up into a keys and values which are they point to
      if key == :players #if the key is players:
        value.each do |player| #for index in the array players
          if input == player[:player_name] #if the input is the players name
            player.delete(:player_name) #remove player_name from the array since we are not returning this
            return player #return what is left in the hash that is the index
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:shoe] > big_shoe
        big_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
    rebounds
end

def most_points_scored
  most_points = 0
  most_points_player = 0
    game_hash.each do |team, team_info|
      team_info[:players].each do |player|
       if player[:points] > most_points
         most_points = player[:points]
         most_points_player = player[:player_name]
       end
     end
    end
    most_points_player
end

def winning_team
  total_points = 0
  winning_team = " "
    game_hash.each do |team, team_info|
      team_points = 0
      team_name = game_hash[team][:team_name]
      team_info[:players].each do |player|
        points = player[:points]
        team_points += points
      end
      if team_points > total_points
          total_points = team_points
          winning_team = team_name
    end
  end
  return winning_team
end

def player_with_longest_name
name_length = 0
longest_name = " "
game_hash.each do |team, team_info|
  team_info[:players].each do |player|
    if player[:player_name].length > name_length
      name_length = player[:player_name].length
      longest_name = player[:player_name]
    end
  end
end
  longest_name
end

def long_name_steals_a_ton?
 most_steals_name = ""
 most_steals = 0
 game_hash.each do |team, team_info|
   team_info[:players].each do |player|
     if player[:steals] > most_steals
        most_steals = player[:steals]
        most_steals_name = player[:player_name]
      end
    end
  end
  if most_steals_name == player_with_longest_name
    return true
  end
end
