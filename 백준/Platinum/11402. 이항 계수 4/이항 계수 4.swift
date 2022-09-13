let input = readLine()!.split(separator: " ").map {Int(String($0))!}
var (N,M,K) = (input[0],input[1],input[2])
if N == M || M == 0 {
    print("1")
}
else if M == 1 {
    print(N%K)
}
else {
    var dp = [Int]()
    var dp2 = [Int]()
    var binomial = Array(repeating: Array(repeating: 1, count: K+1), count: K+1)

    var m = 0
    while (true) {
        dp2.append(M%K)
        dp.append(N%K)
        m = max(m,N%K, M%K)
        N = N/K
        M = M/K
        if M <= 0 {
            break
        }
    }
    if m >= 2 {
        for i in 2...m {
            for j in 1...i {
                if j != i {
                    binomial[i][j] = (binomial[i-1][j]%K) + (binomial[i-1][j-1]%K)
                    binomial[i][j] %= K
                }
            }
        }
    }
    var answer = 1
    for i in stride(from: dp2.count-1, to: -1, by: -1) {
        if dp[i] < dp2[i] {
            answer = 0
            break
        }
        answer = answer * binomial[dp[i]][dp2[i]] % K
    }
    print(answer)

}
