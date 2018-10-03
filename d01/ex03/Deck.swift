import Foundation

class Deck: NSObject {
    static let allSpades: [Card] = [Card(Color.spades, Value.ace),
                                    Card(Color.spades, Value.two),
                                    Card(Color.spades, Value.three),
                                    Card(Color.spades, Value.four),
                                    Card(Color.spades, Value.five),
                                    Card(Color.spades, Value.six),
                                    Card(Color.spades, Value.seven),
                                    Card(Color.spades, Value.eight),
                                    Card(Color.spades, Value.nine),
                                    Card(Color.spades, Value.ten),
                                    Card(Color.spades, Value.jack),
                                    Card(Color.spades, Value.queen),
                                    Card(Color.spades, Value.king),]

    static let allDiamonds: [Card] = [Card(Color.diamonds, Value.ace),
                                    Card(Color.diamonds, Value.two),
                                    Card(Color.diamonds, Value.three),
                                    Card(Color.diamonds, Value.four),
                                    Card(Color.diamonds, Value.five),
                                    Card(Color.diamonds, Value.six),
                                    Card(Color.diamonds, Value.seven),
                                    Card(Color.diamonds, Value.eight),
                                    Card(Color.diamonds, Value.nine),
                                    Card(Color.diamonds, Value.ten),
                                    Card(Color.diamonds, Value.jack),
                                    Card(Color.diamonds, Value.queen),
                                    Card(Color.diamonds, Value.king),]
                            
    static let allHearts: [Card] = [Card(Color.hearts, Value.ace),
                                    Card(Color.hearts, Value.two),
                                    Card(Color.hearts, Value.three),
                                    Card(Color.hearts, Value.four),
                                    Card(Color.hearts, Value.five),
                                    Card(Color.hearts, Value.six),
                                    Card(Color.hearts, Value.seven),
                                    Card(Color.hearts, Value.eight),
                                    Card(Color.hearts, Value.nine),
                                    Card(Color.hearts, Value.ten),
                                    Card(Color.hearts, Value.jack),
                                    Card(Color.hearts, Value.queen),
                                    Card(Color.hearts, Value.king),]

    static let allClubs: [Card] = [Card(Color.clubs, Value.ace),
                                    Card(Color.clubs, Value.two),
                                    Card(Color.clubs, Value.three),
                                    Card(Color.clubs, Value.four),
                                    Card(Color.clubs, Value.five),
                                    Card(Color.clubs, Value.six),
                                    Card(Color.clubs, Value.seven),
                                    Card(Color.clubs, Value.eight),
                                    Card(Color.clubs, Value.nine),
                                    Card(Color.clubs, Value.ten),
                                    Card(Color.clubs, Value.jack),
                                    Card(Color.clubs, Value.queen),
                                    Card(Color.clubs, Value.king),]

    static let allCards: [Card] = [Card(Color.spades, Value.ace),
                                    Card(Color.spades, Value.two),
                                    Card(Color.spades, Value.three),
                                    Card(Color.spades, Value.four),
                                    Card(Color.spades, Value.five),
                                    Card(Color.spades, Value.six),
                                    Card(Color.spades, Value.seven),
                                    Card(Color.spades, Value.eight),
                                    Card(Color.spades, Value.nine),
                                    Card(Color.spades, Value.ten),
                                    Card(Color.spades, Value.jack),
                                    Card(Color.spades, Value.queen),
                                    Card(Color.spades, Value.king),
                                    Card(Color.hearts, Value.ace),
                                    Card(Color.hearts, Value.two),
                                    Card(Color.hearts, Value.three),
                                    Card(Color.hearts, Value.four),
                                    Card(Color.hearts, Value.five),
                                    Card(Color.hearts, Value.six),
                                    Card(Color.hearts, Value.seven),
                                    Card(Color.hearts, Value.eight),
                                    Card(Color.hearts, Value.nine),
                                    Card(Color.hearts, Value.ten),
                                    Card(Color.hearts, Value.jack),
                                    Card(Color.hearts, Value.queen),
                                    Card(Color.hearts, Value.king),
                                    Card(Color.hearts, Value.ace),
                                    Card(Color.hearts, Value.two),
                                    Card(Color.hearts, Value.three),
                                    Card(Color.hearts, Value.four),
                                    Card(Color.hearts, Value.five),
                                    Card(Color.hearts, Value.six),
                                    Card(Color.hearts, Value.seven),
                                    Card(Color.hearts, Value.eight),
                                    Card(Color.hearts, Value.nine),
                                    Card(Color.hearts, Value.ten),
                                    Card(Color.hearts, Value.jack),
                                    Card(Color.hearts, Value.queen),
                                    Card(Color.hearts, Value.king),
                                    Card(Color.clubs, Value.ace),
                                    Card(Color.clubs, Value.two),
                                    Card(Color.clubs, Value.three),
                                    Card(Color.clubs, Value.four),
                                    Card(Color.clubs, Value.five),
                                    Card(Color.clubs, Value.six),
                                    Card(Color.clubs, Value.seven),
                                    Card(Color.clubs, Value.eight),
                                    Card(Color.clubs, Value.nine),
                                    Card(Color.clubs, Value.ten),
                                    Card(Color.clubs, Value.jack),
                                    Card(Color.clubs, Value.queen),
                                    Card(Color.clubs, Value.king)]                                

}

extension Array {
    mutating func shuffle() -> Array
    {
        var arr = self
        var mixedArr = self

        for i in 0..<arr.count
        {
            let randPos = Int(arc4random_uniform(UInt32(arr.count)))
            mixedArr[i] = arr[randPos]
            arr.remove(at: randPos)
        }
        return mixedArr
    }
}