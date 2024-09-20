class Country < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ドイツ' },
    { id: 2, name: 'オーストリア' },
    { id: 3, name: 'ロシア' },
    { id: 4, name: 'チェコ' },
    { id: 5, name: 'イタリア' },
    { id: 6, name: 'フィンランド' },
    { id: 7, name: 'デンマーク' },
    { id: 8, name: 'フランス' },
    { id: 9, name: 'イギリス' },
  ]

  include ActiveHash::Associations
  has_many :pieces
  end