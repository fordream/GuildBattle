class SkillMaster < ActiveRecord::Base
  self.inheritance_column = :escape_from_type
  self.table_name = 'skill_master'
end