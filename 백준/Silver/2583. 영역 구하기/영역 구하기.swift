let input = readLine()!.split(separator: " ").map({Int(String($0))!})
let (m,n,k) = (input[0],input[1],input[2])

var map = Array(repeating: Array(repeating: 0, count: n), count: m)

for _ in 0..<k {
    let input2 = readLine()!.split(separator: " ").map({Int(String($0))!}) // 직사각형 좌표
    let (a,b,c,d) = (input2[0],input2[1],input2[2],input2[3])
    for i in a..<c {
        for j in b..<d {
            map[j][i] += 1
        }
    }
}


func dfs(_ x: Int, _ y: Int) {
    if x < 0 || x >= m || y < 0 || y >= n || map[x][y] != 0 { return }
    map[x][y] = 1
    idx += 1 // area_tmp 1 증가시켜주기
    dfs(x+1, y)
    dfs(x-1, y) // 세로로 전 자리
    dfs(x, y+1)
    dfs(x, y-1)
}
var answer = [Int]()
var idx = 0
for i in 0..<n {
    for j in 0..<m {
        if map[j][i] == 0 {
            idx = 0
            dfs(j, i)
            answer.append(idx)
        }
    }
}

print(answer.count)
answer.sort()
for i in answer {
    print(i,terminator: " ")
}
