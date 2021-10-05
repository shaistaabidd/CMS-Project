class Page < ApplicationRecord

  belongs_to :subject#,  optional: true#,:class_name => "Subject", :foreign_key => "subject_id" #, {:optional => false }
  #has_and_belongs_to_many :admin_users
end
