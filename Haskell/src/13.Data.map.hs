import qualified Data.Map                      as Map

env :: Map.Map String String
env = Map.fromList [("hoge", "42"), ("piyo", "100")] -- 初期化

main = do
    -- lookup :: Ord k => k -> Map.Map k a -> Maybe a
    print $ Map.lookup "hoge" env   -- 値がある時

    -- insert :: Ord k => k -> a -> Map.Map k a -> Map.Map k a
    let env2 = Map.insert "foo" "500" env   -- envに新しくkey-valueを追加したものをenv2に束縛
    print env2
    print $ Map.lookup "foo" env2

    -- delete :: Ord k => k -> Map.Map k a -> Map.Map k a
    let env3 = Map.delete "hoge" env        -- "hoge"を削除したものをenv3に束縛
    print $ Map.lookup "hoge" env3          --値がない時

    let env4 = Map.map (++ "1") env
    print env4
    print $ Map.map (++ "1") env

    let env5 = Map.mapKeys (++ "1") env
    print env5
