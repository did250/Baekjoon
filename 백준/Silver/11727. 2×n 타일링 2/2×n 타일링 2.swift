let input = Int(readLine()!)!
var dp = Array(repeating: 0, count: input+1)
dp[0] = 1
for i in 1...input {
    if i == 1 {
        dp[i] = 1
    }
    else if i == 2 {
        dp[i] = 3
    }
    else {
        dp[i] = (dp[i-1] + 2 * dp[i-2]) % 10007
    }
}
print(dp[input])
