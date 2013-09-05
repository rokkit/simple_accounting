class User < ActiveRecord::Base
  rolify
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :bank_books
  def to_s
    "#{name} - #{roles}"
  end
end
