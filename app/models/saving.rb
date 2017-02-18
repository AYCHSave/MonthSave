class Saving < ApplicationRecord
  belongs_to :source_transaction
  belongs_to :coin_bank
end
