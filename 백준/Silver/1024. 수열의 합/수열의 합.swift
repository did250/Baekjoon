var input = readLine()!.split(separator: " ").map { Int(String($0))!}
var start = -1
var end = -1

for i in input[1]...100 {
   
    
    if i % 2 == 0 {
        if input[0] % i == i/2 {
            start = input[0]/i - i/2 + 1
            end = input[0]/i + i/2
            break
        }
    }
    else {
        if input[0] % i == 0 {
            start = input[0]/i - i/2
            end = input[0]/i + i/2
            break
        }
    }
}
if start < 0 {
    print("-1")
}
else {
    for i in start...end{
        print(i,terminator: " ")
    }
}
