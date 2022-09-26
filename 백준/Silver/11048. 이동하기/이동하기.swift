let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n,m) = (input[0],input[1])

var arr = [[Int]]()
for _ in 1...n {
    arr.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

var dp = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)

for i in 1...n {
    for j in 1...m {
        dp[i][j] = arr[i-1][j-1] + max(dp[i-1][j-1], dp[i-1][j], dp[i][j-1])
    }
}

print(dp[n][m])
