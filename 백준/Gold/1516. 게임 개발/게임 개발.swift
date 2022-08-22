let N = Int(readLine()!)!

var lower = Array(repeating: [Int](), count: N+1)
var degree = Array(repeating: 0, count: N+1)
var dp = Array(repeating: 0, count: N+1)
var time = Array(repeating: 0, count: N+1)
for t in 1...N{
    let input = readLine()!.split(separator: " ").map({Int(String($0))!})
    time[t] = input[0]
    dp[t] += time[t]
    for i in 1..<input.count-1 {
        lower[input[i]].append(t)
        degree[t] += 1
    }
}

var queue = [Int]()
for i in 1..<N+1{
    if degree[i] == 0 {
        queue.append(i)
    }
}

var s = 0
while s < queue.count{
    for i in lower[queue[s]]{
        dp[i] = max(dp[i], dp[queue[s]] + time[i])
        degree[i] -= 1
        if degree[i] == 0{
            queue.append(i)
        }
    }
    s += 1
}

for i in 1..<dp.count {
    print(dp[i])
}
