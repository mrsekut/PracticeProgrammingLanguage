type Person* = ref object of RootObj
  givenName*: string

proc newPeron*(givenName: string): Person =
  Person(givenName: givenName)

method getName(this: Person): string =
  this.givenName

proc main() =
  block:
    let givenName = "Yamada"
    let name: Person = newPeron(givenName)
    echo name.getName()


when isMainModule:
  main()

impl Person