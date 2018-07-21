# echo "hello wolrd!"

# https://qiita.com/KTakahiro1729/items/f4776f3a072c01f9086b

# echo "what is your name?"
# var name: string = readLine(stdin) # var name = readLine(stdin)
# echo "Hi", name, "!"

# echo 1000000
# echo 1_000_000
# echo 1.0e6 # 浮動小数点数型になる

# var x,y =3
# echo "x, ", x
# echo "y, ", y
# x =42
# echo "x, ", x
# echo "y, ", y


# let x = "abc"
# echo x

let name = readLine(stdin)
if name == "":
 echo "Poor soul, you lost your name?"
elif name == "name":
 echo "Very funny, your name is name."
else:
  echo "Hi, ", name, "!"

# let name = readLine(stdin)
# case name
# of "":
#   echo "poor soul, you lost your name?"
# of "name":
#   echo "very funny, your name is name."
# of "Dave","Frank":
# # of "Dave":
# # of "Frank":
#   echo "cool name!"
# else:
#   echo "Hi, ", name, "!"

# from strutils import parseInt
#
# echo "A number please:"
# let n = parseInt(readLine(stdin))
# case n
# of 0..2, 4..7: echo "the number is in the set"
# of 3,8: echo "the number is 3 or8."
# else: discard

# echo "your name?"
# var name = readLine(stdin)
# while name == "":
#   echo "please tell me your name"
#   name = readLine(stdin)

# echo "Counting to ten:"
# for i in countup(1,10):
#   echo $i

# block myblock: # block's lavel is optional
#   var x = "hi"

# block myblock:
#   echo "entering block"
#   while true:
#     echo "looping"
#     break
#   echo "still in block"
#
# block myblock2:
#   echo "entering block"
#   while true:
#     echo "looping"
#     break myblock2
#   echo "still in block"

# yesというプロシージャ名、sring型の引数を取りboolean型の値を返す
# proc yes(question: string): bool =
#   echo question, "(y/n)"
#   while true:
#     case readLine(stdin)
#     of "y", "Y", "yes", "Yes": return true
#     of "n", "N", "no", "No": return false
#     else: echo "please be ckear: yes or no"
#
# if yes("should I delete all your important files?"):
#   echo "I'm sorry Dave, I'm afraid I cant't do that."
# else:
#   echo "I think you know what the probelm is just as well as I do."

# proc sumTillNegative(x :varargs[int]): int =
#   for i in x:
#     if i<0:
#       return
#     result = result + i
#
# echo sumTillNegative()
# echo sumTillNegative(3, 4, 5)
# echo sumTillNegative(3, 4, -1, 6)

# proc printSeq(s: seq, nprinted: int = -1) =
#   var nprinted = if nprinted == -1: s.len else: min(nprinted, s.len)
#   for i in 0 .. <nprinted:
#     echo s[i]

# proc divmod(a, b: int; res, remainder: var int) =
#   res = a div b
#   remainder = a mod b
#
# var
#   x, y: int
# divmod(8,5,x,y)
# echo x
# echo y

# proc p(x,y: int): int {.discardable.} =
#   return x + y
#
# p(3,4)

# proc even(n: int): bool # 定義するためにコンパイラにevenの存在を知らせる
# proc odd(n: int): bool =
#   assert(n >= 0)
#   if n == 0: false
#   else:
#     n == 1 or even(n-1)
#
# proc even(n: int): bool =
#   assert(n >= 0)
#   if n == 1: false
#   else:
#     n == 0 or odd(n-1)

# echo "Counting to ten:"
# for i in countup(1,10):
#   echo $i

# iterator countup(a, b: int): int =
#   var res = a
#   while res <= b:
#     yield res
#     inc(res)

# while p != nil and p.name != "xyz":
#   p = p.next

# var
#   x: int32 = 1.int32
#   y: int8 = int8('a')
#   z: float = 2.5
#   sum: int = int(x) + int(y) + int(z)

# type
#   biggestInt = int64
#   biggestFloat = float64


# type
#   Direction = enum
#     north, east, south, west
#
# var x = south
# echo $x

# var num = 10
#
# echo ord(num)
# echo inc(num)
# echo inc(num, 5)
# echo dec(num)
# echo dec(num, 5)
# echo succ(num)
# echo succ(num, 5)
# echo pred(num)
# echo pred(num, 5)

# type
#   MySubrange = range[0..5]

# type
#   CharSet = set[char]
#
# var
#   x: CharSet
#
# x = {'0'..'9'}
# echo x

# type
#   IntArray = array[0..5, int]
# var
#   x: IntArray
# x = [1,2,3,4,5,6]
# for i in low(x)..high(x):
#   echo x[i]

# type
#   Direction = enum
#     north, east, south, west
#   BlinkLights = enum
#     off, on, slowBlink, mediumBlink, fastBlink
#   LevelSetting = array[north..west, BlinkLights]
# var
#   level: LevelSetting
# level[north] = on
# level[south] = slowBlink
# level[east] = fastBlink
# echo repr(level)
# echo low(level)
# echo len(level)
# echo high(level)

# var
#   a = "Nim is a programming language"
#   b = "Slices are useless."
#
# echo a[7..12]
# b[11..^2] = "useless"
# echo b

proc echoItem(x: int) = echo x

proc forEach(action: proc(x: int)) =
  const
    data = [2,3,5,7,11]
  for d in items(data):
    action(d)

forEach(echoItem)
