#include <cstdio>
#include <string>

struct Account {
    Account(const std::string &s) : name(s) {}
    virtual ~Account() {}
    void showName() {
        printf("Account name is: %s\n", name.c_str());
    }
    void adminStuff() { 
        printf("Not Implemented\n");
	}
    std::string name;
};

struct UserAccount : Account {
    UserAccount(const std::string &s) : Account(s) {}
    virtual ~UserAccount() {}
    void adminStuff() { 
        printf("Admin Work not permitted for a user account!\n");
    }
};

struct AdminAccount : Account {
    AdminAccount(const std::string &s) : Account(s) {}
    virtual ~AdminAccount() {}
    void adminStuff() { 
        printf("Would do admin work in context of: %s\n", this->name.c_str());
    }
};

int main(int argc, const char *argv[]) {

    UserAccount* user = new UserAccount("user");
    AdminAccount* admin = new AdminAccount("admin");

    (void)(argc);
    (void)(argv);

    printf("Admin check: \n");
    admin->showName();
    admin->adminStuff();

    printf("User check: \n");
    user->showName();
    user->adminStuff();
    
    // imagine this change happens via memory corruption,
    // type confusion, deserialization vulnerability,
    // or a similar flaw
    Account *account = static_cast<Account*>(user);
    AdminAccount *admin_it = static_cast<AdminAccount*>(account);

    admin_it->showName();
    printf("CFI Should prevent the actions below:\n");
    admin_it->adminStuff();

    return 0;
}
