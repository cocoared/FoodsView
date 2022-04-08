class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user| #find_or_create_by(条件)  条件としたデータの検索と作成を自動的に判断して処理を行うメソッド
      user.password = SecureRandom.urlsafe_base64  #SecureRandom.urlsafe_base64  ランダムな文字列を生成するメソッド
      user.name = "guestuser"
    end
  end

end
