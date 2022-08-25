let input = Int(readLine()!)!
var dp  = Array(repeating: 0, count: input)
var answer = 0
var index = 0
let input2  = readLine()!.split(separator: " ").map {Int(String($0))!}
for i in 0...input-1{
    var max = 0
    for j in 0...i {
        if input2[j] < input2[i] && dp[j] > max{
            max = dp[j]
        }
    }
    dp[i] += max + 1
    if dp[i] > answer {
        answer = dp[i]
        index = i
    }
}
var k = [Int]()
k.append(input2[index])
print(answer)
var s = index
answer -= 1
for i in stride(from: s-1, to: -1, by: -1) {
    if dp[i] == answer && input2[i] < input2[index]{
        
        k.append(input2[i])
        answer -= 1
        index = i
    }
}
k.reverse()
for i in 0...k.count-1 {
    print(k[i],terminator: " ")
}
