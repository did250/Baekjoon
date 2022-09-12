let T = Int(readLine()!)!
var (N, M) = (0,0)
for _ in 0..<T {
    
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    (N, M) = (input[0],input[1])
    var answer = 0
    
    var dp = Array(repeating: Array(repeating: -1, count: (1 << M) ), count: N+1)
    var map : [[String]] = Array(repeating: [], count: N)
    for i in 0...N-1 {
        map[i] = readLine()!.map{String($0)}
    }
    var canbe = [Int]()
    var count = [Int]()
    for i in 0..<(1<<M) {
        if adj(i) {
            canbe.append(i)
            count.append(counting(i))
        }
    }
    var index = 0
    var p = blocked(map[0])
    for i in canbe {
        if i | p - p == i {
            dp[0][i] = count[index]
            answer = max(answer, dp[0][i])
        }
        index += 1
    }
    if N != 1 {
        for i in 1...N-1 {
            index = 0
            var t = blocked(map[i])
            for j in canbe {
                if j | t - t == j {
                    for s in canbe {
                        if can(s, j) {
                            dp[i][j] = max(dp[i][j], count[index]+dp[i-1][s])
                            answer = max(answer, dp[i][j])
                        }
                    }
                }
                index += 1
            }
        }
    }
    print(answer)
    
}

func blocked(_ arr:[String]) -> Int {
//    for i in 0..<arr.count {
//        if arr[i] == "x"  {
//            if x & (1<<i) >= 1 {
//                return false
//            }
//
//        }
//    }
//    return true
    var answer = 0
    var temp = 1
    for i in 0..<arr.count {
        if arr[i] == "x" {
            answer += temp
        }
        temp = temp * 2
    }
    return answer
}

func adj(_ x : Int) -> Bool {
    if M != 1 {
        for i in 0...M-2 {
            let k = 3 << i
            if x & k == k {
                return false
            }
        }
    }
    return true
}

func can(_ before: Int, _ after: Int) -> Bool {
    for i in 0...M-1 {
        if 1<<i & before >= 1 {
            if 1<<(i-1) & after >= 1 {
                return false
            }
            if 1<<(i+1) & after >= 1 {
                return false
            }
        }
    }
    return true
}

func counting(_ x:Int) -> Int {
    var s = x
    var answer = 0
    var t = 0
    while (true) {
        t = s%2
        answer += t
        s = s/2
        if s<=0 {
            break
        }
    }
    return answer
}
