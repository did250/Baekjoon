var N = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: N), count: N)

for i in 0...N-1{
    var input = readLine()!.split(separator: " ").map { Int(String($0))!}
    for j in 0...N-1{
        arr[i][j] = input[j]
    }
}

func max ( A : Int, B:Int, C:Int, D:Int) -> Int{
    if ( A >= B && B >= C && B >= D){
        return B
    }
    else if ( D >= B && B >= A && B >= C){
        return B
    }
    else if ( C >= B && B >= A && B >= D){
        return B
    }
    else if ( A >= C && C >= B && C >= D){
        return C
    }
    else if ( B >= C && C >= A && C >= D){
        return C
    }
    else if ( D >= C && C >= B && C >= A){
        return C
    }
    else if ( A >= D && D >= B && D >= C){
        return D
    }
    else if ( B >= D && D >= A && D >= C){
        return D
    }
    else if ( C >= D && D >= B && D >= A){
        return D
    }
    else if ( B >= A && A >= C && A >= D){
        return A
    }
    else if ( C >= A && A >= B && A >= D){
        return A
    }
    else if ( D >= A && A >= C && A >= B){
        return A
    }
    else {
        return 0
    }
}

func find ( ARR : [[Int]]) -> [[Int]]{
    var temp = Array(repeating: Array(repeating: 0, count: ARR.count/2), count: ARR.count/2)
    
    for i in 0...ARR.count/2-1{
        for j in 0...ARR.count/2-1{
            temp[i][j] = max(A: ARR[2*i][2*j], B: ARR[2*i+1][2*j], C: ARR[2*i][2*j+1], D: ARR[2*i+1][2*j+1])
            
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
