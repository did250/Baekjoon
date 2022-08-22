let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 31)
if n%2 == 1{
    print("0")
}
else {
    dp[0] = 1
    dp[2] = 3
    for i in stride(from: 4, to: n+2, by: 2){
        dp[i] = 3 * dp[i-2]
        for j in stride(from: 4, to: i+1, by: 2) {
            dp[i] += 2*dp[i-j]
        }
    }
    print(dp[n])
}

