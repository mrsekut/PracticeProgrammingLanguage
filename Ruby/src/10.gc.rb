# Rubyのしくみ p.341


# MRIのヒープに関数r情報を表示する
def display_count
    data = ObjectSpace.count_objects
    puts "Total: #{data[:TOTAL]} Free: #{data[:FREE]} Object: #{data[:T_OBJECT]}"
end


# # Experiment 1 ========================================
# # 10個のRubyオブジェクトを作成
# 10.times do
#     obj = Object.new
#     display_count
# end

# Output
# $ ruby 10.gc.rb
# Total: 23230 Free: 64 Object: 265
# Total: 23230 Free: 236 Object: 265
# Total: 23230 Free: 230 Object: 266
# Total: 23230 Free: 224 Object: 267
# Total: 23230 Free: 218 Object: 268
# Total: 23230 Free: 212 Object: 269
# Total: 23230 Free: 206 Object: 270
# Total: 23230 Free: 200 Object: 271
# Total: 23230 Free: 194 Object: 272
# Total: 23230 Free: 188 Object: 273

# desc
# Todal: オブジェクトの総数
#   この値(23230)はRubyの内部でその時点で有効なオブジェクトの総数
# Free: フリーオブジェクトの総数
#   フリーリストの長さを表す.
#   ループの繰り返しごとに7ずつ減っている
#   コード上では1個のオブジェクトしか生成していないが、内部的にRubyが6つのオブジェクトを生成している
# Object: RObject構造体の数
#   Rubyの中でその時点でアクティブなRObject構造体の数
#   生成したオブジェクトをどこからも参照してしないのに1ずつ増えていっていることから、RObjectはアクティブなオブジェクトとゴミオブジェクトを含んでいることがわかる

# # Experiment 2 ========================================
# # 30個のRubyオブジェクトを作成
# 30.times do
#     obj = Object.new
#     display_count
# end

# Output
# $ ruby 10.gc.rb
# Total: 23235 Free: 260 Object: 264
# Total: 23235 Free: 204 Object: 265
# Total: 23235 Free: 198 Object: 266
# .....
# Total: 23235 Free: 78 Object: 286
# Total: 23235 Free: 72 Object: 287
# Total: 23235 Free: 66 Object: 288 <= ①
# Total: 23235 Free: 312 Object: 289 <= ②
# Total: 23235 Free: 306 Object: 290
# Total: 23235 Free: 300 Object: 291
# Total: 23235 Free: 294 Object: 292
# Total: 23235 Free: 288 Object: 293

# ①から②にかけてFreeリストが増加しているがこれは完全なGCではない。
# なぜなら完全なGCだと、Freeが増加すると共に、RObjectの数が減るはずだから。
# これは遅延スイープが起きている。
# Freeリストが減っているのにRObjectの個数が減らないのは、RObjectを再利用しているから

# Experiment 3 ========================================
# # 30個のRubyオブジェクトを作成
# 30.times do
#     obj = Object.new
#     display_count
# end

# GC.start # 完全なGCを実行
# display_count

# Output
# $ ruby 10.gc.rb
# Total: 23237 Free: 214 Object: 264
# Total: 23237 Free: 158 Object: 265
# ....
# Total: 23237 Free: 247 Object: 292
# Total: 23237 Free: 241 Object: 293
# Total: 23237 Free: 6028 Object: 253 <= GC!

# Desc
# Freeがめっちゃ増えて、RObjectが激減している
# Freeリスト中の全てのゴミオブジェクトをスイープした
#   ↑これにはこのコード中のループで作成したオブジェクト以外にも、パースとコンパイルの段階で内部で作られたものも含まれる

# Experiment 4 ========================================
# # 30個のRubyオブジェクトを作成
# GC::Profiler.enable
# 1000000.times do
#     obj = Object.new
# end
# GC::Profiler.report

# # Output
# $ ruby 10.gc.rb
# GC 179 invokes.
# Index    Invoke Time(sec)       Use Size(byte)     Total Size(byte)         Total Object                    GC Time(ms)
#     1               0.101               690840               930240                23256         0.44199999999998407230
#     2               0.103               690840               930240                23256         0.28100000000000346922
#     3               0.104               690840               930240                23256         0.27400000000001034639
#     4               0.105               690840               930240                23256         0.27099999999995183497
#     5               0.106               690840               930240                23256         0.26099999999999734523
#     6               0.107               690840               930240                23256         0.25899999999989820054
#     7               0.109               690840               930240                23256         0.20400000000003748468
#     8               0.110               690840               930240                23256         0.17500000000000848210
#     9               0.111               690840               930240                23256         0.18299999999993321609
#    10               0.112               690840               930240                23256         0.17400000000000748202
#    11               0.113               690840               930240                23256         0.18699999999999272760
#    12               0.114               690840               930240                23256         0.24100000000001897682
#    13               0.115               690840               930240                23256         0.22700000000011599788
#    14               0.116               690840               930240                23256         0.18899999999999472777
#    15               0.117               690840               930240                23256         0.18599999999993621635
#    16               0.118               690840               930240                23256         0.19400000000002748379
#    17               0.119               690840               930240                23256         0.18099999999995897149
#    18               0.120               690840               930240                23256         0.18699999999996497202

# - Invoke Time: GCが発生するまでに経過した時間
# - Use size: 各GCが終わった後で生きているRubyオブジェクトによってどれくらいのヒープメモリが使用されているか
# - Total size: GC後のヒープ合計サイズ。生きているオブジェクトとフリーリストの合計サイズ
# - Total Object: Rubyオブジェクトの総数。生きているオブジェクトとフリーリスト上のオブジェクトの合計。
# - GC Time: GCにかかった時間

# Experiment 5 ========================================
# JRubyのGCの実験
# 1000000.times do
#     obj = Object.new
# end

# output
# $ jruby -J-verbose:gc 10.gc.rb
# [0.021s][info][gc] Using G1
# [0.823s][info][gc] GC(0) Pause Initial Mark (Metadata GC Threshold) 9M->4M(256M) 9.468ms
# [0.823s][info][gc] GC(1) Concurrent Cycle
# [0.831s][info][gc] GC(1) Pause Remark 5M->5M(256M) 2.485ms
# [0.832s][info][gc] GC(1) Pause Cleanup 5M->5M(256M) 0.243ms
# [0.834s][info][gc] GC(1) Concurrent Cycle 11.082ms

# desc
# 本と出力が変わっているので、あまり見てない
# 今回の実験ではminor GCしか起動していない



# Experiment 6 ========================================
# Major GCも発生させる
arr = []
10000000.times do
    arr << Object.new
end

# Major GCも置きている