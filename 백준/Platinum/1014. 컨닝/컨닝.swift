import Foundation
let file = FileIO()
let T = file.readInt()
var N = 0
var M = 0
for _ in 0..<T {
    
//    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//    (N,M) = (input[0],input[1])
    var answer = 0
    N = file.readInt()
    M = file.readInt()
    var dp = Array(repeating: Array(repeating: -1, count: (1 << M) ), count: N+1)
    var map : [[String]] = Array(repeating: [], count: N)
    for i in 0...N-1 {
        map[i] = file.readString().map{String($0)}
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
    for i in canbe {
        if blocked(map[0], i) {
            dp[0][i] = count[index]
            answer = max(answer, dp[0][i])
        }
        index += 1
    }
    if N != 1 {
        for i in 1...N-1 {
            index = 0
            for j in canbe {
                if blocked(map[i], j) {
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

func blocked(_ arr:[String], _ x: Int) -> Bool {
    for i in 0..<arr.count {
        if arr[i] == "x"  {
            if x & (1<<i) >= 1 {
                return false
            }
            
        }
    }
    return true
//    var answer = 0
//    var temp = 1
//    for i in 0..<arr.count {
//        if arr[i] == "x" {
//            answer += temp
//        }
//        temp = temp * 2
//    }
//    return answer
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




final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}
