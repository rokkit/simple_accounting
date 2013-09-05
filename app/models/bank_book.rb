class BankBook < ActiveRecord::Base
  self.primary_key = :id
  has_and_belongs_to_many :users

  validates :id, presence: true
end
