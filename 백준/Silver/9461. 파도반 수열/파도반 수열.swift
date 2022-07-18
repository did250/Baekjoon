import Foundation

var numbers = [1,1,1,2,2,3,4,5,7,9]

let test_case = Int(readLine()!)!

for _ in 0..<test_case{
    let num = Int(readLine()!)!
    if num<=numbers.count{
        print("\(numbers[num-1])")
    }
    else {
        for i in numbers.count..<num{
            numbers.append(numbers[i-1]+numbers[i-5])
        }
        print(numbers.last!)
    }
}