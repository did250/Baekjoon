var input = readLine()!.split(separator: " ").map { Int(String($0))!}
var N = input[0]
var M = input[1]
var B = input[2]
var arr = Array(repeating: Array(repeating: 0, count: M), count: N)
var min = 256
var max = 0
var total = B
for i in 0...N-1{
    let temp = readLine()!.split(separator: " ").map { Int(String($0))!}
    for j in 0...M-1{
        arr[i][j] = temp[j]
        if arr[i][j]<min{
            min = arr[i][j]
        }
        if arr[i][j]>max{
            max = arr[i][j]
        }
        total += arr[i][j]
    }
}
var an = [Int]()
var an2 = [Int]()

var answer = Int()
for s in min...max{
    answer = 0
    if total >= s*N*M{
        loop : for i in 0...N-1{
            for j in 0...M-1{
                if arr[i][j] > s{
                    let t = arr[i][j]-s
                    answer += 2*t
                }
                else if arr[i][j] < s{
                    answer += s-arr[i][j]
                }
            }
            if i == N-1{
                an.append(answer)
                an2.append(s)
            }
        }
    }
    
}

var ans = an[0]
var ans2 = 0
for i in 0...an.count-1{
    if an[i]<ans{
        ans=an[i]
        ans2 = an2[i]
    }
    else if an[i] == ans{
        if an2[i]>ans2 {
            ans2 = an2[i]
        }
    }
}
print(ans,terminator: " ")
print(ans2)
