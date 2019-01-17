# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

prize_array = ['Flachbildschirm Samsung ','Flachbildschirm Samsung ','Mac Book Pro','iPhone ','iPhone','iPhone ','Samsung S9','Samsung S9','Samsung S9','Fahrrad','Fahrrad','Play Station 4 pro ','Play Station 4 pro ','Golden Curl STR8 - Haarglätter Bürste ','Golden Curl STR8 - Haarglätter Bürste ','Golden Curl STR8 - Haarglätter Bürste ','Amazon Gutschein 200€','Amazon Gutschein 200€','Amazon Gutschein 200€','Amazon Gutschein 200€','Amazon Gutschein 200€','Amazon Gutschein 100€','Amazon Gutschein 100€','Amazon Gutschein 100€','Amazon Gutschein 100€','Amazon Gutschein 50€','Amazon Gutschein 50€','Messerset','ferngesteuertes Modellauto','ferngesteuertes Modellauto','Flaconi Überraschungspaket','Flaconi Überraschungspaket','Flaconi Überraschungspaket','Flaconi Überraschungspaket','Flaconi Überraschungspaket','Flaconi Überraschungspaket','Flaconi Überraschungspaket','Flaconi Überraschungspaket','Bluetooth Speaker','Bluetooth Speaker','Bluetooth Speaker','Bluetooth Speaker','Bluetooth Speaker','Powerbank','Fashion Watch','Fashion Watch','Fashion Watch','Fashion Watch','Fashion Watch','Fashion Watch']

samsung_tv = 'https://www.samsung.com/us/images/news/ces2013/F8000_Front_Black.jpg'
mac_pro = "https://cyberport.scene7.com/is/image/cyberport/180713181843400701900728I?$Zoom_500$"
iphone = "https://static2.o9.de/resource/blob/137864/c55714951138a9e8f6ed3412fdc9f9fc/article-item-4510-300518-00-imagebig-picture-data.png"
samsung_s9 = "https://images-na.ssl-images-amazon.com/images/I/81VnTSgQgQL._SX522_.jpg"
fahrrad = "https://www.fahrrad-xxl.de/media/pimg/Trek_2019/thumbs/224069_1139296.jpg"
ps4_pro = "https://images-na.ssl-images-amazon.com/images/I/71pFB-gWFdL._SL1500_.jpg"
buerste = "https://images-na.ssl-images-amazon.com/images/I/81RfEeoBNcL._SY355_.jpg"
amazon = "https://www.logitel.de/bilder/amazon-30-euro-gutschein+art,4384,d1_xl.jpg"
messer = "https://cdn6.elektronik-star.de/out/pictures/generated/product/5/700_700_75/10031844_0004_detail_Klarstein_Kissaki_Messerset_schwarz.jpg"
auto = "https://i.ebayimg.com/images/g/GYcAAOSwYEhalsHM/s-l640.jpg"
flaconi = "https://testundliebe.de/wp-content/uploads/2018/05/Flaconi-Box-Ciao-Bella-2.jpg"
speaker = "https://www.staples-3p.com/s7/is/image/Staples/m005807470_sc7?$splssku$"
powerbank = "https://static.123bdcdn.com/img/26991/146802.jpg&width=585&height=439&q=100"
uhr = "https://i.ebayimg.com/images/g/C14AAOSwuxFYypV8/s-l1600.jpg"

image_array = [samsung_tv,samsung_tv,mac_pro,iphone,iphone,iphone,samsung_s9,samsung_s9,samsung_s9,fahrrad,fahrrad,ps4_pro,ps4_pro,buerste,buerste,buerste,amazon,amazon,amazon,amazon,amazon,amazon,amazon,amazon,amazon,amazon,amazon,messer,auto,auto,flaconi,flaconi,flaconi,flaconi,flaconi,flaconi,flaconi,flaconi,speaker,speaker,speaker,speaker,speaker,powerbank,uhr,uhr,uhr,uhr,uhr,uhr]

Prize.destroy_all
Ticket.destroy_all
User.destroy_all

puts "just deleted the old seed"

User.create(email: "lottofee@flaconi.de", password: "flaconi2019")

rank = 1
i = 0
prize_array.each do |prize|
  rank_index = rank
  img_tag = image_array[i]
  Prize.create(rank: rank_index, title: prize, image: img_tag)
  rank += 1
  i += 1
end

puts "created #{Prize.count} Gewinne"

first_los = 1
last_los = 1170

while first_los <= last_los do
  if first_los < 10 then
    new_los = "000#{first_los}"
  elsif first_los < 100 then
    new_los = "00#{first_los}"
  elsif first_los < 1000 then
    new_los = "0#{first_los}"
  else
    new_los = first_los.to_s
  end
  Ticket.create(ticket: new_los)
  first_los += 1
end

puts "created #{Ticket.count} Gewinne"

