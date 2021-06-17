json.extract! question, :id, :text, :description, :explaination, :category, :difficulty, :created_at, :updated_at
json.url question_url(question, format: :json)
