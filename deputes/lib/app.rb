#DataTables_Table_0 > tbody > tr:nth-child(1) > td.sorting_1 > a
#DataTables_Table_0 > tbody > tr:nth-child(577) > td.sorting_1 > a

require 'nokogiri'
require 'open-uri'

=begin recuperation email dep

def get_hall_email(townhall_url)
	mail=""
	page = Nokogiri::HTML(open(townhall_url))
	page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li/a/@href').select do |a|
   
   	mail=a.to_s
   	x=mail.length
   	puts mail.slice!(7..x)
	end
end
=end


#def get_hall_urls  recup nom et lien dep

	page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/tableau'))

	puts page.xpath('//a[@class="deputes dataTable no-footer"]/@href')

		
#end


#get_townhall_email('http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036')
#get_hall_urls