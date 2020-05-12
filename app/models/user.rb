class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name

  def first_name
    self.name.to_s.split(' ')[0].to_s.capitalize
  end

  def last_name
    self.name.to_s.split(' ')[-1].to_s.capitalize
  end
end
