let input = readLine()!
let input2 = readLine()!
var arr = [Character]()
var arr2 = [Character]()

for i in input.indices {
    arr.append(input[i])
}
for i in input2.indices {
    arr2.append(input2[i])
}
var dp = Array(repeating: Array(repeating: 0, count: arr2.count+2), count: arr.count+2)
for i in 1...arr.count {
    
    for j in 1...arr2.count{
        if arr[i-1] == arr2[j-1]{
            dp[i][j] = dp[i-1][j-1] + 1
        }
        else {
            dp[i][j] = max(dp[i][j-1], dp[i-1][j])
        }
    
    }
}
var answer = dp[arr.count][arr2.count]

print(answer)

var kk = ""
if answer != 0 {
    var i = arr.count
    var j = arr2.count
    while answer > 0 {
        if dp[i][j] == dp[i-1][j] {
            i -= 1
        }
        else if dp[i][j] == dp[i][j-1] {
            j -= 1
        }
        else {
            kk = String(arr[i-1]) + kk
            answer -= 1
            i -= 1
            j -= 1
        }
    }
    print(kk)
}

