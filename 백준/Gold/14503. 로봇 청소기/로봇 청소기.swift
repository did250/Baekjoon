var input = readLine()!.split(separator: " ").map { Int(String($0))!}
var input2 = readLine()!.split(separator: " ").map { Int(String($0))!}
var map = Array(repeating: Array(repeating: 1, count: input[1]+2), count: input[0]+2)
for i in 1...input[0] {
    var maps = readLine()!.split(separator: " ").map { Int(String($0))!}
    for j in 1...input[1] {
        map[i][j] = maps[j-1]
    }
    
}
var direction = input2[2]

var x = input2[0] + 1
var y = input2[1] + 1
var cnt = 0
var k = 0
while true {
    
    if map[x][y] == 0 {
        map[x][y] = 2
        cnt += 1
        k = 0
    }
    if x == 1 && direction == 2 {
        break
    }
    if y == 1 && direction == 1 {
        break
    }
    if x == input[0] && direction == 0 {
        break
    }
    if y == input[1] && direction == 3 {
        break
    }
//    print(cnt)
//    print(x,y)
//    print(direction)
//    for i in 1...input[0]{
//        for j in 1...input[1]{
//            print(map[i][j],terminator: " ")
//        }
//        print()
//    }

    if direction == 0 && map[x][y-1] == 0 {
        
        direction = 3
        y = y - 1
        
        
    }
    else if direction == 1 && map[x-1][y] == 0 {
        
        
        direction = 0
        x = x - 1
        
    }
    else if direction == 2 && map[x][y+1] == 0 {
        
        
        direction = 1
        y = y + 1
        
    }
    else if direction == 3 && map[x+1][y] == 0 {
        
        direction = 2
        x = x + 1
        
    }
    else if k == 4 {
        k = 0
        if direction == 0 {
            if x == input[0] || map[x+1][y] == 1 {
                break
            }
            else {
                x = x + 1
            }
        }
        else if direction == 1 {
            if y == input[1] || map[x][y-1] == 1 {
                break
            }
            else {
                y = y - 1
            }
        }
        else if direction == 2 {
            if x == 1 || map[x-1][y] == 1 {
                break
            }
            else {
                x = x - 1
            }
        }
        else if direction == 3 {
            if y == 1 || map[x][y+1] == 1 {
                break
            }
            else {
                y = y + 1
            }
        }
    }
    else if direction == 0 && map[x][y-1] != 0 {
        direction = 3
        k += 1
    }
    else if direction == 1 && map[x-1][y] != 0 {
        direction = 0
        k += 1
    }
    else if direction == 2 && map[x][y+1] != 0 {
        direction = 1
        k += 1
    }
    else if direction == 3 && map[x+1][y] != 0 {
        direction = 2
        k += 1
    }
    
}

//11 10
//7 4 0
//1 1 1 1 1 1 1 1 1 1
//1 0 0 0 0 0 0 0 0 1
//1 0 0 0 1 1 1 1 0 1
//1 0 0 1 1 0 0 0 0 1
//1 0 1 1 0 0 0 0 0 1
//1 0 0 0 0 0 0 0 0 1
//1 0 0 0 0 0 0 1 0 1
//1 0 0 0 0 0 1 1 0 1
//1 0 0 0 0 0 1 1 0 1
//1 0 0 0 0 0 0 0 0 1
//1 1 1 1 1 1 1 1 1 1
print(cnt)
