var A = readLine()!.map{Int(String($0))!}
var B = readLine()!.map{Int(String($0))!}
var C = readLine()!.map{Int(String($0))!}
var D = readLine()!.map{Int(String($0))!}
var cur = [[-1,2],[6,2],[6,2],[6,-1]]
var n = Int(readLine()!)!
for _ in 1...n {
    var input = readLine()!.split(separator: " ").map {Int(String($0))!}
    var target = input[0]
    var direction = input[1]
    var D1 = false
    if A[cur[0][1]] == B[cur[1][0]] {
        D1 = true
    }
    
    var D2 = false
    if B[cur[1][1]] == C[cur[2][0]] {
        D2 = true
    }
    var D3 = false
    if C[cur[2][1]] == D[cur[3][0]] {
        D3 = true
    }
    if target == 1 {
        if direction == 1 {
            cur[0][1] -= 1
            if cur[0][1] == -1{
                cur[0][1] = 7
            }
        }
        else if direction == -1 {
            cur[0][1] += 1
            if cur[0][1] == 8{
                cur[0][1] = 0
            }
        }
        if D1 == false {
            if direction == 1{
                cur[1][0] += 1
                cur[1][1] += 1
                if cur[1][0] == 8 {
                    cur[1][0] = 0
                }
                if cur[1][1] == 8 {
                    cur[1][1] = 0
                }
            }
            else {
                cur[1][0] -= 1
                cur[1][1] -= 1
                if cur[1][0] == -1 {
                    cur[1][0] = 7
                }
                if cur[1][1] == -1 {
                    cur[1][1] = 7
                }
            }
            if D2 == false {
                if direction == -1 {
                    cur[2][0] += 1
                    cur[2][1] += 1
                    if cur[2][0] == 8 {
                        cur[2][0] = 0
                    }
                    if cur[2][1] == 8 {
                        cur[2][1] = 0
                    }
                }
                else {
                    cur[2][0] -= 1
                    cur[2][1] -= 1
                    if cur[2][0] == -1 {
                        cur[2][0] = 7
                    }
                    if cur[2][1] == -1 {
                        cur[2][1] = 7
                    }
                }
                if D3 == false {
                    if direction == 1 {
                        cur[3][0] += 1
                        if cur[3][0] == 8 {
                            cur[3][0] = 0
                        }
                    }
                    else {
                        cur[3][0] -= 1
                        if cur[3][0] == -1 {
                            cur[3][0] = 7
                        }
                    }
                }
            }
        }
    }
    else if target == 2{
        if direction == -1 {
            cur[1][0] += 1
            cur[1][1] += 1
            if cur[1][0] == 8 {
                cur[1][0] = 0
            }
            if cur[1][1] == 8 {
                cur[1][1] = 0
            }
        }
        else {
            cur[1][0] -= 1
            cur[1][1] -= 1
            if cur[1][0] == -1 {
                cur[1][0] = 7
            }
            if cur[1][1] == -1 {
                cur[1][1] = 7
            }
        }
        if D1 == false {
            if direction == -1 {
                cur[0][1] -= 1
                if cur[0][1] == -1{
                    cur[0][1] = 7
                }
            }
            else if direction == 1 {
                cur[0][1] += 1
                if cur[0][1] == 8{
                    cur[0][1] = 0
                }
            }
        }
        if D2 == false {
            if direction == 1 {
                cur[2][0] += 1
                cur[2][1] += 1
                if cur[2][0] == 8 {
                    cur[2][0] = 0
                }
                if cur[2][1] == 8 {
                    cur[2][1] = 0
                }
            }
            else {
                cur[2][0] -= 1
                cur[2][1] -= 1
                if cur[2][0] == -1 {
                    cur[2][0] = 7
                }
                if cur[2][1] == -1 {
                    cur[2][1] = 7
                }
            }
            if D3 == false {
                if direction == -1 {
                    cur[3][0] += 1
                    if cur[3][0] == 8 {
                        cur[3][0] = 0
                    }
                }
                else {
                    cur[3][0] -= 1
                    if cur[3][0] == -1 {
                        cur[3][0] = 7
                    }
                }
            }
        }
    }
    else if target == 3{
        if direction == -1 {
            cur[2][0] += 1
            cur[2][1] += 1
            if cur[2][0] == 8 {
                cur[2][0] = 0
            }
            if cur[2][1] == 8 {
                cur[2][1] = 0
            }
        }
        else {
            cur[2][0] -= 1
            cur[2][1] -= 1
            if cur[2][0] == -1 {
                cur[2][0] = 7
            }
            if cur[2][1] == -1 {
                cur[2][1] = 7
            }
        }
        if D3 == false {
            if direction == 1 {
                cur[3][0] += 1
                if cur[3][0] == 8 {
                    cur[3][0] = 0
                }
            }
            else {
                cur[3][0] -= 1
                if cur[3][0] == -1 {
                    cur[3][0] = 7
                }
            }
        }
        if D2 == false {
            if direction == 1 {
                cur[1][0] += 1
                cur[1][1] += 1
                if cur[1][0] == 8 {
                    cur[1][0] = 0
                }
                if cur[1][1] == 8 {
                    cur[1][1] = 0
                }
            }
            else {
                cur[1][0] -= 1
                cur[1][1] -= 1
                if cur[1][0] == -1 {
                    cur[1][0] = 7
                }
                if cur[1][1] == -1 {
                    cur[1][1] = 7
                }
            }
            if D1 == false {
                if direction == 1 {
                    cur[0][1] -= 1
                    if cur[0][1] == -1{
                        cur[0][1] = 7
                    }
                }
                else if direction == -1 {
                    cur[0][1] += 1
                    if cur[0][1] == 8{
                        cur[0][1] = 0
                    }
                }
            }
        }
    }
    else {
        if direction == -1 {
            cur[3][0] += 1
            if cur[3][0] == 8 {
                cur[3][0] = 0
            }
        }
        else {
            cur[3][0] -= 1
            if cur[3][0] == -1 {
                cur[3][0] = 7
            }
        }
        if D3 == false {
            if direction == 1 {
                cur[2][0] += 1
                cur[2][1] += 1
                if cur[2][0] == 8 {
                    cur[2][0] = 0
                }
                if cur[2][1] == 8 {
                    cur[2][1] = 0
                }
            }
            else {
                cur[2][0] -= 1
                cur[2][1] -= 1
                if cur[2][0] == -1 {
                    cur[2][0] = 7
                }
                if cur[2][1] == -1 {
                    cur[2][1] = 7
                }
            }
            if D2 == false {
                if direction == -1 {
                    cur[1][0] += 1
                    cur[1][1] += 1
                    if cur[1][0] == 8 {
                        cur[1][0] = 0
                    }
                    if cur[1][1] == 8 {
                        cur[1][1] = 0
                    }
                }
                else {
                    cur[1][0] -= 1
                    cur[1][1] -= 1
                    if cur[1][0] == -1 {
                        cur[1][0] = 7
                    }
                    if cur[1][1] == -1 {
                        cur[1][1] = 7
                    }
                }
                if D1 == false {
                    if direction == 1 {
                        cur[0][1] += 1
                        if cur[0][1] == 8 {
                            cur[0][1] = 0
                        }
                    }
                    else {
                        cur[0][1] -= 1
                        if cur[0][1] == -1 {
                            cur[0][1] = 7
                        }
                    }
                }
            }
        }
    }

}
if cur[0][1] - 2 < 0 {
    cur[0][1] += 8
}
if cur[1][1] - 2 < 0 {
    cur[1][1] += 8
}
if cur[2][1] - 2 < 0 {
    cur[2][1] += 8
}
if cur[3][0] + 2 > 7 {
    cur[3][0] -= 8
}
print(A[cur[0][1]-2] + ( 2 * B[cur[1][1]-2] ) + ( 4 * C[cur[2][1]-2] ) + ( 8 * D[cur[3][0]+2] ))
