# Garage
Garage.configure {}
Garage::TokenScope.configure {
  register :public do
    access :read, User
  end
}
# DoorKeeper使う
Garage.configuration.strategy = Garage::Strategy::Doorkeeper

# DoorKeeper側の設定
Doorkeeper.configure do

  # アクセストークンの有効期間(nil=無期限)
  access_token_expires_in nil

  # 認証情報(credentials)からリソースオーナーを特定するメソッド
  resource_owner_from_credentials do |routes|
    us = UserShikibetsu.find_by(user_shikibetsu_id: params[:uid])
    us.user if us.present?
  end
end

# アクセストークン取得 (/oauth/token) にてpassword認証を許可
Doorkeeper.configuration.token_grant_types << "password"