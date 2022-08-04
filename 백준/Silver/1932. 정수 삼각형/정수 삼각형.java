import java.io.*;

public class Main {
    public static void main (String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        int n = Integer.parseInt(br.readLine());
        int[][] arr = new int[n+1][n+1];
        for ( int i = 1; i<=n; i++){
            String[] input = br.readLine().split(" ");
            for ( int j = 1; j<i+1; j++){
                if ( i == 1 && j==1) {
                    arr[i][j] = Integer.parseInt(input[j - 1]);
                }
                else if (j == 1){
                    arr[i][j] = arr[i-1][j] + Integer.parseInt(input[j-1]);
                }
                else{
                    int A;
                    if ( arr[i-1][j]>= arr[i-1][j-1]){
                        A = arr[i-1][j];
                    }
                    else{
                        A = arr[i-1][j-1];
                    }
                    arr[i][j] = Integer.parseInt(input[j-1]) + A;
                }
            }
        }
        int max= 0;
        for ( int i = 1; i<=n; i++){
            if ( arr[n][i] > max){
                max = arr[n][i];
            }
        }
        bw.write(String.valueOf(max));
        bw.flush();
        bw.close();
        br.close();
    }
}