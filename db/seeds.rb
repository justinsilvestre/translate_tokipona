# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require_relative '../lib/dic.rb'
require_relative '../lib/test_text.rb'

j_password = ENV['RAILS_ENV'] == 'production' ? ENV['J_PW'] : 'password'
justin = User.create(email: 'justinsilvestre@gmail.com', username: 'jatin', password: j_password, password_confirmation: j_password)


tp_en_hash.each do |tp, roles|
	roles.each do |tp_role, en_roles|
		tp_phrase = TokiponaPhrase.create(words: tp, role: tp_role)
		en_roles.each do |en_role, en_phrases|
			en_phrases.each do |en_phrase|
				tp_phrase.english_phrases.create(role: en_role, base_form: en_phrase) unless EnglishPhrase.find_by(tokipona_phrase_id: tp_phrase.id, role: en_role, base_form: en_phrase)
			end
		end
	end
end

justin.documents.create(title: 'tomo palisa suli pi nimi Pape', original_text: tomo_palisa_suli_text)