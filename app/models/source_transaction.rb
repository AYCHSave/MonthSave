class SourceTransaction < ApplicationRecord
  belongs_to :account, class_name: 'SourceAccount'
end
