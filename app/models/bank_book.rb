class BankBook < ActiveRecord::Base
  self.primary_key = :id
  has_and_belongs_to_many :users
  has_many :operations

  validates :id, presence: true

  def to_s
    "#{name} - #{id}"
  end
end
