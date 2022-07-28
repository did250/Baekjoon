var N = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: N), count: N)

for i in 0...N-1{
    var input = readLine()!.split(separator: " ").map { Int(String($0))!}
    for j in 0...N-1{
        arr[i][j] = input[j]
    }
    
}

func find ( ARR : [[Int]]) -> [[Int]]{
    var temp = Array(repeating: Array(repeating: 0, count: ARR.count/2), count: ARR.count/2)
    
    for i in 0...ARR.count/2-1{
        for j in 0...ARR.count/2-1{
            var k = [Int]()
            k.append(ARR[2*i][2*j])
            k.append(ARR[2*i+1][2*j])
            k.append(ARR[2*i][2*j+1])
            k.append(ARR[2*i+1][2*j+1])
            k.sort()
            temp[i][j] = k[2]
        }
    }
    return temp
}


while true {
    arr = find(ARR: arr)
    if arr.count == 1{
        print(arr[0][0])
        break
    }
}


