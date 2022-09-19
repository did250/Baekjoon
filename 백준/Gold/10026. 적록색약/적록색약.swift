let N = Int(readLine()!)!
var map = [[Character]]()
for _ in 0...N-1 {
    let line = readLine()!.map { $0 }
    map.append(line)
}

var visited = Array(repeating: Array(repeating: false, count: N), count: N)

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]


var answer1 = 0
var answer2 = 0

func dfs(_ x: Int,_ y: Int,_ color: Character) {
    visited[x][y] = true
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx >= 0 && nx < N && ny >= 0 && ny < N && map[nx][ny] == color && !visited[nx][ny] {
            dfs(nx, ny, color)
        }
    }

}


for i in 0...N-1 {
    for j in 0...N-1 {
        if !visited[i][j] {
            answer1 += 1
            dfs(i, j, map[i][j])
        }
    }
}

for i in 0...N-1 {
    for j in 0...N-1 {
        if map[i][j] == "R" {
            map[i][j] = "G"
        }
    }
}

visited = Array(repeating: Array(repeating: false, count: N), count: N)

for i in 0...N-1 {
    for j in 0...N-1 {
        if !visited[i][j] {
            answer2 += 1
            dfs(i, j, map[i][j])
        }
    }
}
print(answer1,answer2,separator: " ")
