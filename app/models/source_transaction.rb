class SourceTransaction < ApplicationRecord
  monetize :price_cents

  belongs_to :account, class_name: 'SourceAccount'
end
