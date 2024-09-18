class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '交響曲' },
    { id: 2, name: '序曲' },
    { id: 3, name: 'バレエ音楽' },
    { id: 4, name: '序曲' },
  ]

  include ActiveHash::Associations
  has_many :pieces
  end