class Piece < ApplicationRecord
  has_many :piece_instruments
  has_many :instruments, through: :piece_instruments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :composer
  belongs_to :genre
  belongs_to :country

  with_options presence: true do
    validates :piece_name
    validates :composer_id
    validates :genre_id
    validates :year_composed
    validates :country_id
  end

  def self.ransackable_attributes(auth_object = nil)
    ["piece_name", "composer_id", "genre_id", "year_composed", "country_id"]
  end

  # Ransackで検索可能な関連付けを定義
  def self.ransackable_associations(auth_object = nil)
    ["composer", "genre", "country", "instruments", "piece_instruments"]
  end
end