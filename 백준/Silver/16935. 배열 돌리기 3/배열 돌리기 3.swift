import Foundation

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = arr[0]
let M = arr[1]
let R = arr[2]

var map : [[Int]] = Array(repeating: Array(repeating: 0, count: M), count: N)

for i in 0...N-1{
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 0...M-1{
        map[i][j] = tmp[j]
    }
}

var fun = readLine()!.split(separator: " ").map { Int(String($0))! }
var a = N
var b = M
for i in 0...R-1{
    if fun[i] == 1{
        var map2 = map
        for j in 0...(a-1)/2{
            let p = map[j]
            map2[j] = map2[a-1-j]
            map2[a-1-j] = p
        }
        map = map2
    }
    else if fun[i] == 2{
        var map2 = map
        for j in 0...a-1{
            for k in 0...b-1{
                map2[j][k] = map[j][b-1-k]
            }
        }
        map = map2
    }
    else if fun[i] == 3{
        var c = a
        a = b
        b = c
        var map2 = Array(repeating: Array(repeating: 0, count: b), count: a)
        for j in 0...b-1{
            var tmp = map[b-1-j]
            for k in 0...a-1{
                map2[k][j] = tmp[k]
            }
        }
        map = map2
    }
    else if fun[i] == 4{
        var c = a
        a = b
        b = c
        var map2 = Array(repeating: Array(repeating: 0, count: b), count: a)
        for j in 0...b-1{
            var tmp = map[j]
            for k in 0...a-1{
                map2[k][j] = tmp[a-1-k]
            }
        }
        map = map2
    }
    else if fun[i] == 5{
        
        var map2 = map
        for j in 0...(a-1)/2{
            for k in 0...(b-1)/2{
                map2[j][k] = map[j+a/2][k]
            }
            for k in (((b-1)/2)+1)...b-1{
                map2[j][k] = map[j][k-b/2]
            }
        }
        for j in (((a-1)/2)+1)...a-1{
            for k in 0...(b-1)/2{
                map2[j][k] = map[j][k+b/2]
            }
            for k in (((b-1)/2)+1)...b-1{
                map2[j][k] = map[j-a/2][k]
            }
        }
        map = map2
    }
    else if fun[i] == 6{
        var map2 = map
        for j in 0...(a-1)/2{
            for k in 0...(b-1)/2{
                map2[j][k] = map[j][k+b/2]
            }
            for k in (((b-1)/2)+1)...b-1{
                map2[j][k] = map[j+a/2][k]
            }
        }
        for j in (((a-1)/2)+1)...a-1{
            for k in 0...(b-1)/2{
                map2[j][k] = map[j-a/2][k]
            }
            for k in (((b-1)/2)+1)...b-1{
                map2[j][k] = map[j][k-b/2]
            }
        }
        map = map2
        
    }
}

for i in 0...a-1{
    for j in 0...b-1{
        print(map[i][j], terminator: " ")
    }
    print()
}
