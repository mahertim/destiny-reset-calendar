# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

start_datetime = DateTime.new(2018, 9, 4, 17, 0, 0)
for i in 1..100
  @strikes = Event.create({title: 'Vanguard Daily', start: start_datetime, end: start_datetime+4.days, color: '#f36621', allDay: true, order: 1})
  @gambit = Event.create({title: 'Gambit Daily', start: start_datetime+1.day, end: start_datetime+5.days, color: '#0b7b4d', allDay: true, order: 2})
  @crucible = Event.create({title: 'Crucible Daily', start: start_datetime+2.day, end: start_datetime+6.days, color: '#c62b29', allDay: true, order: 3})
  @heroic = Event.create({title: 'Daily Heroic Adventure', start: start_datetime+2.day, end: start_datetime+6.days, color: '#232b57', allDay: true, order: 4})
  start_datetime = start_datetime + 4.days
end

start_datetime = DateTime.new(2018, 9, 4, 17, 0, 0)
for i in 1..100
  @weeklies = Event.create({title: 'Weekly Reset', start: start_datetime, end: start_datetime+7.days, color: '#4386b1', allDay: true, order: 0})
  start_datetime = start_datetime + 7.days
end

Event.all.each do |event|
  if event.end < DateTime.now
    event.color = '#9e9e9e'
    event.save!
  end
end