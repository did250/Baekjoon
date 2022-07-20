import Foundation

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = arr[0]
let M = arr[1]

var map : [[Int]] = Array(repeating: Array(repeating: 0, count: M+2), count: N+2)

var total = 0

for i in 1...N{
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))!}
    for j in 1...M{
        map[i][j] = tmp[j-1]
        total += tmp[j-1]
    }
}
total = total*6
for i in 1...N{
    for j in 1...M{
        total -= (map[i][j]-1)*2
        if ( map[i][j] > map[i-1][j]){
            total -= map[i-1][j]
        }
        else {
            total -= map[i][j]
        }
        if ( map[i][j] > map[i+1][j]){
            total -= map[i+1][j]
        }
        else {
            total -= map[i][j]
        }
        if ( map[i][j] > map[i][j-1]){
            total -= map[i][j-1]
        }
        else {
            total -= map[i][j]
        }
        if ( map[i][j] > map[i][j+1]){
            total -= map[i][j+1]
        }
        else {
            total -= map[i][j]
        }
    }
}

print(total)
