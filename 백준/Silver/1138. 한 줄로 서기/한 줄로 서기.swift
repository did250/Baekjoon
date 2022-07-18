import Foundation

let N = Int(readLine()!)!
let arr = readLine()?.split(separator: " ").map { Int($0)! }
var answer = Array(repeating: 0, count: N)
for i in 0...N-1{
    var cnt = -1
    for j in 0...N-1{
        if answer[j] == 0 {
            cnt += 1
        }
        if cnt == arr![i]{
            answer[j] = i+1
            break
        }
    }
}
for i in 0...N-1{
    print(answer[i], terminator: " ")
}