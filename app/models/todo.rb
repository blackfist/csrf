class Todo < ActiveRecord::Base
  belongs_to :user
  after_initialize :fixdate
  
  def fixdate
    self.due_date ||= Time.now.strftime('%Y-%m-%d').to_s
  end
end
