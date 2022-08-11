import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        String[] input1 = br.readLine().split(" ");
        int n = Integer.parseInt(input1[0]);
        int w = Integer.parseInt(input1[1]);
        int L = Integer.parseInt(input1[2]);
        int truck[] = new int[n];
        String[] input2 = br.readLine().split(" ");
        for (int i = 0; i < n; i++) {
            truck[i] = Integer.parseInt(input2[i]);
        }
        int bridge[][] = new int[w][2];
        int time = 0;
        int idx = 0;
        while(true){
            time++;
            int now = 0;
            for (int i = 0; i<w;i++){
                if ( bridge[i][0] != 0){
                    bridge[i][1]++;
                    if ( bridge[i][1] == w+1){
                        bridge[i][0] = 0;
                        bridge[i][1] = 0;
                    }
                }
                now += bridge[i][0];
            }
            if (idx<n) {
                if (now + truck[idx] <= L) {
                    for (int i = 0; i < w; i++) {
                        if (bridge[i][0] == 0) {
                            bridge[i][0] = truck[idx];
                            bridge[i][1] = 1;
                            idx++;
                            break;
                        }
                    }
                }
            }
            if ( idx == n){
                int k = 0;
                for ( int i = 0; i<w;i++){
                    if ( bridge[i][0] == 0){
                        k++;
                    }
                }
                if ( k == w){
                    System.out.println(time);
                    break;
                }
            }

        }
    }
}
