let t = Int(readLine()!)!
for _ in 1...t {
    let l = Int(readLine()!)!
    var map = Array(repeating: Array(repeating: 0, count: l), count: l)
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (x1,y1) = (input[0],input[1])
    let input2 = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (x2,y2) = (input2[0],input2[1])
    
    var q : [[Int]] = []
    let dx = [1, 2, 2, 1, -1, -2, -2, -1]
    let dy = [-2, -1, 1, 2, 2, 1, -1, -2]
    q.append([x1, y1])
    map[x1][y1] = 0
    var idx = 0
    while q.count > idx {
        let cur = q[idx]
        let x = cur[0]
        let y = cur[1]
        idx += 1
        if x == x2 && y == y2 {
            print(map[x][y])
            break
        }
        
        for i in 0..<8 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx < l && nx >= 0 && ny >= 0 && ny < l {
                if map[nx][ny] == 0 {
                    map[nx][ny] = map[x][y] + 1
                    q.append([nx, ny])
                    q.append([nx, ny])
                }
            }
        }
    }
}
