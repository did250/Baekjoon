let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+1)
for i in 0...N-1 {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (T,P) = (input[0],input[1])
    if i + T <= N {
        dp[i+T] = max(dp[i+T], dp[i]+P)
    }
    dp[i+1] = max(dp[i+1], dp[i])
}
print(dp[N])