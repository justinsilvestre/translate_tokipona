json.array!(@translations) do |translation|
  json.extract! translation, :id, :user_id, :document_id, :analysis
  json.url translation_url(translation, format: :json)
end
