#include <iostream>
#include <nlohmann/json.hpp>
#include <juce_Colour.h>
#include <juce_opengl/juce_opengl.h>
#include "my_lib.h"
#include "config.hpp"

juce::Slider S;

int main(int argc, char** argv){
    print_hello_world();
    std::cout<<NLOHMANN_JSON_VERSION_MAJOR<<std::endl;
    std::cout<<S.getBottom();

    return 0;
}