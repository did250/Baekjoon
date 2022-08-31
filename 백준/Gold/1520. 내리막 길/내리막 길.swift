let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (input[0],input[1])
var map = Array(repeating: Array(repeating: -1, count: M+1), count: N+1)
for i in 1...N {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 1...M {
        map[i][j] = t[j-1]
    }
}
var dp = Array(repeating: Array(repeating: -1, count: M+1), count: N+1)
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]
func dfs (_ x:Int, _ y:Int) -> Int {
    if x == N && y == M {
        return 1
    }
    
    if dp[x][y] == -1 {
        dp[x][y] = 0
        for i in 0...3 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx >= 1 && ny >= 1 && nx <= N && ny <= M && map[x][y] > map[nx][ny] {
                dp[x][y] += dfs(nx,ny)
            }
        }
    }
    return dp[x][y]
}
print(dfs(1,1))

