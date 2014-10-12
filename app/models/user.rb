class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :boards, dependent: :destroy
  has_many :board_members, dependent: :destroy

  def full_name
  	first_name + " " + last_name
  end

  def initials
    (first_name[0] + last_name[0]).upcase
  end

end
