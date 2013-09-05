class Operation < ActiveRecord::Base
  belongs_to :user
  belongs_to :from, class_name: "User"
  belongs_to :money_type_operation
  belongs_to :io_type_operation
end
