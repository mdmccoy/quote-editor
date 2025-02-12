class Quote < ApplicationRecord
  validates_presence_of :name

  scope :ordered, -> { order(id: :desc) }
end
