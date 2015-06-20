class UserSetting < ActiveRecord::Base
  self.table_name = 'user_setting'

  include Garage::Representer
  include Garage::Authorizable

  property :se_onryo          # SE音量
  property :bgm_onryo         # BGM音量
  property :db_version        # DBバージョン
  property :push_start_10_flg # ギルドバトル開始10分前通知
  property :push_start_flg    # ギルドバトル開始通知
  property :push_end_10_flg   # ギルドバトル終了10分前通知
  property :push_end_flg      # ギルドバトル終了通知

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
