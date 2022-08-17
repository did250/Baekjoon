var input = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: 99999, count: input+1), count: input+1)
var Count = Array(repeating: 1, count: input+1)
var Q = [(Int, Int)]()
var index = 0
while true {
    let k = readLine()!.split(separator: " ").map { Int(String($0))!}
    if k[0] == -1 && k[1] == -1 {
        break
    }
    graph[k[0]][k[1]] = 1
    graph[k[1]][k[0]] = 1
    Q.append((k[0], k[1]))
    Q.append((k[1], k[0]))
}

func visit(_ x: Int, _ y:Int) -> Void {
    for i in 0..<input {
        if x == i {
            continue
        }
        else if graph[y][i] != 100000 && graph[x][i] > graph[x][y] + graph[y][i] {
            graph[x][i] = graph[x][y] + graph[y][i]
            graph[i][x] = graph[x][y] + graph[y][i]
            Q.append((x,i))
        }
    }
}

while Q.count > index {
    index += 1
    visit(Q[index-1].0, Q[index-1].1)
}
for i in 1...input {
    for j in 1...input {
        if i != j {
            
            if Count[i] < graph[i][j] {
                Count[i] = graph[i][j]
            }
        }
    }
}


let minimum = Count[1...input].min()!

var answer = ""
var answercnt = 0

    
 
for i in 1...input {
    if Count[i] == minimum {
        answer += "\(i) "
        answercnt += 1
    }
}
    
print(minimum , answercnt ,separator: " ")
print(answer)

