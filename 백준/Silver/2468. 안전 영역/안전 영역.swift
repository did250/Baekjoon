let n = Int(readLine()!)!

var maps = [[Int]]()
var map = [[Int]]()
var ma = 0
var mi = 101
for i in 0...n-1 {
    maps.append(readLine()!.split(separator : " ").map{Int(String($0))!})
    ma = max(ma,maps[i].max()!)
    mi = min(mi,maps[i].min()!)
}

func bfs (_ x:Int,_ y:Int, _ height: Int) {
    
    map[x][y] = 0
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    var Q = [(Int,Int)]()
    Q.append((x,y))
 
    while !Q.isEmpty {
        let (p, q) = ( Q[0].0, Q[0].1 )
        Q.removeFirst()
        for i in 0...3 {
            let (nx,ny) = (p+dx[i], q+dy[i])
            if nx >= 0 && ny >= 0 && nx < n && ny < n && map[nx][ny] > height {
                map[nx][ny] = 0
            
                Q.append((nx,ny))
            }
        }
    }
}
var answer = 0
for i in mi-1..<ma {
    map = maps
    var cnt = 0
    for p in 0..<n {
        for q in 0..<n {
            if map[p][q] > i {
                bfs(p, q, i)
                cnt += 1
            }
        }
    }
    answer = max(answer,cnt)
}

print(answer)
