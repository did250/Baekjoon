var N = Int(readLine()!)!
var K = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
if K >= N {
    print("0")
}
else {
    arr.sort()
    var len = [Int]()
    for i in 0...arr.count-2 {
        len.append(arr[i+1]-arr[i])
    }

    len.sort()
    var answer = 0
    for i in 0...len.count-K{
        answer += len[i]
    }

    print(answer)
}
