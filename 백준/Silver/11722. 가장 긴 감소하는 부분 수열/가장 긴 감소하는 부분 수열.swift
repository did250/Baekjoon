let input = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = [Int]()
for i in arr {
    if dp.isEmpty {
        dp.append(i)
        continue
    }
    if i < dp[dp.count-1] {
        dp.append(i)
    }
    else {
        var s = 0
        var e = dp.count - 1
        var m = 0
        while s < e {
            m = (s + e) / 2
            if i < dp[m] {
                s = m + 1
            }
            else {
                e = m
            }
        }
        dp[e] = i
    }
}
print(dp.count)
