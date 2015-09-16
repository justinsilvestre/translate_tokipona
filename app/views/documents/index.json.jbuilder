json.array!(@documents) do |document|
  json.extract! document, :id, :user_id, :title, :source, :url, :original_text, :analysis
  json.url document_url(document, format: :json)
end
