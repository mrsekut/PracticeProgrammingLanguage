(module
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$vi (func (param i32)))
 (memory $0 0)
 (table $0 1 funcref)
 (elem (i32.const 0) $null)
 (global $~lib/argc (mut i32) (i32.const 0))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "Vec#get:mX" (func $assembly/index/Vec#getX))
 (export "Vec#set:mX" (func $assembly/index/Vec#set:x))
 (export "Vec#get:mY" (func $assembly/index/Vec#getY))
 (export "Vec#set:mY" (func $assembly/index/Vec#set:y))
 (export "_setargc" (func $~lib/setargc))
 (export "Vec#constructor" (func $assembly/index/Vec#constructor|trampoline))
 (export "Vec#add" (func $assembly/index/Vec#add))
 (export "Vec#getX" (func $assembly/index/Vec#getX))
 (export "Vec#getY" (func $assembly/index/Vec#getY))
 (export "Vec#get:x" (func $assembly/index/Vec#getX))
 (export "Vec#set:x" (func $assembly/index/Vec#set:x))
 (export "Vec#get:y" (func $assembly/index/Vec#getY))
 (export "Vec#set:y" (func $assembly/index/Vec#set:y))
 (export "init" (func $assembly/index/init))
 (func $assembly/index/Vec#constructor (; 0 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i32.eqz
  if
   unreachable
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
 )
 (func $assembly/index/Vec#add (; 1 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/index/Vec#getX (; 2 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load
 )
 (func $assembly/index/Vec#getY (; 3 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
 )
 (func $assembly/index/Vec#set:x (; 4 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store
 )
 (func $assembly/index/Vec#set:y (; 5 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=4
 )
 (func $assembly/index/init (; 6 ;) (type $FUNCSIG$i) (result i32)
  i32.const 0
  i32.const 1
  i32.const 0
  call $assembly/index/Vec#constructor
  i32.const 0
  i32.const 2
  i32.const 3
  call $assembly/index/Vec#constructor
  call $assembly/index/Vec#add
  i32.load
 )
 (func $null (; 7 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/index/Vec#constructor|trampoline (; 8 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/setargc (; 9 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  global.set $~lib/argc
 )
)
