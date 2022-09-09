let N = Int(readLine()!)!
let M = Int(readLine()!)!
var arr : [[Int]] = Array(repeating: [], count: M)
var visited : [Bool] = Array(repeating: false, count: N+1)
var map = Array(repeating: 100000001,count: N+1)
var graph : [[Int]] = Array(repeating: [], count: N+1)

for i in 0...M-1{
    arr[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[arr[i][0]].append(arr[i][1])
}


let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (s,e) = (input[0],input[1])
for i in 0...M-1 {
    let start : Int = arr[i][0]
    let end : Int = arr[i][1]
    let cost : Int = arr[i][2]
    if start == s {
        if map[end] == 100000001 {
            map[end] = cost
        }
        else {
            map[end] = min(map[end], cost)
        }
    }
}
visited[s] = true
solve()

func solve() {
    var next = s
    while (true) {
        var m = 100000001
        var cur = 0
        for i in 1...N {
            if !visited[i] && m > map[i] {
                m = map[i]
                cur = i
            }
        }
        next = cur
        visited[next] = true
        
        
        if m == 100000001 {
            break
        }
        for i in 0...M-1 {
            if arr[i][0] == next {
                map[arr[i][1]] = min(map[arr[i][1]], arr[i][2] + map[arr[i][0]])
            }
        }
    
    }
}
print(map[e])

