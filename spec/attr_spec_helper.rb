def attributes_for_document(document)
	{
	  title: document.title,
	  source: document.source,
	  url: document.url,
	  original_text: document.original_text,
	  analysis: document.analysis
	}
end

def attributes_for_translation(translation)
	{
		analysis: translation.analysis
	}
end
