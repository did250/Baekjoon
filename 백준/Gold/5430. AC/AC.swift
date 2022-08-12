import Foundation

var testcase = Int(readLine()!)!
for _ in 1...testcase{
    var input = readLine()!
    var len = Int(readLine()!)!
    var nums = readLine()!.components(separatedBy: [",","[","]"])
    
    nums.removeFirst()
    nums.removeLast()
    
    var start = 0
    var end = len-1
    var reversed = false
    var error = false
    
    for i in input {
        if i == "D"{
            if start > end {
                error = true
                break
            }
            if reversed {
                end -= 1
            }
            else {
                start += 1
            }
        }
        else {
            reversed.toggle()
        }
    }
    
    if error {
        print("error")
    }
    else if start > end {
        print("[]")
    }
    else {
        var ans = ""
        if reversed {
            ans = nums[start...end].reversed().map { String($0) }.joined(separator: ",")
        }
        else {
            ans = nums[start...end].map { String($0) }.joined(separator: ",")
        }
        print("[\(ans)]")
    }
}
