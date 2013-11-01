json.array!(@todos) do |todo|
  json.extract! todo, :text, :due_date, :user_id
  json.url todo_url(todo, format: :json)
end
