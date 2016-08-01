json.array!(@lookups) do |lookup|
  json.extract! lookup, :id, :group_id, :entity_id
  json.url lookup_url(lookup, format: :json)
end
