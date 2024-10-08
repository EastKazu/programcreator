class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '交響曲' },
    { id: 2, name: '交響詩' },
    { id: 3, name: 'バレエ音楽' },
    { id: 4, name: '組曲' },
    { id: 5, name: '協奏曲' },
    { id: 6, name: '序曲' },
    { id: 7, name: '前奏曲' },
    { id: 8, name: 'ワルツ' },
    { id: 9, name: '行進曲' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :pieces
  end