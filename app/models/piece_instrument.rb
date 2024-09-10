class PieceInstrument < ApplicationRecord
  belongs_to :piece
  belongs_to :instrument
end
