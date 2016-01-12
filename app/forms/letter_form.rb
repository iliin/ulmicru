class LetterForm < ApplicationForm
  property :subdivision_code,
           :number,
           :send_date,
           :receiver,
           :title,
           :list_number,
           :annex,
           :state,
           :executor_name,
           :executor_id,
           :stamp_of_receipt,
           :note

  validates :subdivision_code, presence: true
  validates :number, presence: true
  validates :send_date, presence: true
  validates :receiver, presence: true
  validates :title, presence: true
  validates :list_number, presence: true
  validates :annex, presence: true
  validates :state, presence: true
  validates :executor_name, presence: true
  validates :executor_id, presence: true
  validates :stamp_of_receipt, presence: true
  validates :note presence: true
end
