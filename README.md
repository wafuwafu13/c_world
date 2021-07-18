```zsh
$ docker run -it --name "c_world" --cap-add=SYS_PTRACE --security-opt="seccomp=unconfined" c_world /bin/bash

$ docker ps -a
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS                     PORTS     NAMES
3d3a4ae894eb   c_world   "/bin/bash"   13 minutes ago   Exited (0) 6 minutes ago             c_world

$ docker images
REPOSITORY                           TAG        IMAGE ID       CREATED         SIZE
c_world                              latest     d4b117036c0f   23 hours ago    1.58GB

$ docker start c_world
c_world

$ docker attach c_world
[root@3d3a4ae894eb ~]#

[root@3d3a4ae894eb ~]# vi main.c

#include <stdio.h>

int main(void)
{
  int sum = 0;
  sum++;
  sum++;
  printf("sum = %d\n", sum );
  return 0;
}

[root@3d3a4ae894eb ~]# gcc -g -o main main.c
[root@3d3a4ae894eb ~]# ./main
sum = 2

[root@3d3a4ae894eb ~]# vi main.cpp

include <bits/stdc++.h>
using namespace std;

int main() {
  int sum = 0;
  sum++;
  sum++;
  cout << "sum =" << sum << endl;
}

[root@3d3a4ae894eb ~]# g++ -g -o main main.cpp
[root@3d3a4ae894eb ~]# ./main
2

[root@3d3a4ae894eb ~]# gdb main
(gdb) l
1       #include <bits/stdc++.h>
2       using namespace std;
3
4       int main() {
5         int sum = 0;
6         sum++;
7         sum++;
8         cout << sum << endl;
9       }
(gdb) b 7
Breakpoint 1 at 0x4007c0: file min.cpp, line 7.
(gdb) r
Starting program: /root/main

Breakpoint 1, main () at min.cpp:7
7         sum++;
Missing separate debuginfos, use: debuginfo-install glibc-2.17-324.el7_9.x86_64 libgcc-4.8.5-44.el7.x86_64 libstdc++-4.8.5-44.el7.x86_64
(gdb) p sum
$1 = 1
(gdb) n
8         cout << sum << endl;
(gdb) p sum
$2 = 2

(gdb) quit
```

Ref: https://qiita.com/Be-cricket/items/0d6da899045a1cbab3ea
