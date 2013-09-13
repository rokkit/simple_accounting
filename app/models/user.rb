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
  validate :all_password_must_be_different

  def all_password_must_be_different
    if self.fake_password == self.alert_password
      errors.add :password_diff, "Пароли должны отличаться"
    end
  end
  def to_s
    "#{name} - #{roles.first.to_s}"
  end

  def check_type_of_login input_password
    case input_password
      when self.fake_password
        puts "FAKE PASSWORD"
        self.create_activity :fake_password, owner: self
        return false
      else
        return true
    end
  end
end
