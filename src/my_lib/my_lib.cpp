#include <iostream>
#include <fmt/format.h>
#include <cxxopts.hpp>
#include <spdlog/spdlog.h>
#include <nlohmann/json.hpp>

void print_hello_world(){
    std::cout<<"Hola Crayola"<<std::endl;

    std::cout<<"NLOHMANN_JSON:"<<std::endl;
    std::cout<<NLOHMANN_JSON_VERSION_MAJOR<<std::endl;
    std::cout<<NLOHMANN_JSON_VERSION_MINOR<<std::endl;
    std::cout<<NLOHMANN_JSON_VERSION_PATCH<<std::endl;

    std::cout<<"FMT:"<<std::endl;
    std::cout<<FMT_VERSION<<std::endl;
    
    std::cout<<"SPDLOG:"<<std::endl;
    std::cout<<SPDLOG_VERSION<<std::endl;

    std::cout<<"CXXOPTS:"<<std::endl;
    std::cout<<CXXOPTS__VERSION_MAJOR<<"."<<CXXOPTS__VERSION_MINOR<<"."<<CXXOPTS__VERSION_PATCH<<std::endl;
}