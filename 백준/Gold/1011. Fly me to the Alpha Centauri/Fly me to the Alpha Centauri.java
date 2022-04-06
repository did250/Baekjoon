import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        int T = Integer.parseInt(br.readLine());
        for (int i = 0; i<T; i++) {
            String[] n = br.readLine().split(" ");
            int A = Integer.parseInt(n[0]);
            int B = Integer.parseInt(n[1]);
            int D = B-A;
            Integer count = 0;
            int M = 1;
            while (D>0){
                count++;
                D = D-M;
                if (count%2 == 1 && D>0){
                    D = D-M;
                    M++;
                    count++;
                }
            }
            bw.write(count.toString());
            bw.newLine();
        }
        bw.flush();
    }
}