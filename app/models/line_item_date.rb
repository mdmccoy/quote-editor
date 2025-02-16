class LineItemDate < ApplicationRecord
  belongs_to :quote

  validates :date, presence: true, uniqueness: { scope: :quote_id }

  scope :ordered, -> { order(date: :asc) }

  # after_destroy_commit -> { broadcast_remove_to [ self.quote, "line_item_dates" ] }

  # broadcasts_to ->(line_item_date) { [ line_item_date.quote, "line_item_dates" ] }
  #

  def previous_date
    quote.line_item_dates.where("date < ?", date).ordered.last
  end
end
