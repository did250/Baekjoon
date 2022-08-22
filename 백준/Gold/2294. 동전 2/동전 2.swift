let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n,k) = (input[0], input[1])
var arr = [Int]()
var dp = Array(repeating: 10001, count: k+1)
for _ in 1...n {
    let input = Int(readLine()!)!
    if !arr.contains(input) && input <= k{
        arr.append(input)
    }
}

dp[0] = 0
for i in 0...arr.count-1 {
    for j in arr[i]...k {
        dp[j] = min(dp[j], dp[j-arr[i]] + 1)
    }
}
if dp[k] == 10001 {
    print("-1")
}
else {
    print(dp[k])
}
