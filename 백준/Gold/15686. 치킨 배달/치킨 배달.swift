var input = readLine()!.split(separator: " ").map {Int(String($0))!}

var N = input[0]
var M = input[1]
var map = Array(repeating: Array(repeating: 0, count: N), count: N)
var chicken = [[Int]]()
var users = [[Int]]()
for i in 0...N-1{
    var temp = readLine()!.split(separator: " ").map {Int(String($0))!}
    for j in 0...N-1{
        map[i][j] = temp[j]
        if map[i][j] == 2{
            chicken.append([i,j])
        }
        else if map[i][j] == 1{
            users.append([i,j])
        }
    }
}

var distance = Array(repeating: Array(repeating: 0, count: chicken.count), count: users.count)
for i in 0...users.count-1{
    var un = users[i][0]
    var um = users[i][1]
    for j in 0...chicken.count-1{
        
        var cn = chicken[j][0]
        var cm = chicken[j][1]
        var nn = un - cn
        var mm = um - cm
        if nn<0{
            nn = -nn
        }
        if mm<0{
            mm = -mm
        }
        distance[i][j] = nn+mm
    }
}

var visited = Array(repeating: false, count: chicken.count)
var ananan = 1000000
func bfs (start : Int, cnt: Int, r : Int){
   
    if r == cnt{
        var ss = [Int]()
        var answer = 0
        for i in 0...visited.count-1{
            if visited[i] == true{
                ss.append(i)
            }
        }
        for i in 0...users.count-1{
            var p = distance[i][ss[0]]
          
            for j in 0...ss.count-1{
                if p > distance[i][ss[j]]{
                    p = distance[i][ss[j]]
                }
            }
            answer += p
            
        }
        if ananan>answer{
            ananan=answer
        }
        return
    }
    for i in start...chicken.count-1{
        if !visited[i]{
            visited[i] = true
            bfs(start: i, cnt: cnt+1,r: r)
            visited[i] = false
        }
    }
}

bfs( start: 0, cnt: 0, r: M)

print(ananan)
