let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (input[0],input[1])
var arr = [[Int]]()
for _ in 1...m{
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
var time = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
var Q = [(Int,Int)]()
var checked = true
var idx = 0

let dx = [-1, 1, 0, 0]
let dy = [0, 0, 1, -1]
for i in 0..<m{
    for j in 0..<n {
        if arr[i][j] == 1 {
            Q.append((i, j))
        }
    }
}
var answer = 0
var (x,y) = (0,0)
while idx < Q.count {
    let temp = Q[idx]
    idx += 1
    for i in 0...3{
        let nx = temp.0 + dx[i]
        let ny = temp.1 + dy[i]
        if nx >= 0 && nx < m && ny >= 0 && ny < n{
            if arr[nx][ny] == 0{
                arr[nx][ny] = 1
                time[nx][ny] = time[temp.0][temp.1] + 1
                answer = max(time[nx][ny],answer)
                Q.append((nx, ny))
            }
        }
    }
}


here:for i in 0..<m{
    for j in 0..<n{
        if arr[i][j] == 0 {
            checked = false
            break here
        }
    }
}
if checked {
    print(answer)
}
else {
    print(-1)
}

