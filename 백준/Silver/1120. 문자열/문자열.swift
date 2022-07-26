var input = readLine()!.split(separator: " ")

var t = 100
var S1 = [Character]()
var S2 = [Character]()
for i in input[0]{
    S1.append(i)
}
for i in input[1]{
    S2.append(i)
}
for i in 0...S2.count-S1.count{
    var s = 0
    for j in 0...S1.count-1{
        if S1[j] != S2[j+i]{
            s += 1
        }
    }
    if ( t>s){
        t = s
    }
}
print(t)
