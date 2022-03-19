class Subject < ApplicationRecord
  after_update :find_name_before_last_save
  #validates :name, presence: true
  validates_presence_of :name 
  validates_length_of :name, :maximum => 255
  validate :find_name_before_last_save, if: -> {p name_previously_changed?, name_previously_changed?}

  has_many :pages
  
  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where (["name LIKE ?", "%#{query}%"])
  }
  def find_name_before_last_save
    puts "+++++++++++++++"
    self.name
    errors.add(self.name,"hi")
  end
end
