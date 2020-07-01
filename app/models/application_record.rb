class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :latest, ->(count){
    if count >= 50
      count = 50
    end
    order(created_at: "DESC").limit(count)
  }
end
