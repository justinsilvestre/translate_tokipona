class StaticPagesController < ApplicationController
  def home
  	@documents = Document.untranslated.page(1).per 3
  	@translations = Translation.all.page(1).per 3
  end
end
