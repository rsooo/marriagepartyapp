json.array!(@attends) do |attend|
  json.extract! attend, :id, :name, :attend, :payment, :comment
  json.url attend_url(attend, format: :json)
end
