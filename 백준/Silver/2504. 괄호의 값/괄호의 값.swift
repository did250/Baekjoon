var input = readLine()!

var arr = [Character]()
var stack = [Character]()
var answer = 0
var cur = 1
var error = false

for i in input.indices {
    arr.append(input[i])
}

for i in 0..<arr.count{
   
    if arr[i] == "(" {
        stack.append(arr[i])
        cur *= 2
    }
    else if arr[i] == ")" {
        if stack.count == 0 || stack[stack.count-1] != "(" {
            error = true
            break
        }
        else if arr[i-1] == "(" {
            answer += cur
        }
        stack.removeLast()
        cur /= 2
    }
    else if arr[i] == "[" {
        stack.append(arr[i])
        cur *= 3
    }
    else if arr[i] == "]" {
        if stack.count == 0 || stack[stack.count-1] != "[" {
            error = true
            break
        }
        else if arr[i-1] == "[" {
            answer += cur
        }
        stack.removeLast()
        cur /= 3
    }
    else {
        error = true
        break
    }
        
}

if stack.count != 0 {
    error = true
}
if error {
    print("0")
}
else {
    print(answer)
}
