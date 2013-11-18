json.array!(@issues) do |issue|
  json.extract! issue, :name, :description, :project_id, :user_id
  json.url issue_url(issue, format: :json)
end
