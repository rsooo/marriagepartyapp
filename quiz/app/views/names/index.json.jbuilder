json.array!(@names) do |name|
  json.extract! name, :id, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :comment
  json.url name_url(name, format: :json)
end
