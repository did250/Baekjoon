var input = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int(String($0))!}
var max = array[0]
var answer = array
if input > 1{
    for i in 1...input-1{
        for j in 0...i-1{
            if array[i] > array[j] && answer[i] < answer[j] + array[i]{
                answer[i] = answer[j] + array[i]
            }
        }
        if max < answer[i]{
            max = answer[i]
        }
    }
    print(max)
}
else {
    print(array[0])
}

