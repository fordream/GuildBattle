class AddTables < ActiveRecord::Migration
  def change
    create_table :user, id: :bigint, comment: "ユーザーテーブル", force: :cascade do |t|
      t.string :name, :limit => 32, null: false, comment: "ユーザー名"
      t.integer :girudo_id, :limit => 8, comment: "ギルドID"
      t.integer :shotai_id, :limit => 8, null: false, comment: "招待ID"
      t.integer :shotai_su, null: false, comment: "招待数"
      t.integer :level, null: false, comment: "レベル"
      t.integer :exp, :limit => 8, null: false, comment: "経験値"
      t.integer :coin, :limit => 8, null: false, comment: "コイン"
      t.integer :mana_p, :limit => 8, null: false, comment: "マナP"
      t.integer :crystal_kakin, :limit => 8, null: false, comment: "課金クリスタル"
      t.integer :crystal_muryo, :limit => 8, null: false, comment: "無料クリスタル"
      t.integer :premium_p, :limit => 8, null: false, comment: "プレミアムP"
      t.integer :seisyo, :limit => 8, null: false, comment: "聖書"
      t.integer :fvko, :limit => 8, null: false, comment: "FV粉"
      t.integer :unit_max, null: false, comment: "キャラ最大数"
      t.integer :huriwaike_p, null: false, comment: "振り分けP"
      t.integer :unit_cost, null: false, comment: "キャラコスト"
      t.integer :skill_cost, null: false, comment: "スキルコスト"
      t.integer :stamina, null: false, comment: "スタミナ"
      t.integer :stamina_max, null: false, comment: "最大スタミナ"
      t.integer :ap, null: false, comment: "AP"
      t.integer :ap_max, null: false, comment: "最大AP"
      t.integer :koei_flg, null: false, comment: "後衛希望フラグ"
      t.timestamp :final_login_time, null: false, comment: "最終ログイン日時"
      t.integer :renzoku_login, null: false, comment: "連続ログイン"
      t.integer :total_login, null: false, comment: "合計ログイン"
      t.integer :kouken_p, :limit => 8, null: false, comment: "ギルド貢献P"
      t.integer :battle_su, null: false, comment: "開催バトル数"
      t.integer :battle_sanka_su, null: false, comment: "バトル参加数"
      t.timestamp :regist_time, null: false, comment: "登録日時"
      t.timestamp :update_time, null: false, comment: "更新日時"
      t.integer :account_stop_flg, null: false, comment: "アカウント停止フラグ"
      t.timestamps null: false
    end

    create_table :user_shikibetsu, id: :bigint, comment: "ユーザー識別テーブル", force: :cascade do |t|
      t.integer :user_id, :limit => 8, null: false, comment: "ユーザーID"
      t.string :user_shikibetsu_id, :limit => 64, null: false, comment: "ユーザー識別ID"
      t.string :kishu_info, :limit => 64, comment: "機種情報"
      t.integer :update_version, null: false, comment: "更新バージョン"
      t.timestamps null: false
    end

    create_table :user_setting, id: :bigint, comment: "ユーザー設定テーブル", force: :cascade do |t|
      t.integer :se_onryo, null: false, comment: "SE音量"
      t.integer :bgm_onryo, null: false, comment: "BGM音量"
      t.integer :db_version, null: false, comment: "DBバージョン"
      t.integer :push_start_10_flg, null: false, comment: "ギルドバトル開始10分前通知"
      t.integer :push_start_flg, null: false, comment: "ギルドバトル開始通知"
      t.integer :push_end_10_flg, null: false, comment: "ギルドバトル終了10分前通知"
      t.integer :push_end_flg, null: false, comment: "ギルドバトル終了通知"
      t.timestamps null: false
    end

    create_table :user_battle, id: :bigint, comment: "ユーザーバトルテーブル", force: :cascade do |t|
      t.integer :user_id, null: false, comment: "ユーザーID"
      t.string :image_no, :limit => 8, null: false, comment: "画像番号"
      t.integer :zokusei, null: false, comment: "属性"
      t.integer :hp, null: false, comment: "HP"
      t.integer :hp_max, null: false, comment: "最大HP"
      t.integer :sou_senryoku, null: false, comment: "総戦力"
      t.integer :sou_kou, null: false, comment: "総物攻"
      t.integer :sou_bou, null: false, comment: "総物防"
      t.integer :sou_makou, null: false, comment: "総魔攻"
      t.integer :sou_mabou, null: false, comment: "総魔防"
      t.integer :kou_zougenti, comment: "物攻増減値"
      t.integer :bou_zougenti, comment: "物防増減値"
      t.integer :makou_zougenti, comment: "魔攻増減値"
      t.integer :mabou_zougenti, comment: "魔防増減値"
      t.integer :sanka_flg, null: false, comment: "参加中フラグ"
      t.timestamps null: false
    end

    create_table :guild, id: :bigint, comment: "ギルドテーブル", force: :cascade do |t|
      t.integer :name, null: false, comment: "名前"
      t.integer :rank, null: false, comment: "ランク"
      t.integer :exp, null: false, comment: "昇格値"
      t.integer :win_su, null: false, comment: "勝利数"
      t.integer :lose_su, null: false, comment: "敗北数"
      t.integer :draw_su, null: false, comment: "引き分け数"
      t.timestamps null: false
    end

    create_table :chat, id: :bigint, comment: "チャットテーブル", force: :cascade do |t|
      t.integer :user_id, :limit => 8, null: false, comment: "ユーザーID"
      t.text :naiyo, null: false, comment: "内容"
      t.timestamp :regist_time, null: false, comment: "登録日時"
      t.integer :delflg, null: false, comment: "削除フラグ"
      t.timestamps null: false
    end

    create_table :unit_master, id: :bigint, comment: "ユニットマスタ", force: :cascade do |t|
      t.string :no, :limit => 8, null: false, comment: "番号"
      t.string :image_no, :limit => 8, null: false, comment: "画像番号"
      t.integer :rare, null: false, comment: "レア度"
      t.integer :level_max, null: false, comment: "初期最大レベル"
      t.string :name, :limit => 32, null: false, comment: "名前"
      t.text :info, null: false, comment: "説明"
      t.integer :zokusei, null: false, comment: "属性"
      t.integer :type, null: false, comment: "タイプ"
      t.integer :cost, null: false, comment: "コスト"
      t.integer :kou, null: false, comment: "攻撃力"
      t.integer :bou, null: false, comment: "防御力"
      t.integer :zenei_skill_id1, :limit => 8, comment: "前衛スキルID1"
      t.integer :zenei_skill_level1, comment: "前衛スキルレベル1"
      t.integer :zenei_skill_kbn1, comment: "前衛スキル区分1"
      t.integer :zenei_skill_id2, :limit => 8, comment: "前衛スキルID2"
      t.integer :zenei_skill_level2, comment: "前衛スキルレベル2"
      t.integer :zenei_skill_kbn2, comment: "前衛スキル区分2"
      t.integer :koei_skill_id1, :limit => 8, comment: "後衛スキルID1"
      t.integer :koei_skill_level1, comment: "後衛スキルレベル1"
      t.integer :koei_skill_kbn1, comment: "後衛スキル区分1"
      t.integer :koei_skill_id2, :limit => 8, comment: "後衛スキルID2"
      t.integer :koei_skill_level2, comment: "後衛スキルレベル2"
      t.integer :koei_skill_kbn2, comment: "後衛スキル区分2"
      t.integer :leader_skill_id, :limit => 8, comment: "リーダースキルID"
      t.integer :leader_skill_level, comment: "リーダースキルレベル"
      t.integer :leader_skill_kbn, comment: "リーダースキル区分"
      t.timestamp :gatya_muryo_start_time, null: false, comment: "無料ガチャ公開開始日時"
      t.timestamp :gatya_muryo_end_time, null: false, comment: "無料ガチャ公開終了日時"
      t.timestamp :gatya_kakin_start_time, null: false, comment: "課金ガチャ公開開始日時"
      t.timestamp :gatya_kakin_end_time, null: false, comment: "課金ガチャ公開終了日時"
      t.timestamp :regist_time, null: false, comment: "登録日時"
      t.timestamp :update_time, null: false, comment: "更新日時"
      t.timestamps null: false
    end

    create_table :unit, id: :bigint, comment: "ユニットテーブル", force: :cascade do |t|
      t.integer :user_id, :limit => 8, null: false, comment: "ユーザーID"
      t.integer :unit_master_id, :limit => 8, null: false, comment: "ユニットマスタID"
      t.integer :star, null: false, comment: "星"
      t.integer :level_max, null: false, comment: "最大レベル"
      t.integer :level, null: false, comment: "レベル"
      t.integer :exp, null: false, comment: "経験値"
      t.integer :kou, null: false, comment: "攻撃力"
      t.integer :bou, null: false, comment: "防御力"
      t.integer :zenei_skill_id1, :limit => 8, comment: "前衛スキルID1"
      t.integer :zenei_skill_level1, comment: "前衛スキルレベル1"
      t.integer :zenei_skill_kbn1, comment: "前衛スキル区分1"
      t.integer :zenei_skill_id2, :limit => 8, comment: "前衛スキルID2"
      t.integer :zenei_skill_level2, comment: "前衛スキルレベル2"
      t.integer :zenei_skill_kbn2, comment: "前衛スキル区分2"
      t.integer :koei_skill_id1, :limit => 8, comment: "後衛スキルID1"
      t.integer :koei_skill_level1, comment: "後衛スキルレベル1"
      t.integer :koei_skill_kbn1, comment: "後衛スキル区分1"
      t.integer :koei_skill_id2, :limit => 8, comment: "後衛スキルID2"
      t.integer :koei_skill_level2, comment: "後衛スキルレベル2"
      t.integer :koei_skill_kbn2, comment: "後衛スキル区分2"
      t.integer :leader_skill_id, :limit => 8, comment: "リーダースキルID"
      t.integer :leader_skill_level, comment: "リーダースキルレベル"
      t.integer :leader_skill_kbn, comment: "リーダースキル区分"
      t.timestamp :regist_time, null: false, comment: "登録日時"
      t.timestamp :update_time, null: false, comment: "更新日時"
      t.integer :delflg, null: false, comment: "削除フラグ"
      t.timestamps null: false
    end

    create_table :skill_master, id: :bigint, comment: "スキルマスタ", force: :cascade do |t|
      t.string :image_no, :limit => 8, null: false, comment: "画像番号"
      t.integer :kbn, null: false, comment: "区分"
      t.integer :type, null: false, comment: "タイプ"
      t.string :name, :limit => 32, null: false, comment: "名前"
      t.text :info, null: false, comment: "説明"
      t.integer :cost, null: false, comment: "コスト"
      t.integer :zokusei, null: false, comment: "属性"
      t.integer :ap, null: false, comment: "AP"
      t.integer :kaisu, null: false, comment: "回数"
      t.integer :taisyo, null: false, comment: "対象"
      t.integer :taisyo_min, null: false, comment: "最小対象数"
      t.integer :taisyo_max, null: false, comment: "最大対象数"
      t.float :bairitsu, comment: "倍率"
      t.float :kou_zougen, comment: "物攻増減"
      t.float :bou_zougen, comment: "物防増減"
      t.float :makou_zougen, comment: "魔攻増減"
      t.float :mabou_zougen, comment: "魔防増減"
      t.timestamp :start_time, null: false, comment: "公開開始日時"
      t.timestamp :end_time, null: false, comment: "公開終了日時"
      t.timestamp :regist_time, null: false, comment: "登録日時"
      t.timestamp :update_time, null: false, comment: "更新日時"
      t.timestamps null: false
    end

    create_table :dekki, id: :bigint, comment: "デッキテーブル", force: :cascade do |t|
      t.integer :user_id, :limit => 8, null: false, comment: "ユーザーID"
      t.integer :no, null: false, comment: "番号"
      t.integer :main_flg, null: false, comment: "メインフラグ"
      t.timestamps null: false
    end

    create_table :dekki_unit, id: :bigint, comment: "デッキユニットテーブル", force: :cascade do |t|
      t.integer :user_id, :limit => 8, null: false, comment: "ユーザーID"
      t.integer :dekki_id, :limit => 8, null: false, comment: "デッキID"
      t.integer :unit_id, :limit => 8, null: false, comment: "ユニットID"
      t.integer :leader_flg, null: false, comment: "リーダーフラグ"
      t.timestamps null: false
    end

    create_table :dekki_skill, id: :bigint, comment: "デッキスキルテーブル", force: :cascade do |t|
      t.integer :user_id, :limit => 8, null: false, comment: "ユーザーID"
      t.integer :dekki_id, :limit => 8, null: false, comment: "デッキID"
      t.integer :skill_master_id, :limit => 8, null: false, comment: "スキルマスタID"
      t.timestamps null: false
    end

    create_table :info_master, id: :bigint, comment: "お知らせマスタ", force: :cascade do |t|
      t.integer :kbn, null: false, comment: "区分"
      t.text :naiyo, null: false, comment: "内容"
      t.timestamp :regist_time, null: false, comment: "配信開始日時"
      t.timestamp :update_time, null: false, comment: "配信終了日時"
      t.timestamps null: false
    end

    create_table :info, id: :bigint, comment: "お知らせテーブル", force: :cascade do |t|
      t.integer :user_id, :limit => 8, null: false, comment: "ユーザーID"
      t.integer :info_master_id, :limit => 8, null: false, comment: "お知らせマスタID"
      t.timestamp :get_time, null: false, comment: "取得日時"
      t.integer :kidoku_flg, null: false, comment: "既読フラグ"
      t.timestamps null: false
    end

    create_table :event_master, id: :bigint, comment: "イベントマスタ", force: :cascade do |t|
      t.text :name, null: false, comment: "イベント名"
      t.timestamp :regist_time, null: false, comment: "公開開始日時"
      t.timestamp :update_time, null: false, comment: "公開終了日時"
      t.timestamps null: false
    end

    create_table :event_image_master, id: :bigint, comment: "イベント画像マスタ", force: :cascade do |t|
      t.integer :event_master_id, :limit => 8, null: false, comment: "イベントマスタID"
      t.integer :hyoji_kbn, null: false, comment: "表示区分"
      t.string :image_no, :limit => 8, null: false, comment: "画像番号"
      t.integer :link, comment: "リンク"
      t.timestamps null: false
    end

    create_table :present_master, id: :bigint, comment: "プレゼントマスタ", force: :cascade do |t|
      t.integer :kbn, null: false, comment: "区分"
      t.integer :login_su, comment: "ログイン数"
      t.integer :renzoku_login_su, comment: "連続ログイン数"
      t.integer :shotai_su, comment: "招待数"
      t.integer :kind, null: false, comment: "種類"
      t.integer :item_master_id, :limit => 8, comment: "アイテムマスタID"
      t.integer :suryo, null: false, comment: "数量"
      t.text :info, null: false, comment: "説明"
      t.timestamp :regist_time, null: false, comment: "配信開始日時"
      t.timestamp :update_time, null: false, comment: "配信終了日時"
      t.timestamps null: false
    end

    create_table :present, id: :bigint, comment: "プレゼントテーブル", force: :cascade do |t|
      t.integer :user_id, :limit => 8, null: false, comment: "ユーザーID"
      t.integer :present_master_id, :limit => 8, null: false, comment: "プレゼントマスタID"
      t.timestamp :get_time, null: false, comment: "取得日時"
      t.integer :get_flg, null: false, comment: "取得フラグ"
      t.timestamps null: false
    end

    create_table :premium_master, id: :bigint, comment: "プレミアムマスタ", force: :cascade do |t|
      t.integer :kbn, null: false, comment: "区分"
      t.integer :unit_master_id, :limit => 8, comment: "ユニットマスタID"
      t.integer :item_master_id, :limit => 8, comment: "アイテムマスタID"
      t.integer :suryo, null: false, comment: "数量"
      t.integer :seigen, comment: "交換制限"
      t.timestamp :start_time, null: false, comment: "公開開始日時"
      t.timestamp :end_time, null: false, comment: "公開終了日時"
      t.timestamp :regist_time, null: false, comment: "登録日時"
      t.timestamp :update_time, null: false, comment: "更新日時"
      t.timestamps null: false
    end

    create_table :koukan, id: :bigint, comment: "交換履歴テーブル", force: :cascade do |t|
      t.integer :kbn, null: false, comment: "区分"
      t.integer :premium_master_id, :limit => 8, comment: "プレミアムマスタID"
      t.timestamps null: false
    end

    create_table :item_master, id: :bigint, comment: "アイテムマスタ", force: :cascade do |t|
      t.integer :no, null: false, comment: "区分"
      t.string :image_no, :limit => 8, null: false, comment: "画像番号"
      t.string :name, :limit => 32, null: false, comment: "名前"
      t.text :info, null: false, comment: "説明"
      t.integer :koukaryo, null: false, comment: "効果量"
      t.integer :kakuritsu, comment: "確率"
      t.timestamp :regist_time, null: false, comment: "登録日時"
      t.timestamp :update_time, null: false, comment: "更新日時"
      t.timestamps null: false
    end

    create_table :item, id: :bigint, comment: "アイテムテーブル", force: :cascade do |t|
      t.integer :user_id, :limit => 8, null: false, comment: "ユーザーID"
      t.integer :item_master_id, :limit => 8, null: false, comment: "アイテムマスタID"
      t.integer :shojisu, null: false, comment: "所持数"
      t.timestamp :regist_time, null: false, comment: "登録日時"
      t.timestamp :update_time, null: false, comment: "更新日時"
      t.integer :delflg, null: false, comment: "削除フラグ"
      t.timestamps null: false
    end

    create_table :shisetsu_master, id: :bigint, comment: "施設マスタ", force: :cascade do |t|
      t.string :image_no, :limit => 8, null: false, comment: "画像番号"
      t.string :name, :limit => 32, null: false, comment: "名前"
      t.integer :level_max, null: false, comment: "最大レベル"
      t.integer :time, null: false, comment: "回収時間"
      t.integer :jinko, comment: "人口"
      t.integer :get_coin, comment: "コイン回収"
      t.integer :get_mana, comment: "マナ回収"
      t.integer :get_ap, comment: "AP回収"
      t.integer :need_coin, comment: "必要コイン"
      t.integer :need_seisho, comment: "必要聖書"
      t.integer :position_x, null: false, comment: "設置場所X"
      t.integer :position_y, null: false, comment: "設置場所Y"
      t.timestamp :regist_time, null: false, comment: "公開開始日時"
      t.timestamp :update_time, null: false, comment: "公開終了日時"
      t.timestamp :regist_time, null: false, comment: "登録日時"
      t.timestamp :update_time, null: false, comment: "更新日時"
      t.timestamps null: false
    end

    create_table :shisetsu, id: :bigint, comment: "施設テーブル", force: :cascade do |t|
      t.integer :user_id, :limit => 8, null: false, comment: "ユーザーID"
      t.integer :shisetsu_master_id, :limit => 8, null: false, comment: "施設マスタID"
      t.integer :level, null: false, comment: "レベル"
      t.timestamps null: false
    end

    create_table :danjon_master, id: :bigint, comment: "ダンジョンマスタ", force: :cascade do |t|
      t.string :image_no, :limit => 8, null: false, comment: "画像番号"
      t.integer :unit_master_id1, :limit => 8, null: false, comment: "ユニットマスタID1"
      t.integer :shutsugen_ritsu1, null: false, comment: "出現率1"
      t.integer :get_ritsu1, null: false, comment: "取得率1"
      t.integer :hp1, null: false, comment: "基本HP1"
      t.integer :unit_master_id2, :limit => 8, null: false, comment: "ユニットマスタID2"
      t.integer :shutsugen_ritsu2, null: false, comment: "出現率2"
      t.integer :get_ritsu2, null: false, comment: "取得率2"
      t.integer :hp2, null: false, comment: "基本HP2"
      t.integer :unit_master_id3, :limit => 8, null: false, comment: "ユニットマスタID3"
      t.integer :shutsugen_ritsu3, null: false, comment: "出現率3"
      t.integer :get_ritsu3, null: false, comment: "取得率3"
      t.integer :hp3, null: false, comment: "基本HP3"
      t.timestamp :start_time, null: false, comment: "公開開始日時"
      t.timestamp :regist_time, null: false, comment: "登録日時"
      t.timestamp :update_time, null: false, comment: "更新日時"
      t.timestamps null: false
    end

    create_table :danjon, id: :bigint, comment: "ダンジョンテーブル", force: :cascade do |t|
      t.integer :user_id, :limit => 8, null: false, comment: "ユーザーID"
      t.integer :danjon_master_id, :limit => 8, null: false, comment: "ダンジョンマスタID"
      t.integer :level1, null: false, comment: "レベル1"
      t.integer :get_ritsu1, null: false, comment: "取得率1"
      t.integer :level2, null: false, comment: "レベル2"
      t.integer :get_ritsu2, null: false, comment: "取得率2"
      t.integer :level3, null: false, comment: "レベル3"
      t.integer :get_ritsu3, null: false, comment: "取得率3"
      t.integer :unit_master_id, :limit => 8, comment: "敵ユニットマスタID"
      t.integer :hp, comment: "HP"
      t.integer :hp_max, comment: "最大HP"
      t.integer :kaisu, comment: "バトル回数"
      t.timestamps null: false
    end

    create_table :battle, id: :bigint, comment: "バトルテーブル", force: :cascade do |t|
      t.integer :no, null: false, comment: "番号"
      t.integer :girudo_id1, :limit => 8, null: false, comment: "ギルドID1"
      t.integer :bp1, null: false, comment: "BP1"
      t.integer :combo1, null: false, comment: "コンボ数1"
      t.integer :user1, :limit => 8, null: false, comment: "前衛ユーザーID1"
      t.integer :user2, :limit => 8, null: false, comment: "前衛ユーザーID2"
      t.integer :user3, :limit => 8, null: false, comment: "前衛ユーザーID3"
      t.integer :user4, :limit => 8, null: false, comment: "前衛ユーザーID4"
      t.integer :user5, :limit => 8, null: false, comment: "前衛ユーザーID5"
      t.integer :girudo_id2, :limit => 8, null: false, comment: "ギルドID2"
      t.integer :bp2, null: false, comment: "BP2"
      t.integer :combo2, null: false, comment: "コンボ数2"
      t.integer :user6, :limit => 8, null: false, comment: "前衛ユーザーID6"
      t.integer :user7, :limit => 8, null: false, comment: "前衛ユーザーID7"
      t.integer :user8, :limit => 8, null: false, comment: "前衛ユーザーID8"
      t.integer :user9, :limit => 8, null: false, comment: "前衛ユーザーID9"
      t.integer :user10, :limit => 8, null: false, comment: "前衛ユーザーID10"
      t.integer :extra_time, null: false, comment: "延長時間"
      t.integer :win_girudo_id, :limit => 8, comment: "勝利ギルドID"
      t.timestamp :regist_time, null: false, comment: "登録日時"
      t.timestamp :update_time, null: false, comment: "更新日時"
      t.timestamps null: false
    end

    create_table :battle_rireki, id: :bigint, comment: "バトル履歴テーブル", force: :cascade do |t|
      t.integer :battle_id, :limit => 8, null: false, comment: "バトルID"
      t.integer :group_id, null: false, comment: "グループID"
      t.integer :kbn, null: false, comment: "区分"
      t.integer :shiyo_user_id, :limit => 8, null: false, comment: "使用ユーザーID"
      t.integer :shiyo_unit_id, :limit => 8, null: false, comment: "使用ユニットID"
      t.integer :kouka_user_id, :limit => 8, null: false, comment: "効果ユーザーID"
      t.integer :kouka_ryo, comment: "効果量"
      t.integer :skill_id, :limit => 8, comment: "スキルID"
      t.integer :kou_zougenti, comment: "物攻増減値"
      t.integer :bou_zougenti, comment: "物防増減値"
      t.integer :makou_zougenti, comment: "魔攻増減値"
      t.integer :mabou_zougenti, comment: "魔防増減値"
      t.integer :hyoji_flg, null: false, comment: "表示フラグ"
      t.timestamp :regist_time, null: false, comment: "登録日時"
      t.timestamps null: false
    end

    create_table :image_master, id: :bigint, comment: "画像マスタ", force: :cascade do |t|
      t.string :no, :limit => 8, null: false, comment: "番号"
      t.integer :kbn, null: false, comment: "区分"
      t.string :directory, :limit => 32, null: false, comment: "場所"
      t.string :name, :limit => 32, null: false, comment: "画像名"
      t.timestamp :regist_time, null: false, comment: "公開開始日"
      t.timestamp :update_time, null: false, comment: "公開終了日"
      t.integer :update_version, null: false, comment: "更新バージョン"
      t.timestamps null: false
    end

    create_table :image, id: :bigint, comment: "画像テーブル", force: :cascade do |t|
      t.integer :user_id, :limit => 8, null: false, comment: "ユーザーID"
      t.integer :image_master_id, :limit => 8, null: false, comment: "画像マスタID"
      t.integer :get_flg, null: false, comment: "取得フラグ"
      t.timestamps null: false
    end

    create_table :exp_master, id: :bigint, comment: "経験値マスタ", force: :cascade do |t|
      t.integer :kbn, null: false, comment: "区分"
      t.integer :level, null: false, comment: "レベル"
      t.integer :exp, null: false, comment: "必要経験値"
      t.timestamps null: false
    end

    create_table :buy_rireki, id: :bigint, comment: "購入履歴テーブル", force: :cascade do |t|
      t.integer :user_id, :limit => 8, null: false, comment: "ユーザーID"
      t.integer :kbn, null: false, comment: "区分"
      t.integer :kingaku, comment: "金額"
      t.integer :crystal, null: false, comment: "クリスタル"
      t.integer :buy_ok_flg, comment: "購入OKフラグ"
      t.timestamp :regist_time, null: false, comment: "登録日時"
      t.timestamp :update_time, null: false, comment: "更新日時"
      t.timestamps null: false
    end

    create_table :update_master, id: :bigint, comment: "更新マスタ", force: :cascade do |t|
      t.integer :no, null: false, comment: "バージョン"
      t.text :naiyo, null: false, comment: "更新内容"
      t.timestamp :start_time, null: false, comment: "開始日時"
      t.timestamps null: false
    end

  end
end
