let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (input[0], input[1])
if M == 0 {
    print(N)
}
else {
    var graph:[[Int]] = Array(repeating: [], count: N+1)
    var visited = Array(repeating: false, count: N+1)
    var queue = [Int]()

    for _ in 1...M {
        let input2 = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (s,e) = (input2[0],input2[1])
        graph[s].append(e)
        graph[e].append(s)
    }
    func bfs (_ x:Int) {
        queue.append(x)
        visited[x] = true
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for i in graph[cur] {
                if !visited[i] {
                    queue.append(i)
                    visited[i] = true
                }
            }
        }
    }
    var answer = 0

    for i in 1...N {
        if !visited[i] {
            bfs(i)
            answer += 1
        }
    }
    print(answer)
}
