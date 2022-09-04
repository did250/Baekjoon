let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (input[0], input[1])
var map = [[Int]]()
var distance = Array(repeating: (Array(repeating: 0, count: m)), count: n)
for _ in 1...n {
    map.append(readLine()!.map{Int(String($0))!})
}
distance[0][0] = 1
func bfs (_ x:Int,_ y:Int) {
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
            if nx >= 0 && ny >= 0 && nx < n && ny < m && map[nx][ny] == 1 {
                map[nx][ny] = 0
                distance[nx][ny]=distance[p][q] + 1
          
                Q.append((nx,ny))
               
            }
        }
    }
}
bfs(0, 0)
print(distance[n-1][m-1])
