# Singleton Design Pattern with Orthogonal Policies

This project implements a powerful and flexible Singleton Design Pattern in C++ using orthogonal strategies, as described in Chapter 6 of Andrei Alexandrescu's *Modern C++ Design* and inspired by the Loki library. The implementation separates concerns into independent policies for creation, threading, and lifetime management, with a focus on thread-safety for multi-threaded environments.

## Features

- **Orthogonal Policies**:
  - **Creation Policy**: Manages object creation and destruction (default: `new`/`delete`).
  - **Threading Policy**: Ensures thread-safety using double-checked locking with `std::mutex` and `std::atomic`.
  - **Lifetime Policy**: Controls the Singleton's lifetime (default: destruction at program exit via `std::atexit`).
- **Modern C++**: Uses C++11+ features (`std::mutex`, `std::atomic`, templates).
- **Extensibility**: Easily customizable by defining new policies.
- **Thread-Safe**: Optimized for multi-threaded environments with minimal locking overhead.

## Files

- `singleton.hpp`: Header file containing the Singleton template and policy implementations.
- `main.cpp`: Example usage of the Singleton with a simple `Example` class.

## Prerequisites

- C++11 or later compatible compiler (e.g., `g++`, `clang++`, MSVC).
- Standard C++ library with support for `<mutex>`, `<atomic>`, and `<memory>`.

## Build Instructions

1. Clone the repository:

   ```bash
   git clone git@github.com:axillles/OS_coloc2.git
   cd OS_coloc2
   ```
2. Compile the code:

   ```bash
   g++ -std=c++11 main.cpp -o singleton
   ```
3. Run the program:

   ```bash
   ./singleton
   ```

## Usage Example

The `main.cpp` file demonstrates how to use the Singleton:

```cpp
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
    instance2.print(); // Same instance
    return 0;
}
```

Expected output:

```
Singleton instance at 0x...
Singleton instance at 0x...  // Same address
```

## Extending the Singleton

To customize the Singleton, define new policies:

- **Creation Policy**: Implement a new class with `static T* create()` and `static void destroy(T*)`.
- **Threading Policy**: Provide a new class with `static std::mutex& get_mutex()`.
- **Lifetime Policy**: Define a new class with `static void schedule_destruction(T*, void (*)())`.

Example of a custom policy:

```cpp
template <typename T>
struct CustomCreationPolicy {
    static T* create() { return new T(42); } // Custom constructor
    static void destroy(T* obj) { delete obj; }
};

using CustomSingleton = Singleton<Example, CustomCreationPolicy>;
```

## Contributing

Feel free to submit issues or pull requests to the repository at `git@github.com:axillles/OS_coloc2.git`.

## License

This project is licensed under the MIT License.