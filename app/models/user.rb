class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation


  has_many :donations, :foreign_key => :user_id

  has_many :voucher_donations, :through => :donations, :source => :donation_type, :source_type => 'Voucher'
  has_many :experience_donations, :through => :donations, :source => :donation_type, :source_type => 'Experience'
  has_many :physical_item_donations, :through => :donations, :source => :donation_type, :source_type => 'PhysicalItem'

end
