class User {
    let name: String
    var score: Int
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}

let user: User = User(name: "tom", score: 23)
print(user.name)
print(user.score)

