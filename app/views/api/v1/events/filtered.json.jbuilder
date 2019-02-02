json.array! @actor_events do |event|
  json.extract! event, :id, :type
  json.actor do
    json.id event.actor.id
    json.login event.actor.login
    json.avatar_url event.actor.avatar_url
  end
  json.repo do
    json.id event.repo.id
    json.name event.repo.name
    json.url event.repo.url
  end
  json.extract! event, :created_at
end
