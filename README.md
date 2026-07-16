<p align="center">
<img width="50%" height="auto" alt="adding-logo-export" src="https://github.com/user-attachments/assets/dc71e265-dcef-4170-9768-40f64f49b252" />
</p>

Powerful operator library for GameMaker 🚀  
Human-made, Human-gayd 🏳️‍🌈

## Features:
- Addition and its counterparts
- Easily combine values with intuitive functions


## Quick start:
Quickly get started with Adding using its easy to understand API  
```js
x = 2
y = 10
value = Adding.operate(x, y, AddingOperator.add) // 12
```

Downloads also available on [Itch.io](https://wuffmakesgames.itch.io/adding).

## Cheatsheet:
Look up operators and methods to implement your ideas faster
```js

// Configuration -> __AddingConfig
__ADDING_INVERT_OPERATIONS 		// Default [false]
__ADDING_SWAP_PLACES 			// Default [false]
__ADDING_MAX_OUTPUT 			// Default [infinity]
__ADDING_MIN_OUTPUT 			// Default [-infinity]
__ADDING_APPROXIMATE_DIFFERENCE // Default [0.01]

// Methods
Adding.operate(a, b, operator) // -> Real OR String OR Array[Real]
Adding.invert(a) // -> Real
Adding.operator_get_name(operator) // -> String
Adding.operator_get_symbol(operator) // -> String

// Operators
enum AddingOperator {
	equals,
	not_equals,
	approx_equals,
	greater_than,
	lesser_than,
	greater_than_or_equal_to,
	lesser_than_or_equal_to,
	add,
	subtract,
	add_and_subtract,
	subtract_and_add,
	multiply,
	times,
	divide,
	fraction,
	modulo,
	exponent,
	square_root,
	percent,
	per_mille,
}
```

## Documentation:

### `Adding.operate` -> Real OR String OR Array\[Real]
Performs a mathematical operation on values a and b and returns the result.
```js
Adding.operate(a, b, operator)
```

| Arguments | Type | Description |
|-----------|------|-------------|
| a | Real | The left-hand operator. |
| b | Real | The right-hand operator. |
| operator | Enum.AddingOperator | The operation to be performed on a and b. |
```js
// Example
x = 10
y = 90
result = Adding.operate(x, y, AddingOperator.add)
show_debug_message(result) // 100
```
The code above performs an addition operator on x and y, and assigns the output to `result`.
<hr>

### `Adding.invert` -> Real
Gets the inverse of a value (i.e. -10 = 10).
```js
Adding.invert(a)
```
| Arguments | Type | Description |
|-----------|------|-------------|
| a | Real | The value to invert. |
```js
// Example
x = 10
show_debug_message(x) // 10
x = Adding.invert(x)
show_debug_message(x) // -10
```
The code above assigns a value to x, and then inverts that value using `Adding.invert()`.
<hr>

### `Adding.operator_get_name` -> String
Returns the name of an operator.
```js
Adding.operator_get_name(operator)
```
| Arguments | Type | Description |
|-----------|------|-------------|
| a | Enum.AddingOperator | The operator to get the name of. |
```js
// Example
out = Adding.operator_get_name(AddingOperator.add_and_subtract)
show_debug_message(out) // Plus - Minus
```
The code above gets the name of an operator and prints it to the console.
<hr>

### `Adding.operator_get_symbol` -> String
Returns the symbol of an operator.
```js
Adding.operator_get_symbol(operator)
```
| Arguments | Type | Description |
|-----------|------|-------------|
| a | Enum.AddingOperator | The operator to get the symbol of. |
```js
// Example
out = Adding.operator_get_symbol(AddingOperator.add_and_subtract)
show_debug_message(out) // ±
```
The code above gets the symbol of an operator and prints it to the console.

