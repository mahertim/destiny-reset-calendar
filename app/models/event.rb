class Event < ActiveRecord::Base
  scope :ends_today, ->() {
    where(end: DateTime.now.beginning_of_day..DateTime.now.end_of_day)
  }
end
