class Quote < ApplicationRecord
  validates_presence_of :name

  scope :ordered, -> { order(id: :desc) }

  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # Rails conventions allow the below to be shortend to the above
  # after_update_commit -> { broadcast_replace_later_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: self }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }

  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
end
