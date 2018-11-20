type Person = ref object of RootObj
  givenName: string

proc newPeron(givenName: string): Person =
  Person(givenName: givenName)

proc main() =
  let name: Person = newPeron("yamada")
  echo name.givenName


when isMainModule:
  main()