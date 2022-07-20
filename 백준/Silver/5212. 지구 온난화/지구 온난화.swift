import Foundation

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
let R = arr[0]
let C = arr[1]
var maps : [[String]] = Array(repeating: Array(repeating: ".", count: C+2), count: R+2)

for i in 1...R {
    var arr2 = readLine()!.map {String($0)}
    for j in 1...C {
        maps[i][j] = arr2[j-1]
    }
}

var answer : [[String]] = Array(repeating: Array(repeating: ".", count: C), count: R)
for i in 1...R {
    for j in 1...C{
        var count = 0
        if (maps[i][j]=="X") {
            if ( maps[i-1][j] == ".") {
                count += 1
            }
            if ( maps[i+1][j] == ".") {
                count += 1
            }
            if ( maps[i][j-1] == ".") {
                count += 1
            }
            if ( maps[i][j+1] == ".") {
                count += 1
            }
            if count < 3{
                answer[i-1][j-1] = "X"
            }
        }
    }
}
var sx = -1
var sy = 11
var ex = 0
var ey = 0
for i in 0...R-1 {
    for j in 0...C-1{
        if ( answer[i][j] == "X"){
            if sx == -1 {
                sx = i
            }
            if sy > j {
                sy = j
            }
            if ex < i {
                ex = i
            }
            if ey < j {
                ey = j
            }
        }
    }
}

for i in sx...ex{
    for j in sy...ey{
        print(answer[i][j],terminator: "")
    }
    if ( i != ex){
        print("")
    }
}

