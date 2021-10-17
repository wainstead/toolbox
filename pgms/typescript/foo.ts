console.log('Hello from file foo')

type MyFunkyType = {
  myFunction: (msg: string) => void
  // The following strange syntax forces the object passed in to have a field named "param"
  myWeirdFunction?: ({ param }: { param: string }) => void
  myWeirdFunction2?: (param: { name: string }) => void
  isSomething: boolean
}

const m: MyFunkyType = {
  myFunction: (msg) => {
    console.log(msg)
  },

  myWeirdFunction: (param: { param: string }) => {
    console.log(param.param)
  },
  myWeirdFunction2: (name: { name: string }) => {
    console.log(name.name)
  },
  isSomething: false
}

if (m.isSomething) {
  m.myFunction('it is not anything')
} else {
  m.myFunction('Eso no es nada')
}

m.myWeirdFunction({ param: 'Jones' })
m.myWeirdFunction2({ name: 'Bob' })
