class Page < ApplicationRecord

  belongs_to :subject#,  optional: true#,:class_name => "Subject", :foreign_key => "subject_id" #, {:optional => false }
  #has_and_belongs_to_many :admin_users
  validates_presence_of :name 
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink 
  validates_length_of :permalink, :within => 3..255
  validates_uniqueness_of :permalink
end
