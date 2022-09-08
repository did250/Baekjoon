let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,s) = (input[0],input[1])
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var answer = n+1
var cur = 0
var temp = 0
var start = 0
for i in 0...arr.count-1{
    cur += arr[i]
    temp += 1
    if cur >= s {
        answer = min(answer,temp)
        if i == 0 {
            answer = 1
            break
        }
        else {
            for j in start...i-1 {
                if cur - arr[j] >= s {
                    cur -= arr[j]
                    temp -= 1
                    
                    answer = min(answer,temp)
                }
                else {
                    cur -= arr[j]
                    temp -= 1
                    break
                }
            }
            start = i - temp + 1
            
        }
    }
}
if answer == n+1 {
    answer = 0
}
print(answer)
