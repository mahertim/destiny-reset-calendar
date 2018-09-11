class Event < ActiveRecord::Base
  scope :ends_next, ->() {
    where(end: DateTime.now..DateTime.now+24.hours)
  }
end
