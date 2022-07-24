import java.io.*;

public class Main {
    public static void main (String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        String[] input = br.readLine().split(" ");
        int n = Integer.parseInt(input[0]);
        int k = Integer.parseInt(input[1]);
        int[][] dp = new int[201][201];
        for ( int i = 0; i<=200;i++){
            dp[i][1] = 1;
            dp[i][2] = i + 1;
        }
        for ( int i = 1; i<=200;i++  ){
            dp[1][i] = i;
            dp[0][i] = 1;
        }
        for ( int i = 2; i<=200; i++){
            for ( int j = 3; j<=200; j++ ) {
                for ( int l = 0; l<=i; l++){
                    dp[i][j] =(dp[i][j]+ dp[l][j-1])%1000000000;
                }
            }
        }
        bw.write(String.valueOf(dp[n][k]));
        bw.flush();
        bw.close();
        br.close();
    }
}