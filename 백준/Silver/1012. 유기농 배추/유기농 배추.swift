let T = Int(readLine()!)!
var M2 = 0
var N2 = 0
var map2 : [[Int]] = [[Int]]()
for _ in 1...T {
    let input = readLine()!.split(separator: " ").map({Int(String($0))!})
    let (M,N,K) = (input[0],input[1],input[2])
    
    var map = Array(repeating: Array(repeating: 0, count: M), count: N)
    
    for _ in 1...K {
        let input2 = readLine()!.split(separator: " ").map({Int(String($0))!})
        map[input2[1]][input2[0]] = 1
    }
    map2 = map
    M2 = M
    N2 = N
    var answer = 0
    for i in 0..<N {
        for j in 0..<M {
            if map2[i][j] == 1 {
                answer += 1
                dfs(i, j)
            }
        }
    }
    print(answer)
}

func dfs(_ x: Int, _ y: Int) {
    
    if x < 0 || x >= N2 || y < 0 || y >= M2 || map2[x][y] != 1 {
        return
    }
    map2[x][y] = 0
    dfs(x+1, y)
    dfs(x-1, y)
    dfs(x, y+1)
    dfs(x, y-1)
}
