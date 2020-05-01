import           Control.Lens


-- | タプル系
(1,2,3,4,5)^._4 -- 4番目を取得
(1, ('a', 'b', ("Hoge", "Piyo")), 2)^._2._3._1 -- 入れ子でもアクセス可能

-- 値の変更
((1,2),3)&_1._2 .~ True

-- | フィールド系
{-# LANGUAGE TemplateHaskell #-}

data Par = Par {
  _foo :: String,
  _chi :: Chi
  } deriving (Show, Eq)

data Chi = Chi {
  _piyo :: Int
  } deriving (Show, Eq)

makeLenses ''Par
makeLenses ''Chi

let par = (Par "parent" (Chi 1))
_foo par -- 普通のアクセス
par^.foo -- Lensでのアクセス
("Piyo", par)^._2.foo -- タプル系の関数と組み合わせる
_2.foo .~ "Bar" $ ("Piyo", par) -- 値の変更


