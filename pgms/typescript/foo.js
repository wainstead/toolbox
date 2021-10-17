console.log('Hello from file foo');
var m = {
    myFunction: function (msg) {
        console.log(msg);
    },
    myWeirdFunction: function (param) {
        console.log(param.param);
    },
    myWeirdFunction2: function (name) {
        console.log(name.name);
    },
    isSomething: false
};
if (m.isSomething) {
    m.myFunction('it is not anything');
}
else {
    m.myFunction('Eso no es nada');
}
m.myWeirdFunction({ param: 'Jones' });
m.myWeirdFunction2({ name: 'Bob' });
