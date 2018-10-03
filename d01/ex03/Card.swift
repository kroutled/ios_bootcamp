import Foundation

class Card: NSObject {

	var colors: Color
	var values: Value

	init (_ colors: Color, _ values: Value)
	{
		self.colors = colors
		self.values = values 
	}

	
	override var description: String
	{
		return "\(colors),\(values)"
	} 

	override func isEqual(_ object: Any?) -> Bool
	{
		if object is Card
		{
			let rhs = object as! Card
			return self == rhs
		}
		else
		{
			return false
		}
	}

	static func == (left: Card, right: Card) -> Bool
	{
		if left.colors == right.colors && left.values == right.values
		{
			return true
		}
		else
		{
			return false
		}
	}

}
