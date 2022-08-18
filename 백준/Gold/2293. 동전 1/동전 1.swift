import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
var coins = [Int]()
for _ in 1...input[0] {
    coins.append(Int(readLine()!)!)
}
var dp = Array(repeating: 0, count: input[1]+1)
dp[0] = 1
for i in 0...input[0]-1 {
    for j in 1...input[1] {
        if j >= coins[i] {
            if dp[j] + dp[j - coins[i]] >= Int(pow(2.0, 31.0)){
                dp[j] = 0
            }
            else {
                dp[j] += dp[j-coins[i]]
            }
        }
    }
}
print(dp[input[1]])
