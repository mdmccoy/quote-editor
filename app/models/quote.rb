class Quote < ApplicationRecord
  belongs_to :company

  validates_presence_of :name

  scope :ordered, -> { order(id: :desc) }

  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # Rails conventions allow the below to be shortend to the above
  # after_update_commit -> { broadcast_replace_later_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: self }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }

  broadcasts_to ->(quote) { [ quote.company, "quotes" ] }, inserts_by: :prepend

  # after_create_commit -> { broadcast_remove_to([ self.company, "new_quotes" ], target: "new_quote") }
  # after_destroy_commit -> { broadcast_replace_to([ self.company, "new_quotes" ], partial: "quotes/empty_state", target: "new_quote") }
end
