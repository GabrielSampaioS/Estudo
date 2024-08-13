#include <iostream>
#include <vector>

using namespace std;

int binarySearch(vector <int> &vec, int target){
    int left = 0, right = vec.size() - 1;
    while(left <= right){
        int mid = (left + right) / 2;
        if(vec[mid] == target) 
            return mid;
        if(vec[mid] < target) 
            left = mid + 1;
        else 
            right = mid -1;
    }
    return -1;
}



int main(){
    vector  <int> vec = {1,2,3,5,6,7,8,22,33,54,68,68,99,457,784,874};
    int target = 99;
    int result = binarySearch(vec, target);

    if (result == -1) cout << "O elemento não foi encontrado" << endl;
    else cout << "O elemento esta na posicao " << result << endl;

    int x;
    cin >>x;
    return 0;
}