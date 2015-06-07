Garage.configure {}

Garage::TokenScope.configure do
  register :public, desc: 'acessing publicly available data' do
    access :read, User
    access :write, User
  end
end

# DoorKeeper使う
Garage.configuration.strategy = Garage::Strategy::Doorkeeper

# DoorKeeper側の設定
Doorkeeper.configure do

  # 認証情報(credentials)からリソースオーナーを特定するメソッド
  resource_owner_from_credentials do |routes|
    us = UserShikibetsu.find_by(user_shikibetsu_id: params[:uid])
    us.user if us.present?
  end

end

# アクセストークン取得 (/oauth/token) にてpassword認証を許可
Doorkeeper.configuration.token_grant_types << "password"