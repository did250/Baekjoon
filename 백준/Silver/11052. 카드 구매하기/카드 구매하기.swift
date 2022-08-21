let n = Int(readLine()!)!
let Arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: 0, count: n+1)
if n == 1{
    print(Arr[0])
}
for i in 0..<n {
    dp[i+1] = Arr[i]
}

for i in 2...n {
    for j in 1...i-1 {
        dp[i] = max(dp[i - j] + dp[j],dp[i])
    }
}
print(dp[n])
