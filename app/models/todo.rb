class Todo < ApplicationRecord

  enum :priority, { low: 0, medium: 1, high: 2, urgent: 3 }

  scope :overdue, -> { where('due_date < ?', Time.current) }
  scope :due_today, -> { where(due_date: Time.current.beginning_of_day..Time.current.end_of_day) }
  scope :due_this_week, -> { where(due_date: Time.current.beginning_of_week..Time.current.end_of_week) }

end
