let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var (N, K) = (input[0],input[1])
var answer = 0
var used = Array(repeating: false, count: 26)
var words:[[Character]] = Array(repeating: [], count: N)
for j in 0..<N {
    let s = readLine()!.map{String($0)}
    if s.count != 8 {
        for i in 4...s.count-5 {
            if s[i] != "a" && s[i] != "n" && s[i] != "t" && s[i] != "i" && s[i] != "c" && !words[j].contains(Character(s[i])){
                words[j].append(Character(s[i]))
            }
        }
    }
}

if K < 5 {
    print("0")
}
else if K == 26 {
    print(N)
}
else {
    used[0] = true
    used[2] = true
    used[8] = true
    used[13] = true
    used[19] = true
    K -= 5
    dfs(0,0)
    print(answer)
}

func dfs(_ idx:Int, _ cnt:Int) {
    if cnt == K {
        var cur = 0
        for t in 0..<N {
            if words[t].count == 0 {
                cur += 1
            }
            else {
                for i in 0...words[t].count-1 {
                    if !used[Int(words[t][i].asciiValue!)-97] {
                        break
                    }
                    if i == words[t].count-1 {
                        cur += 1
                    }
                }
            }
        }
        answer = max(answer,cur)
        return
    }
    for i in idx...25 {
        if !used[i] {
            used[i] = true
            dfs(i, cnt+1)
            used[i] = false
        }
    }
}
