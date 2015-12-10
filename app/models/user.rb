class User < ActiveRecord::Base
	has_many :rooms, :dependent => :destroy
  acts_as_messageable
  validates_presence_of :name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end
end
