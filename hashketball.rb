require 'pry'

def game_hash #build the big hash
  hash = { # contains keys of home and away
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
  hash # return hash
end

def num_points_scored(name) #takes in name
  game_hash.each do |home_away, team_info| #digs into array first variable is home or away second is player colors teamnae
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
     team_info.each do |key, value| # split the team info up into a keys and values which are they point to
        if key == :players #if the key is players:
          value.each do |player| #for index in the array players
       array.push(player[:number]) #add each player number to the array
            end
          end
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

def big_shoe_rebounds #returns the rebounds stat for the player with the largest shoe size
  big_shoe = 0 #variable that will store largest shoe size
  rebounds = 0 #variable that will store rebonds of the player with the largest shoe size
  game_hash.each do |team, team_info| #iterate through teams and team info
    team_info[:players].each do |player|#iterate through each item in the players key
      if player[:shoe] > big_shoe # if the players shoe size is greater than the big shoe
        big_shoe = player[:shoe] # set big shoe to player shoe size
        rebounds = player[:rebounds] #set rebounds to players rebound score
        #do for the rest of the players
      end
    end
  end
    rebounds # return rebound variable
end

def most_points_scored #returns the player with the most points scored
  most_points = 0 #create variable for the value of the most point
  most_points_player = " " # create variable for the name of the player with the most points
    game_hash.each do |team, team_info| #iterate through teams and team info
      team_info[:players].each do |player| #iterate through each item in the players key
       if player[:points] > most_points #if the players points are greater than the most points
         most_points = player[:points] #update most points to equal the players points
         most_points_player = player[:player_name] # update most points player to be the players name
           #do for the rest of the players
       end
     end
    end
    most_points_player #return the name of the player with the most points
end

def winning_team #return the name of the team with more points
  total_points = 0 #
  winning_team = " "
    game_hash.each do |team, team_info|
      team_points = 0 # set team points equal to zero for each team
      team_name = game_hash[team][:team_name] # set team name equal to the teams name for each iteration
      team_info[:players].each do |player| # for each player in the players key
        points = player[:points] # set points equal to there points
        team_points += points # add there points to the team points
      end
      if team_points > total_points # check if team points are greater than the total point
          total_points = team_points # set total points to team points
          winning_team = team_name set #set winning team to team name
          #do for both teams
    end
  end
  return winning_team # return final winning_team
end

def player_with_longest_name #return player with longest name
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
