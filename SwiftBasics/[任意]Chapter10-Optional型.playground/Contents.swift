// 10.1 optionalのInt型を定義してprintしてください
var optional: Int? = nil;

// 10.2 unwrappedNumberがnilの場合に初期値が10になるようにして、printしてください
var unwrappedNumber: Int? = nil
var number: Int = unwrappedNumber ?? 10
print(number)

// 10.3 if let文を使って　アンラップしてprintしてください
if let unwrappedNumber = optional {
    print("Value is: \(unwrappedNumber)")
} else {
    print("Value is nil")
}
