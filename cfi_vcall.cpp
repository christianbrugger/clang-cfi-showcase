#include <cstdio>

struct Base {
    Base() {}
    virtual ~Base() {}
    virtual void printMe() { 
	    printf("Base::printMe\n");
    }
};

struct Derived : Base {
    Derived() {}
    virtual ~Derived() {}

    virtual void printMe() {
	    printf("Derived::printMe\n");
    }
};

// imagine this is an attacker-created structure 
// in memory
struct Evil {
    Evil() {}
    virtual ~Evil() {}

    virtual void makeAdmin() {
	    printf("CFI Prevents this control flow\n");
	    printf("Evil::makeAdmin\n");
    }
};

int main(int argc, const char *argv[]) {

    Evil *eptr = new Evil();
    Derived* dptr = new Derived();

    (void)(argc);
    (void)(argv);

    dptr->printMe();
    
    // imagine a type confusion vulnerability
    // that does something similar
    dptr = reinterpret_cast<Derived*>(eptr);
    dptr->printMe();

    return 0;
}
