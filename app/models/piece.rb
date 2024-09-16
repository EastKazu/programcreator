class Piece < ApplicationRecord
  has_many :piece_instruments
  has_many :instruments, through: :piece_instruments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :composer
  belongs_to :genre

  with_options presence: true do
    validates :piece_name
    validates :composer_id
    validates :genre_id
    validates :year_composed
  end
end