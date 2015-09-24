require 'csv'
def tp_en_hash
	hash = {}
	CSV.foreach('lib/words.csv') do
		|r| next if r[1]=='alt'
		hash[r[0]] ||= {}
		hash[r[0]][r[1]] ||= {}
		hash[r[0]][r[1]][r[2]] ||= []
		hash[r[0]][r[1]][r[2]] += r[3..-1]
	end
	hash
end
