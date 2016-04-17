json.array!(@answers) do |answer|
  json.extract! answer, :id, :name, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :comment
  json.url answer_url(answer, format: :json)
end
