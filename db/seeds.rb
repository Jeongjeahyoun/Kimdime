# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create(:title =>"안녕하세요", content:"첫글입니다")

new_posts = Post.new
new_posts.title ="글씨체가 너무 작다"
new_posts.content ="그렇죠?!"
new_posts.save

Comment.create(rainy: '우산 꼭 챙기세요~', veryHot: '맨몸 출격 가능', sunny: '오늘은 해커톤 하기 좋은 날', sun: '오늘 날씨는 명선선?', bottleTaste: '난 그저 거들뿐' )

Cloth.create( [{category: '아우터', name:'블루종(SS)', min:6, max:20},
                {category: '아우터', name:'블레이저(SS)', min:11, max:20},
                {category: '아우터', name:'블레이저(FW)', min:6, max:15},
                {category: '아우터', name:'가죽자켓', min:6, max:20},
                {category: '아우터', name:'무스탕', min:-5, max:5},
                {category: '아우터', name:'면코트(SS)', min:6, max:20},
                {category: '아우터', name:'겨울코트(FW)', min:-20, max:5},
                {category: '아우터', name:'패딩조끼', min:-5, max:10},
                {category: '아우터', name:'패딩코트', min:-10, max:5},
                {category: '아우터', name:'라이트다운 패딩', min:-10, max:5},
                {category: '아우터', name:'헤스티아급 패딩', min:-20, max:5},
                {category: '아우터', name:'히말라야급 패딩', min:-20, max:0},
                {category: '아우터', name:'n3b', min:-5, max:5},
                {category: '아우터', name:'덱자켓', min:-5, max:5},
                {category: '아우터', name:'야상(SS)', min:6, max:20},
                {category: '아우터', name:'야상(FW)', min:0, max:5},
                
                {category: '상의', name:'옥스포드 셔츠', min:-20, max:20},
                {category: '상의', name:'플란넬셔츠', min:-20, max:20},
                {category: '상의', name:'린넨 셔츠', min:6, max:40},
                {category: '상의', name:'드레스 셔츠', min:-20, max:40},
                {category: '상의', name:'면 반팔', min:16, max:40},
                {category: '상의', name:'긴팔', min:-20, max:25},
                {category: '상의', name:'카라티', min:16, max:40},
                {category: '상의', name:'니트(얇은)', min:-20, max:25},
                {category: '상의', name:'니트(두꺼운)', min:-20, max:15},
                {category: '상의', name:'맨투맨', min:-20, max:20},
                {category: '상의', name:'기모맨투맨', min:-20, max:20},
                {category: '상의', name:'네오프렌 맨투맨', min:-20, max:20},
                {category: '상의', name:'가디건(얇은)', min:-20, max:25},
                {category: '상의', name:'가디건(두꺼운)', min:-20, max:20},
                {category: '상의', name:'터틀넥', min:-20, max:10},

                {category: '하의', name:'숏팬츠', min:21, max:40},
                {category: '하의', name:'조거팬츠', min:21, max:40},
                {category: '하의', name:'코티드팬츠', min:21, max:25},
                {category: '하의', name:'기모팬츠', min:-20, max:10},
                {category: '하의', name:'청바지', min:-20, max:30},
                {category: '하의', name:'무릎파인청바지', min:6, max:40},
                {category: '하의', name:'린넨팬츠', min:21, max:40},
                {category: '하의', name:'울슬랙스', min:-20, max:25},
                {category: '하의', name:'면슬랙스', min:-20, max:40},
                {category: '하의', name:'치노팬츠', min:-20, max:40},
                
                {category: '신발', name:'로퍼', min:6, max:40},
                {category: '신발', name:'더비슈즈', min:-20, max:40},
                {category: '신발', name:'샌들', min:16, max:40},
                {category: '신발', name:'부츠', min:-20, max:25},
                {category: '신발', name:'워커', min:-20, max:25},
                {category: '신발', name:'스니커즈(가죽/스웨이드)', min:-20, max:25},
                {category: '신발', name:'스니커즈(애나멜/면)', min:-20, max:40},
                {category: '신발', name:'슬립온(면)', min:6, max:40},
                {category: '신발', name:'슬립온(가죽/합성피혁)', min:6, max:25},
                
                {category: '악세사리', name:'머플러', min:-20, max:5},
                {category: '악세사리', name:'목도리', min:-20, max:5},
                {category: '악세사리', name:'장갑', min:-20, max:5},
                {category: '악세사리', name:'여자친구', min:40, max:40},
                {category: '악세사리', name:'솔플', min:-20, max:40},
                {category: '악세사리', name:'커플', min:40, max:50},
                
                  ])
                  
     require 'nokogiri'
      
     @encode_name="http://weather.naver.com/rgn/cityWetrMain.nhn"
     @html = Nokogiri::HTML(Net::HTTP.get(URI(@encode_name)))
  
   
    Weather.create(region: @html.css("table//tbody//tr:nth-child(1)//th").inner_text,
                  day: @html.css("table//tbody//tr:nth-child(1)//td:nth-child(2)//ul//li:nth-child(1)").inner_text,
                  temperture: @html.css("table//tbody//tr:nth-child(1)//td:nth-child(2)//ul//li:nth-child(2)//.temp").inner_text,
                  raining: @html.css("table//tbody//tr:nth-child(1)//td:nth-child(2)//ul//li:nth-child(2)//.rain").inner_text,
                  image_url: @html.css("table//tbody//tr:nth-child(1)//td:nth-child(2)//p//img" )  )
                  
    
    Weather.create(region: @html.css("table//tbody//tr:nth-child(1)//th").inner_text,
                  day: @html.css("table//tbody//tr:nth-child(1)//td:nth-child(3)//ul//li:nth-child(1)").inner_text,
                  temperture: @html.css("table//tbody//tr:nth-child(1)//td:nth-child(3)//ul//li:nth-child(2)//.temp").inner_text,
                  raining: @html.css("table//tbody//tr:nth-child(1)//td:nth-child(3)//ul//li:nth-child(2)//.rain").inner_text,
                  image_url: @html.css("table//tbody//tr:nth-child(1)//td:nth-child(3)//p//img") )
    




































































