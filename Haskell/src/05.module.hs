-- moduleのimport
import           Data.List

-- moduleの中から特定の関数のみをインポート
import           Data.List (nub, sort)

-- 特定の関数以外をインポート
import           Data.List hiding (nub)

-- 修飾付きインポート
import qualified Data.Map
-- > `Data.Map.filter`などのようにして使う

-- 別名をつける
import qualified Data.Map  as M
