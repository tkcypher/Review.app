json.extract! lesson, :id, :title, :teacher, :user_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
