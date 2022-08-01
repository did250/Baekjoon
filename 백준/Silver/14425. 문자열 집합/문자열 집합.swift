var input = readLine()!.split(separator: " ").map {Int(String($0))!}
var array : Set = [""]

for _ in 1...input[0]{
    array.insert(readLine()!)
}
var answer = 0
for _ in 1...input[1]{
    if array.contains(readLine()!){
        answer += 1
    }
}

print(answer)
