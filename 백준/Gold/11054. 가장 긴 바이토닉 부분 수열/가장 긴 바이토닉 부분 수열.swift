let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map {Int(String($0))!}
var up = Array(repeating: 1, count: N)
var down = Array(repeating: 1, count: N)


for i in 0...N-1 {
    var max = 0
    for j in 0...i {
        if arr[i] > arr[j] && up[j] > max {
            max = up[j]
        }
    }
    up[i] = max + 1
   
}


for i in stride(from: N-1, to: -1, by: -1) {
    var max = 0
    for j in i...N-1 {
        if arr[j] < arr[i] && down[j] > max {
            max = down[j]
        }
    }
    down[i] = max + 1
}


var answer = 0
for i in 0...N-1 {
    up[i] += down[i]
    answer = max(answer,up[i])
}

print(answer-1)
