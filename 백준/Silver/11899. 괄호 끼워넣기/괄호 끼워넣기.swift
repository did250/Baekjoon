var input = readLine()!
var cnt = 0
var cnt2 = 0
var answer = 0
for i in input.indices {
    if input[i] == "("{
        cnt += 1
    }
    else {
        cnt2 += 1
    }
    if cnt2 > cnt {
        answer += 1
        cnt2 -= 1
    }
}
answer += cnt - cnt2
print(answer)

