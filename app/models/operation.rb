class Operation < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :user
  belongs_to :from, class_name: "User"
  belongs_to :to_user, class_name: "User"
  belongs_to :money_type_operation
  belongs_to :io_type_operation
  belongs_to :bank_book

  after_create :windraw_amount_from_bank_book

  def to_s
    "#{io_type_operation.name} #{amount}"
  end

  private

  def windraw_amount_from_bank_book
    if io_type_operation.name == "Приход"
      bank_book.decrement! :amount, self.amount
    elsif io_type_operation.name == "Расход"
      bank_book.increment! :amount, self.amount
    else
      raise Exception.new "Unsupported operation"
    end
  end
end
