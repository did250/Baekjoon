let t = Int(readLine()!)!
for _ in 1...t {
    let n = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: 0, count: n), count: 2)
    let line1 = readLine()!.split(separator: " ").map { Int(String($0))!}
    let line2 = readLine()!.split(separator: " ").map { Int(String($0))!}
    var answer = 0
    for i in 0...n-1 {
        if i == 0 {
            dp[0][0] = line1[0]
            dp[1][0] = line2[0]
            answer = max(dp[0][0],dp[1][0])
        }
        else if i == 1 {
            dp[0][1] = line1[1] + dp[1][0]
            dp[1][1] = line2[1] + dp[0][0]
            answer = max(dp[0][1], dp[1][1])
        }
        else {
            dp[0][i] = max(dp[1][i-1], dp[1][i-2]) + line1[i]
            dp[1][i] = max(dp[0][i-1], dp[0][i-2]) + line2[i]
            answer = max(answer,dp[0][i],dp[1][i])
        }
    }
    print(answer)
}

