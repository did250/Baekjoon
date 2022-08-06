var t = Int(readLine()!)!
var dic : [String:Int] = [:]
for _ in 0..<t{
    let s = readLine()!
    var arr = s.split(separator: ".")
    
    if dic.keys.contains(String(arr[1])) {
        dic[String(arr[1])] = dic[String(arr[1])]! + 1
    }
    else{
        dic[String(arr[1])] = 1
    }
}
for key in dic.keys.sorted() {
    print(key, dic[key]!, separator: " ")
    
}
