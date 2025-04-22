#ifndef SINGLETON_HPP
#define SINGLETON_HPP

#include <mutex>
#include <memory>
#include <atomic>

template <typename T>
struct DefaultCreationPolicy {
    static T* create() {
        return new T();
    }
    static void destroy(T* obj) {
        delete obj;
    }
};

template <typename T>
struct ThreadSafePolicy {
    static std::mutex& get_mutex() {
        static std::mutex mutex;
        return mutex;
    }
};

template <typename T>
struct DefaultLifetimePolicy {
    static void schedule_destruction(T*, void (*func)()) {
        std::atexit(func);
    }
};

template <
    typename T,
    template <typename> class CreationPolicy = DefaultCreationPolicy,
    template <typename> class ThreadingPolicy = ThreadSafePolicy,
    template <typename> class LifetimePolicy = DefaultLifetimePolicy
>
class Singleton {
public:
    static T& instance() {
        T* temp = instance_.load(std::memory_order_acquire);
        if (!temp) {
            std::lock_guard<std::mutex> lock(ThreadingPolicy<T>::get_mutex());
            temp = instance_.load(std::memory_order_relaxed);
            if (!temp) {
                temp = CreationPolicy<T>::create();
                instance_.store(temp, std::memory_order_release);
                LifetimePolicy<T>::schedule_destruction(temp, &Singleton::destroy);
            }
        }
        return *temp;
    }

private:
    static void destroy() {
        T* temp = instance_.load(std::memory_order_relaxed);
        if (temp) {
            CreationPolicy<T>::destroy(temp);
            instance_.store(nullptr, std::memory_order_release);
        }
    }

    static std::atomic<T*> instance_;
};

template <typename T, template <typename> class CP, template <typename> class TP, template <typename> class LP>
std::atomic<T*> Singleton<T, CP, TP, LP>::instance_{nullptr};

#endif
