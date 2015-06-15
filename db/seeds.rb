require "pry"
require "roo"
require "active_support"

class Seed

  def initialize(file_path)
    # エクセルを読んでデータを投入
    save_all file_path
  end

  private

  def save_all(file_path)
    readed = []

    xlsx = Roo::Excelx.new(file_path)
    xlsx.sheets.each_with_index do |sheet, sheet_no|
      row_no      = 0

      # シート名を小文字にしたあとでclassifyをかけ、モデルクラスをevalで作る
      # 'UNIT_MASTER'なら -> 'unit_master' -> 'UnitMaster'
      model_class = eval(ActiveSupport::Inflector.classify(sheet.downcase))
      # データは全部削除してから
      model_class.delete_all

      xlsx.sheet_for(sheet).each_row do |row|
        row_no = row_no + 1
        next if row_no < 2

        model  = model_class.new
        col_no = 0

        model.attributes.each do |c|
          # カラム名
          column = c.first
          # created_at, updated_atは無視
          unless column == 'created_at' || column == 'updated_at'
            model[column] = row[col_no].value unless is_blank(row[col_no])
          end
          col_no = col_no + 1
        end
        next if model[:id] == nil
        model.save!
      end
    end
  end

  def is_blank(obj)
    obj == nil || obj.value == nil || obj.value == ''
  end

end

# Run
Seed.new File.join(Rails.root, 'db', 'seed_xls', 'データ管理0525.xlsx')
