let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,K) = (input[0],input[1])

var answer = 0
if N == K {
    print(answer)
}
else {
    var queue = [(Int,Int)]()
    queue.append((N,0))
    var visited = Array(repeating: false, count: 100001)
    visited[N] = true
    var idx = 0
here:while idx < queue.count {
        
        let cur = queue[idx]
       
        idx += 1
        for i in 0..<3 {
            var nx = 0
            switch i {
            case 0: nx = cur.0 - 1
            case 1: nx = cur.0 + 1
            default: nx = cur.0 * 2
            }
            
            if nx == K {
                answer = cur.1 + 1
                break here
            }
            else {
                if nx >= 0 && nx <= 100000 && !visited[nx] {
                    visited[nx] = true
                    queue.append((nx, cur.1+1))
                }
                
            }
        }
    }
    print(answer)
}
