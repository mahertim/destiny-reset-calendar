class Event < ActiveRecord::Base
  scope :ends_next, -> {
    where(end: DateTime.now..DateTime.now+24.hours)
  }
  scope :upcoming, -> {
    where(start: DateTime.now..DateTime.now+1.year).order("start")
  }
  scope :next_event, -> {
    where(start: DateTime.now..DateTime.now+1.year).order("start").first
  }
  scope :current, -> {
    where(start: DateTime.now-7.days..DateTime.now, end: DateTime.now..DateTime.now+1.year)
  }
  scope :past, -> {
    where(end: DateTime.now-1.year..DateTime.now).order("start")
  }
  scope :next_by_title, -> (title) {
    upcoming.where(title: title).first
  }
end
