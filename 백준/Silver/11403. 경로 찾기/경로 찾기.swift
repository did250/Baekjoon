let N = Int(readLine()!)!
var map = [[Int]]()
for _ in 0...N-1 {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var answer = Array(repeating: Array(repeating: 0, count: N), count: N)

var visited = Array(repeating: false, count: N)

func dfs(_ start: Int, _ x: Int) {
    for i in 0..<N {
        if map[x][i] == 1 && !visited[i] {
            answer[start][i] = 1
            visited[i] = true
            dfs(start, i)
        }
    }
}

for i in 0..<N {
    dfs(i, i)
    visited = Array(repeating: false, count: N)
}

for i in 0...N-1 {
    for j in 0...N-1 {
        print(answer[i][j],terminator: " ")
    }
    print("")
}
