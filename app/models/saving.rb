class Saving < ApplicationRecord
  monetize :price_cents

  belongs_to :source_transaction
  belongs_to :coin_bank
end
