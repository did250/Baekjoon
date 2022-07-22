let inp = readLine()!.split(separator: " " ).map{Int(String($0))!}
let N = inp[0]
let M = inp[1]
let total = 2*N+2*M
let T = Int(readLine()!)!
var arr = [Int]()
for _ in 0...T {
    let q = readLine()!.split(separator: " " ).map{Int(String($0))!}
    if q[0] == 1{
        arr.append(q[1])
    }
    else if q[0] == 2{
        arr.append(2*N+M-q[1])
    }
    else if q[0] == 3{
        arr.append(total-q[1])
    }
    else{
        arr.append(N+q[1])
    }
}
let k = arr.removeLast()
var answer = 0
for i in arr{
    let x = min(k,i)
    let y = max(k,i)
    answer = answer + min((x+total-y),(y-x))
}
print(answer)