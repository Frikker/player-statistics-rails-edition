# frozen_string_literal: true

teams = ['San Hose Sharks', 'Calgary Flames', 'LA Kings', 'NY Rangers']
teams.each { |team| Team.create(name: team) }

Player.create(name: 'Joe Pavelski', team: (Team.find_by name: 'San Hose'))
Player.create(name: 'Joe Thornton', team: (Team.find_by name: 'San Hose'))
Player.create(name: 'Mats Zuccarello', team: (Team.find_by name: 'NY'))
Player.create(name: 'Marc Staal', team: (Team.find_by name: 'NY'))
Player.create(name: 'Anze Kopitar', team: (Team.find_by name: 'LA'))
Player.create(name: 'Ilya Kovalchuk', team: (Team.find_by name: 'LA'))
Player.create(name: 'Matthew Tkachuk', team: (Team.find_by name: 'Calgary'))
Player.create(name: 'Johnny Gaudreau', team: (Team.find_by name: 'Calgary'))

achievements = ['Shots on Goal %', 'Shots']
achievements.each { |achievement| Achievement.create(name: achievement) }

Team.find_each.each do |team|
  TeamMatch.create(team: (Team.find_by name: team), opponent: 2,
                   date: Date('29.05.2015'))
end
