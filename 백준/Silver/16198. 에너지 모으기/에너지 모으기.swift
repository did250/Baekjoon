let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{Int(String($0))!}
var answer = 0
var temp = 0

func dfs(){
    if input.count == 2{
        if answer < temp {
            answer = temp
        }
        return
    }
    for i in 1..<n - 1{
        if i + 1 < input.count{
            temp += input[i - 1] * input[i + 1]
            let pop = input.remove(at: i)
            dfs()
            input.insert(pop, at: i)
            temp -= (input[i - 1] * input[i + 1])
        }
    }
}
dfs()
print(answer)
