
// Inverts all operations done via Adding.operate()
// Only inverts applicable operations
#macro __ADDING_INVERT_OPERATIONS false

// Swaps a,b when calling Adding.operate(a,b,op)
#macro __ADDING_SWAP_PLACES false

// The highest value that can result when calling Adding.operate()
// If an operation results in a higher number, it is clamped to this value
#macro __ADDING_MAX_OUTPUT (infinity)

// The lowest value that can result when calling Adding.operate()
// If an operation results in a lower number, it is clamped to this value
#macro __ADDING_MIN_OUTPUT (-infinity)

// The maximum difference between two values to count as an approximate value
#macro __ADDING_APPROXIMATE_DIFFERENCE 0.01
