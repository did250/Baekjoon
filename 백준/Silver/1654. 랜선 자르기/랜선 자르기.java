import java.util.Scanner;
class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int K = sc.nextInt();
        long N = sc.nextLong();
        long arr[] = new long[K];
        long max = 0;
        for (int i = 0; i < K; i++) {
            arr[i] = sc.nextLong();
            max = Math.max(max, arr[i]);
        }
        long left = 1;
        long right = max;
        while (left <= right) {
            long mid = (left + right) / 2;
            long temp = 0;
            for (int i = 0; i < K; i++) {
                temp += (arr[i] / mid);
            }
            if (temp < N) {
                right = mid - 1;
            }
            else {
                left = mid + 1;
            }
        }
        System.out.println(right);
    }
}