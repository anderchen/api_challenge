json.array! @actors do |actor|
  json.extract! actor, :id, :login, :avatar_url
end


