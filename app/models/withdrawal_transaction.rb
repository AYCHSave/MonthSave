class WithdrawalTransaction < ApplicationRecord
  monetize :price_cents

  belongs_to :account
end
