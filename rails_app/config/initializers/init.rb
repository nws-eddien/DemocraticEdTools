puts "Moin Moin!"
Rails.cache.write('pokemon', "Cache scheint zu funktionieren!")
puts Rails.cache.read('pokemon')
