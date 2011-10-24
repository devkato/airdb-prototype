class Table < ActiveRecord::Base

  # ======================================================================
  # relations
  # ======================================================================
  belongs_to :user
  belongs_to :project


  # ======================================================================
  # scopes
  # ======================================================================
  scope :user_is, lambda {|user| {
    :conditions => ["user_id = ?", user.id]
  }}
end