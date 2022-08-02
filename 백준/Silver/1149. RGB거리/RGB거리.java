import java.io.*;

public class Main {
    public static void main(String args[]) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        int N = Integer.parseInt(br.readLine());
        int[][] arr = new int[N][3];
        int[][] arr2 = new int[N][3];
        for ( int i = 0; i<N; i++){
            String[] input = br.readLine().split(" ");
            arr[i][0] = Integer.parseInt(input[0]);
            arr[i][1] = Integer.parseInt(input[1]);
            arr[i][2] = Integer.parseInt(input[2]);
        }
        arr2[0][0] = arr[0][0];
        arr2[0][1] = arr[0][1];
        arr2[0][2] = arr[0][2];
        for ( int i = 1; i<N; i++){
            if ( arr2[i-1][1] < arr2[i-1][2]){
                arr2[i][0] = arr2[i-1][1]+ arr[i][0];
            }
            else{
                arr2[i][0] = arr2[i-1][2]+ arr[i][0];
            }
            if ( arr2[i-1][0] < arr2[i-1][2]){
                arr2[i][1] = arr2[i-1][0]+ arr[i][1];
            }
            else{
                arr2[i][1] = arr2[i-1][2]+ arr[i][1];
            }
            if ( arr2[i-1][1] < arr2[i-1][0]){
                arr2[i][2] = arr2[i-1][1]+ arr[i][2];
            }
            else{
                arr2[i][2] = arr2[i-1][0]+ arr[i][2];
            }
        }
        if(arr2[N-1][0]<=arr2[N-1][1] && arr2[N-1][0]<= arr2[N-1][2]){
            bw.write(String.valueOf(arr2[N-1][0]));
        }
        else if(arr2[N-1][2]<=arr2[N-1][1] && arr2[N-1][2]<= arr2[N-1][1]){
            bw.write(String.valueOf(arr2[N-1][2]));
        }
        else{
            bw.write(String.valueOf(arr2[N-1][1]));
        }
        bw.flush();
        bw.close();
        br.close();
    }
}