var input = readLine()!.split(separator: " ").map { Int(String($0))!}
var N = input[0]
var K = input[1]

var arr = [N]
var idx = 0
var answer = [Int]()
while true{
    var now = arr[idx]
    var new = 0
    while (now != 0){
        var s = 1
        for _ in 1...K{
            s = s*(now%10)
        }
        new += s
        now = now/10
    }
    if arr.contains(new){
        var kkk = 0
        print(arr.firstIndex(of: new)!)
        
        break
    }
    arr.append(new)
    
    
    idx = idx+1
    
}


