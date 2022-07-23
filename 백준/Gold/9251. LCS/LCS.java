import java.io.*;
import java.util.Arrays;
import java.util.Comparator;

public class Main {

    public static void main (String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        String[] arr1 = br.readLine().split("");
        String[] arr2 = br.readLine().split("");
        int[][] answer = new int[arr1.length][arr2.length];

        for ( int i = 0; i<arr1.length; i++){
            if( arr1[i].equals(arr2[0])){
                int k = i;
                for ( int j = k; j<arr1.length; j++){
                    answer[j][0] = 1;
                }
                break;
            }
        }
        for ( int j = 0; j<arr2.length; j++){
            if ( arr2[j].equals(arr1[0])){
                int k = j;
                for ( int i = k; i<arr2.length; i++){
                    answer[0][i] = 1;
                }
            }
        }
        for ( int i = 1; i<arr1.length; i++){
            for ( int j = 1; j<arr2.length; j++){
                if(arr1[i].equals(arr2[j])){
                    answer[i][j] = answer[i-1][j-1]+1;
                }
                else{
                    if ( answer[i-1][j]> answer[i][j-1]) {
                        answer[i][j] = answer[i - 1][j];
                    }
                    else{
                        answer[i][j] = answer[i][j-1];
                    }
                }
            }
        }

        bw.write(String.valueOf(answer[arr1.length-1][arr2.length-1]));
        bw.flush();
        bw.close();
        br.close();
    }



}