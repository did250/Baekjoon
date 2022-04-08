import java.io.*;
import java.util.Arrays;

public class Main {

    public static void main (String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        int n = Integer.parseInt(br.readLine());
        int[] arr = new int[n];
        for (int i = 0; i<n; i++){
            arr[i] = Integer.parseInt(br.readLine());
        }
        Arrays.sort(arr);
        int GG = arr[1] - arr[0];
        for ( int i = 2; i<n; i++){
            GG = gcd(GG, arr[i] - arr[i-1]);
        }
        for ( int i = 2; i<=GG; i++){
            if ( GG%i == 0){
                bw.write(String.valueOf(i)+" ");
            }
        }
        bw.flush();
        bw.close();
        br.close();
    }
    public static int gcd( int A, int B){
        while ( B!=0){
            int r = A%B;
            A=B;
            B=r;
        }
        return A;
    }
}