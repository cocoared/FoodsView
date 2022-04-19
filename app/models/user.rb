class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :comments, dependent: :destroy


  def get_profile_image(width,height) #モデルに記述することでhtmlファイルにおいて　.get_profile_image というメソッド形式で呼び出せる。
    unless profile_image.attached? #プロフィール画像が存在しない場合
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io:File.open(file_path), filename:'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end


  def self.guest
    find_or_create_by!(name: 'ゲストユーザー' ,email: 'guest@example.com') do |user| #find_or_create_by(条件)  条件としたデータの検索と作成を自動的に判断して処理を行うメソッド
      user.password = SecureRandom.urlsafe_base64  #SecureRandom.urlsafe_base64  ランダムな文字列を生成するメソッド
      user.name = "ゲストユーザー"
    end
  end

end
