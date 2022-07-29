var input2 = readLine()!
var q = [Character]()
for inde in input2.indices{
    q.append(input2[inde])
}
var number = [Int]()
var o = 0
for i in 0...q.count-1{
    if q[i] == " "{
        o += 1
    }
    else {
        if o != 0{
            number.append(o)
        }
        o = 0
    }
}

var empty = 0
var input = input2.split(separator: " ")
var temp = [Character]()
var k = 0
for i in 0...input.count-1{
    var array = [Character]()
    
    for index in input[i].indices{
        array.append(input[i][index])
    }
  
    for j in 0...array.count-1{
        
        if array[j] == "<"{
            if (temp.count != 0){
                for s in 0...temp.count-1{
                    print(temp[temp.count-1-s],terminator: "")
                }
            }
            temp.removeAll()
            k = 1
        }
        if k == 0{
            temp.append(array[j])
        }
        if k == 1{
            print(array[j],terminator: "")
        }
        if array[j] == ">"{
            k = 0
        }
        if j == array.count-1 {
            
            
            if (temp.count != 0){
                for s in 0...temp.count-1{
                    print(temp[temp.count-1-s],terminator: "")
                }
                temp.removeAll()
            }
               
            
            if i != input.count-1 {
                for _ in 1...number[empty]{
                    print(" ",terminator: "")
                }
                empty += 1
            }
        }
        
        
    }
}
