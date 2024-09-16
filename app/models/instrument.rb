class Instrument < ApplicationRecord
  has_many :piece_instruments
  has_many :pieces, through: :piece_instruments

  validates :instrument_name, presence: true
end
