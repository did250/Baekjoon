var input = readLine()!.split(separator: " ").map { Int(String($0))! }
var input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = 0
for i in 0..<input[0] {
    input2[i] = input2[i] - input[1]
    if input2[i] < 0 {
        input2[i] = input2[i] * (-1)
    }
    if i != 0{
        answer = gcd(answer,input2[i])
    }
    else {
        answer = input2[i]
    }
}

print(answer)

func gcd(_ A : Int, _ B : Int) -> Int {
    if B == 0 {
        return A
    }
    else {
        return gcd(B, A%B)
    }
}
