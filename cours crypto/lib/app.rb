#th-nam + th-price

#-----test----
#! /usr/bin/env ruby
def cours

	require 'nokogiri'
	require 'open-uri'

	nam= []
	xprice= []
	hash_cours={}

# Fetch and parse HTML document
	doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))


	doc.search('td.no-wrap.currency-name > a').each do |link|
  		nam << link.content
	end



	doc.css('a[class=price]').each do |link|
  		xprice << link.content
	end

	hash_cours=[nam.zip(xprice)]

return hash_cours
end

puts cours