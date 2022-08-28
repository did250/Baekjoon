let input = readLine()!.split(separator: " ").map { Int(String($0))!}
let (N,M) = (input[0], input[1])
var arr = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
var dp = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
for i in 1...N {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))!}
    for j in 0...input2.count-1 {
        arr[i][j+1] = input2[j]
    }
}
for i in 1...N {
    for j in 1...N {
        if i == 1 {
            dp[i][j] = dp[i][j-1] + arr[i][j]
        }
        else if j == 1{
            dp[i][j] = dp[i-1][j] + arr[i][j]
        }
        else {
            dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + arr[i][j]
        }
    }
}
for i in 1...M {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))!}
    print(dp[input2[2]][input2[3]] + dp[input2[0]-1][input2[1]-1] - dp[input2[0]-1][input2[3]] - dp[input2[2]][input2[1]-1])
}
