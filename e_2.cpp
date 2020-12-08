#include <iostream>
#include <fstream>
#include <string>
#include <map>

using namespace std;


int prod_of_pair_sum_equal_2020(map<int, int> &m, int sum_value);

int prod_of_pair_sum_equal_2020(map<int, int> &m, int sum_value){

  
  map<int, int>::iterator it;
  map<int, int>::iterator k;

  int v1 = 0;
  int v2 = 0;
  
  for (it = m.begin(); it!= m.end(); it++) {
    k = m.find(sum_value - it->first);
    
    
    if (k->first != 0){
      v1 = it->first;
      v2 = k->first;
      cout << v1 << " " << v2 << " " << " " << sum_value << "\n";    
    };


  }

  
  return v1*v2;
}



int prod_of_trio_sum_equal_2020(map<int, int> m, int sum_value){

  map<int, int>::iterator it;
  map<int, int>::iterator k;


  int first_difference = 0;
  int prod_2 = 0;
  int final_prod = 0;
  
  for (it = m.begin(); it!= m.end(); it++) {

    first_difference = sum_value - it->first;

    prod_2 = prod_of_pair_sum_equal_2020(m, first_difference);
    if (prod_2 != 0){
      final_prod = it->first * prod_2;
    }
  }

  
  return final_prod;
}



int main () {

  std::map<int, int> num_hashmap; 
  int sum_value = 2020;
  int final_prod;
  
  string line;
  ifstream myfile ("input_1");

  
  if (myfile.is_open())
  {
    while ( getline (myfile,line) )
    {

      
      num_hashmap[std::stoi(line)] = 1;

    }
    myfile.close();

    //final_prod = prod_of_pair_sum_equal_2020(num_hashmap, sum_value);
    final_prod = prod_of_trio_sum_equal_2020(num_hashmap, sum_value);
    
    
  }

  else cout << "Unable to open file"; 

  cout << final_prod <<"\n";
  return 0;
}
