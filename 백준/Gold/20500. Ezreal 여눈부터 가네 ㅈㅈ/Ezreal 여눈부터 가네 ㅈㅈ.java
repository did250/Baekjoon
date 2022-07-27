import java.io.*;

public class Main {

    public static void main (String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        int n = Integer.parseInt(br.readLine());
        long[][] dp = new long[1516][3];
        dp[0][0] = dp[0][1] = dp[0][2] = 0;
        dp[1][1] = 1;
        dp[1][0] = 0;
        dp[1][2] = 1;
        for ( int i = 2; i<=n; i++){
            dp[i][0] = (dp[i-1][2] + dp[i-1][1])%1000000007;
            dp[i][1] = (dp[i-1][0] + dp[i-1][2])%1000000007;
            dp[i][2] = (dp[i-1][1] + dp[i-1][0])%1000000007;
        }

        bw.write(String.valueOf(dp[n-1][1]));
        bw.flush();
        bw.close();
        br.close();
    }

}