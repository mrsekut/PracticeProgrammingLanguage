(module
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$vi (func (param i32)))
 (memory $0 0)
 (table $0 1 funcref)
 (elem (i32.const 0) $null)
 (global $~lib/memory/HEAP_BASE i32 (i32.const 8))
 (global $~lib/argc (mut i32) (i32.const 0))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "Vec#get:mX" (func $Vec#get:mX))
 (export "Vec#set:mX" (func $Vec#set:mX))
 (export "Vec#get:mY" (func $Vec#get:mY))
 (export "Vec#set:mY" (func $Vec#set:mY))
 (export "_setargc" (func $~lib/setargc))
 (export "Vec#constructor" (func $assembly/index/Vec#constructor|trampoline))
 (export "Vec#init" (func $assembly/index/Vec#init|trampoline))
 (export "Vec#add" (func $assembly/index/Vec#add))
 (export "Vec#getX" (func $assembly/index/Vec#getX))
 (export "Vec#getY" (func $assembly/index/Vec#getY))
 (export "Vec#get:x" (func $assembly/index/Vec#get:x))
 (export "Vec#set:x" (func $assembly/index/Vec#set:x))
 (export "Vec#get:y" (func $assembly/index/Vec#get:y))
 (export "Vec#set:y" (func $assembly/index/Vec#set:y))
 (export "Vec#r" (func $assembly/index/Vec#r))
 (func $~lib/memory/memory.allocate (; 0 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  unreachable
 )
 (func $assembly/index/Vec#constructor (; 1 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/memory/memory.allocate
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
  end
  local.get $1
  i32.store
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
 )
 (func $assembly/index/Vec#init (; 2 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  i32.const 0
  local.get $1
  local.get $2
  call $assembly/index/Vec#constructor
 )
 (func $assembly/index/Vec#add (; 3 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  i32.const 0
  local.get $0
  i32.load
  local.get $1
  i32.load
  i32.add
  local.get $0
  i32.load offset=4
  local.get $1
  i32.load offset=4
  i32.add
  call $assembly/index/Vec#constructor
 )
 (func $assembly/index/Vec#getX (; 4 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load
 )
 (func $assembly/index/Vec#getY (; 5 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
 )
 (func $assembly/index/Vec#get:x (; 6 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load
 )
 (func $assembly/index/Vec#set:x (; 7 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store
 )
 (func $assembly/index/Vec#get:y (; 8 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
 )
 (func $assembly/index/Vec#set:y (; 9 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=4
 )
 (func $assembly/index/Vec#r (; 10 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 42
 )
 (func $null (; 11 ;) (type $FUNCSIG$v)
 )
 (func $Vec#get:mX (; 12 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load
 )
 (func $Vec#set:mX (; 13 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store
 )
 (func $Vec#get:mY (; 14 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
 )
 (func $Vec#set:mY (; 15 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=4
 )
 (func $assembly/index/Vec#constructor|trampoline (; 16 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  block $2of2
   block $1of2
    block $0of2
     block $outOfRange
      global.get $~lib/argc
      br_table $0of2 $1of2 $2of2 $outOfRange
     end
     unreachable
    end
    i32.const 0
    local.set $1
   end
   i32.const 0
   local.set $2
  end
  local.get $0
  local.get $1
  local.get $2
  call $assembly/index/Vec#constructor
 )
 (func $~lib/setargc (; 17 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  global.set $~lib/argc
 )
 (func $assembly/index/Vec#init|trampoline (; 18 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  block $2of2
   block $1of2
    block $0of2
     block $outOfRange
      global.get $~lib/argc
      br_table $0of2 $1of2 $2of2 $outOfRange
     end
     unreachable
    end
    i32.const 0
    local.set $1
   end
   i32.const 0
   local.set $2
  end
  local.get $0
  local.get $1
  local.get $2
  call $assembly/index/Vec#init
 )
)
