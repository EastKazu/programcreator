class Composer < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ベートーヴェン' },
    { id: 2, name: 'ブラームス' },
    { id: 3, name: 'マーラー' },
    { id: 4, name: 'チャイコフスキー' },
    { id: 5, name: 'モーツァルト' },
    { id: 6, name: 'ドヴォルザーク' },
    { id: 7, name: 'メンデルスゾーン' },
    { id: 8, name: 'ワーグナー' },
    { id: 9, name: 'シューマン' },
    { id: 10, name: 'シューベルト' },
    { id: 11, name: 'ヨハンシュトラウス1世' },
    { id: 12, name: 'ヨハンシュトラウス2世' },
    { id: 13, name: 'ブルックナー' },
    { id: 14, name: 'ロッシーニ' },
    { id: 15, name: 'サン＝サーンス' },
    { id: 16, name: 'ベルリオーズ' },
    { id: 17, name: 'ラフマニノフ' },
    { id: 18, name: 'ショスタコーヴィッチ' },
    { id: 19, name: 'ボロディン' },
    { id: 20, name: 'カリンニコフ' },
    { id: 21, name: 'シベリウス' },
    { id: 22, name: 'ニルセン' },
    { id: 23, name: 'ゲーゼ' },
    { id: 24, name: 'ヴェルディ' },
    { id: 25, name: 'ビゼー' },
    { id: 26, name: 'ホルスト' },
    { id: 27, name: 'ウェーバー' },
  ]

  include ActiveHash::Associations
  has_many :pieces
  end