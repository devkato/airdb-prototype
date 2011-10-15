class Table < ActiveRecord::Base

  # ======================================================================
  # callback functions
  # ======================================================================
  before_create :set_real_name
  after_create :create_real_table
  before_destroy :destroy_real_table


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


  private


  def set_real_name
    self.real_name = ""
  end


  def create_real_table
    self.update_attribute(:real_name, "airdb_real_#{sprintf('%06d', self.id)}")

    res = ActiveRecord::Base.connection.execute(<<-EOS
      CREATE TABLE #{self.project.real_name}.#{self.real_name} (
        id INT AUTO_INCREMENT PRIMARY KEY,
        column1 VARCHAR(255) NOT NULL DEFAULT '',
        column2 VARCHAR(255) NOT NULL DEFAULT '',
        column3 VARCHAR(255) NOT NULL DEFAULT ''
      )
    EOS
    )

    logger.debug(res)
  end


  def destroy_real_table
    res = ActiveRecord::Base.connection.execute(%!DROP TABLE #{self.project.real_name}.#{self.real_name}!)
    logger.debug(res)
  end
end
