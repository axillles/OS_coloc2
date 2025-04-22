#include "singleton.hpp"
#include <iostream>

class Example {
public:
    void print() const {
        std::cout << "Singleton instance at " << this << std::endl;
    }
};

int main() {
    Example& instance1 = Singleton<Example>::instance();
    instance1.print();

    Example& instance2 = Singleton<Example>::instance();
    instance2.print();

    return 0;
}
