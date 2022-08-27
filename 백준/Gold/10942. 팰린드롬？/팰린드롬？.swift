import Foundation

let file = FileIO()
let n = file.readInt()
var arr = [Int]()
for _ in 1...n {
    arr.append(file.readInt())
}
let t = file.readInt()
var dp = Array(repeating: Array(repeating: false, count: n), count: n)

dp[n-1][n-1] = true
for i in 0...n-2{
    dp[i][i] = true
    if arr[i] == arr[i+1] {
        dp[i][i+1] = true
    }
}

for i in stride(from: n-1, to: -1, by: -1){
    if i+2 <= n-1 {
        for j in i+2...n-1 {
            if dp[i+1][j-1] && arr[i] == arr[j] {
                dp[i][j] = true
            }
        }
    }
}


for _ in 1...t {
    let s = file.readInt()
    let e = file.readInt()
    if dp[s-1][e-1] {
        print("1")
    }
    else {
        print("0")
    }
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
