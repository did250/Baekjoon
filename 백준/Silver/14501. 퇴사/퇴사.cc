#include <iostream>
#include <algorithm>

using namespace std;

int main() {

	ios_base::sync_with_stdio(false);
	cin.tie(0);
	cout.tie(0);
	int n;
	cin >> n;
	
	int dp[16] = { 0 };
	int p[16] = { 0 };
	int t[16] = { 0 };
	int answer = 0;
	for (int i = 1; i <= n; i++) {
		cin >> t[i] >> p[i];
		for (int j = 0; j < i; j++) {
			if (t[j] + j <= i && i+t[i]<=n+1) {
				dp[i] = max(dp[i], dp[j]+p[i]);
			
			}
		}
		answer = max(answer,dp[i]);
	}
	
	cout << answer;
	

	return 0;
}