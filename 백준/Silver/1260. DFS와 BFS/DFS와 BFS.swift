let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M, V) = (input[0], input[1], input[2])
var graph = Array(repeating: [Int](), count: N+1)
var visited = Array(repeating: false, count: N+1)
for i in 1...M {
    let input2 = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (S, E) = (input2[0], input2[1])
    graph[S].append(E)
    graph[E].append(S)
}
for i in 1...N {
    graph[i].sort()
}
func dfs(_ x : Int) {
    visited[x] = true
    print(x, terminator: " ")
    for i in graph[x] {
        if !visited[i] {
            dfs(i)
        }
    }
}

var queue = [Int]()
func bfs(_ x : Int) {
    queue.append(x)
    visited[x] = true
    while !queue.isEmpty {
        let cur = queue[0]
        print(cur, terminator: " ")
        queue.removeFirst()
        
        for i in graph[cur] {
            if !visited[i] {
                queue.append(i)
                visited[i] = true
            }
        }
    }
}
dfs(V)
print("")
for i in 1...visited.count-1 {
    visited[i] = false
}
bfs(V)