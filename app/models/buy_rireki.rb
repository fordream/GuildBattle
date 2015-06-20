class BuyRireki < ActiveRecord::Base
  self.table_name = 'buy_rireki'

  include Garage::Representer
  include Garage::Authorizable

  property :user_id     # ユーザーID
  property :kbn         # 区分
  property :kingaku     # 金額
  property :crystal     # クリスタル
  property :buy_ok_flg  # 購入OKフラグ
  property :regist_time # 登録日時
  property :update_time # 更新日時

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
