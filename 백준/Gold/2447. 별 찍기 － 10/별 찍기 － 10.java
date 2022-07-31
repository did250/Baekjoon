import java.io.*;

public class Main {
    public static void main(String args[]) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        int B = Integer.parseInt(br.readLine());
        char[][] SSS = new char[B+1][B+1];
        for ( int i = 1 ; i<B+1; i++) {
            for (int j = 1; j < B + 1; j++) {
                SSS[i][j] = '*';
            }
        }
        int C = B;
        for ( int K = 0; K<C+1; K++){
            for ( int i = 1 ; i<C+1; i++) {
                for (int j = 1; j < C + 1; j++) {
                    if (B / 3 < i%B && i%B <= 2 * B / 3 && B / 3 < j%B && j%B <= 2 * B / 3) {
                        SSS[i][j] = ' ';
                    }
                }
            }
            B=B/3;
            if ( B== 1){
                break;
            }
        }
        for ( int i = 1 ; i<C+1; i++) {
            for (int j = 1; j < C + 1; j++) {
                bw.write(SSS[i][j]);
                if ( j == C){
                    bw.newLine();
                }
            }
        }
        bw.flush();
        br.close();
        bw.close();
    }
}
