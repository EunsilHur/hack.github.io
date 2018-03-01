class Event < ActiveRecord::Base
    validates :name, presence: {message: "이름을 입력하세요."}, length: {minimum: 2}
    validates :univ, presence: {message: "학교를 입력하세요."}
    validates :email, presence: {message: "학교 포털 메일 주소를 입력하세요."}
    validates :phone, presence: {message: "전화번호를 입력하세요."}
end
