class Country < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ドイツ' },
    { id: 2, name: 'オーストリア' },
    { id: 3, name: 'ロシア' },
    { id: 4, name: 'チェコ' },
  ]

  include ActiveHash::Associations
  has_many :pieces
  end