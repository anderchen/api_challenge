class Event < ApplicationRecord
  belongs_to :actor, counter_cache: true
  belongs_to :repo

  self.inheritance_column = :_type_disabled

  accepts_nested_attributes_for :actor
  accepts_nested_attributes_for :repo
end
