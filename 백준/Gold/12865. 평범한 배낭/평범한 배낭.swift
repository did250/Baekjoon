let input = readLine()!.split(separator: " ").map {Int(String($0))!}
var dp = Array(repeating: 0, count: input[1]+1)
var WW = [0]
var VV = [0]
for _ in 1..<input[0]+1 {
    let WV = readLine()!.split(separator: " ").map {Int(String($0))!}
    WW.append(WV[0])
    VV.append(WV[1])
}
for i in 1...input[0] {
    for j in stride(from: input[1], to: 0, by: -1) {
        if j >= WW[i] {
            dp[j] = max(dp[j], dp[j-WW[i]] + VV[i])
        }
    }
}
print(dp[input[1]])
