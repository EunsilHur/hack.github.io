# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin_user = User.create(email: 'admin@email.com', password: '123456')
admin_user.add_role :admin  

name = ['김필립','황찬성','김택연','옥찬규','박희준','심지현',
        '이종진','구유림','허은실','이가현','김찬수','김지나',
        '구지현','성지효','박나나','최민용','금사라','최지윤',
        '김지선','박하나','유소망','김지선','최수정','박희연',
        '임기택','박은실','최은지','이윤지','박성택','하민호']
        
univ = ['한국항공','서울','연세','홍익','동덕여자','덕성여자',
        '가천','동덕여자','동덕여자','동덕여자','가천','서울시립',
        '용인','연세','고려','동국','방송통신','부산',
        '부경','성균관','서강','연세','고려','서울',
        '단국','인하','인천','부산','한국외국어','숭실']
        
email = ['philip@hanggong','hwang@seoul','kim@yonsei','ok@hongik','pak@dongduk','sim@duksung',
        'lee@gachon','koo@dongduk','heo@dongduk','leekh@dongduk','kimcs@gachon','kimjn@seoulcity',
        'koojh@yongin','sungjh@yonsei','parknana@korea','choimy@dongguk','guem@broadcast','choijy@busan',
        'kimjs@bukyung','pakone@sunggyungwan','yusomang@sugang','kimjisun@yonsei','choisuj@korea','parkhy@seoul',
        'lim@dankuk','parkes@inha','choiej@incheon','leeyung@busan','parkst@korealang','haminho@sungsil']
        
phone = [78945612,54875656,12356478,45781256,33659985,30210547,
        21004568,36544125,79465321,21014578,14452859,36621458,
        78871445,23365489,13054710,78965541,25103645,12546856,
        96544121,45685223,23665985,10233658,72541658,11235485,
        96696698,52287469,63325451,10255899,74585441,33658851]
        
# phone_number = [*1..99999999].sample(8)

30.times do |i|
    Event.create!(name: name[i], univ: "#{univ[i]}대학교", email: "#{email[i]}.ac.kr", phone: "010#{phone[i]}")
end


