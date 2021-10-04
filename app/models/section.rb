class Section < ApplicationRecord
  #belongs_to :section_edits
  #has_many :admin_users, :through => :section_edits
  has_many :section_edits
end
