/// @description 

history = []
stack = []
input = "0"

//===================================================================
#region Methods

/// Returns the current stack as a string
GetStackString = function() {
	var _output = ""
	for (var _i = 0; _i < array_length(stack); _i++) {
		var _item = stack[_i]
		_output += $"{_item.input} {Adding.operator_get_symbol(_item.op)} "
	}
	return _output
}

/// Delete the last character
Delete = function() {
	input = string_copy(input, 1, string_length(input)-1)
	if (string_length(input) == 0) input = "0"
}

/// Clear the input
Clear = function() {
	input = "0"
}

/// Clear the input and stack
ClearAll = function() {
	input = "0"
	stack = []
}

/// Push an operation to the stack
/// @arg {Enum.AddingOperator} operator
PushOperator = function(_operator) {
	if (input == "") return;
	array_push(stack, {
		"input": input,
		"op": _operator,
	})
	input = "0"
}

/// Push a regular input
/// @arg {String} char
PushInput = function(_char) {
	if (_char == ".") {
		if (string_count(".", input)) return;
		if (input == "") input = "0"
	} else if (input == "0") {
		input = ""
	}
	input = input + _char
}

/// Solves the current input
Resolve = function() {
	var _output = ""
	for (var _i = 0; _i < array_length(stack); _i++) {
		var _item = stack[_i]
		_output += $"{_item.input} {Adding.operator_get_symbol(_item.op)} "
	}
	return _output
}

/// Recieve a signal from a demo button
/// @arg {Id.Instance} object
Signal = function(_obj) {
	if (_obj.is_operator) { return PushOperator(_obj.operator) }
	switch (_obj.label) {
		case "Del": { Delete();		break; }
		case "C":	{ Clear();		break; }
		case "CE":	{ ClearAll();	break; }
		case "=":	{ Resolve();	break; }
		default:	{ PushInput(_obj.label); }
	}
}

#endregion
//===================================================================

// Test operators
//Adding.operate(_a, _b, AddingOperator.equals)
//Adding.operate(_a, _b, AddingOperator.not_equals)
//Adding.operate(_a, _b, AddingOperator.approx_equals)
//Adding.operate(_a, _b, AddingOperator.greater_than)
//Adding.operate(_a, _b, AddingOperator.lesser_than)
//Adding.operate(_a, _b, AddingOperator.greater_than_or_equal_to)
//Adding.operate(_a, _b, AddingOperator.lesser_than_or_equal_to)
//Adding.operate(_a, _b, AddingOperator.add)
//Adding.operate(_a, _b, AddingOperator.subtract)
//Adding.operate(_a, _b, AddingOperator.add_and_subtract)
//Adding.operate(_a, _b, AddingOperator.subtract_and_add)
//Adding.operate(_a, _b, AddingOperator.multiply)
//Adding.operate(_a, _b, AddingOperator.times)
//Adding.operate(_a, _b, AddingOperator.divide)
//Adding.operate(_a, _b, AddingOperator.fraction)
//Adding.operate(_a, _b, AddingOperator.modulo)
//Adding.operate(_a, _b, AddingOperator.exponent)
//Adding.operate(_a, _b, AddingOperator.square_root)
//Adding.operate(_a, _b, AddingOperator.percent)
//Adding.operate(_a, _b, AddingOperator.per_mille)

//// Invert values
//Adding.invert(_a)
//Adding.invert(_b)
