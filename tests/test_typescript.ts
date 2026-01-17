
// TypeScript Advanced Syntax Test for Solarized Flat Theme

// --- Types, Interfaces, Enums, Generics ---
type User = {
    id: number;
    name: string;
    isActive: boolean;
    roles?: string[];
};

interface Box<T> {
    value: T;
    readonly created: Date;
}

enum Color {
    Red = 'RED',
    Green = 'GREEN',
    Blue = 'BLUE',
}

// --- Classes, Inheritance, Decorators ---
function Log(target: any, propertyKey: string, descriptor: PropertyDescriptor) {
    const original = descriptor.value;
    descriptor.value = function (...args: any[]) {
        console.log(`Calling ${propertyKey} with`, args);
        return original.apply(this, args);
    };
}


// Use unique names to avoid duplicate identifier errors
abstract class AnimalTS {
    constructor(public name: string) {}
    abstract speak(): void;
}

// Decorator must match the method signature (target, propertyKey, descriptor)
function LogMethod(
    target: any,
    propertyKey: string,
    descriptor: PropertyDescriptor
) {
    const original = descriptor.value;
    descriptor.value = function (...args: any[]) {
        console.log(`Calling ${propertyKey} with`, args);
        return original.apply(this, args);
    };
}

class DogTS extends AnimalTS {
    // Decorator removed for compatibility
    speak() {
        console.log(`${this.name} barks.`);
    }
}

// --- Namespaces, Modules, Type Guards ---
namespace MathUtils {
    export function add(a: number, b: number): number {
        return a + b;
    }
}

function isUser(obj: any): obj is User {
    return obj && typeof obj.id === 'number' && typeof obj.name === 'string';
}

// --- Async/Await, Promises, Generics ---

// Only one fetchData function allowed
async function fetchDataTS<T>(url: string): Promise<T> {
    return await fetch(url).then(res => res.json());
}

// --- Mapped Types, Utility Types ---
type PartialUser = Partial<User>;
type UserKeys = keyof User;
type UserRecord = Record<string, User>;

// --- Usage Example ---
const users: User[] = [
    { id: 1, name: 'Alice', isActive: true, roles: ['admin'] },
    { id: 2, name: 'Bob', isActive: false },
];


const dogTS = new DogTS('Buddy');
dogTS.speak();

for (const u of users) {
    if (isUser(u)) {
        console.log(`User: ${u.name}, Active: ${u.isActive}`);
    }
}

const box: Box<Color> = { value: Color.Blue, created: new Date() };
console.log(box);

// --- Type Assertions, Optional Chaining, Nullish Coalescing ---
const maybeUser: any = users[0];
const userName: string = (maybeUser as User)?.name ?? 'Unknown';
console.log(userName);

// --- Import/Export (ESM) ---
// export function exportedFunc() {}
// import { exportedFunc } from './someModule';

console.log(`2 + 3 = ${MathUtils.add(2, 3)}`);
console.log(`User keys: ${Object.keys(users[0])}`);