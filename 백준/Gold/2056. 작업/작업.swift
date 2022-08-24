let input = Int(readLine()!)!
var dp  = Array(repeating: 0, count: input)
var answer = 0
for i in 0..<input {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))!}
    let time = input2[0]
    dp[i] = time
    var m = 0
    for s in 1...input2[1]+1 {
        if s != 1 {
            m = max(m,dp[input2[s]-1])
        }
    }
    dp[i] += m
    if dp[i] > answer{
        answer = dp[i]
    }
}

print(answer)
