var input = Int(readLine()!)!
for _ in 1...input{
    var input2 = readLine()!
    var maxx = 0
    var maxy = 0
    var minx = 0
    var miny = 0
    var x = 0
    var y = 0
    var arrow = 0
    var arr = [Character]()
    for s in input2.indices{
        arr.append(input2[s])
    }
    for i in 0...arr.count-1{
        if arr[i] == "F"{
            if arrow == 0{
                y += 1
            }
            else if arrow == 1{
                x += 1
            }
            else if arrow == 2{
                y -= 1
            }
            else if arrow == 3{
                x -= 1
            }
        }
        else if arr[i] == "B"{
            if arrow == 0{
                y -= 1
            }
            else if arrow == 1{
                x -= 1
            }
            else if arrow == 2{
                y += 1
            }
            else if arrow == 3{
                x += 1
            }
        }
        else if arr[i] == "L"{
            if arrow == 0 {
                arrow = 3
            }
            else {
                arrow -= 1
            }
        }
        else if arr[i] == "R"{
            arrow += 1
            if arrow == 4{
                arrow = 0
            }
        }
        if x > maxx {
            maxx = x
        }
        if x < minx {
            minx = x
        }
        if y > maxy {
            maxy = y
        }
        if y < miny {
            miny = y
        }
        
    }
    print((maxx-minx)*(maxy-miny))
}
