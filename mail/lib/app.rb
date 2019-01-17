
require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)

	doc = Nokogiri::HTML(open(townhall_url))

	doc.search('body > div > main > section:nth-child(2) > div > table > tbody > tr:nth-child(4) > td:nth-child(2)').each do |link|
  		return link.content
	end


end


def get_townhall_urls
	town_url=[]
	town_nam=[]
	mail=[]
	hash_contact={}
	i=0
	page = Nokogiri::HTML(open('http://www.annuaire-des-mairies.com/val-d-oise.html'))
	#nam
	page.xpath('//a[@class="lientxt"]/text()').each do |x| 
	town_nam << x.text
end
	#url
	page.xpath('//a[@class="lientxt"]/@href').each do |x| 
	town_url << x.text
	end
	j=town_url.length
	while i<j
		#email
		mail[i]= get_townhall_email( "http://annuaire-des-mairies.com/#{town_url[i]}")
	
		i+=1	
	end
	
	hash_contact=[town_nam.zip(mail)]
	
end

puts get_townhall_urls
