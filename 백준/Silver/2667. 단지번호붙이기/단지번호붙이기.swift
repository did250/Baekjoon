let N = Int(readLine()!)!
var map = [[Int]]()
for _ in 1...N {
    map.append(readLine()!.map{Int(String($0))!})
}

func bfs (_ x:Int,_ y:Int) -> Int {
    map[x][y] = 0
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var Q = [(Int,Int)]()
    Q.append((x,y))
    var cnt = 1
    while !Q.isEmpty {
        let (p, q) = ( Q[0].0, Q[0].1 )
        Q.removeFirst()
        for i in 0...3 {
            let (nx,ny) = (p+dx[i], q+dy[i])
            if nx >= 0 && ny >= 0 && nx < N && ny < N && map[nx][ny] == 1 {
                map[nx][ny] = 0
                cnt += 1
                Q.append((nx,ny))
               
            }
        }
    }
    return cnt
}

var answer = [Int]()

for i in 0...N-1 {
    for j in 0...N-1 {
        if map[i][j] == 1 {
            answer.append(bfs(i, j))
        }
    }
}
answer.sort()
print(answer.count)
for i in answer {
    print(i)
}
