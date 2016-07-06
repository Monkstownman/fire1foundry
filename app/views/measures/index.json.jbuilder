json.array!(@measures) do |measure|
  json.extract! measure, :id, :title, :body, :datetime, :name, :value, :user_id, :unit, :source, :comment, :active
  json.url measure_url(measure, format: :json)
end
