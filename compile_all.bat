set PATH=C:\Program Files\LLVM\bin;%PATH%

clang++ -fvisibility=default -fsanitize=cfi,cfi-cast-strict -flto -fno-sanitize-trap=all -fuse-ld=lld -o default/cfi_cast_strict.exe cfi_cast_strict.cpp
clang++ -fvisibility=default -fsanitize=cfi,cfi-cast-strict -flto -fno-sanitize-trap=all -fuse-ld=lld -o default/cfi_derived_cast.exe cfi_derived_cast.cpp
clang++ -fvisibility=default -fsanitize=cfi,cfi-cast-strict -flto -fno-sanitize-trap=all -fuse-ld=lld -o default/cfi_icall.exe cfi_icall.c
clang++ -fvisibility=default -fsanitize=cfi,cfi-cast-strict -flto -fno-sanitize-trap=all -fuse-ld=lld -o default/cfi_nvcall.exe cfi_nvcall.cpp
clang++ -fvisibility=default -fsanitize=cfi,cfi-cast-strict -flto -fno-sanitize-trap=all -fuse-ld=lld -o default/cfi_unrelated_cast.exe cfi_unrelated_cast.cpp
clang++ -fvisibility=default -fsanitize=cfi,cfi-cast-strict -flto -fno-sanitize-trap=all -fuse-ld=lld -o default/cfi_vcall.exe cfi_vcall.cpp


clang++ -fvisibility=hidden -fsanitize=cfi,cfi-cast-strict -flto -fno-sanitize-trap=all -fuse-ld=lld -o hidden/cfi_cast_strict.exe cfi_cast_strict.cpp
clang++ -fvisibility=hidden -fsanitize=cfi,cfi-cast-strict -flto -fno-sanitize-trap=all -fuse-ld=lld -o hidden/cfi_derived_cast.exe cfi_derived_cast.cpp
clang++ -fvisibility=hidden -fsanitize=cfi,cfi-cast-strict -flto -fno-sanitize-trap=all -fuse-ld=lld -o hidden/cfi_icall.exe cfi_icall.c
clang++ -fvisibility=hidden -fsanitize=cfi,cfi-cast-strict -flto -fno-sanitize-trap=all -fuse-ld=lld -o hidden/cfi_nvcall.exe cfi_nvcall.cpp
clang++ -fvisibility=hidden -fsanitize=cfi,cfi-cast-strict -flto -fno-sanitize-trap=all -fuse-ld=lld -o hidden/cfi_unrelated_cast.exe cfi_unrelated_cast.cpp
clang++ -fvisibility=hidden -fsanitize=cfi,cfi-cast-strict -flto -fno-sanitize-trap=all -fuse-ld=lld -o hidden/cfi_vcall.exe cfi_vcall.cpp