class Prize < ApplicationRecord
  belongs_to :ticket, optional: true
end
