func dp (_ input:Int){
    let array = readLine()!.split(separator: " ").map { Int(String($0))!} 
    var answer = array  
    for i in 0...input-1{
        for j in 0..<i{
            if array[i] > array[j] && answer[i] < answer[j] + array[i]{
                answer[i] = answer[j] + array[i]
            }
        }     
    }
    print(answer.max()!)
}

var input = Int(readLine()!)!
dp(input)
