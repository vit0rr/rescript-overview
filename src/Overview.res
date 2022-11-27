let value = 12

let value = ""

let valueInt = 12
let valueFloat = 12.0

// let res = valueInt + valueFloat
let res = valueFloat +. 85.4

let res = valueFloat->Belt.Float.toInt + valueInt

// let srt = 'fonfonfon'

let srt = "fonfonfon"
let charS = 's'

let srt = `1234 ${"Hello bro"} ${valueInt->Belt.Int.toString}`

let isTrue = true
let isFalse = !(!false) && true

// arrays should be homogeneous
let arr = [1, 2, 3]
let tuple = (1, 2, 3)
let myRef = ref(1)
myRef.contents = 2

// User defined types

type profile = {
  name: string,
  age: int,
}

type intProfile = profile

let userProfile: intProfile = {
  name: "Vitor",
  age: 18,
}

let someProfile: ProfileTypes.profile = {
  name: "Vitor",
  age: 18,
}

let anotherProfile: ProfileTypes.profile = {
  ...someProfile,
  age: 18,
}

// Phantom types
type t

// ADT (Algebraic Data Types), variants

let vitor: ProfileTypes.person = User({
  name: "V",
  age: 18,
})

let fn = (person: ProfileTypes.person, ~isSpecial) => {
  switch person {
  | User({name}) if isSpecial => `Hello ${name} you are special`
  | User({name}) => `Hello ${name}`
  | Admin(name) => `Hello ${name}`
  | Person({name}) => `Hello ${name}`
  }
}

let hello = (~person: ProfileTypes.person, ~isSpecial: bool=false, ()) => {
  switch person {
  | User({name: "Vitor"}) if isSpecial => `Hello you are special`
  | User({name: "Vitor"}) => `Hello`
  | User({name}) => `Hello, ${name}`
  | Admin(name) => `Hello ${name}`
  | Person({name}) => `Hello ${name}`
  }
}

let msg = hello(~isSpecial=true, ())

// polyvariants

type role = [#admin | #user | #masteradmin]

let myProfileRole = #admin({name: "Vitor", age: 18})
let myprofileUserRole = #user

// let hello = role => {
//   switch role {
//   | #admin => "Hello admin"
//   | #master => "Hello master"
//   }
// }

// let _ = hello(myProfileRole)

let _true = (x, y) => x // λx.λy.x
let _false = (x, y) => y // (λx.λy.y)
let _or = (x, y) => x(true)(y) // (λx.λy.x y TRUE)

let one = (f, x) => f(x) // (λf.λx.f x)
let two = (f, x) => f(f(x)) // (λf.λx.f (f x))

let _succ = (n, f, x) => f(n(f)(x)) // (λn.λf.λx.f (n f x))
let _add = (m, n, f, x) => m(f)(n(f)(x)) // (λm.λn.λf.λx.m f (n f x))
let _mult = (m, n, f, x) => m(n(f))(x) // (λm.λn.λf.λx.m (n f) x)
let _exp = (m, n, f, x) => n(m)(f)(x) // (λm.λn.λf.λx.n m f x)
let _pred = (n, f, x) => n((g, h) => h(g(f)))(u => x)(u => u) // (λn.λf.λx.n (λg.λh.h (g f)) (λu.x) (λu.u))
let _sub = (m, n) => n(_pred)(m) // (λm.λn.n pred m)

let str = "Vitor"
let result = str->Js.String2.includes(str, 'x')
