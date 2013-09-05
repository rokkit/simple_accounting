json.array!(@bank_books) do |bank_book|
  json.extract! bank_book, :id, :name, :bank_account, :total, :saldo
  json.url bank_book_url(bank_book, format: :json)
end
