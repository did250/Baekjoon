import Foundation

let input = readLine()!.split(separator: " ").map({Int(String($0))!})
let N = input[0]
let M = input[1]
var lower = Array(repeating: [Int](), count: N+1)
var degree = Array(repeating: 0, count: N+1)

for _ in 0..<M{
    let input = readLine()!.split(separator: " ").map({Int(String($0))!})
    let A = input[0]
    let B = input[1]
    lower[B].append(A)
    degree[A] += 1
}

var queue = [Int]()
for i in 1..<N+1{
    if degree[i] == 0{
        queue.append(i)
    }
}


var answer = [Int]()
var s = 0
while s < queue.count{
    let cur = queue[s]
    answer.append(cur)
    
    for i in lower[cur]{
        degree[i] -= 1
        if degree[i] == 0{
            queue.append(i)
        }
    }
    s += 1
}

answer.reverse()
for i in answer{
    print(i, terminator: " ")
}
