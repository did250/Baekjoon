import java.util.Scanner;
class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int m = sc.nextInt();
        int map[][] = new int[n][m];
        int ans[][] = new int[n][m];
        int q = sc.nextInt();
        for ( int i = 0; i<q; i++) {
            int x = sc.nextInt();
            int y = sc.nextInt();
            map[x-1][y-1] = 1;
            ans[x-1][y-1] = 1;
        }
        int night = sc.nextInt();
        for ( int i = 0;i<night;i++) {
            int x = sc.nextInt();
            int y = sc.nextInt();
            map[x-1][y-1] = 2;
            ans[x-1][y-1] = 1;
        }
        int p = sc.nextInt();
        for ( int i = 0; i<p;i++){
            int x = sc.nextInt();
            int y = sc.nextInt();
            map[x-1][y-1] = 3;
            ans[x-1][y-1] = 1;
        }
        for ( int i = 0; i<n; i++) {
            for (int j = 0; j<m; j++) {
                if (map[i][j] == 1) {
                    for ( int s = i; s<n; s++) {
                        if (s != i && map[s][j] == 0) {
                            ans[s][j] = 1;
                        }
                        else if (s != i && map[s][j] != 0) {
                            break;
                        }

                    }
                    for ( int s = i; s>=0; s--) {
                        if (s != i && map[s][j] == 0) {
                            ans[s][j] = 1;
                        }
                        else if (s != i && map[s][j] != 0) {
                            break;
                        }
                    }
                    for ( int s = j; s>=0; s--) {
                        if (s != j && map[i][s] == 0) {
                            ans[i][s] = 1;
                        }
                        else if (s != j && map[i][s] != 0) {
                            break;
                        }
                    }
                    for ( int s = j; s<m; s++) {
                        if (s != j && map[i][s] == 0) {
                            ans[i][s] = 1;
                        }
                        else if (s != j && map[i][s] != 0) {
                            break;
                        }
                    }
                    int idx = -1;
                    for ( int s = i; s<n; s++) {
                        idx += 1;
                        if (j + idx >= m) {
                            break;
                        }
                        if (s != i && map[s][j+idx] == 0) {
                            ans[s][j+idx] = 1;
                        }
                        else if (s != i && map[s][j+idx] != 0) {
                            break;
                        }

                    }
                    idx = -1;
                    for ( int s = i; s<n; s++) {
                        idx += 1;
                        if (j-idx < 0) {
                            break;
                        }
                        if (s != i && map[s][j-idx] == 0) {
                            ans[s][j-idx] = 1;
                        }
                        else if (s != i && map[s][j-idx] != 0) {
                            break;
                        }
                    }
                    idx = -1;
                    for ( int s = i; s>=0; s--) {
                        idx += 1;
                        if (j-idx < 0) {
                            break;
                        }
                        if (s != i && map[s][j-idx] == 0) {
                            ans[s][j-idx] = 1;
                        }
                        else if (s != i && map[s][j-idx] != 0) {
                            break;
                        }
                    }
                    idx = -1;
                    for ( int s = i; s>=0; s--) {
                        idx += 1;
                        if (j+idx >= m) {
                            break;
                        }
                        if (s != i && map[s][j+idx] == 0) {
                            ans[s][j+idx] = 1;
                        }
                        else if (s != i && map[s][j+idx] != 0) {
                            break;
                        }
                    }
                }
            }

        }
        int dx[] = {-2,-2,2,2,-1,1,-1,1};
        int dy[] = {-1,1,-1,1,-2,-2,2,2};
        for ( int i = 0; i<n; i++) {
            for (int j = 0; j<m; j++) {
                if ( map[i][j] == 2 ) {
                    for (int s = 0; s<8;s++) {
                        int nx = dx[s] + i;
                        int ny = dy[s] + j;
                        if (nx >=0 && ny >= 0 && nx<n && ny<m ) {
                            if (map[nx][ny] != 1) {
                                ans[nx][ny] = 1;
                            }
                        }
                    }
                }

            }

        }
        int answer = 0;
        for ( int i = 0; i<n; i++) {
            for (int j = 0; j<m; j++) {
                if (ans[i][j] == 0) {
                    answer += 1;
                }

            }

        }
        System.out.println(answer);
//        for ( int i = 0; i<n; i++) {
//            for (int j = 0; j<m; j++) {
//
//                System.out.print(ans[i][j]);
//            }
//            System.out.println();
//        }
     }


}