class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :latest, ->(count){
    order(created_at: "DESC").limit(count)
  }
end
