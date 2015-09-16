# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require_relative '../lib/dic.rb'

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

justin.documents.create(title: 'tomo palisa suli pi nimi Pape', original_text: 'ma ali li jo e toki wan sama. jan ali li kama tan ni: nasin pi kama suno li kama lon ma Sinale li awen lon ni. jan li toki e ni: o kama! mi mute o pali e kiwen tomo o seli e ona. jan mute li toki e ni: o kama! mi mute o pali e ma tomo e tomo palisa suli. lawa pi tomo palisa li lon sewi kon. nimi pi mi mute o kama suli! mi wile ala e ni: mi mute li awen tawa sama. mi mute li lon ma ali. sewi Jawe li kama anpa li lukin e ma tomo e tomo palisa pi jan lili mute. sewi Jawe li toki e ni: jan ni li jo e ma wan li jo e toki sama li pali e tomo palisa. tenpo ni la ona mute li ken pali mute ike. mi wile tawa anpa. mi pakala e toki pi jan mute ni. jan o sona ala e toki pi jan ante. sewi Jawe li pali e ni: jan ali li poki ala jan li lon ma mute li ken ala pali e ma tomo. nimi pi ma tomo ni li Pape tan ni: sewi Jawe li pakala e toki pi jan ali. tan ma tomo Pape la sewi Jawe li tawa e jan tawa ma mute. lipu li ike tawa sina la sina ken ante e ona. o pilin e poki o ante. jan ale li ken ante e lipu ale! ken la sina sona e ni: tenpo pini la lipu sona ni li lon lipu sona Wikipesija. kulupu Wikimesija li wile tawa e ona tawa lipu Wikija. lipu sona ni li lon lipu Wikija tan ni. jan kulupu li wile e ijo la kulupu li ken pana: jan kulupu li pakala la kulupu ona li ken pona e jan kulupu ni. mama li wile pana e jan lili la meli ante li ken pali. jan li jo ala e moku la jan kulupu ante li ken pana e moku. mi en ona li olin e sina anu jan ike.')