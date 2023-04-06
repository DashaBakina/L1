#include <iostream>

using namespace std;

extern "C" float funcasm(int x, int y);

int main()
{
    int x, y;

   /* cout << "Input x: " << endl;
    cin >> x;
    cout << "Input y: " << endl;
    cin >> y;*/

    x = 0;
    y = 2;

    float R = funcasm(x,y);
          
    cout << "Result: " << R << endl;
    return 0;

}

