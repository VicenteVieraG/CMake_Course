#include <iostream>
#include <nlohmann/json.hpp>
#include "my_lib.h"
#include "config.hpp"

int main(int argc, char** argv){
    print_hello_world();
    std::cout<<NLOHMANN_JSON_VERSION_MAJOR<<std::endl;

    return 0;
}