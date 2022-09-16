let N = Int(readLine()!)!
let K = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: N+1)
var visited = Array(repeating: false, count: N+1)
for _ in 1...K {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

func dfs(_ x: Int) {
    if visited[x] {
        return
    }
    visited[x] = true
    for i in graph[x] {
        dfs(i)
    }
}
dfs(1)
var answer = 0
for i in 1...N {
    if visited[i] {
        answer += 1
    }
}

print(answer-1)
