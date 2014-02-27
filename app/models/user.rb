class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable


  # I know this is not advisable.  There appears to be issues with Devise
  # caused by Rails 4's conversion to strong parameters.
  # The below is a quick fix.  Had I more time, I would have found a better solution.
  attr_accessible :email, :password, :password_confirmation


  has_many :donations, :foreign_key => :user_id

  has_many :voucher_donations, :through => :donations, :source => :donatable, :source_type => 'voucher'
  has_many :experience_donations, :through => :donations, :source => :donatable, :source_type => 'experience'
  has_many :physical_item_donations, :through => :donations, :source => :dontable, :source_type => 'physicalItem'

end
