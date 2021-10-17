// define a type that has an array of two types

type SpamEmail = {
  fromName: string
  toName: string
}
type SpamSMS = {
  phone: string
  message: string
}

type Duopoly = {
  messages: (SpamSMS | SpamEmail)[]
}

const foo: Duopoly = {
  messages: [
    { phone: '687-5309', message: 'buy our cheap crap' },
    { fromname: 'steve', toName: 'wainstead' }
  ]
}

console.log(foo)
