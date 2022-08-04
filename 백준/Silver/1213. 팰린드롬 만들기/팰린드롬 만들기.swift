let input = readLine()!

var array = [Character]()

for items in input.indices {
    array.append(input[items])
}
var count = Array(repeating: 0, count: 26)

for i in 0..<array.count{
    let t = array[i].asciiValue!
    count[Int(t)-65] += 1
}

var check = 0
var answer = [Unicode.Scalar]()
var target = Unicode.Scalar(0)!
var str = [Character]()
for i in 0..<count.count{
    if count[i] % 2 == 1{
        check += 1
        if let a = UnicodeScalar(i+65) {
            target = a
        }
        count[i] -= 1
    }
    if count[i] != 0 {
        if let b = UnicodeScalar(i+65) {
            for _ in 1...count[i]/2{
                answer.append((b))
            }
        }
        
    }
    if check == 2{
        print("I'm Sorry Hansoo")
        break
    }
    if i == count.count-1{
        for j in 0..<answer.count{
            str.append(Character(answer[j]))
        }
        if target != Unicode.Scalar(0)!{
            str.append(Character(target))
        }
        for j in 0..<answer.count{
            str.append(Character(answer[answer.count-1-j]))
        }
    }
   
}
for i in 0..<str.count{
    print(str[i],terminator: "")
}
