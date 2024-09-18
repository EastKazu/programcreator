class Composer < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ベートーヴェン' },
    { id: 2, name: 'ブラームス' },
    { id: 3, name: 'マーラー' },
    { id: 4, name: 'チャイコフスキー' },
  ]

  include ActiveHash::Associations
  has_many :pieces
  end