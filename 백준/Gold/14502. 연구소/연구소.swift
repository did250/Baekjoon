let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (input[0],input[1])
var arr = [[Int]]()
for _ in 0..<n{
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
var Ans = 0
func dfs(_ len: Int){
    if len == 3{
        bfs()
        return
    }
    for i in 0..<n{
        for j in 0..<m{
            if arr[i][j] == 0 {
                arr[i][j] = 1
                dfs(len + 1)
                arr[i][j] = 0
            }
        }
    }
}
let dx = [-1, 1, 0, 0]
let dy = [0, 0, 1, -1]
func bfs(){
    var idx = 0
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var map = arr
    var queue = [(Int,Int)]()
    for i in 0..<n{
        for j in 0..<m{
            if map[i][j] == 2 {
                queue.append((i,j))
            }
        }
    }
    while idx < queue.count {
        let cur = queue[idx]
        let (x,y) = (cur.0,cur.1)
        idx += 1
        for i in 0...3{
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx >= 0 && nx < n && ny >= 0 && ny < m{
                if map[nx][ny] == 0 && !visited[nx][ny]{
                    visited[nx][ny] = true
                    map[nx][ny] = 2
                    queue.append((nx,ny))
                }
                
            }
        }
    }
    var answer = 0
    for i in 0..<n{
        for j in 0..<m{
            if map[i][j] == 0{
                answer += 1
            }
        }
    }
    Ans = max(Ans, answer)
}
dfs(0)
print(Ans)
