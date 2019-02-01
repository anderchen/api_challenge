class Event < ApplicationRecord
  belongs_to :actor
  belongs_to :repo

  self.inheritance_column = :_type_disabled
end
