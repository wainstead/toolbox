/* basic c++ stuff */
#include <string>
#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

int main()
{
  vector<string> v;
  ifstream in("Hello.cpp");
  string word;
  int bracecount = 0;

  cout << "Hello, sailor!" << endl;

  while(in >> word) {
    v.push_back(word);
  }

  for (uint i = 1; i < v.size(); i++) {
    if ( v[i] == "}" ) bracecount++;   // count braces
    cout << i << ": " << v[i] << endl; // output words with number
  }

  cout << "braces: " << bracecount  << endl;
  return (0);
}
