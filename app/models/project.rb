class Project < ActiveRecord::Base

  # ======================================================================
  # callback functions
  # ======================================================================
  before_create :set_real_name
  after_create :create_real_database
  before_destroy :destroy_real_database


  # ======================================================================
  # relations
  # ======================================================================
  belongs_to :user
  has_many :tables


  # ======================================================================
  # scopes
  # ======================================================================
  scope :user_is, lambda {|user| {
    :conditions => ["user_id = ?", user.id]
  }}


  private


  def set_real_name
    self.real_name = ""
  end


  def create_real_database
    self.update_attribute(:real_name, "airdb_real_#{sprintf('%06d', self.id)}")

    res = ActiveRecord::Base.connection.execute(%!CREATE DATABASE #{self.real_name}!)
    logger.debug(res)
  end


  def destroy_real_database
    res = ActiveRecord::Base.connection.execute(%!DROP DATABASE #{self.real_name}!)
    logger.debug(res)
  end
end
