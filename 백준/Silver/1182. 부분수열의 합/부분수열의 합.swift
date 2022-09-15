let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, S) = (input[0],input[1])
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var visited = Array(repeating: false, count: N)
var answer = 0
var sum = 0

func dfs(_ k: Int, _ s: Int){
    if sum == S && k >= 1{
        answer += 1
    }
    for i in s..<N{
        if !visited[i] {
            visited[i] = true
            sum += arr[i]
            dfs(k + 1, i)
            visited[i] = false
            sum -= arr[i]
        }
    }
}
dfs(0, 0)
print(answer)