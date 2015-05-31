class UnitMaster < ActiveRecord::Base
  self.inheritance_column = :escape_from_type
  self.table_name = 'unit_master'
end