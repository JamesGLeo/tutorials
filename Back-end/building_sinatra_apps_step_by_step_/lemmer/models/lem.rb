class Lem < ActiveRecord::Base
  belongs_to :users

  def tags
    self.body.scan(/#(\w+)/).flatten
  end
end
