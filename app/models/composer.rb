class Composer < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ベートーヴェン' },
    { id: 2, name: 'ブラームス' },
    { id: 3, name: 'チャイコフスキー' },
    { id: 4, name: 'モーツァルト' },
  ]

  include ActiveHash::Associations
  has_many :pieces
  end