import java.io.*;


public class Main {
    static int[][] arr = new int[9][9];
    static int count=0;
    static boolean[] num = new boolean[9];
    static int[][] arr2;
    static int L;
    static int[][] arr3;
    static BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
    public static void main (String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        for ( int i = 0; i<9; i++){
            String[] n = br.readLine().split(" ");
            for ( int j = 0; j<9; j++){
                arr[i][j] = Integer.parseInt(n[j]);
                if ( arr[i][j] == 0){
                    count++;
                }
            }
        }
        int idx = 0;
        L = count;
        arr2 = new int[count][2];
        for ( int i = 0; i<9; i++){
            for ( int j = 0; j<9;j++){
                if ( arr[i][j] == 0){
                    arr2[idx][0] = i;
                    arr2[idx][1] = j;
                    idx++;
                }
            }
        }
        sdk();
        idx = 0;
        arr3= new int[L][2];
        for ( int i = 0; i<9; i++){
            for ( int j = 0; j<9; j++){
                if (arr[i][j] == 0) {
                    arr3[idx][0] = i;
                    arr3[idx][1] = j;
                    idx++;
                }
            }

        }

        for ( int j = 0;j<9; j++){
            num[j] = false;
        }
        if( idx == 0){
            for ( int i = 0; i<9; i++){
                for ( int j = 0; j<9; j++){
                    bw.write(String.valueOf(arr[i][j])+ " ");
                }
                bw.newLine();
            }
        }
        else{
            rest(0);
        }

        bw.flush();
        bw.close();
        br.close();
    }
    public static void sdk (){
        int R=0;
        int O = 0;
        for ( int i = 0; i<L; i++){
            if ( i == 0){
                O = R;
            }
            if (arr[arr2[i][0]][arr2[i][1]] == 0){
                arr[arr2[i][0]][arr2[i][1]] = cal(arr2[i][0],arr2[i][1]);
                if (arr[arr2[i][0]][arr2[i][1]] != 0) {
                    R++;
                }
            }
            if ( R == L){
                break;
            }

            if ( i == L-1){

                i = -1;
                if ( R == O){
                    L = L - R;
                    return;
                }
            }
        }
        return;
    }
    public static int cal( int D, int C){
        int k = 0;
        for ( int i = 0; i<9; i++) {
            if (arr[D][i] != 0) {
                num[arr[D][i] - 1] = true;
            }
            if (arr[i][C] != 0) {
                num[arr[i][C] - 1] = true;
            }
        }
        int x = D/3 *3;
        int y = C/3 *3;

        for ( int i = x; i< x+3; i++){
            for ( int j = y; j < y+3; j++){

                if (arr[i][j] != 0) {
                    num[arr[i][j] - 1] = true;
                }
            }
        }
        int p = 0;
        for ( int i = 0; i<9; i++){
            if(num[i] == false){
                p++;
                k = i;
            }
        }
        for ( int i = 0; i<9; i++){
            num[i] = false;
        }
        if (p==1){
            return k+1;
        }
        else{
            return 0;
        }
    }
    public static void rest(int V) throws IOException {
        boolean[] num2 = new boolean[9];

        for ( int j = 0;j<9; j++){
            num2[j] = false;
        }
        if ( V == L){
            for ( int i = 0; i<9; i++){
                for ( int j = 0; j<9; j++){
                    bw.write(String.valueOf(arr[i][j]));
                    bw.write(" ");
                }
                bw.newLine();
            }
            bw.flush();
            System.exit(0);
            return;
        }
        int D = arr3[V][0];
        int C = arr3[V][1];
        for ( int i = 0; i<9; i++) {
            if (arr[D][i] != 0) {
                num2[arr[D][i] - 1] = true;
            }
            if (arr[i][C] != 0) {
                num2[arr[i][C] - 1] = true;
            }
        }
        int x = D/3 *3;
        int y = C/3 *3;
        for ( int i = x; i< x+3; i++){
            for ( int j = y; j < y+3; j++){

                if (arr[i][j] != 0) {
                    num2[arr[i][j] - 1] = true;
                }
            }
        }
        int HH = 0;
        for ( int m = 0; m<9; m++){
            if ( num2[m] == false){
                HH++;
                break;
            }
        }
        if (HH == 0) {
            arr[arr3[V + 1][0]][arr3[V + 1][1]] = 0;
            arr[arr3[V][0]][arr3[V][1]] = 0;
            arr[arr3[V-1][0]][arr3[V-1][1]] = 0;
            return;
        }
        for ( int i = 0; i<9; i++){
            if (!num2[i] && V<L){
                arr[D][C] = i+1;
                rest (V+1);
                num[i] = true;
            }
            if ( i == 8){
                arr[arr3[V + 1][0]][arr3[V + 1][1]] = 0;
                arr[arr3[V][0]][arr3[V][1]] = 0;
                arr[arr3[V-1][0]][arr3[V-1][1]] = 0;
                return;
            }

        }
    }
}