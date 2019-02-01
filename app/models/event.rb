class Event < ApplicationRecord
  belongs_to :actor
  belongs_to :repo
end
