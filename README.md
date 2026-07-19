<p align="center">
<img width="50%" height="auto" alt="adding-logo-export" src="https://github.com/user-attachments/assets/dc71e265-dcef-4170-9768-40f64f49b252" />
</p>

<p align="center">Powerful operator library for GameMaker 🚀</p>
<p align="center">Human-made, Human-gayd 🏳️‍🌈</p>

# Features
- Addition and its counterparts
- Easily combine values with intuitive functions
- JSDocs for all functions

# Quick start
Quickly get started with Adding using its easy to understand API  

In GameMaker IDE:
1. Under Tools select "Import Local Package"
2. Select the .yymps from the file manager
3. Wait for gamemaker to load package
4. Select "add all"
5. Hit "Import"

```js
x = 2
y = 10
value = Adding.operate(x, y, AddingOperator.add) // 12
```

Downloads also available on [Itch.io](https://wuffmakesgames.itch.io/adding).

# Cheatsheet
Look up operators and methods to implement your ideas faster
```js

// Configuration -> __AddingConfig
__ADDING_INVERT_OPERATIONS 		// Default [false]
__ADDING_SWAP_PLACES 			// Default [false]
__ADDING_MAX_OUTPUT 			// Default [infinity]
__ADDING_MIN_OUTPUT 			// Default [-infinity]
__ADDING_APPROXIMATE_DIFFERENCE // Default [0.01]

// Methods
Adding.operate(a, b, operator)
Adding.invert(a)
Adding.operator_get_name(operator)
Adding.operator_get_symbol(operator)

```

# Documentation
In-depth explanations of all the features Adding contains.
- [Functions](#functions)
- [Constants](#constants)

## Functions
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
| operator | Enum.AddingOperator | The operator to get the name of. |
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
| operator | Enum.AddingOperator | The operator to get the symbol of. |
```js
// Example
out = Adding.operator_get_symbol(AddingOperator.add_and_subtract)
show_debug_message(out) // ±
```
The code above gets the symbol of an operator and prints it to the console.

## Constants
### `AddingOperator`
| Operator | Name | Symbol | Description |
|----------|------|:------:|-------------|
| equals 					| Equals 				| = | Returns true if two values are equal |
| not_equals 				| Inequal 				| ≠ | Returns false if two values are equal |
| approx_equals 			| Approximately Equal 	| ≈ | Returns true if the difference between two values falls within a certain range |
| greater_than 				| Strict Inequality 	| > | Returns true if a is greater than b |
| lesser_than 				| Strict Inequality 	| < | Returns true if a is lesser than b |
| greater_than_or_equal_to 	| Inequality 			| ≥ | Returns true if a is greater than or equal to b |
| lesser_than_or_equal_to 	| Inequality 			| ≤ | Returns true if a is lesser than or equal to b |
| add 						| Plus 					| + | Increases a value by a certain amount |
| subtract 					| Minus 				| - | Reduces a value by a certain amount |
| add_and_subtract 			| Plus - Minus 			| ± | Performs addition and subtraction and returns an array containing the results |
| subtract_and_add 			| Minus - Plus 			| ± | Performs subtraction and addition and returns an array containing the results |
| multiply 					| Multiply 				| * | Adds a value to itself a certain number of times |
| times 					| Times 				| × | Same as AddingOperator.multiply |
| divide 					| Division 				| ÷ | Returns the number of times a number can fit into another number |
| fraction 					| Fraction 				| / | Same as AddingOperator.divide |
| modulo 					| Modulo 				| % | Wraps a value so that it is not larger than b |
| exponent 					| Power 				| ^ | Multiplies a number by its self exponentially |
| square_root 				| Square Root 			| √ | Finds the value that can be multiplied by itself to get the input |
| percent 					| Percent 				| % | Returns the percent value of a number out of 100 |
| per_mille 				| Per-Mille 			| ‰ | Returns the percent value of a number out of 1000 |
