var Card1 = Card(Color.hearts, Value.two)
var Card2 = Card(Color.diamonds, Value.ten)

print(Card1)
print(Card2)

print(Card1.isEqual(Card1))
print(Card2.isEqual(Card2))

print(Card1.isEqual(Card2))
print(Card2.isEqual(Card1))

print (Card1 == Card2)
print (Card1 == Card1)
print (Card2 == Card2)