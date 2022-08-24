let input = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 3), count: input)
var dp2 = Array(repeating: Array(repeating: 0, count: 3), count: input)
for i in 0..<input {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))!}
    if i == 0 {
        for j in 0...2 {
            dp[i][j] += input2[j]
            dp2[i][j] += input2[j]
        }
    }
    else {
        dp[i][0] = max(dp[i-1][0], dp[i-1][1]) + input2[0]
        dp[i][1] = max(dp[i-1][0], dp[i-1][1], dp[i-1][2]) + input2[1]
        dp[i][2] = max(dp[i-1][1], dp[i-1][2]) + input2[2]
        dp2[i][0] = min(dp2[i-1][0], dp2[i-1][1]) + input2[0]
        dp2[i][1] = min(dp2[i-1][0], dp2[i-1][1], dp2[i-1][2]) + input2[1]
        dp2[i][2] = min(dp2[i-1][1], dp2[i-1][2]) + input2[2]

    }
}

print(max(dp[input-1][0], dp[input-1][1], dp[input-1][2]), min(dp2[input-1][0], dp2[input-1][1], dp2[input-1][2]), separator: " ")
