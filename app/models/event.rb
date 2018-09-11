class Event < ActiveRecord::Base
  scope :ends_next, ->() {
    where(end: DateTime.now..DateTime.now+24.hours)
  }
  scope :upcoming, ->() {
    where(start: DateTime.now..DateTime.now+1.year).order("start")
  }
  scope :next, ->(title) {
    upcoming.where(title: title).first
  }
end
