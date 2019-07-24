# frozen_string_literal: true

teams = ['San Hose Sharks', 'Calgary Flames', 'LA Kings', 'NY Rangers']
teams.each { |team| Team.create(name: team) }

Player.create(name: 'Joe Pavelski', team: (Team.find_by name: 'San Hose Sharks'))
Player.create(name: 'Joe Thornton', team: (Team.find_by name: 'San Hose Sharks'))
Player.create(name: 'Mats Zuccarello', team: (Team.find_by name: 'NY Rangers'))
Player.create(name: 'Marc Staal', team: (Team.find_by name: 'NY Rangers'))
Player.create(name: 'Anze Kopitar', team: (Team.find_by name: 'LA Kings'))
Player.create(name: 'Ilya Kovalchuk', team: (Team.find_by name: 'LA Kings'))
Player.create(name: 'Matthew Tkachuk', team: (Team.find_by name: 'Calgary Flames'))
Player.create(name: 'Johnny Gaudreau', team: (Team.find_by name: 'Calgary Flames'))

achievements = ['Shots on Goal %', 'Shots']
achievements.each { |achievement| Achievement.create(name: achievement, countable: true) }

TeamMatch.create!(team: Team.find(1), opponent: 2, date: Date.parse('29/05/2019'))
TeamMatch.create!(team: Team.find(1), opponent: 3, date: Date.parse('31/05/2019'))
TeamMatch.create!(team: Team.find(1), opponent: 4, date: Date.parse('27/05/2019'))
TeamMatch.create!(team: Team.find(2), opponent: 3, date: Date.parse('28/05/2019'))
TeamMatch.create!(team: Team.find(2), opponent: 4, date: Date.parse('30/05/2019'))
TeamMatch.create!(team: Team.find(3), opponent: 4, date: Date.parse('31/05/2019'))

Player.find_each do |player|
  (TeamMatch.where(team: player.team) + TeamMatch.where(opponent: player.team.id)).each do |match|
    Achievement.find_each do |achievement|
      PlayerStatistic.create(player: player, team_match: match,
                             achievement: achievement, value: rand(50..100))
    end
  end
end