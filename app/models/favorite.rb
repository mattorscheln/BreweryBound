class Favorite < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :brewery_id, :presence => true, :uniqueness => { :scope => :user_id }

  belongs_to :brewery , :class_name => "Brewery", :foreign_key => "brewery_id"
  belongs_to :user , :class_name => "User", :foreign_key => "user_id"
end
