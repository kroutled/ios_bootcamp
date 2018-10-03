import Foundation

var colors: [Color] =  Color.allColors
var values: [Value] = Value.allValues

for test in Color.allColors
{
	print(test.rawValue)
}

for test in Value.allValues
{
	print(test.rawValue)
}
