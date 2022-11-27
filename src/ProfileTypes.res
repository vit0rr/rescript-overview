type profile = {
  name: string,
  age: int,
}

type person = User(profile) | Admin(string) | Person(profile)