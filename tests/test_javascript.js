
// JavaScript Advanced Syntax Test for Solarized Flat Theme

// --- Classes, Inheritance, Static, Getters/Setters ---
class Animal {
    constructor(name) {
        this.name = name;
    }
    speak() {
        console.log(`${this.name} makes a sound.`);
    }
    static kingdom = 'Animalia';
}

class Dog extends Animal {
    #secret = 'woof';
    speak() {
        super.speak();
        console.log(`${this.name} barks!`);
    }
    get secret() { return this.#secret; }
}

// --- Generators, Iterators ---
function* idGen() {
    let i = 0;
    while (true) yield i++;
}

// --- Async/Await, Promises ---
async function fetchData(url) {
    try {
        const res = await fetch(url);
        return await res.json();
    } catch (e) {
        console.error('Fetch error:', e);
    }
}

// --- Proxy, Reflect, Symbols ---
const handler = {
    get(target, prop, receiver) {
        if (prop === 'greet') return () => 'Hello!';
        return Reflect.get(target, prop, receiver);
    }
};
const proxied = new Proxy({ foo: 42 }, handler);

// --- Destructuring, Spread, Rest, Default Params ---
const [a, ...rest] = [1, 2, 3, 4];
const obj = { x: 1, y: 2, z: 3 };
const { x, ...others } = obj;
function sum(x = 0, y = 0) { return x + y; }

// --- Template Literals, Tagged Templates ---
function tag(strings, ...values) {
    return strings.raw[0] + values.join('-');
}
const tagged = tag`A${1}B${2}`;

// --- Modules (ESM) ---
// export function exportedFunc() {}
// import { exportedFunc } from './someModule.js';

// --- Error Handling, Try/Catch/Finally ---
try {
    throw new Error('Test error');
} catch (e) {
    console.warn('Caught:', e.message);
} finally {
    // cleanup
}

// --- Usage Example ---
const dog = new Dog('Buddy');
dog.speak();
console.log('Secret:', dog.secret);

const gen = idGen();
console.log('Gen:', gen.next().value, gen.next().value);
console.log('Proxy greet:', proxied.greet());
console.log('Sum:', sum(3, 4));
console.log('Tagged:', tagged);
console.log(`2 + 3 = ${MathUtils.add(2, 3)}`);
console.log(`User keys: ${Object.keys(users[0])}`);