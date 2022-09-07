let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,k) = (input[0],input[1])
var dp = Array(repeating: 0, count: n)
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var count = Array(repeating: 0, count: k+1)
var cur = [Int]()
for i in 0...arr.count-1 {
    count[arr[i]] += 1
}

var answer = 0
for i in 0...arr.count-1 {
    if cur.contains(arr[i]) {
        continue
    }
    if cur.count < n {
        cur.append(arr[i])
    }
    else if cur.count == n {
        var target = 0
        var m = -1
    here:for j in 0...n-1 {
            for s in i...arr.count-1 {
                if arr[s] == cur[j] && s != i {
                    if m < s {
                        target = j
                        m = s
                    }
                    break
                }
                if s == arr.count-1 {
                    target = j
                    break here
                }
            }
        }
        cur.remove(at: target)
        cur.append(arr[i])
        answer += 1
    }
}
print(answer)
