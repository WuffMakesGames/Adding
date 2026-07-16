/*===================================================================
		              ___       ___                            
		             (   )     (   )  .-.                      
		  .---.    .-.| |    .-.| |  ( __)  ___ .-.     .--.   
		 / .-, \  /   \ |   /   \ |  (''") (   )   \   /    \  
		(__) ; | |  .-. |  |  .-. |   | |   |  .-. .  ;  ,-. ' 
		  .'`  | | |  | |  | |  | |   | |   | |  | |  | |  | | 
		 / .'| | | |  | |  | |  | |   | |   | |  | |  | |  | | 
		| /  | | | |  | |  | |  | |   | |   | |  | |  | |  | | 
		; |  ; | | '  | |  | '  | |   | |   | |  | |  | '  | | 
		' `-'  | ' `-'  /  ' `-'  /   | |   | |  | |  '  `-' | 
		`.__.'_.  `.__,'    `.__,'   (___) (___)(___)  `.__. | 
		                                               ( `-' ; 
		                                                `.__.  
- By WuffMakesGames ================================================= */

function Adding() constructor {
	
	//===============================================================
	#region Methods
	
	/// Performs a mathematical operation on values a and b and returns the result.
	/// @arg {Real} a The left-hand operator.
	/// @arg {Real} b The right-hand operator.
	/// @arg {Enum.AddingOperator} operator The operation to be performed on a and b.
	/// @return {Real,Bool,Array<Real>}
	static operate = function(_a, _b, _operator) {
		var _output = 0;
		
		// Swap places
		if (__ADDING_SWAP_PLACES) {
			var _temp = _a;
			_a = _b;
			_b = _temp;
		}
		
		// Perform inverted operations
		if (__ADDING_INVERT_OPERATIONS) {
			switch (_operator) {
				case AddingOperator.equals:						{ _output = _a != _b; break; }
				case AddingOperator.not_equals:					{ _output = _a == _b; break; }
				case AddingOperator.approx_equals:				{ _output = abs(_a - _b) >= __ADDING_APPROXIMATE_DIFFERENCE; break; }
				case AddingOperator.greater_than:				{ _output = _a < _b; break; }
				case AddingOperator.lesser_than:				{ _output = _a > _b; break; }
				case AddingOperator.greater_than_or_equal_to:	{ _output = _a <= _b; break; }
				case AddingOperator.lesser_than_or_equal_to:	{ _output = _a >= _b; break; }
				case AddingOperator.add:						{ _output = _a - _b; break; }
				case AddingOperator.subtract:					{ _output = _a + _b; break; }
				case AddingOperator.add_and_subtract:			{ _output = [_a - _b, _a + _b]; break; }
				case AddingOperator.subtract_and_add:			{ _output = [_a + _b, _a - _b]; break; }
				case AddingOperator.multiply:					{ _output = _a / _b; break; }
				case AddingOperator.times:						{ _output = _a / _b; break; }
				case AddingOperator.divide:						{ _output = _a * _b; break; }
				case AddingOperator.fraction:					{ _output = _a * _b; break; }
				case AddingOperator.modulo:						{ _output = _a % _b; break; }
				//case AddingOperator.exponent:					{ _output = power(_a, _b); break; }
				//case AddingOperator.square_root:				{ _output = sqrt(_a); break; }
				case AddingOperator.percent:					{ _output = 100 * _a; break; }
				case AddingOperator.per_mille:					{ _output = 1000 * _a; break; }
				default: { __AddingError($"Invalid operator: {_operator}"); }
			}
		// Perform operation
		} else {
			switch (_operator) {
				case AddingOperator.equals:						{ _output = _a == _b; break; }
				case AddingOperator.not_equals:					{ _output = _a != _b; break; }
				case AddingOperator.approx_equals:				{ _output = abs(_a - _b) <= __ADDING_APPROXIMATE_DIFFERENCE; break; }
				case AddingOperator.greater_than:				{ _output = _a > _b; break; }
				case AddingOperator.lesser_than:				{ _output = _a < _b; break; }
				case AddingOperator.greater_than_or_equal_to:	{ _output = _a >= _b; break; }
				case AddingOperator.lesser_than_or_equal_to:	{ _output = _a <= _b; break; }
				case AddingOperator.add:						{ _output = _a + _b; break; }
				case AddingOperator.subtract:					{ _output = _a - _b; break; }
				case AddingOperator.add_and_subtract:			{ _output = [_a + _b, _a - _b]; break; }
				case AddingOperator.subtract_and_add:			{ _output = [_a - _b, _a + _b]; break; }
				case AddingOperator.multiply:					{ _output = _a * _b; break; }
				case AddingOperator.times:						{ _output = _a * _b; break; }
				case AddingOperator.divide:						{ _output = _a / _b; break; }
				case AddingOperator.fraction:					{ _output = _a / _b; break; }
				case AddingOperator.modulo:						{ _output = _a % _b; break; }
				case AddingOperator.exponent:					{ _output = power(_a, _b); break; }
				case AddingOperator.square_root:				{ _output = sqrt(_a); break; }
				case AddingOperator.percent:					{ _output = (1/100) * _a; break; }
				case AddingOperator.per_mille:					{ _output = (1/1000) * _a; break; }
				default: { __AddingError($"Invalid operator: {_operator}"); }
			}
		}
		
		// Clamp output
		switch (typeof(_output)) {
			case "number": { _output = clamp(_output, __ADDING_MIN_OUTPUT, __ADDING_MAX_OUTPUT); break; }
			case "array": {
				array_foreach(_output, method({_output}, function(_value, _index) {
					_output[_index] = clamp(_value, __ADDING_MIN_OUTPUT, __ADDING_MAX_OUTPUT);
				}));
				break;
			}
		}
		
		// Return value
		__AddingMessage($"Performed {operator_get_name(_operator)} ({operator_get_symbol(_operator)}) on {_a} and {_b} and got {_output}");
		return _output;
	}
	
	/// Gets the inverse of a value (i.e. -10 = 10).
	/// @arg {Real} a The value to invert.
	/// @return {Real}
	static invert = function(_a) {
		return _a * -1;
	}
	
	#endregion
	//===============================================================
	#region Getters
	
	/// Returns the name of an operator.
	/// @arg {Enum.AddingOperator} operator The operator to get the name of.
	/// @return {String}
	static operator_get_name = function(_operator) {
		switch (_operator) {
			case AddingOperator.equals:						{ return "Equals"; }
			case AddingOperator.not_equals:					{ return "Inequal"; }
			case AddingOperator.approx_equals:				{ return "Approximately Equal"; }
			case AddingOperator.greater_than:				{ return "Strict Inequality"; }
			case AddingOperator.lesser_than:				{ return "Strict Inequality"; }
			case AddingOperator.greater_than_or_equal_to:	{ return "Inequality"; }
			case AddingOperator.lesser_than_or_equal_to:	{ return "Inequality"; }
			case AddingOperator.add:						{ return "Plus"; }
			case AddingOperator.subtract:					{ return "Minus"; }
			case AddingOperator.add_and_subtract:			{ return "Plus - Minus"; }
			case AddingOperator.subtract_and_add:			{ return "Minus - Plus"; }
			case AddingOperator.multiply:					{ return "Multiply"; }
			case AddingOperator.times:						{ return "Times"; }
			case AddingOperator.divide:						{ return "Division"; }
			case AddingOperator.fraction:					{ return "Fraction"; }
			case AddingOperator.modulo:						{ return "Modulo"; }
			case AddingOperator.exponent:					{ return "Power"; }
			case AddingOperator.square_root:				{ return "Square Root"; }
			case AddingOperator.percent:					{ return "Percent"; }
			case AddingOperator.per_mille:					{ return "Per-Mille"; }
			default: { __AddingError($"Invalid operator: {_operator}"); }
		}
	}
	
	/// Returns the symbol of an operator.
	/// @arg {Enum.AddingOperator} operator The operator to get the symbol of.
	/// @return {String}
	static operator_get_symbol = function(_operator) {
		switch (_operator) {
			case AddingOperator.equals:						{ return "="; }
			case AddingOperator.not_equals:					{ return "≠"; }
			case AddingOperator.approx_equals:				{ return "≈"; }
			case AddingOperator.greater_than:				{ return ">"; }
			case AddingOperator.lesser_than:				{ return "<"; }
			case AddingOperator.greater_than_or_equal_to:	{ return "≥"; }
			case AddingOperator.lesser_than_or_equal_to:	{ return "≤"; }
			case AddingOperator.add:						{ return "+"; }
			case AddingOperator.subtract:					{ return "-"; }
			case AddingOperator.add_and_subtract:			{ return "±"; }
			case AddingOperator.subtract_and_add:			{ return "±"; }
			case AddingOperator.multiply:					{ return "*"; }
			case AddingOperator.times:						{ return "×"; }
			case AddingOperator.divide:						{ return "÷"; }
			case AddingOperator.fraction:					{ return "/"; }
			case AddingOperator.modulo:						{ return "%"; }
			case AddingOperator.exponent:					{ return "^"; }
			case AddingOperator.square_root:				{ return "√"; }
			case AddingOperator.percent:					{ return "%"; }
			case AddingOperator.per_mille:					{ return "‰"; }
			default: { __AddingError($"Invalid operator: {_operator}"); }
		}
	}
	
	#endregion
	//===============================================================
	
	// Operators that can be used in Adding.operate()
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
	
}

// Initialize static variables
new Adding();
