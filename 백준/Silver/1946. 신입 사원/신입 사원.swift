import Foundation
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

let file = FileIO()
let n = file.readInt()

for _ in 1...n{
    let len = file.readInt()
    var arr = Array(repeating: Array(repeating: 0, count: 2), count: len)
    for i in 0...len-1 {
        arr[i][0] = file.readInt()
        arr[i][1] = file.readInt()
    }
    arr.sort { (a, b) -> Bool in
        return a[0] < b[0]
    }
    var m = arr[0][1]
    var cnt = 1
    if len > 1 {
        for i in 1...len-1{
            if m > arr[i][1]{
                cnt += 1
                m = arr[i][1]
            }
        }
    }
    print(cnt)
}
