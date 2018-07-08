
_usertests:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 de 4d 00 00       	push   $0x4dde
      16:	6a 01                	push   $0x1
      18:	e8 b3 3a 00 00       	call   3ad0 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	5a                   	pop    %edx
      1e:	59                   	pop    %ecx
      1f:	6a 00                	push   $0x0
      21:	68 f2 4d 00 00       	push   $0x4df2
      26:	e8 87 39 00 00       	call   39b2 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 14                	js     46 <main+0x46>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	83 ec 08             	sub    $0x8,%esp
      35:	68 5c 55 00 00       	push   $0x555c
      3a:	6a 01                	push   $0x1
      3c:	e8 8f 3a 00 00       	call   3ad0 <printf>
    exit();
      41:	e8 2c 39 00 00       	call   3972 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      46:	50                   	push   %eax
      47:	50                   	push   %eax
      48:	68 00 02 00 00       	push   $0x200
      4d:	68 f2 4d 00 00       	push   $0x4df2
      52:	e8 5b 39 00 00       	call   39b2 <open>
      57:	89 04 24             	mov    %eax,(%esp)
      5a:	e8 3b 39 00 00       	call   399a <close>

  argptest();
      5f:	e8 3c 36 00 00       	call   36a0 <argptest>
  createdelete();
      64:	e8 c7 11 00 00       	call   1230 <createdelete>
  linkunlink();
      69:	e8 b2 1a 00 00       	call   1b20 <linkunlink>
  concreate();
      6e:	e8 7d 17 00 00       	call   17f0 <concreate>
  fourfiles();
      73:	e8 b8 0f 00 00       	call   1030 <fourfiles>
  sharedfd();
      78:	e8 f3 0d 00 00       	call   e70 <sharedfd>

  bigargtest();
      7d:	e8 9e 32 00 00       	call   3320 <bigargtest>
  bigwrite();
      82:	e8 b9 23 00 00       	call   2440 <bigwrite>
  bigargtest();
      87:	e8 94 32 00 00       	call   3320 <bigargtest>
  bsstest();
      8c:	e8 0f 32 00 00       	call   32a0 <bsstest>
  sbrktest();
      91:	e8 fa 2c 00 00       	call   2d90 <sbrktest>
  validatetest();
      96:	e8 45 31 00 00       	call   31e0 <validatetest>

  opentest();
      9b:	e8 60 03 00 00       	call   400 <opentest>
  writetest();
      a0:	e8 eb 03 00 00       	call   490 <writetest>
  writetest1();
      a5:	e8 c6 05 00 00       	call   670 <writetest1>
  createtest();
      aa:	e8 91 07 00 00       	call   840 <createtest>

  openiputtest();
      af:	e8 3c 02 00 00       	call   2f0 <openiputtest>
  exitiputtest();
      b4:	e8 47 01 00 00       	call   200 <exitiputtest>
  iputtest();
      b9:	e8 62 00 00 00       	call   120 <iputtest>

  mem();
      be:	e8 dd 0c 00 00       	call   da0 <mem>
  pipe1();
      c3:	e8 58 09 00 00       	call   a20 <pipe1>
  preempt();
      c8:	e8 f3 0a 00 00       	call   bc0 <preempt>
  exitwait();
      cd:	e8 3e 0c 00 00       	call   d10 <exitwait>

  rmdot();
      d2:	e8 59 27 00 00       	call   2830 <rmdot>
  fourteen();
      d7:	e8 14 26 00 00       	call   26f0 <fourteen>
  bigfile();
      dc:	e8 3f 24 00 00       	call   2520 <bigfile>
  subdir();
      e1:	e8 7a 1c 00 00       	call   1d60 <subdir>
  linktest();
      e6:	e8 f5 14 00 00       	call   15e0 <linktest>
  unlinkread();
      eb:	e8 60 13 00 00       	call   1450 <unlinkread>
  dirfile();
      f0:	e8 bb 28 00 00       	call   29b0 <dirfile>
  iref();
      f5:	e8 b6 2a 00 00       	call   2bb0 <iref>
  forktest();
      fa:	e8 d1 2b 00 00       	call   2cd0 <forktest>
  bigdir(); // slow
      ff:	e8 2c 1b 00 00       	call   1c30 <bigdir>

  uio();
     104:	e8 17 35 00 00       	call   3620 <uio>

  exectest();
     109:	e8 c2 08 00 00       	call   9d0 <exectest>

  exit();
     10e:	e8 5f 38 00 00       	call   3972 <exit>
     113:	66 90                	xchg   %ax,%ax
     115:	66 90                	xchg   %ax,%ax
     117:	66 90                	xchg   %ax,%ax
     119:	66 90                	xchg   %ax,%ax
     11b:	66 90                	xchg   %ax,%ax
     11d:	66 90                	xchg   %ax,%ax
     11f:	90                   	nop

00000120 <iputtest>:
{
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     126:	68 84 3e 00 00       	push   $0x3e84
     12b:	ff 35 88 5e 00 00    	pushl  0x5e88
     131:	e8 9a 39 00 00       	call   3ad0 <printf>
  if(mkdir("iputdir") < 0){
     136:	c7 04 24 17 3e 00 00 	movl   $0x3e17,(%esp)
     13d:	e8 98 38 00 00       	call   39da <mkdir>
     142:	83 c4 10             	add    $0x10,%esp
     145:	85 c0                	test   %eax,%eax
     147:	78 58                	js     1a1 <iputtest+0x81>
  if(chdir("iputdir") < 0){
     149:	83 ec 0c             	sub    $0xc,%esp
     14c:	68 17 3e 00 00       	push   $0x3e17
     151:	e8 8c 38 00 00       	call   39e2 <chdir>
     156:	83 c4 10             	add    $0x10,%esp
     159:	85 c0                	test   %eax,%eax
     15b:	0f 88 85 00 00 00    	js     1e6 <iputtest+0xc6>
  if(unlink("../iputdir") < 0){
     161:	83 ec 0c             	sub    $0xc,%esp
     164:	68 14 3e 00 00       	push   $0x3e14
     169:	e8 54 38 00 00       	call   39c2 <unlink>
     16e:	83 c4 10             	add    $0x10,%esp
     171:	85 c0                	test   %eax,%eax
     173:	78 5a                	js     1cf <iputtest+0xaf>
  if(chdir("/") < 0){
     175:	83 ec 0c             	sub    $0xc,%esp
     178:	68 39 3e 00 00       	push   $0x3e39
     17d:	e8 60 38 00 00       	call   39e2 <chdir>
     182:	83 c4 10             	add    $0x10,%esp
     185:	85 c0                	test   %eax,%eax
     187:	78 2f                	js     1b8 <iputtest+0x98>
  printf(stdout, "iput test ok\n");
     189:	83 ec 08             	sub    $0x8,%esp
     18c:	68 bc 3e 00 00       	push   $0x3ebc
     191:	ff 35 88 5e 00 00    	pushl  0x5e88
     197:	e8 34 39 00 00       	call   3ad0 <printf>
}
     19c:	83 c4 10             	add    $0x10,%esp
     19f:	c9                   	leave  
     1a0:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     1a1:	50                   	push   %eax
     1a2:	50                   	push   %eax
     1a3:	68 f0 3d 00 00       	push   $0x3df0
     1a8:	ff 35 88 5e 00 00    	pushl  0x5e88
     1ae:	e8 1d 39 00 00       	call   3ad0 <printf>
    exit();
     1b3:	e8 ba 37 00 00       	call   3972 <exit>
    printf(stdout, "chdir / failed\n");
     1b8:	50                   	push   %eax
     1b9:	50                   	push   %eax
     1ba:	68 3b 3e 00 00       	push   $0x3e3b
     1bf:	ff 35 88 5e 00 00    	pushl  0x5e88
     1c5:	e8 06 39 00 00       	call   3ad0 <printf>
    exit();
     1ca:	e8 a3 37 00 00       	call   3972 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
     1cf:	52                   	push   %edx
     1d0:	52                   	push   %edx
     1d1:	68 1f 3e 00 00       	push   $0x3e1f
     1d6:	ff 35 88 5e 00 00    	pushl  0x5e88
     1dc:	e8 ef 38 00 00       	call   3ad0 <printf>
    exit();
     1e1:	e8 8c 37 00 00       	call   3972 <exit>
    printf(stdout, "chdir iputdir failed\n");
     1e6:	51                   	push   %ecx
     1e7:	51                   	push   %ecx
     1e8:	68 fe 3d 00 00       	push   $0x3dfe
     1ed:	ff 35 88 5e 00 00    	pushl  0x5e88
     1f3:	e8 d8 38 00 00       	call   3ad0 <printf>
    exit();
     1f8:	e8 75 37 00 00       	call   3972 <exit>
     1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <exitiputtest>:
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exitiput test\n");
     206:	68 4b 3e 00 00       	push   $0x3e4b
     20b:	ff 35 88 5e 00 00    	pushl  0x5e88
     211:	e8 ba 38 00 00       	call   3ad0 <printf>
  pid = fork(0);
     216:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     21d:	e8 48 37 00 00       	call   396a <fork>
  if(pid < 0){
     222:	83 c4 10             	add    $0x10,%esp
     225:	85 c0                	test   %eax,%eax
     227:	78 7f                	js     2a8 <exitiputtest+0xa8>
  if(pid == 0){
     229:	75 45                	jne    270 <exitiputtest+0x70>
    if(mkdir("iputdir") < 0){
     22b:	83 ec 0c             	sub    $0xc,%esp
     22e:	68 17 3e 00 00       	push   $0x3e17
     233:	e8 a2 37 00 00       	call   39da <mkdir>
     238:	83 c4 10             	add    $0x10,%esp
     23b:	85 c0                	test   %eax,%eax
     23d:	0f 88 93 00 00 00    	js     2d6 <exitiputtest+0xd6>
    if(chdir("iputdir") < 0){
     243:	83 ec 0c             	sub    $0xc,%esp
     246:	68 17 3e 00 00       	push   $0x3e17
     24b:	e8 92 37 00 00       	call   39e2 <chdir>
     250:	83 c4 10             	add    $0x10,%esp
     253:	85 c0                	test   %eax,%eax
     255:	78 68                	js     2bf <exitiputtest+0xbf>
    if(unlink("../iputdir") < 0){
     257:	83 ec 0c             	sub    $0xc,%esp
     25a:	68 14 3e 00 00       	push   $0x3e14
     25f:	e8 5e 37 00 00       	call   39c2 <unlink>
     264:	83 c4 10             	add    $0x10,%esp
     267:	85 c0                	test   %eax,%eax
     269:	78 25                	js     290 <exitiputtest+0x90>
    exit();
     26b:	e8 02 37 00 00       	call   3972 <exit>
  wait();
     270:	e8 05 37 00 00       	call   397a <wait>
  printf(stdout, "exitiput test ok\n");
     275:	83 ec 08             	sub    $0x8,%esp
     278:	68 6e 3e 00 00       	push   $0x3e6e
     27d:	ff 35 88 5e 00 00    	pushl  0x5e88
     283:	e8 48 38 00 00       	call   3ad0 <printf>
}
     288:	83 c4 10             	add    $0x10,%esp
     28b:	c9                   	leave  
     28c:	c3                   	ret    
     28d:	8d 76 00             	lea    0x0(%esi),%esi
      printf(stdout, "unlink ../iputdir failed\n");
     290:	83 ec 08             	sub    $0x8,%esp
     293:	68 1f 3e 00 00       	push   $0x3e1f
     298:	ff 35 88 5e 00 00    	pushl  0x5e88
     29e:	e8 2d 38 00 00       	call   3ad0 <printf>
      exit();
     2a3:	e8 ca 36 00 00       	call   3972 <exit>
    printf(stdout, "fork failed\n");
     2a8:	51                   	push   %ecx
     2a9:	51                   	push   %ecx
     2aa:	68 31 4d 00 00       	push   $0x4d31
     2af:	ff 35 88 5e 00 00    	pushl  0x5e88
     2b5:	e8 16 38 00 00       	call   3ad0 <printf>
    exit();
     2ba:	e8 b3 36 00 00       	call   3972 <exit>
      printf(stdout, "child chdir failed\n");
     2bf:	50                   	push   %eax
     2c0:	50                   	push   %eax
     2c1:	68 5a 3e 00 00       	push   $0x3e5a
     2c6:	ff 35 88 5e 00 00    	pushl  0x5e88
     2cc:	e8 ff 37 00 00       	call   3ad0 <printf>
      exit();
     2d1:	e8 9c 36 00 00       	call   3972 <exit>
      printf(stdout, "mkdir failed\n");
     2d6:	52                   	push   %edx
     2d7:	52                   	push   %edx
     2d8:	68 f0 3d 00 00       	push   $0x3df0
     2dd:	ff 35 88 5e 00 00    	pushl  0x5e88
     2e3:	e8 e8 37 00 00       	call   3ad0 <printf>
      exit();
     2e8:	e8 85 36 00 00       	call   3972 <exit>
     2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <openiputtest>:
{
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "openiput test\n");
     2f6:	68 80 3e 00 00       	push   $0x3e80
     2fb:	ff 35 88 5e 00 00    	pushl  0x5e88
     301:	e8 ca 37 00 00       	call   3ad0 <printf>
  if(mkdir("oidir") < 0){
     306:	c7 04 24 8f 3e 00 00 	movl   $0x3e8f,(%esp)
     30d:	e8 c8 36 00 00       	call   39da <mkdir>
     312:	83 c4 10             	add    $0x10,%esp
     315:	85 c0                	test   %eax,%eax
     317:	0f 88 90 00 00 00    	js     3ad <openiputtest+0xbd>
  pid = fork(0);
     31d:	83 ec 0c             	sub    $0xc,%esp
     320:	6a 00                	push   $0x0
     322:	e8 43 36 00 00       	call   396a <fork>
  if(pid < 0){
     327:	83 c4 10             	add    $0x10,%esp
     32a:	85 c0                	test   %eax,%eax
     32c:	0f 88 92 00 00 00    	js     3c4 <openiputtest+0xd4>
  if(pid == 0){
     332:	75 34                	jne    368 <openiputtest+0x78>
    int fd = open("oidir", O_RDWR);
     334:	83 ec 08             	sub    $0x8,%esp
     337:	6a 02                	push   $0x2
     339:	68 8f 3e 00 00       	push   $0x3e8f
     33e:	e8 6f 36 00 00       	call   39b2 <open>
    if(fd >= 0){
     343:	83 c4 10             	add    $0x10,%esp
     346:	85 c0                	test   %eax,%eax
     348:	78 5e                	js     3a8 <openiputtest+0xb8>
      printf(stdout, "open directory for write succeeded\n");
     34a:	83 ec 08             	sub    $0x8,%esp
     34d:	68 14 4e 00 00       	push   $0x4e14
     352:	ff 35 88 5e 00 00    	pushl  0x5e88
     358:	e8 73 37 00 00       	call   3ad0 <printf>
      exit();
     35d:	e8 10 36 00 00       	call   3972 <exit>
     362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  sleep(1);
     368:	83 ec 0c             	sub    $0xc,%esp
     36b:	6a 01                	push   $0x1
     36d:	e8 90 36 00 00       	call   3a02 <sleep>
  if(unlink("oidir") != 0){
     372:	c7 04 24 8f 3e 00 00 	movl   $0x3e8f,(%esp)
     379:	e8 44 36 00 00       	call   39c2 <unlink>
     37e:	83 c4 10             	add    $0x10,%esp
     381:	85 c0                	test   %eax,%eax
     383:	75 56                	jne    3db <openiputtest+0xeb>
  wait();
     385:	e8 f0 35 00 00       	call   397a <wait>
  printf(stdout, "openiput test ok\n");
     38a:	83 ec 08             	sub    $0x8,%esp
     38d:	68 b8 3e 00 00       	push   $0x3eb8
     392:	ff 35 88 5e 00 00    	pushl  0x5e88
     398:	e8 33 37 00 00       	call   3ad0 <printf>
}
     39d:	83 c4 10             	add    $0x10,%esp
     3a0:	c9                   	leave  
     3a1:	c3                   	ret    
     3a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
     3a8:	e8 c5 35 00 00       	call   3972 <exit>
    printf(stdout, "mkdir oidir failed\n");
     3ad:	51                   	push   %ecx
     3ae:	51                   	push   %ecx
     3af:	68 95 3e 00 00       	push   $0x3e95
     3b4:	ff 35 88 5e 00 00    	pushl  0x5e88
     3ba:	e8 11 37 00 00       	call   3ad0 <printf>
    exit();
     3bf:	e8 ae 35 00 00       	call   3972 <exit>
    printf(stdout, "fork failed\n");
     3c4:	52                   	push   %edx
     3c5:	52                   	push   %edx
     3c6:	68 31 4d 00 00       	push   $0x4d31
     3cb:	ff 35 88 5e 00 00    	pushl  0x5e88
     3d1:	e8 fa 36 00 00       	call   3ad0 <printf>
    exit();
     3d6:	e8 97 35 00 00       	call   3972 <exit>
    printf(stdout, "unlink failed\n");
     3db:	50                   	push   %eax
     3dc:	50                   	push   %eax
     3dd:	68 a9 3e 00 00       	push   $0x3ea9
     3e2:	ff 35 88 5e 00 00    	pushl  0x5e88
     3e8:	e8 e3 36 00 00       	call   3ad0 <printf>
    exit();
     3ed:	e8 80 35 00 00       	call   3972 <exit>
     3f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000400 <opentest>:
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "open test\n");
     406:	68 ca 3e 00 00       	push   $0x3eca
     40b:	ff 35 88 5e 00 00    	pushl  0x5e88
     411:	e8 ba 36 00 00       	call   3ad0 <printf>
  fd = open("echo", 0);
     416:	58                   	pop    %eax
     417:	5a                   	pop    %edx
     418:	6a 00                	push   $0x0
     41a:	68 d5 3e 00 00       	push   $0x3ed5
     41f:	e8 8e 35 00 00       	call   39b2 <open>
  if(fd < 0){
     424:	83 c4 10             	add    $0x10,%esp
     427:	85 c0                	test   %eax,%eax
     429:	78 36                	js     461 <opentest+0x61>
  close(fd);
     42b:	83 ec 0c             	sub    $0xc,%esp
     42e:	50                   	push   %eax
     42f:	e8 66 35 00 00       	call   399a <close>
  fd = open("doesnotexist", 0);
     434:	5a                   	pop    %edx
     435:	59                   	pop    %ecx
     436:	6a 00                	push   $0x0
     438:	68 ed 3e 00 00       	push   $0x3eed
     43d:	e8 70 35 00 00       	call   39b2 <open>
  if(fd >= 0){
     442:	83 c4 10             	add    $0x10,%esp
     445:	85 c0                	test   %eax,%eax
     447:	79 2f                	jns    478 <opentest+0x78>
  printf(stdout, "open test ok\n");
     449:	83 ec 08             	sub    $0x8,%esp
     44c:	68 18 3f 00 00       	push   $0x3f18
     451:	ff 35 88 5e 00 00    	pushl  0x5e88
     457:	e8 74 36 00 00       	call   3ad0 <printf>
}
     45c:	83 c4 10             	add    $0x10,%esp
     45f:	c9                   	leave  
     460:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
     461:	50                   	push   %eax
     462:	50                   	push   %eax
     463:	68 da 3e 00 00       	push   $0x3eda
     468:	ff 35 88 5e 00 00    	pushl  0x5e88
     46e:	e8 5d 36 00 00       	call   3ad0 <printf>
    exit();
     473:	e8 fa 34 00 00       	call   3972 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     478:	50                   	push   %eax
     479:	50                   	push   %eax
     47a:	68 fa 3e 00 00       	push   $0x3efa
     47f:	ff 35 88 5e 00 00    	pushl  0x5e88
     485:	e8 46 36 00 00       	call   3ad0 <printf>
    exit();
     48a:	e8 e3 34 00 00       	call   3972 <exit>
     48f:	90                   	nop

00000490 <writetest>:
{
     490:	55                   	push   %ebp
     491:	89 e5                	mov    %esp,%ebp
     493:	56                   	push   %esi
     494:	53                   	push   %ebx
  printf(stdout, "small file test\n");
     495:	83 ec 08             	sub    $0x8,%esp
     498:	68 26 3f 00 00       	push   $0x3f26
     49d:	ff 35 88 5e 00 00    	pushl  0x5e88
     4a3:	e8 28 36 00 00       	call   3ad0 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     4a8:	59                   	pop    %ecx
     4a9:	5b                   	pop    %ebx
     4aa:	68 02 02 00 00       	push   $0x202
     4af:	68 37 3f 00 00       	push   $0x3f37
     4b4:	e8 f9 34 00 00       	call   39b2 <open>
  if(fd >= 0){
     4b9:	83 c4 10             	add    $0x10,%esp
     4bc:	85 c0                	test   %eax,%eax
     4be:	0f 88 8b 01 00 00    	js     64f <writetest+0x1bf>
    printf(stdout, "creat small succeeded; ok\n");
     4c4:	83 ec 08             	sub    $0x8,%esp
     4c7:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 100; i++){
     4c9:	31 db                	xor    %ebx,%ebx
    printf(stdout, "creat small succeeded; ok\n");
     4cb:	68 3d 3f 00 00       	push   $0x3f3d
     4d0:	ff 35 88 5e 00 00    	pushl  0x5e88
     4d6:	e8 f5 35 00 00       	call   3ad0 <printf>
     4db:	83 c4 10             	add    $0x10,%esp
     4de:	66 90                	xchg   %ax,%ax
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     4e0:	83 ec 04             	sub    $0x4,%esp
     4e3:	6a 0a                	push   $0xa
     4e5:	68 74 3f 00 00       	push   $0x3f74
     4ea:	56                   	push   %esi
     4eb:	e8 a2 34 00 00       	call   3992 <write>
     4f0:	83 c4 10             	add    $0x10,%esp
     4f3:	83 f8 0a             	cmp    $0xa,%eax
     4f6:	0f 85 d9 00 00 00    	jne    5d5 <writetest+0x145>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     4fc:	83 ec 04             	sub    $0x4,%esp
     4ff:	6a 0a                	push   $0xa
     501:	68 7f 3f 00 00       	push   $0x3f7f
     506:	56                   	push   %esi
     507:	e8 86 34 00 00       	call   3992 <write>
     50c:	83 c4 10             	add    $0x10,%esp
     50f:	83 f8 0a             	cmp    $0xa,%eax
     512:	0f 85 d6 00 00 00    	jne    5ee <writetest+0x15e>
  for(i = 0; i < 100; i++){
     518:	83 c3 01             	add    $0x1,%ebx
     51b:	83 fb 64             	cmp    $0x64,%ebx
     51e:	75 c0                	jne    4e0 <writetest+0x50>
  printf(stdout, "writes ok\n");
     520:	83 ec 08             	sub    $0x8,%esp
     523:	68 8a 3f 00 00       	push   $0x3f8a
     528:	ff 35 88 5e 00 00    	pushl  0x5e88
     52e:	e8 9d 35 00 00       	call   3ad0 <printf>
  close(fd);
     533:	89 34 24             	mov    %esi,(%esp)
     536:	e8 5f 34 00 00       	call   399a <close>
  fd = open("small", O_RDONLY);
     53b:	58                   	pop    %eax
     53c:	5a                   	pop    %edx
     53d:	6a 00                	push   $0x0
     53f:	68 37 3f 00 00       	push   $0x3f37
     544:	e8 69 34 00 00       	call   39b2 <open>
  if(fd >= 0){
     549:	83 c4 10             	add    $0x10,%esp
     54c:	85 c0                	test   %eax,%eax
  fd = open("small", O_RDONLY);
     54e:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     550:	0f 88 b1 00 00 00    	js     607 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
     556:	83 ec 08             	sub    $0x8,%esp
     559:	68 95 3f 00 00       	push   $0x3f95
     55e:	ff 35 88 5e 00 00    	pushl  0x5e88
     564:	e8 67 35 00 00       	call   3ad0 <printf>
  i = read(fd, buf, 2000);
     569:	83 c4 0c             	add    $0xc,%esp
     56c:	68 d0 07 00 00       	push   $0x7d0
     571:	68 60 86 00 00       	push   $0x8660
     576:	53                   	push   %ebx
     577:	e8 0e 34 00 00       	call   398a <read>
  if(i == 2000){
     57c:	83 c4 10             	add    $0x10,%esp
     57f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     584:	0f 85 95 00 00 00    	jne    61f <writetest+0x18f>
    printf(stdout, "read succeeded ok\n");
     58a:	83 ec 08             	sub    $0x8,%esp
     58d:	68 c9 3f 00 00       	push   $0x3fc9
     592:	ff 35 88 5e 00 00    	pushl  0x5e88
     598:	e8 33 35 00 00       	call   3ad0 <printf>
  close(fd);
     59d:	89 1c 24             	mov    %ebx,(%esp)
     5a0:	e8 f5 33 00 00       	call   399a <close>
  if(unlink("small") < 0){
     5a5:	c7 04 24 37 3f 00 00 	movl   $0x3f37,(%esp)
     5ac:	e8 11 34 00 00       	call   39c2 <unlink>
     5b1:	83 c4 10             	add    $0x10,%esp
     5b4:	85 c0                	test   %eax,%eax
     5b6:	78 7f                	js     637 <writetest+0x1a7>
  printf(stdout, "small file test ok\n");
     5b8:	83 ec 08             	sub    $0x8,%esp
     5bb:	68 f1 3f 00 00       	push   $0x3ff1
     5c0:	ff 35 88 5e 00 00    	pushl  0x5e88
     5c6:	e8 05 35 00 00       	call   3ad0 <printf>
}
     5cb:	83 c4 10             	add    $0x10,%esp
     5ce:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5d1:	5b                   	pop    %ebx
     5d2:	5e                   	pop    %esi
     5d3:	5d                   	pop    %ebp
     5d4:	c3                   	ret    
      printf(stdout, "error: write aa %d new file failed\n", i);
     5d5:	83 ec 04             	sub    $0x4,%esp
     5d8:	53                   	push   %ebx
     5d9:	68 38 4e 00 00       	push   $0x4e38
     5de:	ff 35 88 5e 00 00    	pushl  0x5e88
     5e4:	e8 e7 34 00 00       	call   3ad0 <printf>
      exit();
     5e9:	e8 84 33 00 00       	call   3972 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     5ee:	83 ec 04             	sub    $0x4,%esp
     5f1:	53                   	push   %ebx
     5f2:	68 5c 4e 00 00       	push   $0x4e5c
     5f7:	ff 35 88 5e 00 00    	pushl  0x5e88
     5fd:	e8 ce 34 00 00       	call   3ad0 <printf>
      exit();
     602:	e8 6b 33 00 00       	call   3972 <exit>
    printf(stdout, "error: open small failed!\n");
     607:	83 ec 08             	sub    $0x8,%esp
     60a:	68 ae 3f 00 00       	push   $0x3fae
     60f:	ff 35 88 5e 00 00    	pushl  0x5e88
     615:	e8 b6 34 00 00       	call   3ad0 <printf>
    exit();
     61a:	e8 53 33 00 00       	call   3972 <exit>
    printf(stdout, "read failed\n");
     61f:	83 ec 08             	sub    $0x8,%esp
     622:	68 f5 42 00 00       	push   $0x42f5
     627:	ff 35 88 5e 00 00    	pushl  0x5e88
     62d:	e8 9e 34 00 00       	call   3ad0 <printf>
    exit();
     632:	e8 3b 33 00 00       	call   3972 <exit>
    printf(stdout, "unlink small failed\n");
     637:	83 ec 08             	sub    $0x8,%esp
     63a:	68 dc 3f 00 00       	push   $0x3fdc
     63f:	ff 35 88 5e 00 00    	pushl  0x5e88
     645:	e8 86 34 00 00       	call   3ad0 <printf>
    exit();
     64a:	e8 23 33 00 00       	call   3972 <exit>
    printf(stdout, "error: creat small failed!\n");
     64f:	83 ec 08             	sub    $0x8,%esp
     652:	68 58 3f 00 00       	push   $0x3f58
     657:	ff 35 88 5e 00 00    	pushl  0x5e88
     65d:	e8 6e 34 00 00       	call   3ad0 <printf>
    exit();
     662:	e8 0b 33 00 00       	call   3972 <exit>
     667:	89 f6                	mov    %esi,%esi
     669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000670 <writetest1>:
{
     670:	55                   	push   %ebp
     671:	89 e5                	mov    %esp,%ebp
     673:	56                   	push   %esi
     674:	53                   	push   %ebx
  printf(stdout, "big files test\n");
     675:	83 ec 08             	sub    $0x8,%esp
     678:	68 05 40 00 00       	push   $0x4005
     67d:	ff 35 88 5e 00 00    	pushl  0x5e88
     683:	e8 48 34 00 00       	call   3ad0 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     688:	59                   	pop    %ecx
     689:	5b                   	pop    %ebx
     68a:	68 02 02 00 00       	push   $0x202
     68f:	68 7f 40 00 00       	push   $0x407f
     694:	e8 19 33 00 00       	call   39b2 <open>
  if(fd < 0){
     699:	83 c4 10             	add    $0x10,%esp
     69c:	85 c0                	test   %eax,%eax
     69e:	0f 88 64 01 00 00    	js     808 <writetest1+0x198>
     6a4:	89 c6                	mov    %eax,%esi
     6a6:	31 db                	xor    %ebx,%ebx
     6a8:	90                   	nop
     6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(write(fd, buf, 512) != 512){
     6b0:	83 ec 04             	sub    $0x4,%esp
    ((int*)buf)[0] = i;
     6b3:	89 1d 60 86 00 00    	mov    %ebx,0x8660
    if(write(fd, buf, 512) != 512){
     6b9:	68 00 02 00 00       	push   $0x200
     6be:	68 60 86 00 00       	push   $0x8660
     6c3:	56                   	push   %esi
     6c4:	e8 c9 32 00 00       	call   3992 <write>
     6c9:	83 c4 10             	add    $0x10,%esp
     6cc:	3d 00 02 00 00       	cmp    $0x200,%eax
     6d1:	0f 85 b3 00 00 00    	jne    78a <writetest1+0x11a>
  for(i = 0; i < MAXFILE; i++){
     6d7:	83 c3 01             	add    $0x1,%ebx
     6da:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     6e0:	75 ce                	jne    6b0 <writetest1+0x40>
  close(fd);
     6e2:	83 ec 0c             	sub    $0xc,%esp
     6e5:	56                   	push   %esi
     6e6:	e8 af 32 00 00       	call   399a <close>
  fd = open("big", O_RDONLY);
     6eb:	58                   	pop    %eax
     6ec:	5a                   	pop    %edx
     6ed:	6a 00                	push   $0x0
     6ef:	68 7f 40 00 00       	push   $0x407f
     6f4:	e8 b9 32 00 00       	call   39b2 <open>
  if(fd < 0){
     6f9:	83 c4 10             	add    $0x10,%esp
     6fc:	85 c0                	test   %eax,%eax
  fd = open("big", O_RDONLY);
     6fe:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     700:	0f 88 ea 00 00 00    	js     7f0 <writetest1+0x180>
     706:	31 db                	xor    %ebx,%ebx
     708:	eb 1d                	jmp    727 <writetest1+0xb7>
     70a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(i != 512){
     710:	3d 00 02 00 00       	cmp    $0x200,%eax
     715:	0f 85 9f 00 00 00    	jne    7ba <writetest1+0x14a>
    if(((int*)buf)[0] != n){
     71b:	a1 60 86 00 00       	mov    0x8660,%eax
     720:	39 c3                	cmp    %eax,%ebx
     722:	75 7f                	jne    7a3 <writetest1+0x133>
    n++;
     724:	83 c3 01             	add    $0x1,%ebx
    i = read(fd, buf, 512);
     727:	83 ec 04             	sub    $0x4,%esp
     72a:	68 00 02 00 00       	push   $0x200
     72f:	68 60 86 00 00       	push   $0x8660
     734:	56                   	push   %esi
     735:	e8 50 32 00 00       	call   398a <read>
    if(i == 0){
     73a:	83 c4 10             	add    $0x10,%esp
     73d:	85 c0                	test   %eax,%eax
     73f:	75 cf                	jne    710 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     741:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     747:	0f 84 86 00 00 00    	je     7d3 <writetest1+0x163>
  close(fd);
     74d:	83 ec 0c             	sub    $0xc,%esp
     750:	56                   	push   %esi
     751:	e8 44 32 00 00       	call   399a <close>
  if(unlink("big") < 0){
     756:	c7 04 24 7f 40 00 00 	movl   $0x407f,(%esp)
     75d:	e8 60 32 00 00       	call   39c2 <unlink>
     762:	83 c4 10             	add    $0x10,%esp
     765:	85 c0                	test   %eax,%eax
     767:	0f 88 b3 00 00 00    	js     820 <writetest1+0x1b0>
  printf(stdout, "big files ok\n");
     76d:	83 ec 08             	sub    $0x8,%esp
     770:	68 a6 40 00 00       	push   $0x40a6
     775:	ff 35 88 5e 00 00    	pushl  0x5e88
     77b:	e8 50 33 00 00       	call   3ad0 <printf>
}
     780:	83 c4 10             	add    $0x10,%esp
     783:	8d 65 f8             	lea    -0x8(%ebp),%esp
     786:	5b                   	pop    %ebx
     787:	5e                   	pop    %esi
     788:	5d                   	pop    %ebp
     789:	c3                   	ret    
      printf(stdout, "error: write big file failed\n", i);
     78a:	83 ec 04             	sub    $0x4,%esp
     78d:	53                   	push   %ebx
     78e:	68 2f 40 00 00       	push   $0x402f
     793:	ff 35 88 5e 00 00    	pushl  0x5e88
     799:	e8 32 33 00 00       	call   3ad0 <printf>
      exit();
     79e:	e8 cf 31 00 00       	call   3972 <exit>
      printf(stdout, "read content of block %d is %d\n",
     7a3:	50                   	push   %eax
     7a4:	53                   	push   %ebx
     7a5:	68 80 4e 00 00       	push   $0x4e80
     7aa:	ff 35 88 5e 00 00    	pushl  0x5e88
     7b0:	e8 1b 33 00 00       	call   3ad0 <printf>
      exit();
     7b5:	e8 b8 31 00 00       	call   3972 <exit>
      printf(stdout, "read failed %d\n", i);
     7ba:	83 ec 04             	sub    $0x4,%esp
     7bd:	50                   	push   %eax
     7be:	68 83 40 00 00       	push   $0x4083
     7c3:	ff 35 88 5e 00 00    	pushl  0x5e88
     7c9:	e8 02 33 00 00       	call   3ad0 <printf>
      exit();
     7ce:	e8 9f 31 00 00       	call   3972 <exit>
        printf(stdout, "read only %d blocks from big", n);
     7d3:	83 ec 04             	sub    $0x4,%esp
     7d6:	68 8b 00 00 00       	push   $0x8b
     7db:	68 66 40 00 00       	push   $0x4066
     7e0:	ff 35 88 5e 00 00    	pushl  0x5e88
     7e6:	e8 e5 32 00 00       	call   3ad0 <printf>
        exit();
     7eb:	e8 82 31 00 00       	call   3972 <exit>
    printf(stdout, "error: open big failed!\n");
     7f0:	83 ec 08             	sub    $0x8,%esp
     7f3:	68 4d 40 00 00       	push   $0x404d
     7f8:	ff 35 88 5e 00 00    	pushl  0x5e88
     7fe:	e8 cd 32 00 00       	call   3ad0 <printf>
    exit();
     803:	e8 6a 31 00 00       	call   3972 <exit>
    printf(stdout, "error: creat big failed!\n");
     808:	83 ec 08             	sub    $0x8,%esp
     80b:	68 15 40 00 00       	push   $0x4015
     810:	ff 35 88 5e 00 00    	pushl  0x5e88
     816:	e8 b5 32 00 00       	call   3ad0 <printf>
    exit();
     81b:	e8 52 31 00 00       	call   3972 <exit>
    printf(stdout, "unlink big failed\n");
     820:	83 ec 08             	sub    $0x8,%esp
     823:	68 93 40 00 00       	push   $0x4093
     828:	ff 35 88 5e 00 00    	pushl  0x5e88
     82e:	e8 9d 32 00 00       	call   3ad0 <printf>
    exit();
     833:	e8 3a 31 00 00       	call   3972 <exit>
     838:	90                   	nop
     839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000840 <createtest>:
{
     840:	55                   	push   %ebp
     841:	89 e5                	mov    %esp,%ebp
     843:	53                   	push   %ebx
  name[2] = '\0';
     844:	bb 30 00 00 00       	mov    $0x30,%ebx
{
     849:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "many creates, followed by unlink test\n");
     84c:	68 a0 4e 00 00       	push   $0x4ea0
     851:	ff 35 88 5e 00 00    	pushl  0x5e88
     857:	e8 74 32 00 00       	call   3ad0 <printf>
  name[0] = 'a';
     85c:	c6 05 60 a6 00 00 61 	movb   $0x61,0xa660
  name[2] = '\0';
     863:	c6 05 62 a6 00 00 00 	movb   $0x0,0xa662
     86a:	83 c4 10             	add    $0x10,%esp
     86d:	8d 76 00             	lea    0x0(%esi),%esi
    fd = open(name, O_CREATE|O_RDWR);
     870:	83 ec 08             	sub    $0x8,%esp
    name[1] = '0' + i;
     873:	88 1d 61 a6 00 00    	mov    %bl,0xa661
     879:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     87c:	68 02 02 00 00       	push   $0x202
     881:	68 60 a6 00 00       	push   $0xa660
     886:	e8 27 31 00 00       	call   39b2 <open>
    close(fd);
     88b:	89 04 24             	mov    %eax,(%esp)
     88e:	e8 07 31 00 00       	call   399a <close>
  for(i = 0; i < 52; i++){
     893:	83 c4 10             	add    $0x10,%esp
     896:	80 fb 64             	cmp    $0x64,%bl
     899:	75 d5                	jne    870 <createtest+0x30>
  name[0] = 'a';
     89b:	c6 05 60 a6 00 00 61 	movb   $0x61,0xa660
  name[2] = '\0';
     8a2:	c6 05 62 a6 00 00 00 	movb   $0x0,0xa662
     8a9:	bb 30 00 00 00       	mov    $0x30,%ebx
     8ae:	66 90                	xchg   %ax,%ax
    unlink(name);
     8b0:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + i;
     8b3:	88 1d 61 a6 00 00    	mov    %bl,0xa661
     8b9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     8bc:	68 60 a6 00 00       	push   $0xa660
     8c1:	e8 fc 30 00 00       	call   39c2 <unlink>
  for(i = 0; i < 52; i++){
     8c6:	83 c4 10             	add    $0x10,%esp
     8c9:	80 fb 64             	cmp    $0x64,%bl
     8cc:	75 e2                	jne    8b0 <createtest+0x70>
  printf(stdout, "many creates, followed by unlink; ok\n");
     8ce:	83 ec 08             	sub    $0x8,%esp
     8d1:	68 c8 4e 00 00       	push   $0x4ec8
     8d6:	ff 35 88 5e 00 00    	pushl  0x5e88
     8dc:	e8 ef 31 00 00       	call   3ad0 <printf>
}
     8e1:	83 c4 10             	add    $0x10,%esp
     8e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8e7:	c9                   	leave  
     8e8:	c3                   	ret    
     8e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008f0 <dirtest>:
{
     8f0:	55                   	push   %ebp
     8f1:	89 e5                	mov    %esp,%ebp
     8f3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     8f6:	68 b4 40 00 00       	push   $0x40b4
     8fb:	ff 35 88 5e 00 00    	pushl  0x5e88
     901:	e8 ca 31 00 00       	call   3ad0 <printf>
  if(mkdir("dir0") < 0){
     906:	c7 04 24 c0 40 00 00 	movl   $0x40c0,(%esp)
     90d:	e8 c8 30 00 00       	call   39da <mkdir>
     912:	83 c4 10             	add    $0x10,%esp
     915:	85 c0                	test   %eax,%eax
     917:	78 58                	js     971 <dirtest+0x81>
  if(chdir("dir0") < 0){
     919:	83 ec 0c             	sub    $0xc,%esp
     91c:	68 c0 40 00 00       	push   $0x40c0
     921:	e8 bc 30 00 00       	call   39e2 <chdir>
     926:	83 c4 10             	add    $0x10,%esp
     929:	85 c0                	test   %eax,%eax
     92b:	0f 88 85 00 00 00    	js     9b6 <dirtest+0xc6>
  if(chdir("..") < 0){
     931:	83 ec 0c             	sub    $0xc,%esp
     934:	68 65 46 00 00       	push   $0x4665
     939:	e8 a4 30 00 00       	call   39e2 <chdir>
     93e:	83 c4 10             	add    $0x10,%esp
     941:	85 c0                	test   %eax,%eax
     943:	78 5a                	js     99f <dirtest+0xaf>
  if(unlink("dir0") < 0){
     945:	83 ec 0c             	sub    $0xc,%esp
     948:	68 c0 40 00 00       	push   $0x40c0
     94d:	e8 70 30 00 00       	call   39c2 <unlink>
     952:	83 c4 10             	add    $0x10,%esp
     955:	85 c0                	test   %eax,%eax
     957:	78 2f                	js     988 <dirtest+0x98>
  printf(stdout, "mkdir test ok\n");
     959:	83 ec 08             	sub    $0x8,%esp
     95c:	68 fd 40 00 00       	push   $0x40fd
     961:	ff 35 88 5e 00 00    	pushl  0x5e88
     967:	e8 64 31 00 00       	call   3ad0 <printf>
}
     96c:	83 c4 10             	add    $0x10,%esp
     96f:	c9                   	leave  
     970:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     971:	50                   	push   %eax
     972:	50                   	push   %eax
     973:	68 f0 3d 00 00       	push   $0x3df0
     978:	ff 35 88 5e 00 00    	pushl  0x5e88
     97e:	e8 4d 31 00 00       	call   3ad0 <printf>
    exit();
     983:	e8 ea 2f 00 00       	call   3972 <exit>
    printf(stdout, "unlink dir0 failed\n");
     988:	50                   	push   %eax
     989:	50                   	push   %eax
     98a:	68 e9 40 00 00       	push   $0x40e9
     98f:	ff 35 88 5e 00 00    	pushl  0x5e88
     995:	e8 36 31 00 00       	call   3ad0 <printf>
    exit();
     99a:	e8 d3 2f 00 00       	call   3972 <exit>
    printf(stdout, "chdir .. failed\n");
     99f:	52                   	push   %edx
     9a0:	52                   	push   %edx
     9a1:	68 d8 40 00 00       	push   $0x40d8
     9a6:	ff 35 88 5e 00 00    	pushl  0x5e88
     9ac:	e8 1f 31 00 00       	call   3ad0 <printf>
    exit();
     9b1:	e8 bc 2f 00 00       	call   3972 <exit>
    printf(stdout, "chdir dir0 failed\n");
     9b6:	51                   	push   %ecx
     9b7:	51                   	push   %ecx
     9b8:	68 c5 40 00 00       	push   $0x40c5
     9bd:	ff 35 88 5e 00 00    	pushl  0x5e88
     9c3:	e8 08 31 00 00       	call   3ad0 <printf>
    exit();
     9c8:	e8 a5 2f 00 00       	call   3972 <exit>
     9cd:	8d 76 00             	lea    0x0(%esi),%esi

000009d0 <exectest>:
{
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     9d6:	68 0c 41 00 00       	push   $0x410c
     9db:	ff 35 88 5e 00 00    	pushl  0x5e88
     9e1:	e8 ea 30 00 00       	call   3ad0 <printf>
  if(exec("echo", echoargv) < 0){
     9e6:	5a                   	pop    %edx
     9e7:	59                   	pop    %ecx
     9e8:	68 8c 5e 00 00       	push   $0x5e8c
     9ed:	68 d5 3e 00 00       	push   $0x3ed5
     9f2:	e8 b3 2f 00 00       	call   39aa <exec>
     9f7:	83 c4 10             	add    $0x10,%esp
     9fa:	85 c0                	test   %eax,%eax
     9fc:	78 02                	js     a00 <exectest+0x30>
}
     9fe:	c9                   	leave  
     9ff:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
     a00:	50                   	push   %eax
     a01:	50                   	push   %eax
     a02:	68 17 41 00 00       	push   $0x4117
     a07:	ff 35 88 5e 00 00    	pushl  0x5e88
     a0d:	e8 be 30 00 00       	call   3ad0 <printf>
    exit();
     a12:	e8 5b 2f 00 00       	call   3972 <exit>
     a17:	89 f6                	mov    %esi,%esi
     a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a20 <pipe1>:
{
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	57                   	push   %edi
     a24:	56                   	push   %esi
     a25:	53                   	push   %ebx
  if(pipe(fds) != 0){
     a26:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
     a29:	83 ec 38             	sub    $0x38,%esp
  if(pipe(fds) != 0){
     a2c:	50                   	push   %eax
     a2d:	e8 50 2f 00 00       	call   3982 <pipe>
     a32:	83 c4 10             	add    $0x10,%esp
     a35:	85 c0                	test   %eax,%eax
     a37:	0f 85 45 01 00 00    	jne    b82 <pipe1+0x162>
  pid = fork(0);
     a3d:	83 ec 0c             	sub    $0xc,%esp
     a40:	89 c3                	mov    %eax,%ebx
     a42:	6a 00                	push   $0x0
     a44:	e8 21 2f 00 00       	call   396a <fork>
  if(pid == 0){
     a49:	83 c4 10             	add    $0x10,%esp
     a4c:	83 f8 00             	cmp    $0x0,%eax
  pid = fork(0);
     a4f:	89 c6                	mov    %eax,%esi
  if(pid == 0){
     a51:	0f 84 8a 00 00 00    	je     ae1 <pipe1+0xc1>
  } else if(pid > 0){
     a57:	0f 8e 39 01 00 00    	jle    b96 <pipe1+0x176>
    close(fds[1]);
     a5d:	83 ec 0c             	sub    $0xc,%esp
     a60:	ff 75 e4             	pushl  -0x1c(%ebp)
    cc = 1;
     a63:	bf 01 00 00 00       	mov    $0x1,%edi
    close(fds[1]);
     a68:	e8 2d 2f 00 00       	call   399a <close>
    while((n = read(fds[0], buf, cc)) > 0){
     a6d:	83 c4 10             	add    $0x10,%esp
    total = 0;
     a70:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     a77:	83 ec 04             	sub    $0x4,%esp
     a7a:	57                   	push   %edi
     a7b:	68 60 86 00 00       	push   $0x8660
     a80:	ff 75 e0             	pushl  -0x20(%ebp)
     a83:	e8 02 2f 00 00       	call   398a <read>
     a88:	83 c4 10             	add    $0x10,%esp
     a8b:	85 c0                	test   %eax,%eax
     a8d:	0f 8e a9 00 00 00    	jle    b3c <pipe1+0x11c>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a93:	89 d9                	mov    %ebx,%ecx
     a95:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     a98:	f7 d9                	neg    %ecx
     a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     aa0:	38 9c 0b 60 86 00 00 	cmp    %bl,0x8660(%ebx,%ecx,1)
     aa7:	8d 53 01             	lea    0x1(%ebx),%edx
     aaa:	75 1b                	jne    ac7 <pipe1+0xa7>
      for(i = 0; i < n; i++){
     aac:	39 f2                	cmp    %esi,%edx
     aae:	89 d3                	mov    %edx,%ebx
     ab0:	75 ee                	jne    aa0 <pipe1+0x80>
      cc = cc * 2;
     ab2:	01 ff                	add    %edi,%edi
      total += n;
     ab4:	01 45 d4             	add    %eax,-0x2c(%ebp)
     ab7:	b8 00 20 00 00       	mov    $0x2000,%eax
     abc:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     ac2:	0f 4f f8             	cmovg  %eax,%edi
     ac5:	eb b0                	jmp    a77 <pipe1+0x57>
          printf(1, "pipe1 oops 2\n");
     ac7:	83 ec 08             	sub    $0x8,%esp
     aca:	68 46 41 00 00       	push   $0x4146
     acf:	6a 01                	push   $0x1
     ad1:	e8 fa 2f 00 00       	call   3ad0 <printf>
          return;
     ad6:	83 c4 10             	add    $0x10,%esp
}
     ad9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     adc:	5b                   	pop    %ebx
     add:	5e                   	pop    %esi
     ade:	5f                   	pop    %edi
     adf:	5d                   	pop    %ebp
     ae0:	c3                   	ret    
    close(fds[0]);
     ae1:	83 ec 0c             	sub    $0xc,%esp
     ae4:	ff 75 e0             	pushl  -0x20(%ebp)
     ae7:	e8 ae 2e 00 00       	call   399a <close>
     aec:	83 c4 10             	add    $0x10,%esp
        buf[i] = seq++;
     aef:	89 f0                	mov    %esi,%eax
     af1:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx
{
     af7:	89 f3                	mov    %esi,%ebx
        buf[i] = seq++;
     af9:	f7 d8                	neg    %eax
     afb:	90                   	nop
     afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b00:	88 9c 18 60 86 00 00 	mov    %bl,0x8660(%eax,%ebx,1)
     b07:	83 c3 01             	add    $0x1,%ebx
      for(i = 0; i < 1033; i++)
     b0a:	39 d3                	cmp    %edx,%ebx
     b0c:	75 f2                	jne    b00 <pipe1+0xe0>
      if(write(fds[1], buf, 1033) != 1033){
     b0e:	83 ec 04             	sub    $0x4,%esp
     b11:	89 de                	mov    %ebx,%esi
     b13:	68 09 04 00 00       	push   $0x409
     b18:	68 60 86 00 00       	push   $0x8660
     b1d:	ff 75 e4             	pushl  -0x1c(%ebp)
     b20:	e8 6d 2e 00 00       	call   3992 <write>
     b25:	83 c4 10             	add    $0x10,%esp
     b28:	3d 09 04 00 00       	cmp    $0x409,%eax
     b2d:	75 7b                	jne    baa <pipe1+0x18a>
    for(n = 0; n < 5; n++){
     b2f:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b35:	75 b8                	jne    aef <pipe1+0xcf>
    exit();
     b37:	e8 36 2e 00 00       	call   3972 <exit>
    if(total != 5 * 1033){
     b3c:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b43:	75 26                	jne    b6b <pipe1+0x14b>
    close(fds[0]);
     b45:	83 ec 0c             	sub    $0xc,%esp
     b48:	ff 75 e0             	pushl  -0x20(%ebp)
     b4b:	e8 4a 2e 00 00       	call   399a <close>
    wait();
     b50:	e8 25 2e 00 00       	call   397a <wait>
  printf(1, "pipe1 ok\n");
     b55:	58                   	pop    %eax
     b56:	5a                   	pop    %edx
     b57:	68 6b 41 00 00       	push   $0x416b
     b5c:	6a 01                	push   $0x1
     b5e:	e8 6d 2f 00 00       	call   3ad0 <printf>
     b63:	83 c4 10             	add    $0x10,%esp
     b66:	e9 6e ff ff ff       	jmp    ad9 <pipe1+0xb9>
      printf(1, "pipe1 oops 3 total %d\n", total);
     b6b:	83 ec 04             	sub    $0x4,%esp
     b6e:	ff 75 d4             	pushl  -0x2c(%ebp)
     b71:	68 54 41 00 00       	push   $0x4154
     b76:	6a 01                	push   $0x1
     b78:	e8 53 2f 00 00       	call   3ad0 <printf>
      exit();
     b7d:	e8 f0 2d 00 00       	call   3972 <exit>
    printf(1, "pipe() failed\n");
     b82:	83 ec 08             	sub    $0x8,%esp
     b85:	68 29 41 00 00       	push   $0x4129
     b8a:	6a 01                	push   $0x1
     b8c:	e8 3f 2f 00 00       	call   3ad0 <printf>
    exit();
     b91:	e8 dc 2d 00 00       	call   3972 <exit>
    printf(1, "fork() failed\n");
     b96:	83 ec 08             	sub    $0x8,%esp
     b99:	68 75 41 00 00       	push   $0x4175
     b9e:	6a 01                	push   $0x1
     ba0:	e8 2b 2f 00 00       	call   3ad0 <printf>
    exit();
     ba5:	e8 c8 2d 00 00       	call   3972 <exit>
        printf(1, "pipe1 oops 1\n");
     baa:	83 ec 08             	sub    $0x8,%esp
     bad:	68 38 41 00 00       	push   $0x4138
     bb2:	6a 01                	push   $0x1
     bb4:	e8 17 2f 00 00       	call   3ad0 <printf>
        exit();
     bb9:	e8 b4 2d 00 00       	call   3972 <exit>
     bbe:	66 90                	xchg   %ax,%ax

00000bc0 <preempt>:
{
     bc0:	55                   	push   %ebp
     bc1:	89 e5                	mov    %esp,%ebp
     bc3:	57                   	push   %edi
     bc4:	56                   	push   %esi
     bc5:	53                   	push   %ebx
     bc6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "preempt: ");
     bc9:	68 84 41 00 00       	push   $0x4184
     bce:	6a 01                	push   $0x1
     bd0:	e8 fb 2e 00 00       	call   3ad0 <printf>
  pid1 = fork(0);
     bd5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     bdc:	e8 89 2d 00 00       	call   396a <fork>
  if(pid1 == 0)
     be1:	83 c4 10             	add    $0x10,%esp
     be4:	85 c0                	test   %eax,%eax
     be6:	75 02                	jne    bea <preempt+0x2a>
     be8:	eb fe                	jmp    be8 <preempt+0x28>
  pid2 = fork(0);
     bea:	83 ec 0c             	sub    $0xc,%esp
     bed:	89 c7                	mov    %eax,%edi
     bef:	6a 00                	push   $0x0
     bf1:	e8 74 2d 00 00       	call   396a <fork>
  if(pid2 == 0)
     bf6:	83 c4 10             	add    $0x10,%esp
     bf9:	85 c0                	test   %eax,%eax
  pid2 = fork(0);
     bfb:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     bfd:	75 02                	jne    c01 <preempt+0x41>
     bff:	eb fe                	jmp    bff <preempt+0x3f>
  pipe(pfds);
     c01:	8d 45 e0             	lea    -0x20(%ebp),%eax
     c04:	83 ec 0c             	sub    $0xc,%esp
     c07:	50                   	push   %eax
     c08:	e8 75 2d 00 00       	call   3982 <pipe>
  pid3 = fork(0);
     c0d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c14:	e8 51 2d 00 00       	call   396a <fork>
  if(pid3 == 0){
     c19:	83 c4 10             	add    $0x10,%esp
     c1c:	85 c0                	test   %eax,%eax
  pid3 = fork(0);
     c1e:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     c20:	75 47                	jne    c69 <preempt+0xa9>
    close(pfds[0]);
     c22:	83 ec 0c             	sub    $0xc,%esp
     c25:	ff 75 e0             	pushl  -0x20(%ebp)
     c28:	e8 6d 2d 00 00       	call   399a <close>
    if(write(pfds[1], "x", 1) != 1)
     c2d:	83 c4 0c             	add    $0xc,%esp
     c30:	6a 01                	push   $0x1
     c32:	68 49 47 00 00       	push   $0x4749
     c37:	ff 75 e4             	pushl  -0x1c(%ebp)
     c3a:	e8 53 2d 00 00       	call   3992 <write>
     c3f:	83 c4 10             	add    $0x10,%esp
     c42:	83 f8 01             	cmp    $0x1,%eax
     c45:	74 12                	je     c59 <preempt+0x99>
      printf(1, "preempt write error");
     c47:	83 ec 08             	sub    $0x8,%esp
     c4a:	68 8e 41 00 00       	push   $0x418e
     c4f:	6a 01                	push   $0x1
     c51:	e8 7a 2e 00 00       	call   3ad0 <printf>
     c56:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c59:	83 ec 0c             	sub    $0xc,%esp
     c5c:	ff 75 e4             	pushl  -0x1c(%ebp)
     c5f:	e8 36 2d 00 00       	call   399a <close>
     c64:	83 c4 10             	add    $0x10,%esp
     c67:	eb fe                	jmp    c67 <preempt+0xa7>
  close(pfds[1]);
     c69:	83 ec 0c             	sub    $0xc,%esp
     c6c:	ff 75 e4             	pushl  -0x1c(%ebp)
     c6f:	e8 26 2d 00 00       	call   399a <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c74:	83 c4 0c             	add    $0xc,%esp
     c77:	68 00 20 00 00       	push   $0x2000
     c7c:	68 60 86 00 00       	push   $0x8660
     c81:	ff 75 e0             	pushl  -0x20(%ebp)
     c84:	e8 01 2d 00 00       	call   398a <read>
     c89:	83 c4 10             	add    $0x10,%esp
     c8c:	83 f8 01             	cmp    $0x1,%eax
     c8f:	74 1a                	je     cab <preempt+0xeb>
    printf(1, "preempt read error");
     c91:	83 ec 08             	sub    $0x8,%esp
     c94:	68 a2 41 00 00       	push   $0x41a2
     c99:	6a 01                	push   $0x1
     c9b:	e8 30 2e 00 00       	call   3ad0 <printf>
    return;
     ca0:	83 c4 10             	add    $0x10,%esp
}
     ca3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ca6:	5b                   	pop    %ebx
     ca7:	5e                   	pop    %esi
     ca8:	5f                   	pop    %edi
     ca9:	5d                   	pop    %ebp
     caa:	c3                   	ret    
  close(pfds[0]);
     cab:	83 ec 0c             	sub    $0xc,%esp
     cae:	ff 75 e0             	pushl  -0x20(%ebp)
     cb1:	e8 e4 2c 00 00       	call   399a <close>
  printf(1, "kill... ");
     cb6:	58                   	pop    %eax
     cb7:	5a                   	pop    %edx
     cb8:	68 b5 41 00 00       	push   $0x41b5
     cbd:	6a 01                	push   $0x1
     cbf:	e8 0c 2e 00 00       	call   3ad0 <printf>
  kill(pid1);
     cc4:	89 3c 24             	mov    %edi,(%esp)
     cc7:	e8 d6 2c 00 00       	call   39a2 <kill>
  kill(pid2);
     ccc:	89 34 24             	mov    %esi,(%esp)
     ccf:	e8 ce 2c 00 00       	call   39a2 <kill>
  kill(pid3);
     cd4:	89 1c 24             	mov    %ebx,(%esp)
     cd7:	e8 c6 2c 00 00       	call   39a2 <kill>
  printf(1, "wait... ");
     cdc:	59                   	pop    %ecx
     cdd:	5b                   	pop    %ebx
     cde:	68 be 41 00 00       	push   $0x41be
     ce3:	6a 01                	push   $0x1
     ce5:	e8 e6 2d 00 00       	call   3ad0 <printf>
  wait();
     cea:	e8 8b 2c 00 00       	call   397a <wait>
  wait();
     cef:	e8 86 2c 00 00       	call   397a <wait>
  wait();
     cf4:	e8 81 2c 00 00       	call   397a <wait>
  printf(1, "preempt ok\n");
     cf9:	5e                   	pop    %esi
     cfa:	5f                   	pop    %edi
     cfb:	68 c7 41 00 00       	push   $0x41c7
     d00:	6a 01                	push   $0x1
     d02:	e8 c9 2d 00 00       	call   3ad0 <printf>
     d07:	83 c4 10             	add    $0x10,%esp
     d0a:	eb 97                	jmp    ca3 <preempt+0xe3>
     d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d10 <exitwait>:
{
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	56                   	push   %esi
     d14:	be 64 00 00 00       	mov    $0x64,%esi
     d19:	53                   	push   %ebx
     d1a:	eb 14                	jmp    d30 <exitwait+0x20>
     d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid){
     d20:	74 77                	je     d99 <exitwait+0x89>
      if(wait() != pid){
     d22:	e8 53 2c 00 00       	call   397a <wait>
     d27:	39 c3                	cmp    %eax,%ebx
     d29:	75 35                	jne    d60 <exitwait+0x50>
  for(i = 0; i < 100; i++){
     d2b:	83 ee 01             	sub    $0x1,%esi
     d2e:	74 50                	je     d80 <exitwait+0x70>
    pid = fork(0);
     d30:	83 ec 0c             	sub    $0xc,%esp
     d33:	6a 00                	push   $0x0
     d35:	e8 30 2c 00 00       	call   396a <fork>
    if(pid < 0){
     d3a:	83 c4 10             	add    $0x10,%esp
     d3d:	85 c0                	test   %eax,%eax
    pid = fork(0);
     d3f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d41:	79 dd                	jns    d20 <exitwait+0x10>
      printf(1, "fork failed\n");
     d43:	83 ec 08             	sub    $0x8,%esp
     d46:	68 31 4d 00 00       	push   $0x4d31
     d4b:	6a 01                	push   $0x1
     d4d:	e8 7e 2d 00 00       	call   3ad0 <printf>
      return;
     d52:	83 c4 10             	add    $0x10,%esp
}
     d55:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d58:	5b                   	pop    %ebx
     d59:	5e                   	pop    %esi
     d5a:	5d                   	pop    %ebp
     d5b:	c3                   	ret    
     d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "wait wrong pid\n");
     d60:	83 ec 08             	sub    $0x8,%esp
     d63:	68 d3 41 00 00       	push   $0x41d3
     d68:	6a 01                	push   $0x1
     d6a:	e8 61 2d 00 00       	call   3ad0 <printf>
        return;
     d6f:	83 c4 10             	add    $0x10,%esp
}
     d72:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d75:	5b                   	pop    %ebx
     d76:	5e                   	pop    %esi
     d77:	5d                   	pop    %ebp
     d78:	c3                   	ret    
     d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  printf(1, "exitwait ok\n");
     d80:	83 ec 08             	sub    $0x8,%esp
     d83:	68 e3 41 00 00       	push   $0x41e3
     d88:	6a 01                	push   $0x1
     d8a:	e8 41 2d 00 00       	call   3ad0 <printf>
     d8f:	83 c4 10             	add    $0x10,%esp
}
     d92:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d95:	5b                   	pop    %ebx
     d96:	5e                   	pop    %esi
     d97:	5d                   	pop    %ebp
     d98:	c3                   	ret    
      exit();
     d99:	e8 d4 2b 00 00       	call   3972 <exit>
     d9e:	66 90                	xchg   %ax,%ax

00000da0 <mem>:
{
     da0:	55                   	push   %ebp
     da1:	89 e5                	mov    %esp,%ebp
     da3:	57                   	push   %edi
     da4:	56                   	push   %esi
     da5:	53                   	push   %ebx
     da6:	83 ec 14             	sub    $0x14,%esp
  printf(1, "mem test\n");
     da9:	68 f0 41 00 00       	push   $0x41f0
     dae:	6a 01                	push   $0x1
     db0:	e8 1b 2d 00 00       	call   3ad0 <printf>
  ppid = getpid();
     db5:	e8 38 2c 00 00       	call   39f2 <getpid>
  if((pid = fork(0)) == 0){
     dba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  ppid = getpid();
     dc1:	89 c6                	mov    %eax,%esi
  if((pid = fork(0)) == 0){
     dc3:	e8 a2 2b 00 00       	call   396a <fork>
     dc8:	83 c4 10             	add    $0x10,%esp
     dcb:	85 c0                	test   %eax,%eax
     dcd:	75 71                	jne    e40 <mem+0xa0>
     dcf:	31 db                	xor    %ebx,%ebx
     dd1:	eb 09                	jmp    ddc <mem+0x3c>
     dd3:	90                   	nop
     dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *(char**)m2 = m1;
     dd8:	89 18                	mov    %ebx,(%eax)
     dda:	89 c3                	mov    %eax,%ebx
    while((m2 = malloc(10001)) != 0){
     ddc:	83 ec 0c             	sub    $0xc,%esp
     ddf:	68 11 27 00 00       	push   $0x2711
     de4:	e8 27 2f 00 00       	call   3d10 <malloc>
     de9:	83 c4 10             	add    $0x10,%esp
     dec:	85 c0                	test   %eax,%eax
     dee:	75 e8                	jne    dd8 <mem+0x38>
    while(m1){
     df0:	85 db                	test   %ebx,%ebx
     df2:	74 18                	je     e0c <mem+0x6c>
     df4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     df8:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     dfa:	83 ec 0c             	sub    $0xc,%esp
     dfd:	53                   	push   %ebx
     dfe:	89 fb                	mov    %edi,%ebx
     e00:	e8 7b 2e 00 00       	call   3c80 <free>
    while(m1){
     e05:	83 c4 10             	add    $0x10,%esp
     e08:	85 db                	test   %ebx,%ebx
     e0a:	75 ec                	jne    df8 <mem+0x58>
    m1 = malloc(1024*20);
     e0c:	83 ec 0c             	sub    $0xc,%esp
     e0f:	68 00 50 00 00       	push   $0x5000
     e14:	e8 f7 2e 00 00       	call   3d10 <malloc>
    if(m1 == 0){
     e19:	83 c4 10             	add    $0x10,%esp
     e1c:	85 c0                	test   %eax,%eax
     e1e:	74 30                	je     e50 <mem+0xb0>
    free(m1);
     e20:	83 ec 0c             	sub    $0xc,%esp
     e23:	50                   	push   %eax
     e24:	e8 57 2e 00 00       	call   3c80 <free>
    printf(1, "mem ok\n");
     e29:	58                   	pop    %eax
     e2a:	5a                   	pop    %edx
     e2b:	68 14 42 00 00       	push   $0x4214
     e30:	6a 01                	push   $0x1
     e32:	e8 99 2c 00 00       	call   3ad0 <printf>
    exit();
     e37:	e8 36 2b 00 00       	call   3972 <exit>
     e3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
     e40:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e43:	5b                   	pop    %ebx
     e44:	5e                   	pop    %esi
     e45:	5f                   	pop    %edi
     e46:	5d                   	pop    %ebp
    wait();
     e47:	e9 2e 2b 00 00       	jmp    397a <wait>
     e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "couldn't allocate mem?!!\n");
     e50:	83 ec 08             	sub    $0x8,%esp
     e53:	68 fa 41 00 00       	push   $0x41fa
     e58:	6a 01                	push   $0x1
     e5a:	e8 71 2c 00 00       	call   3ad0 <printf>
      kill(ppid);
     e5f:	89 34 24             	mov    %esi,(%esp)
     e62:	e8 3b 2b 00 00       	call   39a2 <kill>
      exit();
     e67:	e8 06 2b 00 00       	call   3972 <exit>
     e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e70 <sharedfd>:
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	57                   	push   %edi
     e74:	56                   	push   %esi
     e75:	53                   	push   %ebx
     e76:	83 ec 34             	sub    $0x34,%esp
  printf(1, "sharedfd test\n");
     e79:	68 1c 42 00 00       	push   $0x421c
     e7e:	6a 01                	push   $0x1
     e80:	e8 4b 2c 00 00       	call   3ad0 <printf>
  unlink("sharedfd");
     e85:	c7 04 24 2b 42 00 00 	movl   $0x422b,(%esp)
     e8c:	e8 31 2b 00 00       	call   39c2 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e91:	5b                   	pop    %ebx
     e92:	5e                   	pop    %esi
     e93:	68 02 02 00 00       	push   $0x202
     e98:	68 2b 42 00 00       	push   $0x422b
     e9d:	e8 10 2b 00 00       	call   39b2 <open>
  if(fd < 0){
     ea2:	83 c4 10             	add    $0x10,%esp
     ea5:	85 c0                	test   %eax,%eax
     ea7:	0f 88 29 01 00 00    	js     fd6 <sharedfd+0x166>
  pid = fork(0);
     ead:	83 ec 0c             	sub    $0xc,%esp
     eb0:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     eb2:	8d 75 de             	lea    -0x22(%ebp),%esi
  pid = fork(0);
     eb5:	6a 00                	push   $0x0
  memset(buf, pid==0?'c':'p', sizeof(buf));
     eb7:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  pid = fork(0);
     ebc:	e8 a9 2a 00 00       	call   396a <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ec1:	83 c4 0c             	add    $0xc,%esp
     ec4:	83 f8 01             	cmp    $0x1,%eax
  pid = fork(0);
     ec7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     eca:	19 c0                	sbb    %eax,%eax
     ecc:	6a 0a                	push   $0xa
     ece:	83 e0 f3             	and    $0xfffffff3,%eax
     ed1:	83 c0 70             	add    $0x70,%eax
     ed4:	50                   	push   %eax
     ed5:	56                   	push   %esi
     ed6:	e8 05 29 00 00       	call   37e0 <memset>
     edb:	83 c4 10             	add    $0x10,%esp
     ede:	eb 05                	jmp    ee5 <sharedfd+0x75>
  for(i = 0; i < 1000; i++){
     ee0:	83 eb 01             	sub    $0x1,%ebx
     ee3:	74 26                	je     f0b <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     ee5:	83 ec 04             	sub    $0x4,%esp
     ee8:	6a 0a                	push   $0xa
     eea:	56                   	push   %esi
     eeb:	57                   	push   %edi
     eec:	e8 a1 2a 00 00       	call   3992 <write>
     ef1:	83 c4 10             	add    $0x10,%esp
     ef4:	83 f8 0a             	cmp    $0xa,%eax
     ef7:	74 e7                	je     ee0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     ef9:	83 ec 08             	sub    $0x8,%esp
     efc:	68 1c 4f 00 00       	push   $0x4f1c
     f01:	6a 01                	push   $0x1
     f03:	e8 c8 2b 00 00       	call   3ad0 <printf>
      break;
     f08:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
     f0b:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     f0e:	85 c9                	test   %ecx,%ecx
     f10:	0f 84 f4 00 00 00    	je     100a <sharedfd+0x19a>
    wait();
     f16:	e8 5f 2a 00 00       	call   397a <wait>
  close(fd);
     f1b:	83 ec 0c             	sub    $0xc,%esp
     f1e:	31 db                	xor    %ebx,%ebx
     f20:	57                   	push   %edi
     f21:	8d 7d e8             	lea    -0x18(%ebp),%edi
     f24:	e8 71 2a 00 00       	call   399a <close>
  fd = open("sharedfd", 0);
     f29:	58                   	pop    %eax
     f2a:	5a                   	pop    %edx
     f2b:	6a 00                	push   $0x0
     f2d:	68 2b 42 00 00       	push   $0x422b
     f32:	e8 7b 2a 00 00       	call   39b2 <open>
  if(fd < 0){
     f37:	83 c4 10             	add    $0x10,%esp
     f3a:	31 d2                	xor    %edx,%edx
     f3c:	85 c0                	test   %eax,%eax
  fd = open("sharedfd", 0);
     f3e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     f41:	0f 88 a9 00 00 00    	js     ff0 <sharedfd+0x180>
     f47:	89 f6                	mov    %esi,%esi
     f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f50:	83 ec 04             	sub    $0x4,%esp
     f53:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f56:	6a 0a                	push   $0xa
     f58:	56                   	push   %esi
     f59:	ff 75 d0             	pushl  -0x30(%ebp)
     f5c:	e8 29 2a 00 00       	call   398a <read>
     f61:	83 c4 10             	add    $0x10,%esp
     f64:	85 c0                	test   %eax,%eax
     f66:	7e 27                	jle    f8f <sharedfd+0x11f>
     f68:	89 f0                	mov    %esi,%eax
     f6a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f6d:	eb 13                	jmp    f82 <sharedfd+0x112>
     f6f:	90                   	nop
        np++;
     f70:	80 f9 70             	cmp    $0x70,%cl
     f73:	0f 94 c1             	sete   %cl
     f76:	0f b6 c9             	movzbl %cl,%ecx
     f79:	01 cb                	add    %ecx,%ebx
     f7b:	83 c0 01             	add    $0x1,%eax
    for(i = 0; i < sizeof(buf); i++){
     f7e:	39 c7                	cmp    %eax,%edi
     f80:	74 ce                	je     f50 <sharedfd+0xe0>
      if(buf[i] == 'c')
     f82:	0f b6 08             	movzbl (%eax),%ecx
     f85:	80 f9 63             	cmp    $0x63,%cl
     f88:	75 e6                	jne    f70 <sharedfd+0x100>
        nc++;
     f8a:	83 c2 01             	add    $0x1,%edx
     f8d:	eb ec                	jmp    f7b <sharedfd+0x10b>
  close(fd);
     f8f:	83 ec 0c             	sub    $0xc,%esp
     f92:	ff 75 d0             	pushl  -0x30(%ebp)
     f95:	e8 00 2a 00 00       	call   399a <close>
  unlink("sharedfd");
     f9a:	c7 04 24 2b 42 00 00 	movl   $0x422b,(%esp)
     fa1:	e8 1c 2a 00 00       	call   39c2 <unlink>
  if(nc == 10000 && np == 10000){
     fa6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     fa9:	83 c4 10             	add    $0x10,%esp
     fac:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     fb2:	75 5b                	jne    100f <sharedfd+0x19f>
     fb4:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     fba:	75 53                	jne    100f <sharedfd+0x19f>
    printf(1, "sharedfd ok\n");
     fbc:	83 ec 08             	sub    $0x8,%esp
     fbf:	68 34 42 00 00       	push   $0x4234
     fc4:	6a 01                	push   $0x1
     fc6:	e8 05 2b 00 00       	call   3ad0 <printf>
     fcb:	83 c4 10             	add    $0x10,%esp
}
     fce:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fd1:	5b                   	pop    %ebx
     fd2:	5e                   	pop    %esi
     fd3:	5f                   	pop    %edi
     fd4:	5d                   	pop    %ebp
     fd5:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for writing");
     fd6:	83 ec 08             	sub    $0x8,%esp
     fd9:	68 f0 4e 00 00       	push   $0x4ef0
     fde:	6a 01                	push   $0x1
     fe0:	e8 eb 2a 00 00       	call   3ad0 <printf>
    return;
     fe5:	83 c4 10             	add    $0x10,%esp
}
     fe8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     feb:	5b                   	pop    %ebx
     fec:	5e                   	pop    %esi
     fed:	5f                   	pop    %edi
     fee:	5d                   	pop    %ebp
     fef:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for reading\n");
     ff0:	83 ec 08             	sub    $0x8,%esp
     ff3:	68 3c 4f 00 00       	push   $0x4f3c
     ff8:	6a 01                	push   $0x1
     ffa:	e8 d1 2a 00 00       	call   3ad0 <printf>
    return;
     fff:	83 c4 10             	add    $0x10,%esp
}
    1002:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1005:	5b                   	pop    %ebx
    1006:	5e                   	pop    %esi
    1007:	5f                   	pop    %edi
    1008:	5d                   	pop    %ebp
    1009:	c3                   	ret    
    exit();
    100a:	e8 63 29 00 00       	call   3972 <exit>
    printf(1, "sharedfd oops %d %d\n", nc, np);
    100f:	53                   	push   %ebx
    1010:	52                   	push   %edx
    1011:	68 41 42 00 00       	push   $0x4241
    1016:	6a 01                	push   $0x1
    1018:	e8 b3 2a 00 00       	call   3ad0 <printf>
    exit();
    101d:	e8 50 29 00 00       	call   3972 <exit>
    1022:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001030 <fourfiles>:
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	57                   	push   %edi
    1034:	56                   	push   %esi
    1035:	53                   	push   %ebx
  printf(1, "fourfiles test\n");
    1036:	be 56 42 00 00       	mov    $0x4256,%esi
  for(pi = 0; pi < 4; pi++){
    103b:	31 db                	xor    %ebx,%ebx
{
    103d:	83 ec 34             	sub    $0x34,%esp
  char *names[] = { "f0", "f1", "f2", "f3" };
    1040:	c7 45 d8 56 42 00 00 	movl   $0x4256,-0x28(%ebp)
    1047:	c7 45 dc 9f 43 00 00 	movl   $0x439f,-0x24(%ebp)
  printf(1, "fourfiles test\n");
    104e:	68 5c 42 00 00       	push   $0x425c
    1053:	6a 01                	push   $0x1
  char *names[] = { "f0", "f1", "f2", "f3" };
    1055:	c7 45 e0 a3 43 00 00 	movl   $0x43a3,-0x20(%ebp)
    105c:	c7 45 e4 59 42 00 00 	movl   $0x4259,-0x1c(%ebp)
  printf(1, "fourfiles test\n");
    1063:	e8 68 2a 00 00       	call   3ad0 <printf>
    1068:	83 c4 10             	add    $0x10,%esp
    unlink(fname);
    106b:	83 ec 0c             	sub    $0xc,%esp
    106e:	56                   	push   %esi
    106f:	e8 4e 29 00 00       	call   39c2 <unlink>
    pid = fork(0);
    1074:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    107b:	e8 ea 28 00 00       	call   396a <fork>
    if(pid < 0){
    1080:	83 c4 10             	add    $0x10,%esp
    1083:	85 c0                	test   %eax,%eax
    1085:	0f 88 84 01 00 00    	js     120f <fourfiles+0x1df>
    if(pid == 0){
    108b:	0f 84 e4 00 00 00    	je     1175 <fourfiles+0x145>
  for(pi = 0; pi < 4; pi++){
    1091:	83 c3 01             	add    $0x1,%ebx
    1094:	83 fb 04             	cmp    $0x4,%ebx
    1097:	74 06                	je     109f <fourfiles+0x6f>
    1099:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    109d:	eb cc                	jmp    106b <fourfiles+0x3b>
    wait();
    109f:	e8 d6 28 00 00       	call   397a <wait>
    10a4:	bf 30 00 00 00       	mov    $0x30,%edi
    10a9:	e8 cc 28 00 00       	call   397a <wait>
    10ae:	e8 c7 28 00 00       	call   397a <wait>
    10b3:	e8 c2 28 00 00       	call   397a <wait>
    10b8:	c7 45 d4 56 42 00 00 	movl   $0x4256,-0x2c(%ebp)
    fd = open(fname, 0);
    10bf:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    10c2:	31 db                	xor    %ebx,%ebx
    fd = open(fname, 0);
    10c4:	6a 00                	push   $0x0
    10c6:	ff 75 d4             	pushl  -0x2c(%ebp)
    10c9:	e8 e4 28 00 00       	call   39b2 <open>
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10ce:	83 c4 10             	add    $0x10,%esp
    fd = open(fname, 0);
    10d1:	89 c6                	mov    %eax,%esi
    10d3:	90                   	nop
    10d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10d8:	83 ec 04             	sub    $0x4,%esp
    10db:	68 00 20 00 00       	push   $0x2000
    10e0:	68 60 86 00 00       	push   $0x8660
    10e5:	56                   	push   %esi
    10e6:	e8 9f 28 00 00       	call   398a <read>
    10eb:	83 c4 10             	add    $0x10,%esp
    10ee:	85 c0                	test   %eax,%eax
    10f0:	7e 1c                	jle    110e <fourfiles+0xde>
    10f2:	31 d2                	xor    %edx,%edx
    10f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if(buf[j] != '0'+i){
    10f8:	0f be 8a 60 86 00 00 	movsbl 0x8660(%edx),%ecx
    10ff:	39 cf                	cmp    %ecx,%edi
    1101:	75 5e                	jne    1161 <fourfiles+0x131>
      for(j = 0; j < n; j++){
    1103:	83 c2 01             	add    $0x1,%edx
    1106:	39 d0                	cmp    %edx,%eax
    1108:	75 ee                	jne    10f8 <fourfiles+0xc8>
      total += n;
    110a:	01 c3                	add    %eax,%ebx
    110c:	eb ca                	jmp    10d8 <fourfiles+0xa8>
    close(fd);
    110e:	83 ec 0c             	sub    $0xc,%esp
    1111:	56                   	push   %esi
    1112:	e8 83 28 00 00       	call   399a <close>
    if(total != 12*500){
    1117:	83 c4 10             	add    $0x10,%esp
    111a:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1120:	0f 85 d4 00 00 00    	jne    11fa <fourfiles+0x1ca>
    unlink(fname);
    1126:	83 ec 0c             	sub    $0xc,%esp
    1129:	ff 75 d4             	pushl  -0x2c(%ebp)
    112c:	83 c7 01             	add    $0x1,%edi
    112f:	e8 8e 28 00 00       	call   39c2 <unlink>
  for(i = 0; i < 2; i++){
    1134:	83 c4 10             	add    $0x10,%esp
    1137:	83 ff 32             	cmp    $0x32,%edi
    113a:	75 1a                	jne    1156 <fourfiles+0x126>
  printf(1, "fourfiles ok\n");
    113c:	83 ec 08             	sub    $0x8,%esp
    113f:	68 9a 42 00 00       	push   $0x429a
    1144:	6a 01                	push   $0x1
    1146:	e8 85 29 00 00       	call   3ad0 <printf>
}
    114b:	83 c4 10             	add    $0x10,%esp
    114e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1151:	5b                   	pop    %ebx
    1152:	5e                   	pop    %esi
    1153:	5f                   	pop    %edi
    1154:	5d                   	pop    %ebp
    1155:	c3                   	ret    
    1156:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1159:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    115c:	e9 5e ff ff ff       	jmp    10bf <fourfiles+0x8f>
          printf(1, "wrong char\n");
    1161:	83 ec 08             	sub    $0x8,%esp
    1164:	68 7d 42 00 00       	push   $0x427d
    1169:	6a 01                	push   $0x1
    116b:	e8 60 29 00 00       	call   3ad0 <printf>
          exit();
    1170:	e8 fd 27 00 00       	call   3972 <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    1175:	83 ec 08             	sub    $0x8,%esp
    1178:	68 02 02 00 00       	push   $0x202
    117d:	56                   	push   %esi
    117e:	e8 2f 28 00 00       	call   39b2 <open>
      if(fd < 0){
    1183:	83 c4 10             	add    $0x10,%esp
    1186:	85 c0                	test   %eax,%eax
      fd = open(fname, O_CREATE | O_RDWR);
    1188:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    118a:	78 5a                	js     11e6 <fourfiles+0x1b6>
      memset(buf, '0'+pi, 512);
    118c:	83 ec 04             	sub    $0x4,%esp
    118f:	83 c3 30             	add    $0x30,%ebx
    1192:	68 00 02 00 00       	push   $0x200
    1197:	53                   	push   %ebx
    1198:	bb 0c 00 00 00       	mov    $0xc,%ebx
    119d:	68 60 86 00 00       	push   $0x8660
    11a2:	e8 39 26 00 00       	call   37e0 <memset>
    11a7:	83 c4 10             	add    $0x10,%esp
        if((n = write(fd, buf, 500)) != 500){
    11aa:	83 ec 04             	sub    $0x4,%esp
    11ad:	68 f4 01 00 00       	push   $0x1f4
    11b2:	68 60 86 00 00       	push   $0x8660
    11b7:	56                   	push   %esi
    11b8:	e8 d5 27 00 00       	call   3992 <write>
    11bd:	83 c4 10             	add    $0x10,%esp
    11c0:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    11c5:	75 0a                	jne    11d1 <fourfiles+0x1a1>
      for(i = 0; i < 12; i++){
    11c7:	83 eb 01             	sub    $0x1,%ebx
    11ca:	75 de                	jne    11aa <fourfiles+0x17a>
      exit();
    11cc:	e8 a1 27 00 00       	call   3972 <exit>
          printf(1, "write failed %d\n", n);
    11d1:	83 ec 04             	sub    $0x4,%esp
    11d4:	50                   	push   %eax
    11d5:	68 6c 42 00 00       	push   $0x426c
    11da:	6a 01                	push   $0x1
    11dc:	e8 ef 28 00 00       	call   3ad0 <printf>
          exit();
    11e1:	e8 8c 27 00 00       	call   3972 <exit>
        printf(1, "create failed\n");
    11e6:	83 ec 08             	sub    $0x8,%esp
    11e9:	68 f7 44 00 00       	push   $0x44f7
    11ee:	6a 01                	push   $0x1
    11f0:	e8 db 28 00 00       	call   3ad0 <printf>
        exit();
    11f5:	e8 78 27 00 00       	call   3972 <exit>
      printf(1, "wrong length %d\n", total);
    11fa:	83 ec 04             	sub    $0x4,%esp
    11fd:	53                   	push   %ebx
    11fe:	68 89 42 00 00       	push   $0x4289
    1203:	6a 01                	push   $0x1
    1205:	e8 c6 28 00 00       	call   3ad0 <printf>
      exit();
    120a:	e8 63 27 00 00       	call   3972 <exit>
      printf(1, "fork failed\n");
    120f:	83 ec 08             	sub    $0x8,%esp
    1212:	68 31 4d 00 00       	push   $0x4d31
    1217:	6a 01                	push   $0x1
    1219:	e8 b2 28 00 00       	call   3ad0 <printf>
      exit();
    121e:	e8 4f 27 00 00       	call   3972 <exit>
    1223:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001230 <createdelete>:
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	57                   	push   %edi
    1234:	56                   	push   %esi
    1235:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    1236:	31 db                	xor    %ebx,%ebx
{
    1238:	83 ec 44             	sub    $0x44,%esp
  printf(1, "createdelete test\n");
    123b:	68 a8 42 00 00       	push   $0x42a8
    1240:	6a 01                	push   $0x1
    1242:	e8 89 28 00 00       	call   3ad0 <printf>
    1247:	83 c4 10             	add    $0x10,%esp
    pid = fork(0);
    124a:	83 ec 0c             	sub    $0xc,%esp
    124d:	6a 00                	push   $0x0
    124f:	e8 16 27 00 00       	call   396a <fork>
    if(pid < 0){
    1254:	83 c4 10             	add    $0x10,%esp
    1257:	85 c0                	test   %eax,%eax
    1259:	0f 88 b7 01 00 00    	js     1416 <createdelete+0x1e6>
    if(pid == 0){
    125f:	0f 84 f6 00 00 00    	je     135b <createdelete+0x12b>
  for(pi = 0; pi < 4; pi++){
    1265:	83 c3 01             	add    $0x1,%ebx
    1268:	83 fb 04             	cmp    $0x4,%ebx
    126b:	75 dd                	jne    124a <createdelete+0x1a>
    126d:	8d 7d c8             	lea    -0x38(%ebp),%edi
  for(i = 0; i < N; i++){
    1270:	31 f6                	xor    %esi,%esi
    wait();
    1272:	e8 03 27 00 00       	call   397a <wait>
    1277:	e8 fe 26 00 00       	call   397a <wait>
    127c:	e8 f9 26 00 00       	call   397a <wait>
    1281:	e8 f4 26 00 00       	call   397a <wait>
  name[0] = name[1] = name[2] = 0;
    1286:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    128a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1290:	8d 46 30             	lea    0x30(%esi),%eax
    1293:	83 fe 09             	cmp    $0x9,%esi
      name[2] = '\0';
    1296:	bb 70 00 00 00       	mov    $0x70,%ebx
    129b:	0f 9f c2             	setg   %dl
    129e:	85 f6                	test   %esi,%esi
    12a0:	88 45 c7             	mov    %al,-0x39(%ebp)
    12a3:	0f 94 c0             	sete   %al
    12a6:	09 c2                	or     %eax,%edx
      } else if((i >= 1 && i < N/2) && fd >= 0){
    12a8:	8d 46 ff             	lea    -0x1(%esi),%eax
    12ab:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    12ae:	89 45 c0             	mov    %eax,-0x40(%ebp)
      name[1] = '0' + i;
    12b1:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    12b5:	83 ec 08             	sub    $0x8,%esp
      name[0] = 'p' + pi;
    12b8:	88 5d c8             	mov    %bl,-0x38(%ebp)
      fd = open(name, 0);
    12bb:	6a 00                	push   $0x0
    12bd:	57                   	push   %edi
      name[1] = '0' + i;
    12be:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    12c1:	e8 ec 26 00 00       	call   39b2 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    12c6:	89 c1                	mov    %eax,%ecx
    12c8:	83 c4 10             	add    $0x10,%esp
    12cb:	c1 e9 1f             	shr    $0x1f,%ecx
    12ce:	84 c9                	test   %cl,%cl
    12d0:	74 0a                	je     12dc <createdelete+0xac>
    12d2:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    12d6:	0f 85 11 01 00 00    	jne    13ed <createdelete+0x1bd>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    12dc:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    12e0:	0f 86 44 01 00 00    	jbe    142a <createdelete+0x1fa>
      if(fd >= 0)
    12e6:	85 c0                	test   %eax,%eax
    12e8:	78 0c                	js     12f6 <createdelete+0xc6>
        close(fd);
    12ea:	83 ec 0c             	sub    $0xc,%esp
    12ed:	50                   	push   %eax
    12ee:	e8 a7 26 00 00       	call   399a <close>
    12f3:	83 c4 10             	add    $0x10,%esp
    12f6:	83 c3 01             	add    $0x1,%ebx
    for(pi = 0; pi < 4; pi++){
    12f9:	80 fb 74             	cmp    $0x74,%bl
    12fc:	75 b3                	jne    12b1 <createdelete+0x81>
  for(i = 0; i < N; i++){
    12fe:	83 c6 01             	add    $0x1,%esi
    1301:	83 fe 14             	cmp    $0x14,%esi
    1304:	75 8a                	jne    1290 <createdelete+0x60>
    1306:	be 70 00 00 00       	mov    $0x70,%esi
    130b:	90                   	nop
    130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1310:	8d 46 c0             	lea    -0x40(%esi),%eax
    1313:	bb 04 00 00 00       	mov    $0x4,%ebx
    1318:	88 45 c7             	mov    %al,-0x39(%ebp)
      name[0] = 'p' + i;
    131b:	89 f0                	mov    %esi,%eax
      unlink(name);
    131d:	83 ec 0c             	sub    $0xc,%esp
      name[0] = 'p' + i;
    1320:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    1323:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    1327:	57                   	push   %edi
      name[1] = '0' + i;
    1328:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    132b:	e8 92 26 00 00       	call   39c2 <unlink>
    for(pi = 0; pi < 4; pi++){
    1330:	83 c4 10             	add    $0x10,%esp
    1333:	83 eb 01             	sub    $0x1,%ebx
    1336:	75 e3                	jne    131b <createdelete+0xeb>
    1338:	83 c6 01             	add    $0x1,%esi
  for(i = 0; i < N; i++){
    133b:	89 f0                	mov    %esi,%eax
    133d:	3c 84                	cmp    $0x84,%al
    133f:	75 cf                	jne    1310 <createdelete+0xe0>
  printf(1, "createdelete ok\n");
    1341:	83 ec 08             	sub    $0x8,%esp
    1344:	68 bb 42 00 00       	push   $0x42bb
    1349:	6a 01                	push   $0x1
    134b:	e8 80 27 00 00       	call   3ad0 <printf>
}
    1350:	83 c4 10             	add    $0x10,%esp
    1353:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1356:	5b                   	pop    %ebx
    1357:	5e                   	pop    %esi
    1358:	5f                   	pop    %edi
    1359:	5d                   	pop    %ebp
    135a:	c3                   	ret    
      name[0] = 'p' + pi;
    135b:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    135e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1362:	be 01 00 00 00       	mov    $0x1,%esi
      name[0] = 'p' + pi;
    1367:	88 5d c8             	mov    %bl,-0x38(%ebp)
    136a:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    136d:	31 db                	xor    %ebx,%ebx
    136f:	eb 12                	jmp    1383 <createdelete+0x153>
    1371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1378:	83 fe 14             	cmp    $0x14,%esi
    137b:	74 6b                	je     13e8 <createdelete+0x1b8>
    137d:	83 c3 01             	add    $0x1,%ebx
    1380:	83 c6 01             	add    $0x1,%esi
        fd = open(name, O_CREATE | O_RDWR);
    1383:	83 ec 08             	sub    $0x8,%esp
        name[1] = '0' + i;
    1386:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    1389:	68 02 02 00 00       	push   $0x202
    138e:	57                   	push   %edi
        name[1] = '0' + i;
    138f:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    1392:	e8 1b 26 00 00       	call   39b2 <open>
        if(fd < 0){
    1397:	83 c4 10             	add    $0x10,%esp
    139a:	85 c0                	test   %eax,%eax
    139c:	78 64                	js     1402 <createdelete+0x1d2>
        close(fd);
    139e:	83 ec 0c             	sub    $0xc,%esp
    13a1:	50                   	push   %eax
    13a2:	e8 f3 25 00 00       	call   399a <close>
        if(i > 0 && (i % 2 ) == 0){
    13a7:	83 c4 10             	add    $0x10,%esp
    13aa:	85 db                	test   %ebx,%ebx
    13ac:	74 cf                	je     137d <createdelete+0x14d>
    13ae:	f6 c3 01             	test   $0x1,%bl
    13b1:	75 c5                	jne    1378 <createdelete+0x148>
          if(unlink(name) < 0){
    13b3:	83 ec 0c             	sub    $0xc,%esp
          name[1] = '0' + (i / 2);
    13b6:	89 d8                	mov    %ebx,%eax
    13b8:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    13ba:	57                   	push   %edi
          name[1] = '0' + (i / 2);
    13bb:	83 c0 30             	add    $0x30,%eax
    13be:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    13c1:	e8 fc 25 00 00       	call   39c2 <unlink>
    13c6:	83 c4 10             	add    $0x10,%esp
    13c9:	85 c0                	test   %eax,%eax
    13cb:	79 ab                	jns    1378 <createdelete+0x148>
            printf(1, "unlink failed\n");
    13cd:	83 ec 08             	sub    $0x8,%esp
    13d0:	68 a9 3e 00 00       	push   $0x3ea9
    13d5:	6a 01                	push   $0x1
    13d7:	e8 f4 26 00 00       	call   3ad0 <printf>
            exit();
    13dc:	e8 91 25 00 00       	call   3972 <exit>
    13e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      exit();
    13e8:	e8 85 25 00 00       	call   3972 <exit>
        printf(1, "oops createdelete %s didn't exist\n", name);
    13ed:	83 ec 04             	sub    $0x4,%esp
    13f0:	57                   	push   %edi
    13f1:	68 68 4f 00 00       	push   $0x4f68
    13f6:	6a 01                	push   $0x1
    13f8:	e8 d3 26 00 00       	call   3ad0 <printf>
        exit();
    13fd:	e8 70 25 00 00       	call   3972 <exit>
          printf(1, "create failed\n");
    1402:	83 ec 08             	sub    $0x8,%esp
    1405:	68 f7 44 00 00       	push   $0x44f7
    140a:	6a 01                	push   $0x1
    140c:	e8 bf 26 00 00       	call   3ad0 <printf>
          exit();
    1411:	e8 5c 25 00 00       	call   3972 <exit>
      printf(1, "fork failed\n");
    1416:	83 ec 08             	sub    $0x8,%esp
    1419:	68 31 4d 00 00       	push   $0x4d31
    141e:	6a 01                	push   $0x1
    1420:	e8 ab 26 00 00       	call   3ad0 <printf>
      exit();
    1425:	e8 48 25 00 00       	call   3972 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    142a:	85 c0                	test   %eax,%eax
    142c:	0f 88 c4 fe ff ff    	js     12f6 <createdelete+0xc6>
        printf(1, "oops createdelete %s did exist\n", name);
    1432:	83 ec 04             	sub    $0x4,%esp
    1435:	57                   	push   %edi
    1436:	68 8c 4f 00 00       	push   $0x4f8c
    143b:	6a 01                	push   $0x1
    143d:	e8 8e 26 00 00       	call   3ad0 <printf>
        exit();
    1442:	e8 2b 25 00 00       	call   3972 <exit>
    1447:	89 f6                	mov    %esi,%esi
    1449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001450 <unlinkread>:
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	56                   	push   %esi
    1454:	53                   	push   %ebx
  printf(1, "unlinkread test\n");
    1455:	83 ec 08             	sub    $0x8,%esp
    1458:	68 cc 42 00 00       	push   $0x42cc
    145d:	6a 01                	push   $0x1
    145f:	e8 6c 26 00 00       	call   3ad0 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1464:	5b                   	pop    %ebx
    1465:	5e                   	pop    %esi
    1466:	68 02 02 00 00       	push   $0x202
    146b:	68 dd 42 00 00       	push   $0x42dd
    1470:	e8 3d 25 00 00       	call   39b2 <open>
  if(fd < 0){
    1475:	83 c4 10             	add    $0x10,%esp
    1478:	85 c0                	test   %eax,%eax
    147a:	0f 88 e6 00 00 00    	js     1566 <unlinkread+0x116>
  write(fd, "hello", 5);
    1480:	83 ec 04             	sub    $0x4,%esp
    1483:	89 c3                	mov    %eax,%ebx
    1485:	6a 05                	push   $0x5
    1487:	68 02 43 00 00       	push   $0x4302
    148c:	50                   	push   %eax
    148d:	e8 00 25 00 00       	call   3992 <write>
  close(fd);
    1492:	89 1c 24             	mov    %ebx,(%esp)
    1495:	e8 00 25 00 00       	call   399a <close>
  fd = open("unlinkread", O_RDWR);
    149a:	58                   	pop    %eax
    149b:	5a                   	pop    %edx
    149c:	6a 02                	push   $0x2
    149e:	68 dd 42 00 00       	push   $0x42dd
    14a3:	e8 0a 25 00 00       	call   39b2 <open>
  if(fd < 0){
    14a8:	83 c4 10             	add    $0x10,%esp
    14ab:	85 c0                	test   %eax,%eax
  fd = open("unlinkread", O_RDWR);
    14ad:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    14af:	0f 88 10 01 00 00    	js     15c5 <unlinkread+0x175>
  if(unlink("unlinkread") != 0){
    14b5:	83 ec 0c             	sub    $0xc,%esp
    14b8:	68 dd 42 00 00       	push   $0x42dd
    14bd:	e8 00 25 00 00       	call   39c2 <unlink>
    14c2:	83 c4 10             	add    $0x10,%esp
    14c5:	85 c0                	test   %eax,%eax
    14c7:	0f 85 e5 00 00 00    	jne    15b2 <unlinkread+0x162>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14cd:	83 ec 08             	sub    $0x8,%esp
    14d0:	68 02 02 00 00       	push   $0x202
    14d5:	68 dd 42 00 00       	push   $0x42dd
    14da:	e8 d3 24 00 00       	call   39b2 <open>
  write(fd1, "yyy", 3);
    14df:	83 c4 0c             	add    $0xc,%esp
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14e2:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    14e4:	6a 03                	push   $0x3
    14e6:	68 3a 43 00 00       	push   $0x433a
    14eb:	50                   	push   %eax
    14ec:	e8 a1 24 00 00       	call   3992 <write>
  close(fd1);
    14f1:	89 34 24             	mov    %esi,(%esp)
    14f4:	e8 a1 24 00 00       	call   399a <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    14f9:	83 c4 0c             	add    $0xc,%esp
    14fc:	68 00 20 00 00       	push   $0x2000
    1501:	68 60 86 00 00       	push   $0x8660
    1506:	53                   	push   %ebx
    1507:	e8 7e 24 00 00       	call   398a <read>
    150c:	83 c4 10             	add    $0x10,%esp
    150f:	83 f8 05             	cmp    $0x5,%eax
    1512:	0f 85 87 00 00 00    	jne    159f <unlinkread+0x14f>
  if(buf[0] != 'h'){
    1518:	80 3d 60 86 00 00 68 	cmpb   $0x68,0x8660
    151f:	75 6b                	jne    158c <unlinkread+0x13c>
  if(write(fd, buf, 10) != 10){
    1521:	83 ec 04             	sub    $0x4,%esp
    1524:	6a 0a                	push   $0xa
    1526:	68 60 86 00 00       	push   $0x8660
    152b:	53                   	push   %ebx
    152c:	e8 61 24 00 00       	call   3992 <write>
    1531:	83 c4 10             	add    $0x10,%esp
    1534:	83 f8 0a             	cmp    $0xa,%eax
    1537:	75 40                	jne    1579 <unlinkread+0x129>
  close(fd);
    1539:	83 ec 0c             	sub    $0xc,%esp
    153c:	53                   	push   %ebx
    153d:	e8 58 24 00 00       	call   399a <close>
  unlink("unlinkread");
    1542:	c7 04 24 dd 42 00 00 	movl   $0x42dd,(%esp)
    1549:	e8 74 24 00 00       	call   39c2 <unlink>
  printf(1, "unlinkread ok\n");
    154e:	58                   	pop    %eax
    154f:	5a                   	pop    %edx
    1550:	68 85 43 00 00       	push   $0x4385
    1555:	6a 01                	push   $0x1
    1557:	e8 74 25 00 00       	call   3ad0 <printf>
}
    155c:	83 c4 10             	add    $0x10,%esp
    155f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1562:	5b                   	pop    %ebx
    1563:	5e                   	pop    %esi
    1564:	5d                   	pop    %ebp
    1565:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    1566:	51                   	push   %ecx
    1567:	51                   	push   %ecx
    1568:	68 e8 42 00 00       	push   $0x42e8
    156d:	6a 01                	push   $0x1
    156f:	e8 5c 25 00 00       	call   3ad0 <printf>
    exit();
    1574:	e8 f9 23 00 00       	call   3972 <exit>
    printf(1, "unlinkread write failed\n");
    1579:	51                   	push   %ecx
    157a:	51                   	push   %ecx
    157b:	68 6c 43 00 00       	push   $0x436c
    1580:	6a 01                	push   $0x1
    1582:	e8 49 25 00 00       	call   3ad0 <printf>
    exit();
    1587:	e8 e6 23 00 00       	call   3972 <exit>
    printf(1, "unlinkread wrong data\n");
    158c:	53                   	push   %ebx
    158d:	53                   	push   %ebx
    158e:	68 55 43 00 00       	push   $0x4355
    1593:	6a 01                	push   $0x1
    1595:	e8 36 25 00 00       	call   3ad0 <printf>
    exit();
    159a:	e8 d3 23 00 00       	call   3972 <exit>
    printf(1, "unlinkread read failed");
    159f:	56                   	push   %esi
    15a0:	56                   	push   %esi
    15a1:	68 3e 43 00 00       	push   $0x433e
    15a6:	6a 01                	push   $0x1
    15a8:	e8 23 25 00 00       	call   3ad0 <printf>
    exit();
    15ad:	e8 c0 23 00 00       	call   3972 <exit>
    printf(1, "unlink unlinkread failed\n");
    15b2:	50                   	push   %eax
    15b3:	50                   	push   %eax
    15b4:	68 20 43 00 00       	push   $0x4320
    15b9:	6a 01                	push   $0x1
    15bb:	e8 10 25 00 00       	call   3ad0 <printf>
    exit();
    15c0:	e8 ad 23 00 00       	call   3972 <exit>
    printf(1, "open unlinkread failed\n");
    15c5:	50                   	push   %eax
    15c6:	50                   	push   %eax
    15c7:	68 08 43 00 00       	push   $0x4308
    15cc:	6a 01                	push   $0x1
    15ce:	e8 fd 24 00 00       	call   3ad0 <printf>
    exit();
    15d3:	e8 9a 23 00 00       	call   3972 <exit>
    15d8:	90                   	nop
    15d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000015e0 <linktest>:
{
    15e0:	55                   	push   %ebp
    15e1:	89 e5                	mov    %esp,%ebp
    15e3:	53                   	push   %ebx
    15e4:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "linktest\n");
    15e7:	68 94 43 00 00       	push   $0x4394
    15ec:	6a 01                	push   $0x1
    15ee:	e8 dd 24 00 00       	call   3ad0 <printf>
  unlink("lf1");
    15f3:	c7 04 24 9e 43 00 00 	movl   $0x439e,(%esp)
    15fa:	e8 c3 23 00 00       	call   39c2 <unlink>
  unlink("lf2");
    15ff:	c7 04 24 a2 43 00 00 	movl   $0x43a2,(%esp)
    1606:	e8 b7 23 00 00       	call   39c2 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    160b:	58                   	pop    %eax
    160c:	5a                   	pop    %edx
    160d:	68 02 02 00 00       	push   $0x202
    1612:	68 9e 43 00 00       	push   $0x439e
    1617:	e8 96 23 00 00       	call   39b2 <open>
  if(fd < 0){
    161c:	83 c4 10             	add    $0x10,%esp
    161f:	85 c0                	test   %eax,%eax
    1621:	0f 88 1e 01 00 00    	js     1745 <linktest+0x165>
  if(write(fd, "hello", 5) != 5){
    1627:	83 ec 04             	sub    $0x4,%esp
    162a:	89 c3                	mov    %eax,%ebx
    162c:	6a 05                	push   $0x5
    162e:	68 02 43 00 00       	push   $0x4302
    1633:	50                   	push   %eax
    1634:	e8 59 23 00 00       	call   3992 <write>
    1639:	83 c4 10             	add    $0x10,%esp
    163c:	83 f8 05             	cmp    $0x5,%eax
    163f:	0f 85 98 01 00 00    	jne    17dd <linktest+0x1fd>
  close(fd);
    1645:	83 ec 0c             	sub    $0xc,%esp
    1648:	53                   	push   %ebx
    1649:	e8 4c 23 00 00       	call   399a <close>
  if(link("lf1", "lf2") < 0){
    164e:	5b                   	pop    %ebx
    164f:	58                   	pop    %eax
    1650:	68 a2 43 00 00       	push   $0x43a2
    1655:	68 9e 43 00 00       	push   $0x439e
    165a:	e8 73 23 00 00       	call   39d2 <link>
    165f:	83 c4 10             	add    $0x10,%esp
    1662:	85 c0                	test   %eax,%eax
    1664:	0f 88 60 01 00 00    	js     17ca <linktest+0x1ea>
  unlink("lf1");
    166a:	83 ec 0c             	sub    $0xc,%esp
    166d:	68 9e 43 00 00       	push   $0x439e
    1672:	e8 4b 23 00 00       	call   39c2 <unlink>
  if(open("lf1", 0) >= 0){
    1677:	58                   	pop    %eax
    1678:	5a                   	pop    %edx
    1679:	6a 00                	push   $0x0
    167b:	68 9e 43 00 00       	push   $0x439e
    1680:	e8 2d 23 00 00       	call   39b2 <open>
    1685:	83 c4 10             	add    $0x10,%esp
    1688:	85 c0                	test   %eax,%eax
    168a:	0f 89 27 01 00 00    	jns    17b7 <linktest+0x1d7>
  fd = open("lf2", 0);
    1690:	83 ec 08             	sub    $0x8,%esp
    1693:	6a 00                	push   $0x0
    1695:	68 a2 43 00 00       	push   $0x43a2
    169a:	e8 13 23 00 00       	call   39b2 <open>
  if(fd < 0){
    169f:	83 c4 10             	add    $0x10,%esp
    16a2:	85 c0                	test   %eax,%eax
  fd = open("lf2", 0);
    16a4:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    16a6:	0f 88 f8 00 00 00    	js     17a4 <linktest+0x1c4>
  if(read(fd, buf, sizeof(buf)) != 5){
    16ac:	83 ec 04             	sub    $0x4,%esp
    16af:	68 00 20 00 00       	push   $0x2000
    16b4:	68 60 86 00 00       	push   $0x8660
    16b9:	50                   	push   %eax
    16ba:	e8 cb 22 00 00       	call   398a <read>
    16bf:	83 c4 10             	add    $0x10,%esp
    16c2:	83 f8 05             	cmp    $0x5,%eax
    16c5:	0f 85 c6 00 00 00    	jne    1791 <linktest+0x1b1>
  close(fd);
    16cb:	83 ec 0c             	sub    $0xc,%esp
    16ce:	53                   	push   %ebx
    16cf:	e8 c6 22 00 00       	call   399a <close>
  if(link("lf2", "lf2") >= 0){
    16d4:	58                   	pop    %eax
    16d5:	5a                   	pop    %edx
    16d6:	68 a2 43 00 00       	push   $0x43a2
    16db:	68 a2 43 00 00       	push   $0x43a2
    16e0:	e8 ed 22 00 00       	call   39d2 <link>
    16e5:	83 c4 10             	add    $0x10,%esp
    16e8:	85 c0                	test   %eax,%eax
    16ea:	0f 89 8e 00 00 00    	jns    177e <linktest+0x19e>
  unlink("lf2");
    16f0:	83 ec 0c             	sub    $0xc,%esp
    16f3:	68 a2 43 00 00       	push   $0x43a2
    16f8:	e8 c5 22 00 00       	call   39c2 <unlink>
  if(link("lf2", "lf1") >= 0){
    16fd:	59                   	pop    %ecx
    16fe:	5b                   	pop    %ebx
    16ff:	68 9e 43 00 00       	push   $0x439e
    1704:	68 a2 43 00 00       	push   $0x43a2
    1709:	e8 c4 22 00 00       	call   39d2 <link>
    170e:	83 c4 10             	add    $0x10,%esp
    1711:	85 c0                	test   %eax,%eax
    1713:	79 56                	jns    176b <linktest+0x18b>
  if(link(".", "lf1") >= 0){
    1715:	83 ec 08             	sub    $0x8,%esp
    1718:	68 9e 43 00 00       	push   $0x439e
    171d:	68 66 46 00 00       	push   $0x4666
    1722:	e8 ab 22 00 00       	call   39d2 <link>
    1727:	83 c4 10             	add    $0x10,%esp
    172a:	85 c0                	test   %eax,%eax
    172c:	79 2a                	jns    1758 <linktest+0x178>
  printf(1, "linktest ok\n");
    172e:	83 ec 08             	sub    $0x8,%esp
    1731:	68 3c 44 00 00       	push   $0x443c
    1736:	6a 01                	push   $0x1
    1738:	e8 93 23 00 00       	call   3ad0 <printf>
}
    173d:	83 c4 10             	add    $0x10,%esp
    1740:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1743:	c9                   	leave  
    1744:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    1745:	50                   	push   %eax
    1746:	50                   	push   %eax
    1747:	68 a6 43 00 00       	push   $0x43a6
    174c:	6a 01                	push   $0x1
    174e:	e8 7d 23 00 00       	call   3ad0 <printf>
    exit();
    1753:	e8 1a 22 00 00       	call   3972 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    1758:	50                   	push   %eax
    1759:	50                   	push   %eax
    175a:	68 20 44 00 00       	push   $0x4420
    175f:	6a 01                	push   $0x1
    1761:	e8 6a 23 00 00       	call   3ad0 <printf>
    exit();
    1766:	e8 07 22 00 00       	call   3972 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    176b:	52                   	push   %edx
    176c:	52                   	push   %edx
    176d:	68 d4 4f 00 00       	push   $0x4fd4
    1772:	6a 01                	push   $0x1
    1774:	e8 57 23 00 00       	call   3ad0 <printf>
    exit();
    1779:	e8 f4 21 00 00       	call   3972 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    177e:	50                   	push   %eax
    177f:	50                   	push   %eax
    1780:	68 02 44 00 00       	push   $0x4402
    1785:	6a 01                	push   $0x1
    1787:	e8 44 23 00 00       	call   3ad0 <printf>
    exit();
    178c:	e8 e1 21 00 00       	call   3972 <exit>
    printf(1, "read lf2 failed\n");
    1791:	51                   	push   %ecx
    1792:	51                   	push   %ecx
    1793:	68 f1 43 00 00       	push   $0x43f1
    1798:	6a 01                	push   $0x1
    179a:	e8 31 23 00 00       	call   3ad0 <printf>
    exit();
    179f:	e8 ce 21 00 00       	call   3972 <exit>
    printf(1, "open lf2 failed\n");
    17a4:	53                   	push   %ebx
    17a5:	53                   	push   %ebx
    17a6:	68 e0 43 00 00       	push   $0x43e0
    17ab:	6a 01                	push   $0x1
    17ad:	e8 1e 23 00 00       	call   3ad0 <printf>
    exit();
    17b2:	e8 bb 21 00 00       	call   3972 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    17b7:	50                   	push   %eax
    17b8:	50                   	push   %eax
    17b9:	68 ac 4f 00 00       	push   $0x4fac
    17be:	6a 01                	push   $0x1
    17c0:	e8 0b 23 00 00       	call   3ad0 <printf>
    exit();
    17c5:	e8 a8 21 00 00       	call   3972 <exit>
    printf(1, "link lf1 lf2 failed\n");
    17ca:	51                   	push   %ecx
    17cb:	51                   	push   %ecx
    17cc:	68 cb 43 00 00       	push   $0x43cb
    17d1:	6a 01                	push   $0x1
    17d3:	e8 f8 22 00 00       	call   3ad0 <printf>
    exit();
    17d8:	e8 95 21 00 00       	call   3972 <exit>
    printf(1, "write lf1 failed\n");
    17dd:	50                   	push   %eax
    17de:	50                   	push   %eax
    17df:	68 b9 43 00 00       	push   $0x43b9
    17e4:	6a 01                	push   $0x1
    17e6:	e8 e5 22 00 00       	call   3ad0 <printf>
    exit();
    17eb:	e8 82 21 00 00       	call   3972 <exit>

000017f0 <concreate>:
{
    17f0:	55                   	push   %ebp
    17f1:	89 e5                	mov    %esp,%ebp
    17f3:	57                   	push   %edi
    17f4:	56                   	push   %esi
    17f5:	53                   	push   %ebx
  for(i = 0; i < 40; i++){
    17f6:	31 f6                	xor    %esi,%esi
    17f8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    if(pid && (i % 3) == 1){
    17fb:	bf 56 55 55 55       	mov    $0x55555556,%edi
{
    1800:	83 ec 64             	sub    $0x64,%esp
  printf(1, "concreate test\n");
    1803:	68 49 44 00 00       	push   $0x4449
    1808:	6a 01                	push   $0x1
    180a:	e8 c1 22 00 00       	call   3ad0 <printf>
  file[0] = 'C';
    180f:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    1813:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    1817:	83 c4 10             	add    $0x10,%esp
    181a:	eb 51                	jmp    186d <concreate+0x7d>
    181c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid && (i % 3) == 1){
    1820:	89 f0                	mov    %esi,%eax
    1822:	89 f1                	mov    %esi,%ecx
    1824:	f7 ef                	imul   %edi
    1826:	89 f0                	mov    %esi,%eax
    1828:	c1 f8 1f             	sar    $0x1f,%eax
    182b:	29 c2                	sub    %eax,%edx
    182d:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1830:	29 c1                	sub    %eax,%ecx
    1832:	83 f9 01             	cmp    $0x1,%ecx
    1835:	0f 84 c5 00 00 00    	je     1900 <concreate+0x110>
      fd = open(file, O_CREATE | O_RDWR);
    183b:	83 ec 08             	sub    $0x8,%esp
    183e:	68 02 02 00 00       	push   $0x202
    1843:	53                   	push   %ebx
    1844:	e8 69 21 00 00       	call   39b2 <open>
      if(fd < 0){
    1849:	83 c4 10             	add    $0x10,%esp
    184c:	85 c0                	test   %eax,%eax
    184e:	78 74                	js     18c4 <concreate+0xd4>
      close(fd);
    1850:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    1853:	83 c6 01             	add    $0x1,%esi
      close(fd);
    1856:	50                   	push   %eax
    1857:	e8 3e 21 00 00       	call   399a <close>
    185c:	83 c4 10             	add    $0x10,%esp
      wait();
    185f:	e8 16 21 00 00       	call   397a <wait>
  for(i = 0; i < 40; i++){
    1864:	83 fe 28             	cmp    $0x28,%esi
    1867:	0f 84 bb 00 00 00    	je     1928 <concreate+0x138>
    unlink(file);
    186d:	83 ec 0c             	sub    $0xc,%esp
    file[1] = '0' + i;
    1870:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    1873:	53                   	push   %ebx
    file[1] = '0' + i;
    1874:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1877:	e8 46 21 00 00       	call   39c2 <unlink>
    pid = fork(0);
    187c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1883:	e8 e2 20 00 00       	call   396a <fork>
    if(pid && (i % 3) == 1){
    1888:	83 c4 10             	add    $0x10,%esp
    188b:	85 c0                	test   %eax,%eax
    188d:	75 91                	jne    1820 <concreate+0x30>
    } else if(pid == 0 && (i % 5) == 1){
    188f:	89 f0                	mov    %esi,%eax
    1891:	ba 67 66 66 66       	mov    $0x66666667,%edx
    1896:	f7 ea                	imul   %edx
    1898:	89 f0                	mov    %esi,%eax
    189a:	c1 f8 1f             	sar    $0x1f,%eax
    189d:	d1 fa                	sar    %edx
    189f:	29 c2                	sub    %eax,%edx
    18a1:	8d 04 92             	lea    (%edx,%edx,4),%eax
    18a4:	29 c6                	sub    %eax,%esi
    18a6:	83 fe 01             	cmp    $0x1,%esi
    18a9:	74 35                	je     18e0 <concreate+0xf0>
      fd = open(file, O_CREATE | O_RDWR);
    18ab:	83 ec 08             	sub    $0x8,%esp
    18ae:	68 02 02 00 00       	push   $0x202
    18b3:	53                   	push   %ebx
    18b4:	e8 f9 20 00 00       	call   39b2 <open>
      if(fd < 0){
    18b9:	83 c4 10             	add    $0x10,%esp
    18bc:	85 c0                	test   %eax,%eax
    18be:	0f 89 4b 02 00 00    	jns    1b0f <concreate+0x31f>
        printf(1, "concreate create %s failed\n", file);
    18c4:	83 ec 04             	sub    $0x4,%esp
    18c7:	53                   	push   %ebx
    18c8:	68 5c 44 00 00       	push   $0x445c
    18cd:	6a 01                	push   $0x1
    18cf:	e8 fc 21 00 00       	call   3ad0 <printf>
        exit();
    18d4:	e8 99 20 00 00       	call   3972 <exit>
    18d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      link("C0", file);
    18e0:	83 ec 08             	sub    $0x8,%esp
    18e3:	53                   	push   %ebx
    18e4:	68 59 44 00 00       	push   $0x4459
    18e9:	e8 e4 20 00 00       	call   39d2 <link>
    18ee:	83 c4 10             	add    $0x10,%esp
      exit();
    18f1:	e8 7c 20 00 00       	call   3972 <exit>
    18f6:	8d 76 00             	lea    0x0(%esi),%esi
    18f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      link("C0", file);
    1900:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < 40; i++){
    1903:	83 c6 01             	add    $0x1,%esi
      link("C0", file);
    1906:	53                   	push   %ebx
    1907:	68 59 44 00 00       	push   $0x4459
    190c:	e8 c1 20 00 00       	call   39d2 <link>
    1911:	83 c4 10             	add    $0x10,%esp
      wait();
    1914:	e8 61 20 00 00       	call   397a <wait>
  for(i = 0; i < 40; i++){
    1919:	83 fe 28             	cmp    $0x28,%esi
    191c:	0f 85 4b ff ff ff    	jne    186d <concreate+0x7d>
    1922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  memset(fa, 0, sizeof(fa));
    1928:	8d 45 c0             	lea    -0x40(%ebp),%eax
    192b:	83 ec 04             	sub    $0x4,%esp
    192e:	8d 7d b0             	lea    -0x50(%ebp),%edi
    1931:	6a 28                	push   $0x28
    1933:	6a 00                	push   $0x0
    1935:	50                   	push   %eax
    1936:	e8 a5 1e 00 00       	call   37e0 <memset>
  fd = open(".", 0);
    193b:	59                   	pop    %ecx
    193c:	5e                   	pop    %esi
    193d:	6a 00                	push   $0x0
    193f:	68 66 46 00 00       	push   $0x4666
    1944:	e8 69 20 00 00       	call   39b2 <open>
  while(read(fd, &de, sizeof(de)) > 0){
    1949:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    194c:	89 c6                	mov    %eax,%esi
  n = 0;
    194e:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    1955:	8d 76 00             	lea    0x0(%esi),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    1958:	83 ec 04             	sub    $0x4,%esp
    195b:	6a 10                	push   $0x10
    195d:	57                   	push   %edi
    195e:	56                   	push   %esi
    195f:	e8 26 20 00 00       	call   398a <read>
    1964:	83 c4 10             	add    $0x10,%esp
    1967:	85 c0                	test   %eax,%eax
    1969:	7e 3d                	jle    19a8 <concreate+0x1b8>
    if(de.inum == 0)
    196b:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1970:	74 e6                	je     1958 <concreate+0x168>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1972:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1976:	75 e0                	jne    1958 <concreate+0x168>
    1978:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    197c:	75 da                	jne    1958 <concreate+0x168>
      i = de.name[1] - '0';
    197e:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1982:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1985:	83 f8 27             	cmp    $0x27,%eax
    1988:	0f 87 69 01 00 00    	ja     1af7 <concreate+0x307>
      if(fa[i]){
    198e:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1993:	0f 85 46 01 00 00    	jne    1adf <concreate+0x2ef>
      fa[i] = 1;
    1999:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    199e:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    19a2:	eb b4                	jmp    1958 <concreate+0x168>
    19a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  close(fd);
    19a8:	83 ec 0c             	sub    $0xc,%esp
    19ab:	56                   	push   %esi
    19ac:	e8 e9 1f 00 00       	call   399a <close>
  if(n != 40){
    19b1:	83 c4 10             	add    $0x10,%esp
    19b4:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    19b8:	0f 85 0d 01 00 00    	jne    1acb <concreate+0x2db>
    19be:	31 f6                	xor    %esi,%esi
    19c0:	eb 70                	jmp    1a32 <concreate+0x242>
    19c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
       ((i % 3) == 1 && pid != 0)){
    19c8:	83 fa 01             	cmp    $0x1,%edx
    19cb:	0f 85 a1 00 00 00    	jne    1a72 <concreate+0x282>
      close(open(file, 0));
    19d1:	83 ec 08             	sub    $0x8,%esp
    19d4:	6a 00                	push   $0x0
    19d6:	53                   	push   %ebx
    19d7:	e8 d6 1f 00 00       	call   39b2 <open>
    19dc:	89 04 24             	mov    %eax,(%esp)
    19df:	e8 b6 1f 00 00       	call   399a <close>
      close(open(file, 0));
    19e4:	58                   	pop    %eax
    19e5:	5a                   	pop    %edx
    19e6:	6a 00                	push   $0x0
    19e8:	53                   	push   %ebx
    19e9:	e8 c4 1f 00 00       	call   39b2 <open>
    19ee:	89 04 24             	mov    %eax,(%esp)
    19f1:	e8 a4 1f 00 00       	call   399a <close>
      close(open(file, 0));
    19f6:	59                   	pop    %ecx
    19f7:	58                   	pop    %eax
    19f8:	6a 00                	push   $0x0
    19fa:	53                   	push   %ebx
    19fb:	e8 b2 1f 00 00       	call   39b2 <open>
    1a00:	89 04 24             	mov    %eax,(%esp)
    1a03:	e8 92 1f 00 00       	call   399a <close>
      close(open(file, 0));
    1a08:	58                   	pop    %eax
    1a09:	5a                   	pop    %edx
    1a0a:	6a 00                	push   $0x0
    1a0c:	53                   	push   %ebx
    1a0d:	e8 a0 1f 00 00       	call   39b2 <open>
    1a12:	89 04 24             	mov    %eax,(%esp)
    1a15:	e8 80 1f 00 00       	call   399a <close>
    1a1a:	83 c4 10             	add    $0x10,%esp
    if(pid == 0)
    1a1d:	85 ff                	test   %edi,%edi
    1a1f:	0f 84 cc fe ff ff    	je     18f1 <concreate+0x101>
  for(i = 0; i < 40; i++){
    1a25:	83 c6 01             	add    $0x1,%esi
      wait();
    1a28:	e8 4d 1f 00 00       	call   397a <wait>
  for(i = 0; i < 40; i++){
    1a2d:	83 fe 28             	cmp    $0x28,%esi
    1a30:	74 6e                	je     1aa0 <concreate+0x2b0>
    pid = fork(0);
    1a32:	83 ec 0c             	sub    $0xc,%esp
    file[1] = '0' + i;
    1a35:	8d 46 30             	lea    0x30(%esi),%eax
    pid = fork(0);
    1a38:	6a 00                	push   $0x0
    file[1] = '0' + i;
    1a3a:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork(0);
    1a3d:	e8 28 1f 00 00       	call   396a <fork>
    if(pid < 0){
    1a42:	83 c4 10             	add    $0x10,%esp
    1a45:	85 c0                	test   %eax,%eax
    pid = fork(0);
    1a47:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1a49:	78 6c                	js     1ab7 <concreate+0x2c7>
    if(((i % 3) == 0 && pid == 0) ||
    1a4b:	b8 56 55 55 55       	mov    $0x55555556,%eax
    1a50:	f7 ee                	imul   %esi
    1a52:	89 f0                	mov    %esi,%eax
    1a54:	c1 f8 1f             	sar    $0x1f,%eax
    1a57:	29 c2                	sub    %eax,%edx
    1a59:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1a5c:	89 f2                	mov    %esi,%edx
    1a5e:	29 c2                	sub    %eax,%edx
    1a60:	89 f8                	mov    %edi,%eax
    1a62:	09 d0                	or     %edx,%eax
    1a64:	0f 84 67 ff ff ff    	je     19d1 <concreate+0x1e1>
       ((i % 3) == 1 && pid != 0)){
    1a6a:	85 ff                	test   %edi,%edi
    1a6c:	0f 85 56 ff ff ff    	jne    19c8 <concreate+0x1d8>
      unlink(file);
    1a72:	83 ec 0c             	sub    $0xc,%esp
    1a75:	53                   	push   %ebx
    1a76:	e8 47 1f 00 00       	call   39c2 <unlink>
      unlink(file);
    1a7b:	89 1c 24             	mov    %ebx,(%esp)
    1a7e:	e8 3f 1f 00 00       	call   39c2 <unlink>
      unlink(file);
    1a83:	89 1c 24             	mov    %ebx,(%esp)
    1a86:	e8 37 1f 00 00       	call   39c2 <unlink>
      unlink(file);
    1a8b:	89 1c 24             	mov    %ebx,(%esp)
    1a8e:	e8 2f 1f 00 00       	call   39c2 <unlink>
    1a93:	83 c4 10             	add    $0x10,%esp
    1a96:	eb 85                	jmp    1a1d <concreate+0x22d>
    1a98:	90                   	nop
    1a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  printf(1, "concreate ok\n");
    1aa0:	83 ec 08             	sub    $0x8,%esp
    1aa3:	68 ae 44 00 00       	push   $0x44ae
    1aa8:	6a 01                	push   $0x1
    1aaa:	e8 21 20 00 00       	call   3ad0 <printf>
}
    1aaf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1ab2:	5b                   	pop    %ebx
    1ab3:	5e                   	pop    %esi
    1ab4:	5f                   	pop    %edi
    1ab5:	5d                   	pop    %ebp
    1ab6:	c3                   	ret    
      printf(1, "fork failed\n");
    1ab7:	83 ec 08             	sub    $0x8,%esp
    1aba:	68 31 4d 00 00       	push   $0x4d31
    1abf:	6a 01                	push   $0x1
    1ac1:	e8 0a 20 00 00       	call   3ad0 <printf>
      exit();
    1ac6:	e8 a7 1e 00 00       	call   3972 <exit>
    printf(1, "concreate not enough files in directory listing\n");
    1acb:	83 ec 08             	sub    $0x8,%esp
    1ace:	68 f8 4f 00 00       	push   $0x4ff8
    1ad3:	6a 01                	push   $0x1
    1ad5:	e8 f6 1f 00 00       	call   3ad0 <printf>
    exit();
    1ada:	e8 93 1e 00 00       	call   3972 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    1adf:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1ae2:	83 ec 04             	sub    $0x4,%esp
    1ae5:	50                   	push   %eax
    1ae6:	68 91 44 00 00       	push   $0x4491
    1aeb:	6a 01                	push   $0x1
    1aed:	e8 de 1f 00 00       	call   3ad0 <printf>
        exit();
    1af2:	e8 7b 1e 00 00       	call   3972 <exit>
        printf(1, "concreate weird file %s\n", de.name);
    1af7:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1afa:	83 ec 04             	sub    $0x4,%esp
    1afd:	50                   	push   %eax
    1afe:	68 78 44 00 00       	push   $0x4478
    1b03:	6a 01                	push   $0x1
    1b05:	e8 c6 1f 00 00       	call   3ad0 <printf>
        exit();
    1b0a:	e8 63 1e 00 00       	call   3972 <exit>
      close(fd);
    1b0f:	83 ec 0c             	sub    $0xc,%esp
    1b12:	50                   	push   %eax
    1b13:	e8 82 1e 00 00       	call   399a <close>
    1b18:	83 c4 10             	add    $0x10,%esp
    1b1b:	e9 d1 fd ff ff       	jmp    18f1 <concreate+0x101>

00001b20 <linkunlink>:
{
    1b20:	55                   	push   %ebp
    1b21:	89 e5                	mov    %esp,%ebp
    1b23:	57                   	push   %edi
    1b24:	56                   	push   %esi
    1b25:	53                   	push   %ebx
    1b26:	83 ec 24             	sub    $0x24,%esp
  printf(1, "linkunlink test\n");
    1b29:	68 bc 44 00 00       	push   $0x44bc
    1b2e:	6a 01                	push   $0x1
    1b30:	e8 9b 1f 00 00       	call   3ad0 <printf>
  unlink("x");
    1b35:	c7 04 24 49 47 00 00 	movl   $0x4749,(%esp)
    1b3c:	e8 81 1e 00 00       	call   39c2 <unlink>
  pid = fork(0);
    1b41:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1b48:	e8 1d 1e 00 00       	call   396a <fork>
  if(pid < 0){
    1b4d:	83 c4 10             	add    $0x10,%esp
    1b50:	85 c0                	test   %eax,%eax
  pid = fork(0);
    1b52:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1b55:	0f 88 b7 00 00 00    	js     1c12 <linkunlink+0xf2>
  unsigned int x = (pid ? 1 : 97);
    1b5b:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1b5f:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    1b64:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  unsigned int x = (pid ? 1 : 97);
    1b69:	19 ff                	sbb    %edi,%edi
    1b6b:	83 e7 60             	and    $0x60,%edi
    1b6e:	83 c7 01             	add    $0x1,%edi
    1b71:	eb 1f                	jmp    1b92 <linkunlink+0x72>
    1b73:	90                   	nop
    1b74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if((x % 3) == 1){
    1b78:	83 fa 01             	cmp    $0x1,%edx
    1b7b:	74 7b                	je     1bf8 <linkunlink+0xd8>
      unlink("x");
    1b7d:	83 ec 0c             	sub    $0xc,%esp
    1b80:	68 49 47 00 00       	push   $0x4749
    1b85:	e8 38 1e 00 00       	call   39c2 <unlink>
    1b8a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1b8d:	83 eb 01             	sub    $0x1,%ebx
    1b90:	74 3d                	je     1bcf <linkunlink+0xaf>
    x = x * 1103515245 + 12345;
    1b92:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1b98:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1b9e:	89 f8                	mov    %edi,%eax
    1ba0:	f7 e6                	mul    %esi
    1ba2:	d1 ea                	shr    %edx
    1ba4:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1ba7:	89 fa                	mov    %edi,%edx
    1ba9:	29 c2                	sub    %eax,%edx
    1bab:	75 cb                	jne    1b78 <linkunlink+0x58>
      close(open("x", O_RDWR | O_CREATE));
    1bad:	83 ec 08             	sub    $0x8,%esp
    1bb0:	68 02 02 00 00       	push   $0x202
    1bb5:	68 49 47 00 00       	push   $0x4749
    1bba:	e8 f3 1d 00 00       	call   39b2 <open>
    1bbf:	89 04 24             	mov    %eax,(%esp)
    1bc2:	e8 d3 1d 00 00       	call   399a <close>
    1bc7:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1bca:	83 eb 01             	sub    $0x1,%ebx
    1bcd:	75 c3                	jne    1b92 <linkunlink+0x72>
  if(pid)
    1bcf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1bd2:	85 c0                	test   %eax,%eax
    1bd4:	74 50                	je     1c26 <linkunlink+0x106>
    wait();
    1bd6:	e8 9f 1d 00 00       	call   397a <wait>
  printf(1, "linkunlink ok\n");
    1bdb:	83 ec 08             	sub    $0x8,%esp
    1bde:	68 d1 44 00 00       	push   $0x44d1
    1be3:	6a 01                	push   $0x1
    1be5:	e8 e6 1e 00 00       	call   3ad0 <printf>
}
    1bea:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1bed:	5b                   	pop    %ebx
    1bee:	5e                   	pop    %esi
    1bef:	5f                   	pop    %edi
    1bf0:	5d                   	pop    %ebp
    1bf1:	c3                   	ret    
    1bf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      link("cat", "x");
    1bf8:	83 ec 08             	sub    $0x8,%esp
    1bfb:	68 49 47 00 00       	push   $0x4749
    1c00:	68 cd 44 00 00       	push   $0x44cd
    1c05:	e8 c8 1d 00 00       	call   39d2 <link>
    1c0a:	83 c4 10             	add    $0x10,%esp
    1c0d:	e9 7b ff ff ff       	jmp    1b8d <linkunlink+0x6d>
    printf(1, "fork failed\n");
    1c12:	83 ec 08             	sub    $0x8,%esp
    1c15:	68 31 4d 00 00       	push   $0x4d31
    1c1a:	6a 01                	push   $0x1
    1c1c:	e8 af 1e 00 00       	call   3ad0 <printf>
    exit();
    1c21:	e8 4c 1d 00 00       	call   3972 <exit>
    exit();
    1c26:	e8 47 1d 00 00       	call   3972 <exit>
    1c2b:	90                   	nop
    1c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001c30 <bigdir>:
{
    1c30:	55                   	push   %ebp
    1c31:	89 e5                	mov    %esp,%ebp
    1c33:	57                   	push   %edi
    1c34:	56                   	push   %esi
    1c35:	53                   	push   %ebx
    1c36:	83 ec 24             	sub    $0x24,%esp
  printf(1, "bigdir test\n");
    1c39:	68 e0 44 00 00       	push   $0x44e0
    1c3e:	6a 01                	push   $0x1
    1c40:	e8 8b 1e 00 00       	call   3ad0 <printf>
  unlink("bd");
    1c45:	c7 04 24 ed 44 00 00 	movl   $0x44ed,(%esp)
    1c4c:	e8 71 1d 00 00       	call   39c2 <unlink>
  fd = open("bd", O_CREATE);
    1c51:	58                   	pop    %eax
    1c52:	5a                   	pop    %edx
    1c53:	68 00 02 00 00       	push   $0x200
    1c58:	68 ed 44 00 00       	push   $0x44ed
    1c5d:	e8 50 1d 00 00       	call   39b2 <open>
  if(fd < 0){
    1c62:	83 c4 10             	add    $0x10,%esp
    1c65:	85 c0                	test   %eax,%eax
    1c67:	0f 88 de 00 00 00    	js     1d4b <bigdir+0x11b>
  close(fd);
    1c6d:	83 ec 0c             	sub    $0xc,%esp
    1c70:	8d 7d de             	lea    -0x22(%ebp),%edi
  for(i = 0; i < 500; i++){
    1c73:	31 f6                	xor    %esi,%esi
  close(fd);
    1c75:	50                   	push   %eax
    1c76:	e8 1f 1d 00 00       	call   399a <close>
    1c7b:	83 c4 10             	add    $0x10,%esp
    1c7e:	66 90                	xchg   %ax,%ax
    name[1] = '0' + (i / 64);
    1c80:	89 f0                	mov    %esi,%eax
    if(link("bd", name) != 0){
    1c82:	83 ec 08             	sub    $0x8,%esp
    name[0] = 'x';
    1c85:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1c89:	c1 f8 06             	sar    $0x6,%eax
    if(link("bd", name) != 0){
    1c8c:	57                   	push   %edi
    1c8d:	68 ed 44 00 00       	push   $0x44ed
    name[1] = '0' + (i / 64);
    1c92:	83 c0 30             	add    $0x30,%eax
    name[3] = '\0';
    1c95:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1c99:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1c9c:	89 f0                	mov    %esi,%eax
    1c9e:	83 e0 3f             	and    $0x3f,%eax
    1ca1:	83 c0 30             	add    $0x30,%eax
    1ca4:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(link("bd", name) != 0){
    1ca7:	e8 26 1d 00 00       	call   39d2 <link>
    1cac:	83 c4 10             	add    $0x10,%esp
    1caf:	85 c0                	test   %eax,%eax
    1cb1:	89 c3                	mov    %eax,%ebx
    1cb3:	75 6e                	jne    1d23 <bigdir+0xf3>
  for(i = 0; i < 500; i++){
    1cb5:	83 c6 01             	add    $0x1,%esi
    1cb8:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1cbe:	75 c0                	jne    1c80 <bigdir+0x50>
  unlink("bd");
    1cc0:	83 ec 0c             	sub    $0xc,%esp
    1cc3:	68 ed 44 00 00       	push   $0x44ed
    1cc8:	e8 f5 1c 00 00       	call   39c2 <unlink>
    1ccd:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + (i / 64);
    1cd0:	89 d8                	mov    %ebx,%eax
    if(unlink(name) != 0){
    1cd2:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'x';
    1cd5:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1cd9:	c1 f8 06             	sar    $0x6,%eax
    if(unlink(name) != 0){
    1cdc:	57                   	push   %edi
    name[3] = '\0';
    1cdd:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1ce1:	83 c0 30             	add    $0x30,%eax
    1ce4:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1ce7:	89 d8                	mov    %ebx,%eax
    1ce9:	83 e0 3f             	and    $0x3f,%eax
    1cec:	83 c0 30             	add    $0x30,%eax
    1cef:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(unlink(name) != 0){
    1cf2:	e8 cb 1c 00 00       	call   39c2 <unlink>
    1cf7:	83 c4 10             	add    $0x10,%esp
    1cfa:	85 c0                	test   %eax,%eax
    1cfc:	75 39                	jne    1d37 <bigdir+0x107>
  for(i = 0; i < 500; i++){
    1cfe:	83 c3 01             	add    $0x1,%ebx
    1d01:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1d07:	75 c7                	jne    1cd0 <bigdir+0xa0>
  printf(1, "bigdir ok\n");
    1d09:	83 ec 08             	sub    $0x8,%esp
    1d0c:	68 2f 45 00 00       	push   $0x452f
    1d11:	6a 01                	push   $0x1
    1d13:	e8 b8 1d 00 00       	call   3ad0 <printf>
}
    1d18:	83 c4 10             	add    $0x10,%esp
    1d1b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1d1e:	5b                   	pop    %ebx
    1d1f:	5e                   	pop    %esi
    1d20:	5f                   	pop    %edi
    1d21:	5d                   	pop    %ebp
    1d22:	c3                   	ret    
      printf(1, "bigdir link failed\n");
    1d23:	83 ec 08             	sub    $0x8,%esp
    1d26:	68 06 45 00 00       	push   $0x4506
    1d2b:	6a 01                	push   $0x1
    1d2d:	e8 9e 1d 00 00       	call   3ad0 <printf>
      exit();
    1d32:	e8 3b 1c 00 00       	call   3972 <exit>
      printf(1, "bigdir unlink failed");
    1d37:	83 ec 08             	sub    $0x8,%esp
    1d3a:	68 1a 45 00 00       	push   $0x451a
    1d3f:	6a 01                	push   $0x1
    1d41:	e8 8a 1d 00 00       	call   3ad0 <printf>
      exit();
    1d46:	e8 27 1c 00 00       	call   3972 <exit>
    printf(1, "bigdir create failed\n");
    1d4b:	83 ec 08             	sub    $0x8,%esp
    1d4e:	68 f0 44 00 00       	push   $0x44f0
    1d53:	6a 01                	push   $0x1
    1d55:	e8 76 1d 00 00       	call   3ad0 <printf>
    exit();
    1d5a:	e8 13 1c 00 00       	call   3972 <exit>
    1d5f:	90                   	nop

00001d60 <subdir>:
{
    1d60:	55                   	push   %ebp
    1d61:	89 e5                	mov    %esp,%ebp
    1d63:	53                   	push   %ebx
    1d64:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "subdir test\n");
    1d67:	68 3a 45 00 00       	push   $0x453a
    1d6c:	6a 01                	push   $0x1
    1d6e:	e8 5d 1d 00 00       	call   3ad0 <printf>
  unlink("ff");
    1d73:	c7 04 24 c3 45 00 00 	movl   $0x45c3,(%esp)
    1d7a:	e8 43 1c 00 00       	call   39c2 <unlink>
  if(mkdir("dd") != 0){
    1d7f:	c7 04 24 60 46 00 00 	movl   $0x4660,(%esp)
    1d86:	e8 4f 1c 00 00       	call   39da <mkdir>
    1d8b:	83 c4 10             	add    $0x10,%esp
    1d8e:	85 c0                	test   %eax,%eax
    1d90:	0f 85 b3 05 00 00    	jne    2349 <subdir+0x5e9>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d96:	83 ec 08             	sub    $0x8,%esp
    1d99:	68 02 02 00 00       	push   $0x202
    1d9e:	68 99 45 00 00       	push   $0x4599
    1da3:	e8 0a 1c 00 00       	call   39b2 <open>
  if(fd < 0){
    1da8:	83 c4 10             	add    $0x10,%esp
    1dab:	85 c0                	test   %eax,%eax
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1dad:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1daf:	0f 88 81 05 00 00    	js     2336 <subdir+0x5d6>
  write(fd, "ff", 2);
    1db5:	83 ec 04             	sub    $0x4,%esp
    1db8:	6a 02                	push   $0x2
    1dba:	68 c3 45 00 00       	push   $0x45c3
    1dbf:	50                   	push   %eax
    1dc0:	e8 cd 1b 00 00       	call   3992 <write>
  close(fd);
    1dc5:	89 1c 24             	mov    %ebx,(%esp)
    1dc8:	e8 cd 1b 00 00       	call   399a <close>
  if(unlink("dd") >= 0){
    1dcd:	c7 04 24 60 46 00 00 	movl   $0x4660,(%esp)
    1dd4:	e8 e9 1b 00 00       	call   39c2 <unlink>
    1dd9:	83 c4 10             	add    $0x10,%esp
    1ddc:	85 c0                	test   %eax,%eax
    1dde:	0f 89 3f 05 00 00    	jns    2323 <subdir+0x5c3>
  if(mkdir("/dd/dd") != 0){
    1de4:	83 ec 0c             	sub    $0xc,%esp
    1de7:	68 74 45 00 00       	push   $0x4574
    1dec:	e8 e9 1b 00 00       	call   39da <mkdir>
    1df1:	83 c4 10             	add    $0x10,%esp
    1df4:	85 c0                	test   %eax,%eax
    1df6:	0f 85 14 05 00 00    	jne    2310 <subdir+0x5b0>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dfc:	83 ec 08             	sub    $0x8,%esp
    1dff:	68 02 02 00 00       	push   $0x202
    1e04:	68 96 45 00 00       	push   $0x4596
    1e09:	e8 a4 1b 00 00       	call   39b2 <open>
  if(fd < 0){
    1e0e:	83 c4 10             	add    $0x10,%esp
    1e11:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1e13:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1e15:	0f 88 24 04 00 00    	js     223f <subdir+0x4df>
  write(fd, "FF", 2);
    1e1b:	83 ec 04             	sub    $0x4,%esp
    1e1e:	6a 02                	push   $0x2
    1e20:	68 b7 45 00 00       	push   $0x45b7
    1e25:	50                   	push   %eax
    1e26:	e8 67 1b 00 00       	call   3992 <write>
  close(fd);
    1e2b:	89 1c 24             	mov    %ebx,(%esp)
    1e2e:	e8 67 1b 00 00       	call   399a <close>
  fd = open("dd/dd/../ff", 0);
    1e33:	58                   	pop    %eax
    1e34:	5a                   	pop    %edx
    1e35:	6a 00                	push   $0x0
    1e37:	68 ba 45 00 00       	push   $0x45ba
    1e3c:	e8 71 1b 00 00       	call   39b2 <open>
  if(fd < 0){
    1e41:	83 c4 10             	add    $0x10,%esp
    1e44:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/../ff", 0);
    1e46:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1e48:	0f 88 de 03 00 00    	js     222c <subdir+0x4cc>
  cc = read(fd, buf, sizeof(buf));
    1e4e:	83 ec 04             	sub    $0x4,%esp
    1e51:	68 00 20 00 00       	push   $0x2000
    1e56:	68 60 86 00 00       	push   $0x8660
    1e5b:	50                   	push   %eax
    1e5c:	e8 29 1b 00 00       	call   398a <read>
  if(cc != 2 || buf[0] != 'f'){
    1e61:	83 c4 10             	add    $0x10,%esp
    1e64:	83 f8 02             	cmp    $0x2,%eax
    1e67:	0f 85 3a 03 00 00    	jne    21a7 <subdir+0x447>
    1e6d:	80 3d 60 86 00 00 66 	cmpb   $0x66,0x8660
    1e74:	0f 85 2d 03 00 00    	jne    21a7 <subdir+0x447>
  close(fd);
    1e7a:	83 ec 0c             	sub    $0xc,%esp
    1e7d:	53                   	push   %ebx
    1e7e:	e8 17 1b 00 00       	call   399a <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e83:	5b                   	pop    %ebx
    1e84:	58                   	pop    %eax
    1e85:	68 fa 45 00 00       	push   $0x45fa
    1e8a:	68 96 45 00 00       	push   $0x4596
    1e8f:	e8 3e 1b 00 00       	call   39d2 <link>
    1e94:	83 c4 10             	add    $0x10,%esp
    1e97:	85 c0                	test   %eax,%eax
    1e99:	0f 85 c6 03 00 00    	jne    2265 <subdir+0x505>
  if(unlink("dd/dd/ff") != 0){
    1e9f:	83 ec 0c             	sub    $0xc,%esp
    1ea2:	68 96 45 00 00       	push   $0x4596
    1ea7:	e8 16 1b 00 00       	call   39c2 <unlink>
    1eac:	83 c4 10             	add    $0x10,%esp
    1eaf:	85 c0                	test   %eax,%eax
    1eb1:	0f 85 16 03 00 00    	jne    21cd <subdir+0x46d>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1eb7:	83 ec 08             	sub    $0x8,%esp
    1eba:	6a 00                	push   $0x0
    1ebc:	68 96 45 00 00       	push   $0x4596
    1ec1:	e8 ec 1a 00 00       	call   39b2 <open>
    1ec6:	83 c4 10             	add    $0x10,%esp
    1ec9:	85 c0                	test   %eax,%eax
    1ecb:	0f 89 2c 04 00 00    	jns    22fd <subdir+0x59d>
  if(chdir("dd") != 0){
    1ed1:	83 ec 0c             	sub    $0xc,%esp
    1ed4:	68 60 46 00 00       	push   $0x4660
    1ed9:	e8 04 1b 00 00       	call   39e2 <chdir>
    1ede:	83 c4 10             	add    $0x10,%esp
    1ee1:	85 c0                	test   %eax,%eax
    1ee3:	0f 85 01 04 00 00    	jne    22ea <subdir+0x58a>
  if(chdir("dd/../../dd") != 0){
    1ee9:	83 ec 0c             	sub    $0xc,%esp
    1eec:	68 2e 46 00 00       	push   $0x462e
    1ef1:	e8 ec 1a 00 00       	call   39e2 <chdir>
    1ef6:	83 c4 10             	add    $0x10,%esp
    1ef9:	85 c0                	test   %eax,%eax
    1efb:	0f 85 b9 02 00 00    	jne    21ba <subdir+0x45a>
  if(chdir("dd/../../../dd") != 0){
    1f01:	83 ec 0c             	sub    $0xc,%esp
    1f04:	68 54 46 00 00       	push   $0x4654
    1f09:	e8 d4 1a 00 00       	call   39e2 <chdir>
    1f0e:	83 c4 10             	add    $0x10,%esp
    1f11:	85 c0                	test   %eax,%eax
    1f13:	0f 85 a1 02 00 00    	jne    21ba <subdir+0x45a>
  if(chdir("./..") != 0){
    1f19:	83 ec 0c             	sub    $0xc,%esp
    1f1c:	68 63 46 00 00       	push   $0x4663
    1f21:	e8 bc 1a 00 00       	call   39e2 <chdir>
    1f26:	83 c4 10             	add    $0x10,%esp
    1f29:	85 c0                	test   %eax,%eax
    1f2b:	0f 85 21 03 00 00    	jne    2252 <subdir+0x4f2>
  fd = open("dd/dd/ffff", 0);
    1f31:	83 ec 08             	sub    $0x8,%esp
    1f34:	6a 00                	push   $0x0
    1f36:	68 fa 45 00 00       	push   $0x45fa
    1f3b:	e8 72 1a 00 00       	call   39b2 <open>
  if(fd < 0){
    1f40:	83 c4 10             	add    $0x10,%esp
    1f43:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ffff", 0);
    1f45:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1f47:	0f 88 e0 04 00 00    	js     242d <subdir+0x6cd>
  if(read(fd, buf, sizeof(buf)) != 2){
    1f4d:	83 ec 04             	sub    $0x4,%esp
    1f50:	68 00 20 00 00       	push   $0x2000
    1f55:	68 60 86 00 00       	push   $0x8660
    1f5a:	50                   	push   %eax
    1f5b:	e8 2a 1a 00 00       	call   398a <read>
    1f60:	83 c4 10             	add    $0x10,%esp
    1f63:	83 f8 02             	cmp    $0x2,%eax
    1f66:	0f 85 ae 04 00 00    	jne    241a <subdir+0x6ba>
  close(fd);
    1f6c:	83 ec 0c             	sub    $0xc,%esp
    1f6f:	53                   	push   %ebx
    1f70:	e8 25 1a 00 00       	call   399a <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f75:	59                   	pop    %ecx
    1f76:	5b                   	pop    %ebx
    1f77:	6a 00                	push   $0x0
    1f79:	68 96 45 00 00       	push   $0x4596
    1f7e:	e8 2f 1a 00 00       	call   39b2 <open>
    1f83:	83 c4 10             	add    $0x10,%esp
    1f86:	85 c0                	test   %eax,%eax
    1f88:	0f 89 65 02 00 00    	jns    21f3 <subdir+0x493>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1f8e:	83 ec 08             	sub    $0x8,%esp
    1f91:	68 02 02 00 00       	push   $0x202
    1f96:	68 ae 46 00 00       	push   $0x46ae
    1f9b:	e8 12 1a 00 00       	call   39b2 <open>
    1fa0:	83 c4 10             	add    $0x10,%esp
    1fa3:	85 c0                	test   %eax,%eax
    1fa5:	0f 89 35 02 00 00    	jns    21e0 <subdir+0x480>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1fab:	83 ec 08             	sub    $0x8,%esp
    1fae:	68 02 02 00 00       	push   $0x202
    1fb3:	68 d3 46 00 00       	push   $0x46d3
    1fb8:	e8 f5 19 00 00       	call   39b2 <open>
    1fbd:	83 c4 10             	add    $0x10,%esp
    1fc0:	85 c0                	test   %eax,%eax
    1fc2:	0f 89 0f 03 00 00    	jns    22d7 <subdir+0x577>
  if(open("dd", O_CREATE) >= 0){
    1fc8:	83 ec 08             	sub    $0x8,%esp
    1fcb:	68 00 02 00 00       	push   $0x200
    1fd0:	68 60 46 00 00       	push   $0x4660
    1fd5:	e8 d8 19 00 00       	call   39b2 <open>
    1fda:	83 c4 10             	add    $0x10,%esp
    1fdd:	85 c0                	test   %eax,%eax
    1fdf:	0f 89 df 02 00 00    	jns    22c4 <subdir+0x564>
  if(open("dd", O_RDWR) >= 0){
    1fe5:	83 ec 08             	sub    $0x8,%esp
    1fe8:	6a 02                	push   $0x2
    1fea:	68 60 46 00 00       	push   $0x4660
    1fef:	e8 be 19 00 00       	call   39b2 <open>
    1ff4:	83 c4 10             	add    $0x10,%esp
    1ff7:	85 c0                	test   %eax,%eax
    1ff9:	0f 89 b2 02 00 00    	jns    22b1 <subdir+0x551>
  if(open("dd", O_WRONLY) >= 0){
    1fff:	83 ec 08             	sub    $0x8,%esp
    2002:	6a 01                	push   $0x1
    2004:	68 60 46 00 00       	push   $0x4660
    2009:	e8 a4 19 00 00       	call   39b2 <open>
    200e:	83 c4 10             	add    $0x10,%esp
    2011:	85 c0                	test   %eax,%eax
    2013:	0f 89 85 02 00 00    	jns    229e <subdir+0x53e>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2019:	83 ec 08             	sub    $0x8,%esp
    201c:	68 42 47 00 00       	push   $0x4742
    2021:	68 ae 46 00 00       	push   $0x46ae
    2026:	e8 a7 19 00 00       	call   39d2 <link>
    202b:	83 c4 10             	add    $0x10,%esp
    202e:	85 c0                	test   %eax,%eax
    2030:	0f 84 55 02 00 00    	je     228b <subdir+0x52b>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    2036:	83 ec 08             	sub    $0x8,%esp
    2039:	68 42 47 00 00       	push   $0x4742
    203e:	68 d3 46 00 00       	push   $0x46d3
    2043:	e8 8a 19 00 00       	call   39d2 <link>
    2048:	83 c4 10             	add    $0x10,%esp
    204b:	85 c0                	test   %eax,%eax
    204d:	0f 84 25 02 00 00    	je     2278 <subdir+0x518>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2053:	83 ec 08             	sub    $0x8,%esp
    2056:	68 fa 45 00 00       	push   $0x45fa
    205b:	68 99 45 00 00       	push   $0x4599
    2060:	e8 6d 19 00 00       	call   39d2 <link>
    2065:	83 c4 10             	add    $0x10,%esp
    2068:	85 c0                	test   %eax,%eax
    206a:	0f 84 a9 01 00 00    	je     2219 <subdir+0x4b9>
  if(mkdir("dd/ff/ff") == 0){
    2070:	83 ec 0c             	sub    $0xc,%esp
    2073:	68 ae 46 00 00       	push   $0x46ae
    2078:	e8 5d 19 00 00       	call   39da <mkdir>
    207d:	83 c4 10             	add    $0x10,%esp
    2080:	85 c0                	test   %eax,%eax
    2082:	0f 84 7e 01 00 00    	je     2206 <subdir+0x4a6>
  if(mkdir("dd/xx/ff") == 0){
    2088:	83 ec 0c             	sub    $0xc,%esp
    208b:	68 d3 46 00 00       	push   $0x46d3
    2090:	e8 45 19 00 00       	call   39da <mkdir>
    2095:	83 c4 10             	add    $0x10,%esp
    2098:	85 c0                	test   %eax,%eax
    209a:	0f 84 67 03 00 00    	je     2407 <subdir+0x6a7>
  if(mkdir("dd/dd/ffff") == 0){
    20a0:	83 ec 0c             	sub    $0xc,%esp
    20a3:	68 fa 45 00 00       	push   $0x45fa
    20a8:	e8 2d 19 00 00       	call   39da <mkdir>
    20ad:	83 c4 10             	add    $0x10,%esp
    20b0:	85 c0                	test   %eax,%eax
    20b2:	0f 84 3c 03 00 00    	je     23f4 <subdir+0x694>
  if(unlink("dd/xx/ff") == 0){
    20b8:	83 ec 0c             	sub    $0xc,%esp
    20bb:	68 d3 46 00 00       	push   $0x46d3
    20c0:	e8 fd 18 00 00       	call   39c2 <unlink>
    20c5:	83 c4 10             	add    $0x10,%esp
    20c8:	85 c0                	test   %eax,%eax
    20ca:	0f 84 11 03 00 00    	je     23e1 <subdir+0x681>
  if(unlink("dd/ff/ff") == 0){
    20d0:	83 ec 0c             	sub    $0xc,%esp
    20d3:	68 ae 46 00 00       	push   $0x46ae
    20d8:	e8 e5 18 00 00       	call   39c2 <unlink>
    20dd:	83 c4 10             	add    $0x10,%esp
    20e0:	85 c0                	test   %eax,%eax
    20e2:	0f 84 e6 02 00 00    	je     23ce <subdir+0x66e>
  if(chdir("dd/ff") == 0){
    20e8:	83 ec 0c             	sub    $0xc,%esp
    20eb:	68 99 45 00 00       	push   $0x4599
    20f0:	e8 ed 18 00 00       	call   39e2 <chdir>
    20f5:	83 c4 10             	add    $0x10,%esp
    20f8:	85 c0                	test   %eax,%eax
    20fa:	0f 84 bb 02 00 00    	je     23bb <subdir+0x65b>
  if(chdir("dd/xx") == 0){
    2100:	83 ec 0c             	sub    $0xc,%esp
    2103:	68 45 47 00 00       	push   $0x4745
    2108:	e8 d5 18 00 00       	call   39e2 <chdir>
    210d:	83 c4 10             	add    $0x10,%esp
    2110:	85 c0                	test   %eax,%eax
    2112:	0f 84 90 02 00 00    	je     23a8 <subdir+0x648>
  if(unlink("dd/dd/ffff") != 0){
    2118:	83 ec 0c             	sub    $0xc,%esp
    211b:	68 fa 45 00 00       	push   $0x45fa
    2120:	e8 9d 18 00 00       	call   39c2 <unlink>
    2125:	83 c4 10             	add    $0x10,%esp
    2128:	85 c0                	test   %eax,%eax
    212a:	0f 85 9d 00 00 00    	jne    21cd <subdir+0x46d>
  if(unlink("dd/ff") != 0){
    2130:	83 ec 0c             	sub    $0xc,%esp
    2133:	68 99 45 00 00       	push   $0x4599
    2138:	e8 85 18 00 00       	call   39c2 <unlink>
    213d:	83 c4 10             	add    $0x10,%esp
    2140:	85 c0                	test   %eax,%eax
    2142:	0f 85 4d 02 00 00    	jne    2395 <subdir+0x635>
  if(unlink("dd") == 0){
    2148:	83 ec 0c             	sub    $0xc,%esp
    214b:	68 60 46 00 00       	push   $0x4660
    2150:	e8 6d 18 00 00       	call   39c2 <unlink>
    2155:	83 c4 10             	add    $0x10,%esp
    2158:	85 c0                	test   %eax,%eax
    215a:	0f 84 22 02 00 00    	je     2382 <subdir+0x622>
  if(unlink("dd/dd") < 0){
    2160:	83 ec 0c             	sub    $0xc,%esp
    2163:	68 75 45 00 00       	push   $0x4575
    2168:	e8 55 18 00 00       	call   39c2 <unlink>
    216d:	83 c4 10             	add    $0x10,%esp
    2170:	85 c0                	test   %eax,%eax
    2172:	0f 88 f7 01 00 00    	js     236f <subdir+0x60f>
  if(unlink("dd") < 0){
    2178:	83 ec 0c             	sub    $0xc,%esp
    217b:	68 60 46 00 00       	push   $0x4660
    2180:	e8 3d 18 00 00       	call   39c2 <unlink>
    2185:	83 c4 10             	add    $0x10,%esp
    2188:	85 c0                	test   %eax,%eax
    218a:	0f 88 cc 01 00 00    	js     235c <subdir+0x5fc>
  printf(1, "subdir ok\n");
    2190:	83 ec 08             	sub    $0x8,%esp
    2193:	68 42 48 00 00       	push   $0x4842
    2198:	6a 01                	push   $0x1
    219a:	e8 31 19 00 00       	call   3ad0 <printf>
}
    219f:	83 c4 10             	add    $0x10,%esp
    21a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    21a5:	c9                   	leave  
    21a6:	c3                   	ret    
    printf(1, "dd/dd/../ff wrong content\n");
    21a7:	50                   	push   %eax
    21a8:	50                   	push   %eax
    21a9:	68 df 45 00 00       	push   $0x45df
    21ae:	6a 01                	push   $0x1
    21b0:	e8 1b 19 00 00       	call   3ad0 <printf>
    exit();
    21b5:	e8 b8 17 00 00       	call   3972 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    21ba:	50                   	push   %eax
    21bb:	50                   	push   %eax
    21bc:	68 3a 46 00 00       	push   $0x463a
    21c1:	6a 01                	push   $0x1
    21c3:	e8 08 19 00 00       	call   3ad0 <printf>
    exit();
    21c8:	e8 a5 17 00 00       	call   3972 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    21cd:	52                   	push   %edx
    21ce:	52                   	push   %edx
    21cf:	68 05 46 00 00       	push   $0x4605
    21d4:	6a 01                	push   $0x1
    21d6:	e8 f5 18 00 00       	call   3ad0 <printf>
    exit();
    21db:	e8 92 17 00 00       	call   3972 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    21e0:	50                   	push   %eax
    21e1:	50                   	push   %eax
    21e2:	68 b7 46 00 00       	push   $0x46b7
    21e7:	6a 01                	push   $0x1
    21e9:	e8 e2 18 00 00       	call   3ad0 <printf>
    exit();
    21ee:	e8 7f 17 00 00       	call   3972 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    21f3:	52                   	push   %edx
    21f4:	52                   	push   %edx
    21f5:	68 9c 50 00 00       	push   $0x509c
    21fa:	6a 01                	push   $0x1
    21fc:	e8 cf 18 00 00       	call   3ad0 <printf>
    exit();
    2201:	e8 6c 17 00 00       	call   3972 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2206:	52                   	push   %edx
    2207:	52                   	push   %edx
    2208:	68 4b 47 00 00       	push   $0x474b
    220d:	6a 01                	push   $0x1
    220f:	e8 bc 18 00 00       	call   3ad0 <printf>
    exit();
    2214:	e8 59 17 00 00       	call   3972 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2219:	51                   	push   %ecx
    221a:	51                   	push   %ecx
    221b:	68 0c 51 00 00       	push   $0x510c
    2220:	6a 01                	push   $0x1
    2222:	e8 a9 18 00 00       	call   3ad0 <printf>
    exit();
    2227:	e8 46 17 00 00       	call   3972 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    222c:	50                   	push   %eax
    222d:	50                   	push   %eax
    222e:	68 c6 45 00 00       	push   $0x45c6
    2233:	6a 01                	push   $0x1
    2235:	e8 96 18 00 00       	call   3ad0 <printf>
    exit();
    223a:	e8 33 17 00 00       	call   3972 <exit>
    printf(1, "create dd/dd/ff failed\n");
    223f:	51                   	push   %ecx
    2240:	51                   	push   %ecx
    2241:	68 9f 45 00 00       	push   $0x459f
    2246:	6a 01                	push   $0x1
    2248:	e8 83 18 00 00       	call   3ad0 <printf>
    exit();
    224d:	e8 20 17 00 00       	call   3972 <exit>
    printf(1, "chdir ./.. failed\n");
    2252:	50                   	push   %eax
    2253:	50                   	push   %eax
    2254:	68 68 46 00 00       	push   $0x4668
    2259:	6a 01                	push   $0x1
    225b:	e8 70 18 00 00       	call   3ad0 <printf>
    exit();
    2260:	e8 0d 17 00 00       	call   3972 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2265:	51                   	push   %ecx
    2266:	51                   	push   %ecx
    2267:	68 54 50 00 00       	push   $0x5054
    226c:	6a 01                	push   $0x1
    226e:	e8 5d 18 00 00       	call   3ad0 <printf>
    exit();
    2273:	e8 fa 16 00 00       	call   3972 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2278:	53                   	push   %ebx
    2279:	53                   	push   %ebx
    227a:	68 e8 50 00 00       	push   $0x50e8
    227f:	6a 01                	push   $0x1
    2281:	e8 4a 18 00 00       	call   3ad0 <printf>
    exit();
    2286:	e8 e7 16 00 00       	call   3972 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    228b:	50                   	push   %eax
    228c:	50                   	push   %eax
    228d:	68 c4 50 00 00       	push   $0x50c4
    2292:	6a 01                	push   $0x1
    2294:	e8 37 18 00 00       	call   3ad0 <printf>
    exit();
    2299:	e8 d4 16 00 00       	call   3972 <exit>
    printf(1, "open dd wronly succeeded!\n");
    229e:	50                   	push   %eax
    229f:	50                   	push   %eax
    22a0:	68 27 47 00 00       	push   $0x4727
    22a5:	6a 01                	push   $0x1
    22a7:	e8 24 18 00 00       	call   3ad0 <printf>
    exit();
    22ac:	e8 c1 16 00 00       	call   3972 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    22b1:	50                   	push   %eax
    22b2:	50                   	push   %eax
    22b3:	68 0e 47 00 00       	push   $0x470e
    22b8:	6a 01                	push   $0x1
    22ba:	e8 11 18 00 00       	call   3ad0 <printf>
    exit();
    22bf:	e8 ae 16 00 00       	call   3972 <exit>
    printf(1, "create dd succeeded!\n");
    22c4:	50                   	push   %eax
    22c5:	50                   	push   %eax
    22c6:	68 f8 46 00 00       	push   $0x46f8
    22cb:	6a 01                	push   $0x1
    22cd:	e8 fe 17 00 00       	call   3ad0 <printf>
    exit();
    22d2:	e8 9b 16 00 00       	call   3972 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    22d7:	50                   	push   %eax
    22d8:	50                   	push   %eax
    22d9:	68 dc 46 00 00       	push   $0x46dc
    22de:	6a 01                	push   $0x1
    22e0:	e8 eb 17 00 00       	call   3ad0 <printf>
    exit();
    22e5:	e8 88 16 00 00       	call   3972 <exit>
    printf(1, "chdir dd failed\n");
    22ea:	50                   	push   %eax
    22eb:	50                   	push   %eax
    22ec:	68 1d 46 00 00       	push   $0x461d
    22f1:	6a 01                	push   $0x1
    22f3:	e8 d8 17 00 00       	call   3ad0 <printf>
    exit();
    22f8:	e8 75 16 00 00       	call   3972 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    22fd:	50                   	push   %eax
    22fe:	50                   	push   %eax
    22ff:	68 78 50 00 00       	push   $0x5078
    2304:	6a 01                	push   $0x1
    2306:	e8 c5 17 00 00       	call   3ad0 <printf>
    exit();
    230b:	e8 62 16 00 00       	call   3972 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    2310:	53                   	push   %ebx
    2311:	53                   	push   %ebx
    2312:	68 7b 45 00 00       	push   $0x457b
    2317:	6a 01                	push   $0x1
    2319:	e8 b2 17 00 00       	call   3ad0 <printf>
    exit();
    231e:	e8 4f 16 00 00       	call   3972 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    2323:	50                   	push   %eax
    2324:	50                   	push   %eax
    2325:	68 2c 50 00 00       	push   $0x502c
    232a:	6a 01                	push   $0x1
    232c:	e8 9f 17 00 00       	call   3ad0 <printf>
    exit();
    2331:	e8 3c 16 00 00       	call   3972 <exit>
    printf(1, "create dd/ff failed\n");
    2336:	50                   	push   %eax
    2337:	50                   	push   %eax
    2338:	68 5f 45 00 00       	push   $0x455f
    233d:	6a 01                	push   $0x1
    233f:	e8 8c 17 00 00       	call   3ad0 <printf>
    exit();
    2344:	e8 29 16 00 00       	call   3972 <exit>
    printf(1, "subdir mkdir dd failed\n");
    2349:	50                   	push   %eax
    234a:	50                   	push   %eax
    234b:	68 47 45 00 00       	push   $0x4547
    2350:	6a 01                	push   $0x1
    2352:	e8 79 17 00 00       	call   3ad0 <printf>
    exit();
    2357:	e8 16 16 00 00       	call   3972 <exit>
    printf(1, "unlink dd failed\n");
    235c:	50                   	push   %eax
    235d:	50                   	push   %eax
    235e:	68 30 48 00 00       	push   $0x4830
    2363:	6a 01                	push   $0x1
    2365:	e8 66 17 00 00       	call   3ad0 <printf>
    exit();
    236a:	e8 03 16 00 00       	call   3972 <exit>
    printf(1, "unlink dd/dd failed\n");
    236f:	52                   	push   %edx
    2370:	52                   	push   %edx
    2371:	68 1b 48 00 00       	push   $0x481b
    2376:	6a 01                	push   $0x1
    2378:	e8 53 17 00 00       	call   3ad0 <printf>
    exit();
    237d:	e8 f0 15 00 00       	call   3972 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    2382:	51                   	push   %ecx
    2383:	51                   	push   %ecx
    2384:	68 30 51 00 00       	push   $0x5130
    2389:	6a 01                	push   $0x1
    238b:	e8 40 17 00 00       	call   3ad0 <printf>
    exit();
    2390:	e8 dd 15 00 00       	call   3972 <exit>
    printf(1, "unlink dd/ff failed\n");
    2395:	53                   	push   %ebx
    2396:	53                   	push   %ebx
    2397:	68 06 48 00 00       	push   $0x4806
    239c:	6a 01                	push   $0x1
    239e:	e8 2d 17 00 00       	call   3ad0 <printf>
    exit();
    23a3:	e8 ca 15 00 00       	call   3972 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    23a8:	50                   	push   %eax
    23a9:	50                   	push   %eax
    23aa:	68 ee 47 00 00       	push   $0x47ee
    23af:	6a 01                	push   $0x1
    23b1:	e8 1a 17 00 00       	call   3ad0 <printf>
    exit();
    23b6:	e8 b7 15 00 00       	call   3972 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    23bb:	50                   	push   %eax
    23bc:	50                   	push   %eax
    23bd:	68 d6 47 00 00       	push   $0x47d6
    23c2:	6a 01                	push   $0x1
    23c4:	e8 07 17 00 00       	call   3ad0 <printf>
    exit();
    23c9:	e8 a4 15 00 00       	call   3972 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    23ce:	50                   	push   %eax
    23cf:	50                   	push   %eax
    23d0:	68 ba 47 00 00       	push   $0x47ba
    23d5:	6a 01                	push   $0x1
    23d7:	e8 f4 16 00 00       	call   3ad0 <printf>
    exit();
    23dc:	e8 91 15 00 00       	call   3972 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    23e1:	50                   	push   %eax
    23e2:	50                   	push   %eax
    23e3:	68 9e 47 00 00       	push   $0x479e
    23e8:	6a 01                	push   $0x1
    23ea:	e8 e1 16 00 00       	call   3ad0 <printf>
    exit();
    23ef:	e8 7e 15 00 00       	call   3972 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    23f4:	50                   	push   %eax
    23f5:	50                   	push   %eax
    23f6:	68 81 47 00 00       	push   $0x4781
    23fb:	6a 01                	push   $0x1
    23fd:	e8 ce 16 00 00       	call   3ad0 <printf>
    exit();
    2402:	e8 6b 15 00 00       	call   3972 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2407:	50                   	push   %eax
    2408:	50                   	push   %eax
    2409:	68 66 47 00 00       	push   $0x4766
    240e:	6a 01                	push   $0x1
    2410:	e8 bb 16 00 00       	call   3ad0 <printf>
    exit();
    2415:	e8 58 15 00 00       	call   3972 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    241a:	50                   	push   %eax
    241b:	50                   	push   %eax
    241c:	68 93 46 00 00       	push   $0x4693
    2421:	6a 01                	push   $0x1
    2423:	e8 a8 16 00 00       	call   3ad0 <printf>
    exit();
    2428:	e8 45 15 00 00       	call   3972 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    242d:	50                   	push   %eax
    242e:	50                   	push   %eax
    242f:	68 7b 46 00 00       	push   $0x467b
    2434:	6a 01                	push   $0x1
    2436:	e8 95 16 00 00       	call   3ad0 <printf>
    exit();
    243b:	e8 32 15 00 00       	call   3972 <exit>

00002440 <bigwrite>:
{
    2440:	55                   	push   %ebp
    2441:	89 e5                	mov    %esp,%ebp
    2443:	56                   	push   %esi
    2444:	53                   	push   %ebx
  for(sz = 499; sz < 12*512; sz += 471){
    2445:	bb f3 01 00 00       	mov    $0x1f3,%ebx
  printf(1, "bigwrite test\n");
    244a:	83 ec 08             	sub    $0x8,%esp
    244d:	68 4d 48 00 00       	push   $0x484d
    2452:	6a 01                	push   $0x1
    2454:	e8 77 16 00 00       	call   3ad0 <printf>
  unlink("bigwrite");
    2459:	c7 04 24 5c 48 00 00 	movl   $0x485c,(%esp)
    2460:	e8 5d 15 00 00       	call   39c2 <unlink>
    2465:	83 c4 10             	add    $0x10,%esp
    2468:	90                   	nop
    2469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2470:	83 ec 08             	sub    $0x8,%esp
    2473:	68 02 02 00 00       	push   $0x202
    2478:	68 5c 48 00 00       	push   $0x485c
    247d:	e8 30 15 00 00       	call   39b2 <open>
    if(fd < 0){
    2482:	83 c4 10             	add    $0x10,%esp
    2485:	85 c0                	test   %eax,%eax
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2487:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2489:	78 7e                	js     2509 <bigwrite+0xc9>
      int cc = write(fd, buf, sz);
    248b:	83 ec 04             	sub    $0x4,%esp
    248e:	53                   	push   %ebx
    248f:	68 60 86 00 00       	push   $0x8660
    2494:	50                   	push   %eax
    2495:	e8 f8 14 00 00       	call   3992 <write>
      if(cc != sz){
    249a:	83 c4 10             	add    $0x10,%esp
    249d:	39 d8                	cmp    %ebx,%eax
    249f:	75 55                	jne    24f6 <bigwrite+0xb6>
      int cc = write(fd, buf, sz);
    24a1:	83 ec 04             	sub    $0x4,%esp
    24a4:	53                   	push   %ebx
    24a5:	68 60 86 00 00       	push   $0x8660
    24aa:	56                   	push   %esi
    24ab:	e8 e2 14 00 00       	call   3992 <write>
      if(cc != sz){
    24b0:	83 c4 10             	add    $0x10,%esp
    24b3:	39 d8                	cmp    %ebx,%eax
    24b5:	75 3f                	jne    24f6 <bigwrite+0xb6>
    close(fd);
    24b7:	83 ec 0c             	sub    $0xc,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    24ba:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
    24c0:	56                   	push   %esi
    24c1:	e8 d4 14 00 00       	call   399a <close>
    unlink("bigwrite");
    24c6:	c7 04 24 5c 48 00 00 	movl   $0x485c,(%esp)
    24cd:	e8 f0 14 00 00       	call   39c2 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    24d2:	83 c4 10             	add    $0x10,%esp
    24d5:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    24db:	75 93                	jne    2470 <bigwrite+0x30>
  printf(1, "bigwrite ok\n");
    24dd:	83 ec 08             	sub    $0x8,%esp
    24e0:	68 8f 48 00 00       	push   $0x488f
    24e5:	6a 01                	push   $0x1
    24e7:	e8 e4 15 00 00       	call   3ad0 <printf>
}
    24ec:	83 c4 10             	add    $0x10,%esp
    24ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
    24f2:	5b                   	pop    %ebx
    24f3:	5e                   	pop    %esi
    24f4:	5d                   	pop    %ebp
    24f5:	c3                   	ret    
        printf(1, "write(%d) ret %d\n", sz, cc);
    24f6:	50                   	push   %eax
    24f7:	53                   	push   %ebx
    24f8:	68 7d 48 00 00       	push   $0x487d
    24fd:	6a 01                	push   $0x1
    24ff:	e8 cc 15 00 00       	call   3ad0 <printf>
        exit();
    2504:	e8 69 14 00 00       	call   3972 <exit>
      printf(1, "cannot create bigwrite\n");
    2509:	83 ec 08             	sub    $0x8,%esp
    250c:	68 65 48 00 00       	push   $0x4865
    2511:	6a 01                	push   $0x1
    2513:	e8 b8 15 00 00       	call   3ad0 <printf>
      exit();
    2518:	e8 55 14 00 00       	call   3972 <exit>
    251d:	8d 76 00             	lea    0x0(%esi),%esi

00002520 <bigfile>:
{
    2520:	55                   	push   %ebp
    2521:	89 e5                	mov    %esp,%ebp
    2523:	57                   	push   %edi
    2524:	56                   	push   %esi
    2525:	53                   	push   %ebx
    2526:	83 ec 14             	sub    $0x14,%esp
  printf(1, "bigfile test\n");
    2529:	68 9c 48 00 00       	push   $0x489c
    252e:	6a 01                	push   $0x1
    2530:	e8 9b 15 00 00       	call   3ad0 <printf>
  unlink("bigfile");
    2535:	c7 04 24 b8 48 00 00 	movl   $0x48b8,(%esp)
    253c:	e8 81 14 00 00       	call   39c2 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2541:	5e                   	pop    %esi
    2542:	5f                   	pop    %edi
    2543:	68 02 02 00 00       	push   $0x202
    2548:	68 b8 48 00 00       	push   $0x48b8
    254d:	e8 60 14 00 00       	call   39b2 <open>
  if(fd < 0){
    2552:	83 c4 10             	add    $0x10,%esp
    2555:	85 c0                	test   %eax,%eax
    2557:	0f 88 5f 01 00 00    	js     26bc <bigfile+0x19c>
    255d:	89 c6                	mov    %eax,%esi
    255f:	31 db                	xor    %ebx,%ebx
    2561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    memset(buf, i, 600);
    2568:	83 ec 04             	sub    $0x4,%esp
    256b:	68 58 02 00 00       	push   $0x258
    2570:	53                   	push   %ebx
    2571:	68 60 86 00 00       	push   $0x8660
    2576:	e8 65 12 00 00       	call   37e0 <memset>
    if(write(fd, buf, 600) != 600){
    257b:	83 c4 0c             	add    $0xc,%esp
    257e:	68 58 02 00 00       	push   $0x258
    2583:	68 60 86 00 00       	push   $0x8660
    2588:	56                   	push   %esi
    2589:	e8 04 14 00 00       	call   3992 <write>
    258e:	83 c4 10             	add    $0x10,%esp
    2591:	3d 58 02 00 00       	cmp    $0x258,%eax
    2596:	0f 85 f8 00 00 00    	jne    2694 <bigfile+0x174>
  for(i = 0; i < 20; i++){
    259c:	83 c3 01             	add    $0x1,%ebx
    259f:	83 fb 14             	cmp    $0x14,%ebx
    25a2:	75 c4                	jne    2568 <bigfile+0x48>
  close(fd);
    25a4:	83 ec 0c             	sub    $0xc,%esp
    25a7:	56                   	push   %esi
    25a8:	e8 ed 13 00 00       	call   399a <close>
  fd = open("bigfile", 0);
    25ad:	59                   	pop    %ecx
    25ae:	5b                   	pop    %ebx
    25af:	6a 00                	push   $0x0
    25b1:	68 b8 48 00 00       	push   $0x48b8
    25b6:	e8 f7 13 00 00       	call   39b2 <open>
  if(fd < 0){
    25bb:	83 c4 10             	add    $0x10,%esp
    25be:	85 c0                	test   %eax,%eax
  fd = open("bigfile", 0);
    25c0:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    25c2:	0f 88 e0 00 00 00    	js     26a8 <bigfile+0x188>
    25c8:	31 db                	xor    %ebx,%ebx
    25ca:	31 ff                	xor    %edi,%edi
    25cc:	eb 30                	jmp    25fe <bigfile+0xde>
    25ce:	66 90                	xchg   %ax,%ax
    if(cc != 300){
    25d0:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    25d5:	0f 85 91 00 00 00    	jne    266c <bigfile+0x14c>
    if(buf[0] != i/2 || buf[299] != i/2){
    25db:	0f be 05 60 86 00 00 	movsbl 0x8660,%eax
    25e2:	89 fa                	mov    %edi,%edx
    25e4:	d1 fa                	sar    %edx
    25e6:	39 d0                	cmp    %edx,%eax
    25e8:	75 6e                	jne    2658 <bigfile+0x138>
    25ea:	0f be 15 8b 87 00 00 	movsbl 0x878b,%edx
    25f1:	39 d0                	cmp    %edx,%eax
    25f3:	75 63                	jne    2658 <bigfile+0x138>
    total += cc;
    25f5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  for(i = 0; ; i++){
    25fb:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    25fe:	83 ec 04             	sub    $0x4,%esp
    2601:	68 2c 01 00 00       	push   $0x12c
    2606:	68 60 86 00 00       	push   $0x8660
    260b:	56                   	push   %esi
    260c:	e8 79 13 00 00       	call   398a <read>
    if(cc < 0){
    2611:	83 c4 10             	add    $0x10,%esp
    2614:	85 c0                	test   %eax,%eax
    2616:	78 68                	js     2680 <bigfile+0x160>
    if(cc == 0)
    2618:	75 b6                	jne    25d0 <bigfile+0xb0>
  close(fd);
    261a:	83 ec 0c             	sub    $0xc,%esp
    261d:	56                   	push   %esi
    261e:	e8 77 13 00 00       	call   399a <close>
  if(total != 20*600){
    2623:	83 c4 10             	add    $0x10,%esp
    2626:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    262c:	0f 85 9e 00 00 00    	jne    26d0 <bigfile+0x1b0>
  unlink("bigfile");
    2632:	83 ec 0c             	sub    $0xc,%esp
    2635:	68 b8 48 00 00       	push   $0x48b8
    263a:	e8 83 13 00 00       	call   39c2 <unlink>
  printf(1, "bigfile test ok\n");
    263f:	58                   	pop    %eax
    2640:	5a                   	pop    %edx
    2641:	68 47 49 00 00       	push   $0x4947
    2646:	6a 01                	push   $0x1
    2648:	e8 83 14 00 00       	call   3ad0 <printf>
}
    264d:	83 c4 10             	add    $0x10,%esp
    2650:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2653:	5b                   	pop    %ebx
    2654:	5e                   	pop    %esi
    2655:	5f                   	pop    %edi
    2656:	5d                   	pop    %ebp
    2657:	c3                   	ret    
      printf(1, "read bigfile wrong data\n");
    2658:	83 ec 08             	sub    $0x8,%esp
    265b:	68 14 49 00 00       	push   $0x4914
    2660:	6a 01                	push   $0x1
    2662:	e8 69 14 00 00       	call   3ad0 <printf>
      exit();
    2667:	e8 06 13 00 00       	call   3972 <exit>
      printf(1, "short read bigfile\n");
    266c:	83 ec 08             	sub    $0x8,%esp
    266f:	68 00 49 00 00       	push   $0x4900
    2674:	6a 01                	push   $0x1
    2676:	e8 55 14 00 00       	call   3ad0 <printf>
      exit();
    267b:	e8 f2 12 00 00       	call   3972 <exit>
      printf(1, "read bigfile failed\n");
    2680:	83 ec 08             	sub    $0x8,%esp
    2683:	68 eb 48 00 00       	push   $0x48eb
    2688:	6a 01                	push   $0x1
    268a:	e8 41 14 00 00       	call   3ad0 <printf>
      exit();
    268f:	e8 de 12 00 00       	call   3972 <exit>
      printf(1, "write bigfile failed\n");
    2694:	83 ec 08             	sub    $0x8,%esp
    2697:	68 c0 48 00 00       	push   $0x48c0
    269c:	6a 01                	push   $0x1
    269e:	e8 2d 14 00 00       	call   3ad0 <printf>
      exit();
    26a3:	e8 ca 12 00 00       	call   3972 <exit>
    printf(1, "cannot open bigfile\n");
    26a8:	83 ec 08             	sub    $0x8,%esp
    26ab:	68 d6 48 00 00       	push   $0x48d6
    26b0:	6a 01                	push   $0x1
    26b2:	e8 19 14 00 00       	call   3ad0 <printf>
    exit();
    26b7:	e8 b6 12 00 00       	call   3972 <exit>
    printf(1, "cannot create bigfile");
    26bc:	83 ec 08             	sub    $0x8,%esp
    26bf:	68 aa 48 00 00       	push   $0x48aa
    26c4:	6a 01                	push   $0x1
    26c6:	e8 05 14 00 00       	call   3ad0 <printf>
    exit();
    26cb:	e8 a2 12 00 00       	call   3972 <exit>
    printf(1, "read bigfile wrong total\n");
    26d0:	83 ec 08             	sub    $0x8,%esp
    26d3:	68 2d 49 00 00       	push   $0x492d
    26d8:	6a 01                	push   $0x1
    26da:	e8 f1 13 00 00       	call   3ad0 <printf>
    exit();
    26df:	e8 8e 12 00 00       	call   3972 <exit>
    26e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    26ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000026f0 <fourteen>:
{
    26f0:	55                   	push   %ebp
    26f1:	89 e5                	mov    %esp,%ebp
    26f3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "fourteen test\n");
    26f6:	68 58 49 00 00       	push   $0x4958
    26fb:	6a 01                	push   $0x1
    26fd:	e8 ce 13 00 00       	call   3ad0 <printf>
  if(mkdir("12345678901234") != 0){
    2702:	c7 04 24 93 49 00 00 	movl   $0x4993,(%esp)
    2709:	e8 cc 12 00 00       	call   39da <mkdir>
    270e:	83 c4 10             	add    $0x10,%esp
    2711:	85 c0                	test   %eax,%eax
    2713:	0f 85 97 00 00 00    	jne    27b0 <fourteen+0xc0>
  if(mkdir("12345678901234/123456789012345") != 0){
    2719:	83 ec 0c             	sub    $0xc,%esp
    271c:	68 50 51 00 00       	push   $0x5150
    2721:	e8 b4 12 00 00       	call   39da <mkdir>
    2726:	83 c4 10             	add    $0x10,%esp
    2729:	85 c0                	test   %eax,%eax
    272b:	0f 85 de 00 00 00    	jne    280f <fourteen+0x11f>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2731:	83 ec 08             	sub    $0x8,%esp
    2734:	68 00 02 00 00       	push   $0x200
    2739:	68 a0 51 00 00       	push   $0x51a0
    273e:	e8 6f 12 00 00       	call   39b2 <open>
  if(fd < 0){
    2743:	83 c4 10             	add    $0x10,%esp
    2746:	85 c0                	test   %eax,%eax
    2748:	0f 88 ae 00 00 00    	js     27fc <fourteen+0x10c>
  close(fd);
    274e:	83 ec 0c             	sub    $0xc,%esp
    2751:	50                   	push   %eax
    2752:	e8 43 12 00 00       	call   399a <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2757:	58                   	pop    %eax
    2758:	5a                   	pop    %edx
    2759:	6a 00                	push   $0x0
    275b:	68 10 52 00 00       	push   $0x5210
    2760:	e8 4d 12 00 00       	call   39b2 <open>
  if(fd < 0){
    2765:	83 c4 10             	add    $0x10,%esp
    2768:	85 c0                	test   %eax,%eax
    276a:	78 7d                	js     27e9 <fourteen+0xf9>
  close(fd);
    276c:	83 ec 0c             	sub    $0xc,%esp
    276f:	50                   	push   %eax
    2770:	e8 25 12 00 00       	call   399a <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    2775:	c7 04 24 84 49 00 00 	movl   $0x4984,(%esp)
    277c:	e8 59 12 00 00       	call   39da <mkdir>
    2781:	83 c4 10             	add    $0x10,%esp
    2784:	85 c0                	test   %eax,%eax
    2786:	74 4e                	je     27d6 <fourteen+0xe6>
  if(mkdir("123456789012345/12345678901234") == 0){
    2788:	83 ec 0c             	sub    $0xc,%esp
    278b:	68 ac 52 00 00       	push   $0x52ac
    2790:	e8 45 12 00 00       	call   39da <mkdir>
    2795:	83 c4 10             	add    $0x10,%esp
    2798:	85 c0                	test   %eax,%eax
    279a:	74 27                	je     27c3 <fourteen+0xd3>
  printf(1, "fourteen ok\n");
    279c:	83 ec 08             	sub    $0x8,%esp
    279f:	68 a2 49 00 00       	push   $0x49a2
    27a4:	6a 01                	push   $0x1
    27a6:	e8 25 13 00 00       	call   3ad0 <printf>
}
    27ab:	83 c4 10             	add    $0x10,%esp
    27ae:	c9                   	leave  
    27af:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    27b0:	50                   	push   %eax
    27b1:	50                   	push   %eax
    27b2:	68 67 49 00 00       	push   $0x4967
    27b7:	6a 01                	push   $0x1
    27b9:	e8 12 13 00 00       	call   3ad0 <printf>
    exit();
    27be:	e8 af 11 00 00       	call   3972 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    27c3:	50                   	push   %eax
    27c4:	50                   	push   %eax
    27c5:	68 cc 52 00 00       	push   $0x52cc
    27ca:	6a 01                	push   $0x1
    27cc:	e8 ff 12 00 00       	call   3ad0 <printf>
    exit();
    27d1:	e8 9c 11 00 00       	call   3972 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    27d6:	52                   	push   %edx
    27d7:	52                   	push   %edx
    27d8:	68 7c 52 00 00       	push   $0x527c
    27dd:	6a 01                	push   $0x1
    27df:	e8 ec 12 00 00       	call   3ad0 <printf>
    exit();
    27e4:	e8 89 11 00 00       	call   3972 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    27e9:	51                   	push   %ecx
    27ea:	51                   	push   %ecx
    27eb:	68 40 52 00 00       	push   $0x5240
    27f0:	6a 01                	push   $0x1
    27f2:	e8 d9 12 00 00       	call   3ad0 <printf>
    exit();
    27f7:	e8 76 11 00 00       	call   3972 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    27fc:	51                   	push   %ecx
    27fd:	51                   	push   %ecx
    27fe:	68 d0 51 00 00       	push   $0x51d0
    2803:	6a 01                	push   $0x1
    2805:	e8 c6 12 00 00       	call   3ad0 <printf>
    exit();
    280a:	e8 63 11 00 00       	call   3972 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    280f:	50                   	push   %eax
    2810:	50                   	push   %eax
    2811:	68 70 51 00 00       	push   $0x5170
    2816:	6a 01                	push   $0x1
    2818:	e8 b3 12 00 00       	call   3ad0 <printf>
    exit();
    281d:	e8 50 11 00 00       	call   3972 <exit>
    2822:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002830 <rmdot>:
{
    2830:	55                   	push   %ebp
    2831:	89 e5                	mov    %esp,%ebp
    2833:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    2836:	68 af 49 00 00       	push   $0x49af
    283b:	6a 01                	push   $0x1
    283d:	e8 8e 12 00 00       	call   3ad0 <printf>
  if(mkdir("dots") != 0){
    2842:	c7 04 24 bb 49 00 00 	movl   $0x49bb,(%esp)
    2849:	e8 8c 11 00 00       	call   39da <mkdir>
    284e:	83 c4 10             	add    $0x10,%esp
    2851:	85 c0                	test   %eax,%eax
    2853:	0f 85 b0 00 00 00    	jne    2909 <rmdot+0xd9>
  if(chdir("dots") != 0){
    2859:	83 ec 0c             	sub    $0xc,%esp
    285c:	68 bb 49 00 00       	push   $0x49bb
    2861:	e8 7c 11 00 00       	call   39e2 <chdir>
    2866:	83 c4 10             	add    $0x10,%esp
    2869:	85 c0                	test   %eax,%eax
    286b:	0f 85 1d 01 00 00    	jne    298e <rmdot+0x15e>
  if(unlink(".") == 0){
    2871:	83 ec 0c             	sub    $0xc,%esp
    2874:	68 66 46 00 00       	push   $0x4666
    2879:	e8 44 11 00 00       	call   39c2 <unlink>
    287e:	83 c4 10             	add    $0x10,%esp
    2881:	85 c0                	test   %eax,%eax
    2883:	0f 84 f2 00 00 00    	je     297b <rmdot+0x14b>
  if(unlink("..") == 0){
    2889:	83 ec 0c             	sub    $0xc,%esp
    288c:	68 65 46 00 00       	push   $0x4665
    2891:	e8 2c 11 00 00       	call   39c2 <unlink>
    2896:	83 c4 10             	add    $0x10,%esp
    2899:	85 c0                	test   %eax,%eax
    289b:	0f 84 c7 00 00 00    	je     2968 <rmdot+0x138>
  if(chdir("/") != 0){
    28a1:	83 ec 0c             	sub    $0xc,%esp
    28a4:	68 39 3e 00 00       	push   $0x3e39
    28a9:	e8 34 11 00 00       	call   39e2 <chdir>
    28ae:	83 c4 10             	add    $0x10,%esp
    28b1:	85 c0                	test   %eax,%eax
    28b3:	0f 85 9c 00 00 00    	jne    2955 <rmdot+0x125>
  if(unlink("dots/.") == 0){
    28b9:	83 ec 0c             	sub    $0xc,%esp
    28bc:	68 03 4a 00 00       	push   $0x4a03
    28c1:	e8 fc 10 00 00       	call   39c2 <unlink>
    28c6:	83 c4 10             	add    $0x10,%esp
    28c9:	85 c0                	test   %eax,%eax
    28cb:	74 75                	je     2942 <rmdot+0x112>
  if(unlink("dots/..") == 0){
    28cd:	83 ec 0c             	sub    $0xc,%esp
    28d0:	68 21 4a 00 00       	push   $0x4a21
    28d5:	e8 e8 10 00 00       	call   39c2 <unlink>
    28da:	83 c4 10             	add    $0x10,%esp
    28dd:	85 c0                	test   %eax,%eax
    28df:	74 4e                	je     292f <rmdot+0xff>
  if(unlink("dots") != 0){
    28e1:	83 ec 0c             	sub    $0xc,%esp
    28e4:	68 bb 49 00 00       	push   $0x49bb
    28e9:	e8 d4 10 00 00       	call   39c2 <unlink>
    28ee:	83 c4 10             	add    $0x10,%esp
    28f1:	85 c0                	test   %eax,%eax
    28f3:	75 27                	jne    291c <rmdot+0xec>
  printf(1, "rmdot ok\n");
    28f5:	83 ec 08             	sub    $0x8,%esp
    28f8:	68 56 4a 00 00       	push   $0x4a56
    28fd:	6a 01                	push   $0x1
    28ff:	e8 cc 11 00 00       	call   3ad0 <printf>
}
    2904:	83 c4 10             	add    $0x10,%esp
    2907:	c9                   	leave  
    2908:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    2909:	50                   	push   %eax
    290a:	50                   	push   %eax
    290b:	68 c0 49 00 00       	push   $0x49c0
    2910:	6a 01                	push   $0x1
    2912:	e8 b9 11 00 00       	call   3ad0 <printf>
    exit();
    2917:	e8 56 10 00 00       	call   3972 <exit>
    printf(1, "unlink dots failed!\n");
    291c:	50                   	push   %eax
    291d:	50                   	push   %eax
    291e:	68 41 4a 00 00       	push   $0x4a41
    2923:	6a 01                	push   $0x1
    2925:	e8 a6 11 00 00       	call   3ad0 <printf>
    exit();
    292a:	e8 43 10 00 00       	call   3972 <exit>
    printf(1, "unlink dots/.. worked!\n");
    292f:	52                   	push   %edx
    2930:	52                   	push   %edx
    2931:	68 29 4a 00 00       	push   $0x4a29
    2936:	6a 01                	push   $0x1
    2938:	e8 93 11 00 00       	call   3ad0 <printf>
    exit();
    293d:	e8 30 10 00 00       	call   3972 <exit>
    printf(1, "unlink dots/. worked!\n");
    2942:	51                   	push   %ecx
    2943:	51                   	push   %ecx
    2944:	68 0a 4a 00 00       	push   $0x4a0a
    2949:	6a 01                	push   $0x1
    294b:	e8 80 11 00 00       	call   3ad0 <printf>
    exit();
    2950:	e8 1d 10 00 00       	call   3972 <exit>
    printf(1, "chdir / failed\n");
    2955:	50                   	push   %eax
    2956:	50                   	push   %eax
    2957:	68 3b 3e 00 00       	push   $0x3e3b
    295c:	6a 01                	push   $0x1
    295e:	e8 6d 11 00 00       	call   3ad0 <printf>
    exit();
    2963:	e8 0a 10 00 00       	call   3972 <exit>
    printf(1, "rm .. worked!\n");
    2968:	50                   	push   %eax
    2969:	50                   	push   %eax
    296a:	68 f4 49 00 00       	push   $0x49f4
    296f:	6a 01                	push   $0x1
    2971:	e8 5a 11 00 00       	call   3ad0 <printf>
    exit();
    2976:	e8 f7 0f 00 00       	call   3972 <exit>
    printf(1, "rm . worked!\n");
    297b:	50                   	push   %eax
    297c:	50                   	push   %eax
    297d:	68 e6 49 00 00       	push   $0x49e6
    2982:	6a 01                	push   $0x1
    2984:	e8 47 11 00 00       	call   3ad0 <printf>
    exit();
    2989:	e8 e4 0f 00 00       	call   3972 <exit>
    printf(1, "chdir dots failed\n");
    298e:	50                   	push   %eax
    298f:	50                   	push   %eax
    2990:	68 d3 49 00 00       	push   $0x49d3
    2995:	6a 01                	push   $0x1
    2997:	e8 34 11 00 00       	call   3ad0 <printf>
    exit();
    299c:	e8 d1 0f 00 00       	call   3972 <exit>
    29a1:	eb 0d                	jmp    29b0 <dirfile>
    29a3:	90                   	nop
    29a4:	90                   	nop
    29a5:	90                   	nop
    29a6:	90                   	nop
    29a7:	90                   	nop
    29a8:	90                   	nop
    29a9:	90                   	nop
    29aa:	90                   	nop
    29ab:	90                   	nop
    29ac:	90                   	nop
    29ad:	90                   	nop
    29ae:	90                   	nop
    29af:	90                   	nop

000029b0 <dirfile>:
{
    29b0:	55                   	push   %ebp
    29b1:	89 e5                	mov    %esp,%ebp
    29b3:	53                   	push   %ebx
    29b4:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "dir vs file\n");
    29b7:	68 60 4a 00 00       	push   $0x4a60
    29bc:	6a 01                	push   $0x1
    29be:	e8 0d 11 00 00       	call   3ad0 <printf>
  fd = open("dirfile", O_CREATE);
    29c3:	59                   	pop    %ecx
    29c4:	5b                   	pop    %ebx
    29c5:	68 00 02 00 00       	push   $0x200
    29ca:	68 6d 4a 00 00       	push   $0x4a6d
    29cf:	e8 de 0f 00 00       	call   39b2 <open>
  if(fd < 0){
    29d4:	83 c4 10             	add    $0x10,%esp
    29d7:	85 c0                	test   %eax,%eax
    29d9:	0f 88 43 01 00 00    	js     2b22 <dirfile+0x172>
  close(fd);
    29df:	83 ec 0c             	sub    $0xc,%esp
    29e2:	50                   	push   %eax
    29e3:	e8 b2 0f 00 00       	call   399a <close>
  if(chdir("dirfile") == 0){
    29e8:	c7 04 24 6d 4a 00 00 	movl   $0x4a6d,(%esp)
    29ef:	e8 ee 0f 00 00       	call   39e2 <chdir>
    29f4:	83 c4 10             	add    $0x10,%esp
    29f7:	85 c0                	test   %eax,%eax
    29f9:	0f 84 10 01 00 00    	je     2b0f <dirfile+0x15f>
  fd = open("dirfile/xx", 0);
    29ff:	83 ec 08             	sub    $0x8,%esp
    2a02:	6a 00                	push   $0x0
    2a04:	68 a6 4a 00 00       	push   $0x4aa6
    2a09:	e8 a4 0f 00 00       	call   39b2 <open>
  if(fd >= 0){
    2a0e:	83 c4 10             	add    $0x10,%esp
    2a11:	85 c0                	test   %eax,%eax
    2a13:	0f 89 e3 00 00 00    	jns    2afc <dirfile+0x14c>
  fd = open("dirfile/xx", O_CREATE);
    2a19:	83 ec 08             	sub    $0x8,%esp
    2a1c:	68 00 02 00 00       	push   $0x200
    2a21:	68 a6 4a 00 00       	push   $0x4aa6
    2a26:	e8 87 0f 00 00       	call   39b2 <open>
  if(fd >= 0){
    2a2b:	83 c4 10             	add    $0x10,%esp
    2a2e:	85 c0                	test   %eax,%eax
    2a30:	0f 89 c6 00 00 00    	jns    2afc <dirfile+0x14c>
  if(mkdir("dirfile/xx") == 0){
    2a36:	83 ec 0c             	sub    $0xc,%esp
    2a39:	68 a6 4a 00 00       	push   $0x4aa6
    2a3e:	e8 97 0f 00 00       	call   39da <mkdir>
    2a43:	83 c4 10             	add    $0x10,%esp
    2a46:	85 c0                	test   %eax,%eax
    2a48:	0f 84 46 01 00 00    	je     2b94 <dirfile+0x1e4>
  if(unlink("dirfile/xx") == 0){
    2a4e:	83 ec 0c             	sub    $0xc,%esp
    2a51:	68 a6 4a 00 00       	push   $0x4aa6
    2a56:	e8 67 0f 00 00       	call   39c2 <unlink>
    2a5b:	83 c4 10             	add    $0x10,%esp
    2a5e:	85 c0                	test   %eax,%eax
    2a60:	0f 84 1b 01 00 00    	je     2b81 <dirfile+0x1d1>
  if(link("README", "dirfile/xx") == 0){
    2a66:	83 ec 08             	sub    $0x8,%esp
    2a69:	68 a6 4a 00 00       	push   $0x4aa6
    2a6e:	68 0a 4b 00 00       	push   $0x4b0a
    2a73:	e8 5a 0f 00 00       	call   39d2 <link>
    2a78:	83 c4 10             	add    $0x10,%esp
    2a7b:	85 c0                	test   %eax,%eax
    2a7d:	0f 84 eb 00 00 00    	je     2b6e <dirfile+0x1be>
  if(unlink("dirfile") != 0){
    2a83:	83 ec 0c             	sub    $0xc,%esp
    2a86:	68 6d 4a 00 00       	push   $0x4a6d
    2a8b:	e8 32 0f 00 00       	call   39c2 <unlink>
    2a90:	83 c4 10             	add    $0x10,%esp
    2a93:	85 c0                	test   %eax,%eax
    2a95:	0f 85 c0 00 00 00    	jne    2b5b <dirfile+0x1ab>
  fd = open(".", O_RDWR);
    2a9b:	83 ec 08             	sub    $0x8,%esp
    2a9e:	6a 02                	push   $0x2
    2aa0:	68 66 46 00 00       	push   $0x4666
    2aa5:	e8 08 0f 00 00       	call   39b2 <open>
  if(fd >= 0){
    2aaa:	83 c4 10             	add    $0x10,%esp
    2aad:	85 c0                	test   %eax,%eax
    2aaf:	0f 89 93 00 00 00    	jns    2b48 <dirfile+0x198>
  fd = open(".", 0);
    2ab5:	83 ec 08             	sub    $0x8,%esp
    2ab8:	6a 00                	push   $0x0
    2aba:	68 66 46 00 00       	push   $0x4666
    2abf:	e8 ee 0e 00 00       	call   39b2 <open>
  if(write(fd, "x", 1) > 0){
    2ac4:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", 0);
    2ac7:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2ac9:	6a 01                	push   $0x1
    2acb:	68 49 47 00 00       	push   $0x4749
    2ad0:	50                   	push   %eax
    2ad1:	e8 bc 0e 00 00       	call   3992 <write>
    2ad6:	83 c4 10             	add    $0x10,%esp
    2ad9:	85 c0                	test   %eax,%eax
    2adb:	7f 58                	jg     2b35 <dirfile+0x185>
  close(fd);
    2add:	83 ec 0c             	sub    $0xc,%esp
    2ae0:	53                   	push   %ebx
    2ae1:	e8 b4 0e 00 00       	call   399a <close>
  printf(1, "dir vs file OK\n");
    2ae6:	58                   	pop    %eax
    2ae7:	5a                   	pop    %edx
    2ae8:	68 3d 4b 00 00       	push   $0x4b3d
    2aed:	6a 01                	push   $0x1
    2aef:	e8 dc 0f 00 00       	call   3ad0 <printf>
}
    2af4:	83 c4 10             	add    $0x10,%esp
    2af7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2afa:	c9                   	leave  
    2afb:	c3                   	ret    
    printf(1, "create dirfile/xx succeeded!\n");
    2afc:	50                   	push   %eax
    2afd:	50                   	push   %eax
    2afe:	68 b1 4a 00 00       	push   $0x4ab1
    2b03:	6a 01                	push   $0x1
    2b05:	e8 c6 0f 00 00       	call   3ad0 <printf>
    exit();
    2b0a:	e8 63 0e 00 00       	call   3972 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    2b0f:	50                   	push   %eax
    2b10:	50                   	push   %eax
    2b11:	68 8c 4a 00 00       	push   $0x4a8c
    2b16:	6a 01                	push   $0x1
    2b18:	e8 b3 0f 00 00       	call   3ad0 <printf>
    exit();
    2b1d:	e8 50 0e 00 00       	call   3972 <exit>
    printf(1, "create dirfile failed\n");
    2b22:	52                   	push   %edx
    2b23:	52                   	push   %edx
    2b24:	68 75 4a 00 00       	push   $0x4a75
    2b29:	6a 01                	push   $0x1
    2b2b:	e8 a0 0f 00 00       	call   3ad0 <printf>
    exit();
    2b30:	e8 3d 0e 00 00       	call   3972 <exit>
    printf(1, "write . succeeded!\n");
    2b35:	51                   	push   %ecx
    2b36:	51                   	push   %ecx
    2b37:	68 29 4b 00 00       	push   $0x4b29
    2b3c:	6a 01                	push   $0x1
    2b3e:	e8 8d 0f 00 00       	call   3ad0 <printf>
    exit();
    2b43:	e8 2a 0e 00 00       	call   3972 <exit>
    printf(1, "open . for writing succeeded!\n");
    2b48:	53                   	push   %ebx
    2b49:	53                   	push   %ebx
    2b4a:	68 20 53 00 00       	push   $0x5320
    2b4f:	6a 01                	push   $0x1
    2b51:	e8 7a 0f 00 00       	call   3ad0 <printf>
    exit();
    2b56:	e8 17 0e 00 00       	call   3972 <exit>
    printf(1, "unlink dirfile failed!\n");
    2b5b:	50                   	push   %eax
    2b5c:	50                   	push   %eax
    2b5d:	68 11 4b 00 00       	push   $0x4b11
    2b62:	6a 01                	push   $0x1
    2b64:	e8 67 0f 00 00       	call   3ad0 <printf>
    exit();
    2b69:	e8 04 0e 00 00       	call   3972 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    2b6e:	50                   	push   %eax
    2b6f:	50                   	push   %eax
    2b70:	68 00 53 00 00       	push   $0x5300
    2b75:	6a 01                	push   $0x1
    2b77:	e8 54 0f 00 00       	call   3ad0 <printf>
    exit();
    2b7c:	e8 f1 0d 00 00       	call   3972 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b81:	50                   	push   %eax
    2b82:	50                   	push   %eax
    2b83:	68 ec 4a 00 00       	push   $0x4aec
    2b88:	6a 01                	push   $0x1
    2b8a:	e8 41 0f 00 00       	call   3ad0 <printf>
    exit();
    2b8f:	e8 de 0d 00 00       	call   3972 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b94:	50                   	push   %eax
    2b95:	50                   	push   %eax
    2b96:	68 cf 4a 00 00       	push   $0x4acf
    2b9b:	6a 01                	push   $0x1
    2b9d:	e8 2e 0f 00 00       	call   3ad0 <printf>
    exit();
    2ba2:	e8 cb 0d 00 00       	call   3972 <exit>
    2ba7:	89 f6                	mov    %esi,%esi
    2ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002bb0 <iref>:
{
    2bb0:	55                   	push   %ebp
    2bb1:	89 e5                	mov    %esp,%ebp
    2bb3:	53                   	push   %ebx
  printf(1, "empty file name\n");
    2bb4:	bb 33 00 00 00       	mov    $0x33,%ebx
{
    2bb9:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "empty file name\n");
    2bbc:	68 4d 4b 00 00       	push   $0x4b4d
    2bc1:	6a 01                	push   $0x1
    2bc3:	e8 08 0f 00 00       	call   3ad0 <printf>
    2bc8:	83 c4 10             	add    $0x10,%esp
    2bcb:	90                   	nop
    2bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(mkdir("irefd") != 0){
    2bd0:	83 ec 0c             	sub    $0xc,%esp
    2bd3:	68 5e 4b 00 00       	push   $0x4b5e
    2bd8:	e8 fd 0d 00 00       	call   39da <mkdir>
    2bdd:	83 c4 10             	add    $0x10,%esp
    2be0:	85 c0                	test   %eax,%eax
    2be2:	0f 85 bb 00 00 00    	jne    2ca3 <iref+0xf3>
    if(chdir("irefd") != 0){
    2be8:	83 ec 0c             	sub    $0xc,%esp
    2beb:	68 5e 4b 00 00       	push   $0x4b5e
    2bf0:	e8 ed 0d 00 00       	call   39e2 <chdir>
    2bf5:	83 c4 10             	add    $0x10,%esp
    2bf8:	85 c0                	test   %eax,%eax
    2bfa:	0f 85 b7 00 00 00    	jne    2cb7 <iref+0x107>
    mkdir("");
    2c00:	83 ec 0c             	sub    $0xc,%esp
    2c03:	68 13 42 00 00       	push   $0x4213
    2c08:	e8 cd 0d 00 00       	call   39da <mkdir>
    link("README", "");
    2c0d:	59                   	pop    %ecx
    2c0e:	58                   	pop    %eax
    2c0f:	68 13 42 00 00       	push   $0x4213
    2c14:	68 0a 4b 00 00       	push   $0x4b0a
    2c19:	e8 b4 0d 00 00       	call   39d2 <link>
    fd = open("", O_CREATE);
    2c1e:	58                   	pop    %eax
    2c1f:	5a                   	pop    %edx
    2c20:	68 00 02 00 00       	push   $0x200
    2c25:	68 13 42 00 00       	push   $0x4213
    2c2a:	e8 83 0d 00 00       	call   39b2 <open>
    if(fd >= 0)
    2c2f:	83 c4 10             	add    $0x10,%esp
    2c32:	85 c0                	test   %eax,%eax
    2c34:	78 0c                	js     2c42 <iref+0x92>
      close(fd);
    2c36:	83 ec 0c             	sub    $0xc,%esp
    2c39:	50                   	push   %eax
    2c3a:	e8 5b 0d 00 00       	call   399a <close>
    2c3f:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2c42:	83 ec 08             	sub    $0x8,%esp
    2c45:	68 00 02 00 00       	push   $0x200
    2c4a:	68 48 47 00 00       	push   $0x4748
    2c4f:	e8 5e 0d 00 00       	call   39b2 <open>
    if(fd >= 0)
    2c54:	83 c4 10             	add    $0x10,%esp
    2c57:	85 c0                	test   %eax,%eax
    2c59:	78 0c                	js     2c67 <iref+0xb7>
      close(fd);
    2c5b:	83 ec 0c             	sub    $0xc,%esp
    2c5e:	50                   	push   %eax
    2c5f:	e8 36 0d 00 00       	call   399a <close>
    2c64:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2c67:	83 ec 0c             	sub    $0xc,%esp
    2c6a:	68 48 47 00 00       	push   $0x4748
    2c6f:	e8 4e 0d 00 00       	call   39c2 <unlink>
  for(i = 0; i < 50 + 1; i++){
    2c74:	83 c4 10             	add    $0x10,%esp
    2c77:	83 eb 01             	sub    $0x1,%ebx
    2c7a:	0f 85 50 ff ff ff    	jne    2bd0 <iref+0x20>
  chdir("/");
    2c80:	83 ec 0c             	sub    $0xc,%esp
    2c83:	68 39 3e 00 00       	push   $0x3e39
    2c88:	e8 55 0d 00 00       	call   39e2 <chdir>
  printf(1, "empty file name OK\n");
    2c8d:	58                   	pop    %eax
    2c8e:	5a                   	pop    %edx
    2c8f:	68 8c 4b 00 00       	push   $0x4b8c
    2c94:	6a 01                	push   $0x1
    2c96:	e8 35 0e 00 00       	call   3ad0 <printf>
}
    2c9b:	83 c4 10             	add    $0x10,%esp
    2c9e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2ca1:	c9                   	leave  
    2ca2:	c3                   	ret    
      printf(1, "mkdir irefd failed\n");
    2ca3:	83 ec 08             	sub    $0x8,%esp
    2ca6:	68 64 4b 00 00       	push   $0x4b64
    2cab:	6a 01                	push   $0x1
    2cad:	e8 1e 0e 00 00       	call   3ad0 <printf>
      exit();
    2cb2:	e8 bb 0c 00 00       	call   3972 <exit>
      printf(1, "chdir irefd failed\n");
    2cb7:	83 ec 08             	sub    $0x8,%esp
    2cba:	68 78 4b 00 00       	push   $0x4b78
    2cbf:	6a 01                	push   $0x1
    2cc1:	e8 0a 0e 00 00       	call   3ad0 <printf>
      exit();
    2cc6:	e8 a7 0c 00 00       	call   3972 <exit>
    2ccb:	90                   	nop
    2ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002cd0 <forktest>:
{
    2cd0:	55                   	push   %ebp
    2cd1:	89 e5                	mov    %esp,%ebp
    2cd3:	53                   	push   %ebx
  for(n=0; n<1000; n++){
    2cd4:	31 db                	xor    %ebx,%ebx
{
    2cd6:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "fork test\n");
    2cd9:	68 a0 4b 00 00       	push   $0x4ba0
    2cde:	6a 01                	push   $0x1
    2ce0:	e8 eb 0d 00 00       	call   3ad0 <printf>
    2ce5:	83 c4 10             	add    $0x10,%esp
    2ce8:	eb 13                	jmp    2cfd <forktest+0x2d>
    2cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid == 0)
    2cf0:	74 6a                	je     2d5c <forktest+0x8c>
  for(n=0; n<1000; n++){
    2cf2:	83 c3 01             	add    $0x1,%ebx
    2cf5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2cfb:	74 4b                	je     2d48 <forktest+0x78>
    pid = fork(0);
    2cfd:	83 ec 0c             	sub    $0xc,%esp
    2d00:	6a 00                	push   $0x0
    2d02:	e8 63 0c 00 00       	call   396a <fork>
    if(pid < 0)
    2d07:	83 c4 10             	add    $0x10,%esp
    2d0a:	85 c0                	test   %eax,%eax
    2d0c:	79 e2                	jns    2cf0 <forktest+0x20>
  for(; n > 0; n--){
    2d0e:	85 db                	test   %ebx,%ebx
    2d10:	74 14                	je     2d26 <forktest+0x56>
    2d12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2d18:	e8 5d 0c 00 00       	call   397a <wait>
    2d1d:	85 c0                	test   %eax,%eax
    2d1f:	78 40                	js     2d61 <forktest+0x91>
  for(; n > 0; n--){
    2d21:	83 eb 01             	sub    $0x1,%ebx
    2d24:	75 f2                	jne    2d18 <forktest+0x48>
  if(wait() != -1){
    2d26:	e8 4f 0c 00 00       	call   397a <wait>
    2d2b:	83 f8 ff             	cmp    $0xffffffff,%eax
    2d2e:	75 45                	jne    2d75 <forktest+0xa5>
  printf(1, "fork test OK\n");
    2d30:	83 ec 08             	sub    $0x8,%esp
    2d33:	68 d2 4b 00 00       	push   $0x4bd2
    2d38:	6a 01                	push   $0x1
    2d3a:	e8 91 0d 00 00       	call   3ad0 <printf>
}
    2d3f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2d42:	c9                   	leave  
    2d43:	c3                   	ret    
    2d44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "fork claimed to work 1000 times!\n");
    2d48:	83 ec 08             	sub    $0x8,%esp
    2d4b:	68 40 53 00 00       	push   $0x5340
    2d50:	6a 01                	push   $0x1
    2d52:	e8 79 0d 00 00       	call   3ad0 <printf>
    exit();
    2d57:	e8 16 0c 00 00       	call   3972 <exit>
      exit();
    2d5c:	e8 11 0c 00 00       	call   3972 <exit>
      printf(1, "wait stopped early\n");
    2d61:	83 ec 08             	sub    $0x8,%esp
    2d64:	68 ab 4b 00 00       	push   $0x4bab
    2d69:	6a 01                	push   $0x1
    2d6b:	e8 60 0d 00 00       	call   3ad0 <printf>
      exit();
    2d70:	e8 fd 0b 00 00       	call   3972 <exit>
    printf(1, "wait got too many\n");
    2d75:	83 ec 08             	sub    $0x8,%esp
    2d78:	68 bf 4b 00 00       	push   $0x4bbf
    2d7d:	6a 01                	push   $0x1
    2d7f:	e8 4c 0d 00 00       	call   3ad0 <printf>
    exit();
    2d84:	e8 e9 0b 00 00       	call   3972 <exit>
    2d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00002d90 <sbrktest>:
{
    2d90:	55                   	push   %ebp
    2d91:	89 e5                	mov    %esp,%ebp
    2d93:	57                   	push   %edi
    2d94:	56                   	push   %esi
    2d95:	53                   	push   %ebx
  for(i = 0; i < 5000; i++){
    2d96:	31 f6                	xor    %esi,%esi
{
    2d98:	83 ec 64             	sub    $0x64,%esp
  printf(stdout, "sbrk test\n");
    2d9b:	68 e0 4b 00 00       	push   $0x4be0
    2da0:	ff 35 88 5e 00 00    	pushl  0x5e88
    2da6:	e8 25 0d 00 00       	call   3ad0 <printf>
  oldbrk = sbrk(0);
    2dab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2db2:	e8 43 0c 00 00       	call   39fa <sbrk>
  a = sbrk(0);
    2db7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  oldbrk = sbrk(0);
    2dbe:	89 c7                	mov    %eax,%edi
  a = sbrk(0);
    2dc0:	e8 35 0c 00 00       	call   39fa <sbrk>
    2dc5:	83 c4 10             	add    $0x10,%esp
    2dc8:	89 c3                	mov    %eax,%ebx
    2dca:	eb 06                	jmp    2dd2 <sbrktest+0x42>
    2dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    a = b + 1;
    2dd0:	89 c3                	mov    %eax,%ebx
    b = sbrk(1);
    2dd2:	83 ec 0c             	sub    $0xc,%esp
    2dd5:	6a 01                	push   $0x1
    2dd7:	e8 1e 0c 00 00       	call   39fa <sbrk>
    if(b != a){
    2ddc:	83 c4 10             	add    $0x10,%esp
    2ddf:	39 d8                	cmp    %ebx,%eax
    2de1:	0f 85 9b 02 00 00    	jne    3082 <sbrktest+0x2f2>
  for(i = 0; i < 5000; i++){
    2de7:	83 c6 01             	add    $0x1,%esi
    *b = 1;
    2dea:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    2ded:	8d 43 01             	lea    0x1(%ebx),%eax
  for(i = 0; i < 5000; i++){
    2df0:	81 fe 88 13 00 00    	cmp    $0x1388,%esi
    2df6:	75 d8                	jne    2dd0 <sbrktest+0x40>
  pid = fork(0);
    2df8:	83 ec 0c             	sub    $0xc,%esp
    2dfb:	6a 00                	push   $0x0
    2dfd:	e8 68 0b 00 00       	call   396a <fork>
  if(pid < 0){
    2e02:	83 c4 10             	add    $0x10,%esp
    2e05:	85 c0                	test   %eax,%eax
  pid = fork(0);
    2e07:	89 c6                	mov    %eax,%esi
  if(pid < 0){
    2e09:	0f 88 a1 03 00 00    	js     31b0 <sbrktest+0x420>
  c = sbrk(1);
    2e0f:	83 ec 0c             	sub    $0xc,%esp
  if(c != a + 1){
    2e12:	83 c3 02             	add    $0x2,%ebx
  c = sbrk(1);
    2e15:	6a 01                	push   $0x1
    2e17:	e8 de 0b 00 00       	call   39fa <sbrk>
  c = sbrk(1);
    2e1c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e23:	e8 d2 0b 00 00       	call   39fa <sbrk>
  if(c != a + 1){
    2e28:	83 c4 10             	add    $0x10,%esp
    2e2b:	39 d8                	cmp    %ebx,%eax
    2e2d:	0f 85 65 03 00 00    	jne    3198 <sbrktest+0x408>
  if(pid == 0)
    2e33:	85 f6                	test   %esi,%esi
    2e35:	0f 84 58 03 00 00    	je     3193 <sbrktest+0x403>
  wait();
    2e3b:	e8 3a 0b 00 00       	call   397a <wait>
  a = sbrk(0);
    2e40:	83 ec 0c             	sub    $0xc,%esp
    2e43:	6a 00                	push   $0x0
    2e45:	e8 b0 0b 00 00       	call   39fa <sbrk>
    2e4a:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
    2e4c:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2e51:	29 d8                	sub    %ebx,%eax
  p = sbrk(amt);
    2e53:	89 04 24             	mov    %eax,(%esp)
    2e56:	e8 9f 0b 00 00       	call   39fa <sbrk>
  if (p != a) {
    2e5b:	83 c4 10             	add    $0x10,%esp
    2e5e:	39 c3                	cmp    %eax,%ebx
    2e60:	0f 85 15 03 00 00    	jne    317b <sbrktest+0x3eb>
  a = sbrk(0);
    2e66:	83 ec 0c             	sub    $0xc,%esp
  *lastaddr = 99;
    2e69:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    2e70:	6a 00                	push   $0x0
    2e72:	e8 83 0b 00 00       	call   39fa <sbrk>
  c = sbrk(-4096);
    2e77:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    2e7e:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2e80:	e8 75 0b 00 00       	call   39fa <sbrk>
  if(c == (char*)0xffffffff){
    2e85:	83 c4 10             	add    $0x10,%esp
    2e88:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e8b:	0f 84 d2 02 00 00    	je     3163 <sbrktest+0x3d3>
  c = sbrk(0);
    2e91:	83 ec 0c             	sub    $0xc,%esp
    2e94:	6a 00                	push   $0x0
    2e96:	e8 5f 0b 00 00       	call   39fa <sbrk>
  if(c != a - 4096){
    2e9b:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2ea1:	83 c4 10             	add    $0x10,%esp
    2ea4:	39 d0                	cmp    %edx,%eax
    2ea6:	0f 85 a0 02 00 00    	jne    314c <sbrktest+0x3bc>
  a = sbrk(0);
    2eac:	83 ec 0c             	sub    $0xc,%esp
    2eaf:	6a 00                	push   $0x0
    2eb1:	e8 44 0b 00 00       	call   39fa <sbrk>
    2eb6:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2eb8:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2ebf:	e8 36 0b 00 00       	call   39fa <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2ec4:	83 c4 10             	add    $0x10,%esp
    2ec7:	39 c3                	cmp    %eax,%ebx
  c = sbrk(4096);
    2ec9:	89 c6                	mov    %eax,%esi
  if(c != a || sbrk(0) != a + 4096){
    2ecb:	0f 85 64 02 00 00    	jne    3135 <sbrktest+0x3a5>
    2ed1:	83 ec 0c             	sub    $0xc,%esp
    2ed4:	6a 00                	push   $0x0
    2ed6:	e8 1f 0b 00 00       	call   39fa <sbrk>
    2edb:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2ee1:	83 c4 10             	add    $0x10,%esp
    2ee4:	39 d0                	cmp    %edx,%eax
    2ee6:	0f 85 49 02 00 00    	jne    3135 <sbrktest+0x3a5>
  if(*lastaddr == 99){
    2eec:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2ef3:	0f 84 24 02 00 00    	je     311d <sbrktest+0x38d>
  a = sbrk(0);
    2ef9:	83 ec 0c             	sub    $0xc,%esp
    2efc:	6a 00                	push   $0x0
    2efe:	e8 f7 0a 00 00       	call   39fa <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2f03:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    2f0a:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2f0c:	e8 e9 0a 00 00       	call   39fa <sbrk>
    2f11:	89 f9                	mov    %edi,%ecx
    2f13:	29 c1                	sub    %eax,%ecx
    2f15:	89 0c 24             	mov    %ecx,(%esp)
    2f18:	e8 dd 0a 00 00       	call   39fa <sbrk>
  if(c != a){
    2f1d:	83 c4 10             	add    $0x10,%esp
    2f20:	39 c3                	cmp    %eax,%ebx
    2f22:	0f 85 de 01 00 00    	jne    3106 <sbrktest+0x376>
    2f28:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2f2d:	8d 76 00             	lea    0x0(%esi),%esi
    ppid = getpid();
    2f30:	e8 bd 0a 00 00       	call   39f2 <getpid>
    pid = fork(0);
    2f35:	83 ec 0c             	sub    $0xc,%esp
    ppid = getpid();
    2f38:	89 c6                	mov    %eax,%esi
    pid = fork(0);
    2f3a:	6a 00                	push   $0x0
    2f3c:	e8 29 0a 00 00       	call   396a <fork>
    if(pid < 0){
    2f41:	83 c4 10             	add    $0x10,%esp
    2f44:	85 c0                	test   %eax,%eax
    2f46:	0f 88 a2 01 00 00    	js     30ee <sbrktest+0x35e>
    if(pid == 0){
    2f4c:	0f 84 7a 01 00 00    	je     30cc <sbrktest+0x33c>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2f52:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    wait();
    2f58:	e8 1d 0a 00 00       	call   397a <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2f5d:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2f63:	75 cb                	jne    2f30 <sbrktest+0x1a0>
  if(pipe(fds) != 0){
    2f65:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2f68:	83 ec 0c             	sub    $0xc,%esp
    2f6b:	50                   	push   %eax
    2f6c:	e8 11 0a 00 00       	call   3982 <pipe>
    2f71:	83 c4 10             	add    $0x10,%esp
    2f74:	85 c0                	test   %eax,%eax
    2f76:	0f 85 3c 01 00 00    	jne    30b8 <sbrktest+0x328>
    2f7c:	8d 75 c0             	lea    -0x40(%ebp),%esi
    2f7f:	89 f3                	mov    %esi,%ebx
    if((pids[i] = fork(0)) == 0){
    2f81:	83 ec 0c             	sub    $0xc,%esp
    2f84:	6a 00                	push   $0x0
    2f86:	e8 df 09 00 00       	call   396a <fork>
    2f8b:	83 c4 10             	add    $0x10,%esp
    2f8e:	85 c0                	test   %eax,%eax
    2f90:	89 03                	mov    %eax,(%ebx)
    2f92:	0f 84 a5 00 00 00    	je     303d <sbrktest+0x2ad>
    if(pids[i] != -1)
    2f98:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f9b:	74 14                	je     2fb1 <sbrktest+0x221>
      read(fds[0], &scratch, 1);
    2f9d:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2fa0:	83 ec 04             	sub    $0x4,%esp
    2fa3:	6a 01                	push   $0x1
    2fa5:	50                   	push   %eax
    2fa6:	ff 75 b8             	pushl  -0x48(%ebp)
    2fa9:	e8 dc 09 00 00       	call   398a <read>
    2fae:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2fb1:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2fb4:	83 c3 04             	add    $0x4,%ebx
    2fb7:	39 c3                	cmp    %eax,%ebx
    2fb9:	75 c6                	jne    2f81 <sbrktest+0x1f1>
  c = sbrk(4096);
    2fbb:	83 ec 0c             	sub    $0xc,%esp
    2fbe:	68 00 10 00 00       	push   $0x1000
    2fc3:	e8 32 0a 00 00       	call   39fa <sbrk>
    2fc8:	83 c4 10             	add    $0x10,%esp
    2fcb:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    if(pids[i] == -1)
    2fce:	8b 06                	mov    (%esi),%eax
    2fd0:	83 f8 ff             	cmp    $0xffffffff,%eax
    2fd3:	74 11                	je     2fe6 <sbrktest+0x256>
    kill(pids[i]);
    2fd5:	83 ec 0c             	sub    $0xc,%esp
    2fd8:	50                   	push   %eax
    2fd9:	e8 c4 09 00 00       	call   39a2 <kill>
    wait();
    2fde:	e8 97 09 00 00       	call   397a <wait>
    2fe3:	83 c4 10             	add    $0x10,%esp
    2fe6:	83 c6 04             	add    $0x4,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2fe9:	39 f3                	cmp    %esi,%ebx
    2feb:	75 e1                	jne    2fce <sbrktest+0x23e>
  if(c == (char*)0xffffffff){
    2fed:	83 7d a4 ff          	cmpl   $0xffffffff,-0x5c(%ebp)
    2ff1:	0f 84 a9 00 00 00    	je     30a0 <sbrktest+0x310>
  if(sbrk(0) > oldbrk)
    2ff7:	83 ec 0c             	sub    $0xc,%esp
    2ffa:	6a 00                	push   $0x0
    2ffc:	e8 f9 09 00 00       	call   39fa <sbrk>
    3001:	83 c4 10             	add    $0x10,%esp
    3004:	39 c7                	cmp    %eax,%edi
    3006:	73 17                	jae    301f <sbrktest+0x28f>
    sbrk(-(sbrk(0) - oldbrk));
    3008:	83 ec 0c             	sub    $0xc,%esp
    300b:	6a 00                	push   $0x0
    300d:	e8 e8 09 00 00       	call   39fa <sbrk>
    3012:	29 c7                	sub    %eax,%edi
    3014:	89 3c 24             	mov    %edi,(%esp)
    3017:	e8 de 09 00 00       	call   39fa <sbrk>
    301c:	83 c4 10             	add    $0x10,%esp
  printf(stdout, "sbrk test OK\n");
    301f:	83 ec 08             	sub    $0x8,%esp
    3022:	68 88 4c 00 00       	push   $0x4c88
    3027:	ff 35 88 5e 00 00    	pushl  0x5e88
    302d:	e8 9e 0a 00 00       	call   3ad0 <printf>
}
    3032:	83 c4 10             	add    $0x10,%esp
    3035:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3038:	5b                   	pop    %ebx
    3039:	5e                   	pop    %esi
    303a:	5f                   	pop    %edi
    303b:	5d                   	pop    %ebp
    303c:	c3                   	ret    
      sbrk(BIG - (uint)sbrk(0));
    303d:	83 ec 0c             	sub    $0xc,%esp
    3040:	6a 00                	push   $0x0
    3042:	e8 b3 09 00 00       	call   39fa <sbrk>
    3047:	ba 00 00 40 06       	mov    $0x6400000,%edx
    304c:	29 c2                	sub    %eax,%edx
    304e:	89 14 24             	mov    %edx,(%esp)
    3051:	e8 a4 09 00 00       	call   39fa <sbrk>
      write(fds[1], "x", 1);
    3056:	83 c4 0c             	add    $0xc,%esp
    3059:	6a 01                	push   $0x1
    305b:	68 49 47 00 00       	push   $0x4749
    3060:	ff 75 bc             	pushl  -0x44(%ebp)
    3063:	e8 2a 09 00 00       	call   3992 <write>
    3068:	83 c4 10             	add    $0x10,%esp
    306b:	90                   	nop
    306c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(;;) sleep(1000);
    3070:	83 ec 0c             	sub    $0xc,%esp
    3073:	68 e8 03 00 00       	push   $0x3e8
    3078:	e8 85 09 00 00       	call   3a02 <sleep>
    307d:	83 c4 10             	add    $0x10,%esp
    3080:	eb ee                	jmp    3070 <sbrktest+0x2e0>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3082:	83 ec 0c             	sub    $0xc,%esp
    3085:	50                   	push   %eax
    3086:	53                   	push   %ebx
    3087:	56                   	push   %esi
    3088:	68 eb 4b 00 00       	push   $0x4beb
    308d:	ff 35 88 5e 00 00    	pushl  0x5e88
    3093:	e8 38 0a 00 00       	call   3ad0 <printf>
      exit();
    3098:	83 c4 20             	add    $0x20,%esp
    309b:	e8 d2 08 00 00       	call   3972 <exit>
    printf(stdout, "failed sbrk leaked memory\n");
    30a0:	83 ec 08             	sub    $0x8,%esp
    30a3:	68 6d 4c 00 00       	push   $0x4c6d
    30a8:	ff 35 88 5e 00 00    	pushl  0x5e88
    30ae:	e8 1d 0a 00 00       	call   3ad0 <printf>
    exit();
    30b3:	e8 ba 08 00 00       	call   3972 <exit>
    printf(1, "pipe() failed\n");
    30b8:	83 ec 08             	sub    $0x8,%esp
    30bb:	68 29 41 00 00       	push   $0x4129
    30c0:	6a 01                	push   $0x1
    30c2:	e8 09 0a 00 00       	call   3ad0 <printf>
    exit();
    30c7:	e8 a6 08 00 00       	call   3972 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    30cc:	0f be 03             	movsbl (%ebx),%eax
    30cf:	50                   	push   %eax
    30d0:	53                   	push   %ebx
    30d1:	68 54 4c 00 00       	push   $0x4c54
    30d6:	ff 35 88 5e 00 00    	pushl  0x5e88
    30dc:	e8 ef 09 00 00       	call   3ad0 <printf>
      kill(ppid);
    30e1:	89 34 24             	mov    %esi,(%esp)
    30e4:	e8 b9 08 00 00       	call   39a2 <kill>
      exit();
    30e9:	e8 84 08 00 00       	call   3972 <exit>
      printf(stdout, "fork failed\n");
    30ee:	83 ec 08             	sub    $0x8,%esp
    30f1:	68 31 4d 00 00       	push   $0x4d31
    30f6:	ff 35 88 5e 00 00    	pushl  0x5e88
    30fc:	e8 cf 09 00 00       	call   3ad0 <printf>
      exit();
    3101:	e8 6c 08 00 00       	call   3972 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    3106:	50                   	push   %eax
    3107:	53                   	push   %ebx
    3108:	68 34 54 00 00       	push   $0x5434
    310d:	ff 35 88 5e 00 00    	pushl  0x5e88
    3113:	e8 b8 09 00 00       	call   3ad0 <printf>
    exit();
    3118:	e8 55 08 00 00       	call   3972 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    311d:	83 ec 08             	sub    $0x8,%esp
    3120:	68 04 54 00 00       	push   $0x5404
    3125:	ff 35 88 5e 00 00    	pushl  0x5e88
    312b:	e8 a0 09 00 00       	call   3ad0 <printf>
    exit();
    3130:	e8 3d 08 00 00       	call   3972 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    3135:	56                   	push   %esi
    3136:	53                   	push   %ebx
    3137:	68 dc 53 00 00       	push   $0x53dc
    313c:	ff 35 88 5e 00 00    	pushl  0x5e88
    3142:	e8 89 09 00 00       	call   3ad0 <printf>
    exit();
    3147:	e8 26 08 00 00       	call   3972 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    314c:	50                   	push   %eax
    314d:	53                   	push   %ebx
    314e:	68 a4 53 00 00       	push   $0x53a4
    3153:	ff 35 88 5e 00 00    	pushl  0x5e88
    3159:	e8 72 09 00 00       	call   3ad0 <printf>
    exit();
    315e:	e8 0f 08 00 00       	call   3972 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    3163:	83 ec 08             	sub    $0x8,%esp
    3166:	68 39 4c 00 00       	push   $0x4c39
    316b:	ff 35 88 5e 00 00    	pushl  0x5e88
    3171:	e8 5a 09 00 00       	call   3ad0 <printf>
    exit();
    3176:	e8 f7 07 00 00       	call   3972 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    317b:	83 ec 08             	sub    $0x8,%esp
    317e:	68 64 53 00 00       	push   $0x5364
    3183:	ff 35 88 5e 00 00    	pushl  0x5e88
    3189:	e8 42 09 00 00       	call   3ad0 <printf>
    exit();
    318e:	e8 df 07 00 00       	call   3972 <exit>
    exit();
    3193:	e8 da 07 00 00       	call   3972 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    3198:	83 ec 08             	sub    $0x8,%esp
    319b:	68 1d 4c 00 00       	push   $0x4c1d
    31a0:	ff 35 88 5e 00 00    	pushl  0x5e88
    31a6:	e8 25 09 00 00       	call   3ad0 <printf>
    exit();
    31ab:	e8 c2 07 00 00       	call   3972 <exit>
    printf(stdout, "sbrk test fork failed\n");
    31b0:	83 ec 08             	sub    $0x8,%esp
    31b3:	68 06 4c 00 00       	push   $0x4c06
    31b8:	ff 35 88 5e 00 00    	pushl  0x5e88
    31be:	e8 0d 09 00 00       	call   3ad0 <printf>
    exit();
    31c3:	e8 aa 07 00 00       	call   3972 <exit>
    31c8:	90                   	nop
    31c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000031d0 <validateint>:
{
    31d0:	55                   	push   %ebp
    31d1:	89 e5                	mov    %esp,%ebp
}
    31d3:	5d                   	pop    %ebp
    31d4:	c3                   	ret    
    31d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    31d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000031e0 <validatetest>:
{
    31e0:	55                   	push   %ebp
    31e1:	89 e5                	mov    %esp,%ebp
    31e3:	56                   	push   %esi
    31e4:	53                   	push   %ebx
  for(p = 0; p <= (uint)hi; p += 4096){
    31e5:	31 db                	xor    %ebx,%ebx
  printf(stdout, "validate test\n");
    31e7:	83 ec 08             	sub    $0x8,%esp
    31ea:	68 96 4c 00 00       	push   $0x4c96
    31ef:	ff 35 88 5e 00 00    	pushl  0x5e88
    31f5:	e8 d6 08 00 00       	call   3ad0 <printf>
    31fa:	83 c4 10             	add    $0x10,%esp
    31fd:	8d 76 00             	lea    0x0(%esi),%esi
    if((pid = fork(0)) == 0){
    3200:	83 ec 0c             	sub    $0xc,%esp
    3203:	6a 00                	push   $0x0
    3205:	e8 60 07 00 00       	call   396a <fork>
    320a:	83 c4 10             	add    $0x10,%esp
    320d:	85 c0                	test   %eax,%eax
    320f:	89 c6                	mov    %eax,%esi
    3211:	74 63                	je     3276 <validatetest+0x96>
    sleep(0);
    3213:	83 ec 0c             	sub    $0xc,%esp
    3216:	6a 00                	push   $0x0
    3218:	e8 e5 07 00 00       	call   3a02 <sleep>
    sleep(0);
    321d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3224:	e8 d9 07 00 00       	call   3a02 <sleep>
    kill(pid);
    3229:	89 34 24             	mov    %esi,(%esp)
    322c:	e8 71 07 00 00       	call   39a2 <kill>
    wait();
    3231:	e8 44 07 00 00       	call   397a <wait>
    if(link("nosuchfile", (char*)p) != -1){
    3236:	58                   	pop    %eax
    3237:	5a                   	pop    %edx
    3238:	53                   	push   %ebx
    3239:	68 a5 4c 00 00       	push   $0x4ca5
    323e:	e8 8f 07 00 00       	call   39d2 <link>
    3243:	83 c4 10             	add    $0x10,%esp
    3246:	83 f8 ff             	cmp    $0xffffffff,%eax
    3249:	75 30                	jne    327b <validatetest+0x9b>
  for(p = 0; p <= (uint)hi; p += 4096){
    324b:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    3251:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    3257:	75 a7                	jne    3200 <validatetest+0x20>
  printf(stdout, "validate ok\n");
    3259:	83 ec 08             	sub    $0x8,%esp
    325c:	68 c9 4c 00 00       	push   $0x4cc9
    3261:	ff 35 88 5e 00 00    	pushl  0x5e88
    3267:	e8 64 08 00 00       	call   3ad0 <printf>
}
    326c:	83 c4 10             	add    $0x10,%esp
    326f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3272:	5b                   	pop    %ebx
    3273:	5e                   	pop    %esi
    3274:	5d                   	pop    %ebp
    3275:	c3                   	ret    
      exit();
    3276:	e8 f7 06 00 00       	call   3972 <exit>
      printf(stdout, "link should not succeed\n");
    327b:	83 ec 08             	sub    $0x8,%esp
    327e:	68 b0 4c 00 00       	push   $0x4cb0
    3283:	ff 35 88 5e 00 00    	pushl  0x5e88
    3289:	e8 42 08 00 00       	call   3ad0 <printf>
      exit();
    328e:	e8 df 06 00 00       	call   3972 <exit>
    3293:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000032a0 <bsstest>:
{
    32a0:	55                   	push   %ebp
    32a1:	89 e5                	mov    %esp,%ebp
    32a3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "bss test\n");
    32a6:	68 d6 4c 00 00       	push   $0x4cd6
    32ab:	ff 35 88 5e 00 00    	pushl  0x5e88
    32b1:	e8 1a 08 00 00       	call   3ad0 <printf>
    if(uninit[i] != '\0'){
    32b6:	83 c4 10             	add    $0x10,%esp
    32b9:	80 3d 40 5f 00 00 00 	cmpb   $0x0,0x5f40
    32c0:	75 39                	jne    32fb <bsstest+0x5b>
    32c2:	b8 01 00 00 00       	mov    $0x1,%eax
    32c7:	89 f6                	mov    %esi,%esi
    32c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    32d0:	80 b8 40 5f 00 00 00 	cmpb   $0x0,0x5f40(%eax)
    32d7:	75 22                	jne    32fb <bsstest+0x5b>
  for(i = 0; i < sizeof(uninit); i++){
    32d9:	83 c0 01             	add    $0x1,%eax
    32dc:	3d 10 27 00 00       	cmp    $0x2710,%eax
    32e1:	75 ed                	jne    32d0 <bsstest+0x30>
  printf(stdout, "bss test ok\n");
    32e3:	83 ec 08             	sub    $0x8,%esp
    32e6:	68 f1 4c 00 00       	push   $0x4cf1
    32eb:	ff 35 88 5e 00 00    	pushl  0x5e88
    32f1:	e8 da 07 00 00       	call   3ad0 <printf>
}
    32f6:	83 c4 10             	add    $0x10,%esp
    32f9:	c9                   	leave  
    32fa:	c3                   	ret    
      printf(stdout, "bss test failed\n");
    32fb:	83 ec 08             	sub    $0x8,%esp
    32fe:	68 e0 4c 00 00       	push   $0x4ce0
    3303:	ff 35 88 5e 00 00    	pushl  0x5e88
    3309:	e8 c2 07 00 00       	call   3ad0 <printf>
      exit();
    330e:	e8 5f 06 00 00       	call   3972 <exit>
    3313:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003320 <bigargtest>:
{
    3320:	55                   	push   %ebp
    3321:	89 e5                	mov    %esp,%ebp
    3323:	83 ec 14             	sub    $0x14,%esp
  unlink("bigarg-ok");
    3326:	68 fe 4c 00 00       	push   $0x4cfe
    332b:	e8 92 06 00 00       	call   39c2 <unlink>
  pid = fork(0);
    3330:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3337:	e8 2e 06 00 00       	call   396a <fork>
  if(pid == 0){
    333c:	83 c4 10             	add    $0x10,%esp
    333f:	85 c0                	test   %eax,%eax
    3341:	74 3f                	je     3382 <bigargtest+0x62>
  } else if(pid < 0){
    3343:	0f 88 cb 00 00 00    	js     3414 <bigargtest+0xf4>
  wait();
    3349:	e8 2c 06 00 00       	call   397a <wait>
  fd = open("bigarg-ok", 0);
    334e:	83 ec 08             	sub    $0x8,%esp
    3351:	6a 00                	push   $0x0
    3353:	68 fe 4c 00 00       	push   $0x4cfe
    3358:	e8 55 06 00 00       	call   39b2 <open>
  if(fd < 0){
    335d:	83 c4 10             	add    $0x10,%esp
    3360:	85 c0                	test   %eax,%eax
    3362:	0f 88 95 00 00 00    	js     33fd <bigargtest+0xdd>
  close(fd);
    3368:	83 ec 0c             	sub    $0xc,%esp
    336b:	50                   	push   %eax
    336c:	e8 29 06 00 00       	call   399a <close>
  unlink("bigarg-ok");
    3371:	c7 04 24 fe 4c 00 00 	movl   $0x4cfe,(%esp)
    3378:	e8 45 06 00 00       	call   39c2 <unlink>
}
    337d:	83 c4 10             	add    $0x10,%esp
    3380:	c9                   	leave  
    3381:	c3                   	ret    
    3382:	b8 a0 5e 00 00       	mov    $0x5ea0,%eax
    3387:	89 f6                	mov    %esi,%esi
    3389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3390:	c7 00 58 54 00 00    	movl   $0x5458,(%eax)
    3396:	83 c0 04             	add    $0x4,%eax
    for(i = 0; i < MAXARG-1; i++)
    3399:	3d 1c 5f 00 00       	cmp    $0x5f1c,%eax
    339e:	75 f0                	jne    3390 <bigargtest+0x70>
    printf(stdout, "bigarg test\n");
    33a0:	51                   	push   %ecx
    33a1:	51                   	push   %ecx
    33a2:	68 08 4d 00 00       	push   $0x4d08
    33a7:	ff 35 88 5e 00 00    	pushl  0x5e88
    args[MAXARG-1] = 0;
    33ad:	c7 05 1c 5f 00 00 00 	movl   $0x0,0x5f1c
    33b4:	00 00 00 
    printf(stdout, "bigarg test\n");
    33b7:	e8 14 07 00 00       	call   3ad0 <printf>
    exec("echo", args);
    33bc:	58                   	pop    %eax
    33bd:	5a                   	pop    %edx
    33be:	68 a0 5e 00 00       	push   $0x5ea0
    33c3:	68 d5 3e 00 00       	push   $0x3ed5
    33c8:	e8 dd 05 00 00       	call   39aa <exec>
    printf(stdout, "bigarg test ok\n");
    33cd:	59                   	pop    %ecx
    33ce:	58                   	pop    %eax
    33cf:	68 15 4d 00 00       	push   $0x4d15
    33d4:	ff 35 88 5e 00 00    	pushl  0x5e88
    33da:	e8 f1 06 00 00       	call   3ad0 <printf>
    fd = open("bigarg-ok", O_CREATE);
    33df:	58                   	pop    %eax
    33e0:	5a                   	pop    %edx
    33e1:	68 00 02 00 00       	push   $0x200
    33e6:	68 fe 4c 00 00       	push   $0x4cfe
    33eb:	e8 c2 05 00 00       	call   39b2 <open>
    close(fd);
    33f0:	89 04 24             	mov    %eax,(%esp)
    33f3:	e8 a2 05 00 00       	call   399a <close>
    exit();
    33f8:	e8 75 05 00 00       	call   3972 <exit>
    printf(stdout, "bigarg test failed!\n");
    33fd:	50                   	push   %eax
    33fe:	50                   	push   %eax
    33ff:	68 3e 4d 00 00       	push   $0x4d3e
    3404:	ff 35 88 5e 00 00    	pushl  0x5e88
    340a:	e8 c1 06 00 00       	call   3ad0 <printf>
    exit();
    340f:	e8 5e 05 00 00       	call   3972 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    3414:	52                   	push   %edx
    3415:	52                   	push   %edx
    3416:	68 25 4d 00 00       	push   $0x4d25
    341b:	ff 35 88 5e 00 00    	pushl  0x5e88
    3421:	e8 aa 06 00 00       	call   3ad0 <printf>
    exit();
    3426:	e8 47 05 00 00       	call   3972 <exit>
    342b:	90                   	nop
    342c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003430 <fsfull>:
{
    3430:	55                   	push   %ebp
    3431:	89 e5                	mov    %esp,%ebp
    3433:	57                   	push   %edi
    3434:	56                   	push   %esi
    3435:	53                   	push   %ebx
  for(nfiles = 0; ; nfiles++){
    3436:	31 db                	xor    %ebx,%ebx
{
    3438:	83 ec 54             	sub    $0x54,%esp
  printf(1, "fsfull test\n");
    343b:	68 53 4d 00 00       	push   $0x4d53
    3440:	6a 01                	push   $0x1
    3442:	e8 89 06 00 00       	call   3ad0 <printf>
    3447:	83 c4 10             	add    $0x10,%esp
    344a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    name[1] = '0' + nfiles / 1000;
    3450:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3455:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    3457:	89 d9                	mov    %ebx,%ecx
    name[1] = '0' + nfiles / 1000;
    3459:	f7 eb                	imul   %ebx
    345b:	c1 fe 1f             	sar    $0x1f,%esi
    name[3] = '0' + (nfiles % 100) / 10;
    345e:	89 df                	mov    %ebx,%edi
    printf(1, "writing %s\n", name);
    3460:	83 ec 04             	sub    $0x4,%esp
    name[0] = 'f';
    3463:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    3467:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    346b:	c1 fa 06             	sar    $0x6,%edx
    346e:	29 f2                	sub    %esi,%edx
    3470:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3473:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    3479:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    347c:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3481:	29 d1                	sub    %edx,%ecx
    3483:	f7 e9                	imul   %ecx
    3485:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    3488:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    348d:	c1 fa 05             	sar    $0x5,%edx
    3490:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    3492:	b9 67 66 66 66       	mov    $0x66666667,%ecx
    name[2] = '0' + (nfiles % 1000) / 100;
    3497:	83 c2 30             	add    $0x30,%edx
    349a:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    349d:	f7 eb                	imul   %ebx
    349f:	c1 fa 05             	sar    $0x5,%edx
    34a2:	29 f2                	sub    %esi,%edx
    34a4:	6b d2 64             	imul   $0x64,%edx,%edx
    34a7:	29 d7                	sub    %edx,%edi
    34a9:	89 f8                	mov    %edi,%eax
    34ab:	c1 ff 1f             	sar    $0x1f,%edi
    34ae:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    34b0:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    34b2:	c1 fa 02             	sar    $0x2,%edx
    34b5:	29 fa                	sub    %edi,%edx
    34b7:	83 c2 30             	add    $0x30,%edx
    34ba:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    34bd:	f7 e9                	imul   %ecx
    34bf:	89 d9                	mov    %ebx,%ecx
    34c1:	c1 fa 02             	sar    $0x2,%edx
    34c4:	29 f2                	sub    %esi,%edx
    34c6:	8d 04 92             	lea    (%edx,%edx,4),%eax
    34c9:	01 c0                	add    %eax,%eax
    34cb:	29 c1                	sub    %eax,%ecx
    34cd:	89 c8                	mov    %ecx,%eax
    34cf:	83 c0 30             	add    $0x30,%eax
    34d2:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf(1, "writing %s\n", name);
    34d5:	8d 45 a8             	lea    -0x58(%ebp),%eax
    34d8:	50                   	push   %eax
    34d9:	68 60 4d 00 00       	push   $0x4d60
    34de:	6a 01                	push   $0x1
    34e0:	e8 eb 05 00 00       	call   3ad0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    34e5:	58                   	pop    %eax
    34e6:	8d 45 a8             	lea    -0x58(%ebp),%eax
    34e9:	5a                   	pop    %edx
    34ea:	68 02 02 00 00       	push   $0x202
    34ef:	50                   	push   %eax
    34f0:	e8 bd 04 00 00       	call   39b2 <open>
    if(fd < 0){
    34f5:	83 c4 10             	add    $0x10,%esp
    34f8:	85 c0                	test   %eax,%eax
    int fd = open(name, O_CREATE|O_RDWR);
    34fa:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    34fc:	78 50                	js     354e <fsfull+0x11e>
    34fe:	31 f6                	xor    %esi,%esi
    3500:	eb 08                	jmp    350a <fsfull+0xda>
    3502:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      total += cc;
    3508:	01 c6                	add    %eax,%esi
      int cc = write(fd, buf, 512);
    350a:	83 ec 04             	sub    $0x4,%esp
    350d:	68 00 02 00 00       	push   $0x200
    3512:	68 60 86 00 00       	push   $0x8660
    3517:	57                   	push   %edi
    3518:	e8 75 04 00 00       	call   3992 <write>
      if(cc < 512)
    351d:	83 c4 10             	add    $0x10,%esp
    3520:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3525:	7f e1                	jg     3508 <fsfull+0xd8>
    printf(1, "wrote %d bytes\n", total);
    3527:	83 ec 04             	sub    $0x4,%esp
    352a:	56                   	push   %esi
    352b:	68 7c 4d 00 00       	push   $0x4d7c
    3530:	6a 01                	push   $0x1
    3532:	e8 99 05 00 00       	call   3ad0 <printf>
    close(fd);
    3537:	89 3c 24             	mov    %edi,(%esp)
    353a:	e8 5b 04 00 00       	call   399a <close>
    if(total == 0)
    353f:	83 c4 10             	add    $0x10,%esp
    3542:	85 f6                	test   %esi,%esi
    3544:	74 22                	je     3568 <fsfull+0x138>
  for(nfiles = 0; ; nfiles++){
    3546:	83 c3 01             	add    $0x1,%ebx
    3549:	e9 02 ff ff ff       	jmp    3450 <fsfull+0x20>
      printf(1, "open %s failed\n", name);
    354e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3551:	83 ec 04             	sub    $0x4,%esp
    3554:	50                   	push   %eax
    3555:	68 6c 4d 00 00       	push   $0x4d6c
    355a:	6a 01                	push   $0x1
    355c:	e8 6f 05 00 00       	call   3ad0 <printf>
      break;
    3561:	83 c4 10             	add    $0x10,%esp
    3564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    name[1] = '0' + nfiles / 1000;
    3568:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    356d:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    356f:	89 d9                	mov    %ebx,%ecx
    name[1] = '0' + nfiles / 1000;
    3571:	f7 eb                	imul   %ebx
    3573:	c1 fe 1f             	sar    $0x1f,%esi
    name[3] = '0' + (nfiles % 100) / 10;
    3576:	89 df                	mov    %ebx,%edi
    unlink(name);
    3578:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'f';
    357b:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    357f:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    3583:	c1 fa 06             	sar    $0x6,%edx
    3586:	29 f2                	sub    %esi,%edx
    3588:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    358b:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    3591:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3594:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3599:	29 d1                	sub    %edx,%ecx
    359b:	f7 e9                	imul   %ecx
    359d:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    35a0:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    35a5:	c1 fa 05             	sar    $0x5,%edx
    35a8:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    35aa:	b9 67 66 66 66       	mov    $0x66666667,%ecx
    name[2] = '0' + (nfiles % 1000) / 100;
    35af:	83 c2 30             	add    $0x30,%edx
    35b2:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    35b5:	f7 eb                	imul   %ebx
    35b7:	c1 fa 05             	sar    $0x5,%edx
    35ba:	29 f2                	sub    %esi,%edx
    35bc:	6b d2 64             	imul   $0x64,%edx,%edx
    35bf:	29 d7                	sub    %edx,%edi
    35c1:	89 f8                	mov    %edi,%eax
    35c3:	c1 ff 1f             	sar    $0x1f,%edi
    35c6:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    35c8:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    35ca:	c1 fa 02             	sar    $0x2,%edx
    35cd:	29 fa                	sub    %edi,%edx
    35cf:	83 c2 30             	add    $0x30,%edx
    35d2:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    35d5:	f7 e9                	imul   %ecx
    35d7:	89 d9                	mov    %ebx,%ecx
    nfiles--;
    35d9:	83 eb 01             	sub    $0x1,%ebx
    name[4] = '0' + (nfiles % 10);
    35dc:	c1 fa 02             	sar    $0x2,%edx
    35df:	29 f2                	sub    %esi,%edx
    35e1:	8d 04 92             	lea    (%edx,%edx,4),%eax
    35e4:	01 c0                	add    %eax,%eax
    35e6:	29 c1                	sub    %eax,%ecx
    35e8:	89 c8                	mov    %ecx,%eax
    35ea:	83 c0 30             	add    $0x30,%eax
    35ed:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
    35f0:	8d 45 a8             	lea    -0x58(%ebp),%eax
    35f3:	50                   	push   %eax
    35f4:	e8 c9 03 00 00       	call   39c2 <unlink>
  while(nfiles >= 0){
    35f9:	83 c4 10             	add    $0x10,%esp
    35fc:	83 fb ff             	cmp    $0xffffffff,%ebx
    35ff:	0f 85 63 ff ff ff    	jne    3568 <fsfull+0x138>
  printf(1, "fsfull test finished\n");
    3605:	83 ec 08             	sub    $0x8,%esp
    3608:	68 8c 4d 00 00       	push   $0x4d8c
    360d:	6a 01                	push   $0x1
    360f:	e8 bc 04 00 00       	call   3ad0 <printf>
}
    3614:	83 c4 10             	add    $0x10,%esp
    3617:	8d 65 f4             	lea    -0xc(%ebp),%esp
    361a:	5b                   	pop    %ebx
    361b:	5e                   	pop    %esi
    361c:	5f                   	pop    %edi
    361d:	5d                   	pop    %ebp
    361e:	c3                   	ret    
    361f:	90                   	nop

00003620 <uio>:
{
    3620:	55                   	push   %ebp
    3621:	89 e5                	mov    %esp,%ebp
    3623:	83 ec 10             	sub    $0x10,%esp
  printf(1, "uio test\n");
    3626:	68 a2 4d 00 00       	push   $0x4da2
    362b:	6a 01                	push   $0x1
    362d:	e8 9e 04 00 00       	call   3ad0 <printf>
  pid = fork(0);
    3632:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3639:	e8 2c 03 00 00       	call   396a <fork>
  if(pid == 0){
    363e:	83 c4 10             	add    $0x10,%esp
    3641:	85 c0                	test   %eax,%eax
    3643:	74 1b                	je     3660 <uio+0x40>
  } else if(pid < 0){
    3645:	78 3d                	js     3684 <uio+0x64>
  wait();
    3647:	e8 2e 03 00 00       	call   397a <wait>
  printf(1, "uio test done\n");
    364c:	83 ec 08             	sub    $0x8,%esp
    364f:	68 ac 4d 00 00       	push   $0x4dac
    3654:	6a 01                	push   $0x1
    3656:	e8 75 04 00 00       	call   3ad0 <printf>
}
    365b:	83 c4 10             	add    $0x10,%esp
    365e:	c9                   	leave  
    365f:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    3660:	ba 70 00 00 00       	mov    $0x70,%edx
    3665:	b8 09 00 00 00       	mov    $0x9,%eax
    366a:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    366b:	ba 71 00 00 00       	mov    $0x71,%edx
    3670:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    3671:	52                   	push   %edx
    3672:	52                   	push   %edx
    3673:	68 38 55 00 00       	push   $0x5538
    3678:	6a 01                	push   $0x1
    367a:	e8 51 04 00 00       	call   3ad0 <printf>
    exit();
    367f:	e8 ee 02 00 00       	call   3972 <exit>
    printf (1, "fork failed\n");
    3684:	50                   	push   %eax
    3685:	50                   	push   %eax
    3686:	68 31 4d 00 00       	push   $0x4d31
    368b:	6a 01                	push   $0x1
    368d:	e8 3e 04 00 00       	call   3ad0 <printf>
    exit();
    3692:	e8 db 02 00 00       	call   3972 <exit>
    3697:	89 f6                	mov    %esi,%esi
    3699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036a0 <argptest>:
{
    36a0:	55                   	push   %ebp
    36a1:	89 e5                	mov    %esp,%ebp
    36a3:	53                   	push   %ebx
    36a4:	83 ec 0c             	sub    $0xc,%esp
  fd = open("init", O_RDONLY);
    36a7:	6a 00                	push   $0x0
    36a9:	68 bb 4d 00 00       	push   $0x4dbb
    36ae:	e8 ff 02 00 00       	call   39b2 <open>
  if (fd < 0) {
    36b3:	83 c4 10             	add    $0x10,%esp
    36b6:	85 c0                	test   %eax,%eax
    36b8:	78 39                	js     36f3 <argptest+0x53>
  read(fd, sbrk(0) - 1, -1);
    36ba:	83 ec 0c             	sub    $0xc,%esp
    36bd:	89 c3                	mov    %eax,%ebx
    36bf:	6a 00                	push   $0x0
    36c1:	e8 34 03 00 00       	call   39fa <sbrk>
    36c6:	83 c4 0c             	add    $0xc,%esp
    36c9:	83 e8 01             	sub    $0x1,%eax
    36cc:	6a ff                	push   $0xffffffff
    36ce:	50                   	push   %eax
    36cf:	53                   	push   %ebx
    36d0:	e8 b5 02 00 00       	call   398a <read>
  close(fd);
    36d5:	89 1c 24             	mov    %ebx,(%esp)
    36d8:	e8 bd 02 00 00       	call   399a <close>
  printf(1, "arg test passed\n");
    36dd:	58                   	pop    %eax
    36de:	5a                   	pop    %edx
    36df:	68 cd 4d 00 00       	push   $0x4dcd
    36e4:	6a 01                	push   $0x1
    36e6:	e8 e5 03 00 00       	call   3ad0 <printf>
}
    36eb:	83 c4 10             	add    $0x10,%esp
    36ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    36f1:	c9                   	leave  
    36f2:	c3                   	ret    
    printf(2, "open failed\n");
    36f3:	51                   	push   %ecx
    36f4:	51                   	push   %ecx
    36f5:	68 c0 4d 00 00       	push   $0x4dc0
    36fa:	6a 02                	push   $0x2
    36fc:	e8 cf 03 00 00       	call   3ad0 <printf>
    exit();
    3701:	e8 6c 02 00 00       	call   3972 <exit>
    3706:	8d 76 00             	lea    0x0(%esi),%esi
    3709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003710 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    3710:	69 05 84 5e 00 00 0d 	imul   $0x19660d,0x5e84,%eax
    3717:	66 19 00 
{
    371a:	55                   	push   %ebp
    371b:	89 e5                	mov    %esp,%ebp
}
    371d:	5d                   	pop    %ebp
  randstate = randstate * 1664525 + 1013904223;
    371e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3723:	a3 84 5e 00 00       	mov    %eax,0x5e84
}
    3728:	c3                   	ret    
    3729:	66 90                	xchg   %ax,%ax
    372b:	66 90                	xchg   %ax,%ax
    372d:	66 90                	xchg   %ax,%ax
    372f:	90                   	nop

00003730 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3730:	55                   	push   %ebp
    3731:	89 e5                	mov    %esp,%ebp
    3733:	53                   	push   %ebx
    3734:	8b 45 08             	mov    0x8(%ebp),%eax
    3737:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    373a:	89 c2                	mov    %eax,%edx
    373c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3740:	83 c1 01             	add    $0x1,%ecx
    3743:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    3747:	83 c2 01             	add    $0x1,%edx
    374a:	84 db                	test   %bl,%bl
    374c:	88 5a ff             	mov    %bl,-0x1(%edx)
    374f:	75 ef                	jne    3740 <strcpy+0x10>
    ;
  return os;
}
    3751:	5b                   	pop    %ebx
    3752:	5d                   	pop    %ebp
    3753:	c3                   	ret    
    3754:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    375a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003760 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3760:	55                   	push   %ebp
    3761:	89 e5                	mov    %esp,%ebp
    3763:	56                   	push   %esi
    3764:	53                   	push   %ebx
    3765:	8b 55 08             	mov    0x8(%ebp),%edx
    3768:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    376b:	0f b6 02             	movzbl (%edx),%eax
    376e:	0f b6 19             	movzbl (%ecx),%ebx
    3771:	84 c0                	test   %al,%al
    3773:	75 1e                	jne    3793 <strcmp+0x33>
    3775:	eb 29                	jmp    37a0 <strcmp+0x40>
    3777:	89 f6                	mov    %esi,%esi
    3779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    3780:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    3783:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    3786:	8d 71 01             	lea    0x1(%ecx),%esi
  while(*p && *p == *q)
    3789:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    378d:	84 c0                	test   %al,%al
    378f:	74 0f                	je     37a0 <strcmp+0x40>
    3791:	89 f1                	mov    %esi,%ecx
    3793:	38 d8                	cmp    %bl,%al
    3795:	74 e9                	je     3780 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    3797:	29 d8                	sub    %ebx,%eax
}
    3799:	5b                   	pop    %ebx
    379a:	5e                   	pop    %esi
    379b:	5d                   	pop    %ebp
    379c:	c3                   	ret    
    379d:	8d 76 00             	lea    0x0(%esi),%esi
  while(*p && *p == *q)
    37a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    37a2:	29 d8                	sub    %ebx,%eax
}
    37a4:	5b                   	pop    %ebx
    37a5:	5e                   	pop    %esi
    37a6:	5d                   	pop    %ebp
    37a7:	c3                   	ret    
    37a8:	90                   	nop
    37a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000037b0 <strlen>:

uint
strlen(char *s)
{
    37b0:	55                   	push   %ebp
    37b1:	89 e5                	mov    %esp,%ebp
    37b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    37b6:	80 39 00             	cmpb   $0x0,(%ecx)
    37b9:	74 12                	je     37cd <strlen+0x1d>
    37bb:	31 d2                	xor    %edx,%edx
    37bd:	8d 76 00             	lea    0x0(%esi),%esi
    37c0:	83 c2 01             	add    $0x1,%edx
    37c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    37c7:	89 d0                	mov    %edx,%eax
    37c9:	75 f5                	jne    37c0 <strlen+0x10>
    ;
  return n;
}
    37cb:	5d                   	pop    %ebp
    37cc:	c3                   	ret    
  for(n = 0; s[n]; n++)
    37cd:	31 c0                	xor    %eax,%eax
}
    37cf:	5d                   	pop    %ebp
    37d0:	c3                   	ret    
    37d1:	eb 0d                	jmp    37e0 <memset>
    37d3:	90                   	nop
    37d4:	90                   	nop
    37d5:	90                   	nop
    37d6:	90                   	nop
    37d7:	90                   	nop
    37d8:	90                   	nop
    37d9:	90                   	nop
    37da:	90                   	nop
    37db:	90                   	nop
    37dc:	90                   	nop
    37dd:	90                   	nop
    37de:	90                   	nop
    37df:	90                   	nop

000037e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    37e0:	55                   	push   %ebp
    37e1:	89 e5                	mov    %esp,%ebp
    37e3:	57                   	push   %edi
    37e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    37e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    37ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    37ed:	89 d7                	mov    %edx,%edi
    37ef:	fc                   	cld    
    37f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    37f2:	89 d0                	mov    %edx,%eax
    37f4:	5f                   	pop    %edi
    37f5:	5d                   	pop    %ebp
    37f6:	c3                   	ret    
    37f7:	89 f6                	mov    %esi,%esi
    37f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003800 <strchr>:

char*
strchr(const char *s, char c)
{
    3800:	55                   	push   %ebp
    3801:	89 e5                	mov    %esp,%ebp
    3803:	53                   	push   %ebx
    3804:	8b 45 08             	mov    0x8(%ebp),%eax
    3807:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    380a:	0f b6 10             	movzbl (%eax),%edx
    380d:	84 d2                	test   %dl,%dl
    380f:	74 1d                	je     382e <strchr+0x2e>
    if(*s == c)
    3811:	38 d3                	cmp    %dl,%bl
    3813:	89 d9                	mov    %ebx,%ecx
    3815:	75 0d                	jne    3824 <strchr+0x24>
    3817:	eb 17                	jmp    3830 <strchr+0x30>
    3819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3820:	38 ca                	cmp    %cl,%dl
    3822:	74 0c                	je     3830 <strchr+0x30>
  for(; *s; s++)
    3824:	83 c0 01             	add    $0x1,%eax
    3827:	0f b6 10             	movzbl (%eax),%edx
    382a:	84 d2                	test   %dl,%dl
    382c:	75 f2                	jne    3820 <strchr+0x20>
      return (char*)s;
  return 0;
    382e:	31 c0                	xor    %eax,%eax
}
    3830:	5b                   	pop    %ebx
    3831:	5d                   	pop    %ebp
    3832:	c3                   	ret    
    3833:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003840 <gets>:

char*
gets(char *buf, int max)
{
    3840:	55                   	push   %ebp
    3841:	89 e5                	mov    %esp,%ebp
    3843:	57                   	push   %edi
    3844:	56                   	push   %esi
    3845:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3846:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    3848:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    384b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    384e:	eb 29                	jmp    3879 <gets+0x39>
    cc = read(0, &c, 1);
    3850:	83 ec 04             	sub    $0x4,%esp
    3853:	6a 01                	push   $0x1
    3855:	57                   	push   %edi
    3856:	6a 00                	push   $0x0
    3858:	e8 2d 01 00 00       	call   398a <read>
    if(cc < 1)
    385d:	83 c4 10             	add    $0x10,%esp
    3860:	85 c0                	test   %eax,%eax
    3862:	7e 1d                	jle    3881 <gets+0x41>
      break;
    buf[i++] = c;
    3864:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3868:	8b 55 08             	mov    0x8(%ebp),%edx
    386b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    386d:	3c 0a                	cmp    $0xa,%al
    buf[i++] = c;
    386f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    3873:	74 1b                	je     3890 <gets+0x50>
    3875:	3c 0d                	cmp    $0xd,%al
    3877:	74 17                	je     3890 <gets+0x50>
  for(i=0; i+1 < max; ){
    3879:	8d 5e 01             	lea    0x1(%esi),%ebx
    387c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    387f:	7c cf                	jl     3850 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    3881:	8b 45 08             	mov    0x8(%ebp),%eax
    3884:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3888:	8d 65 f4             	lea    -0xc(%ebp),%esp
    388b:	5b                   	pop    %ebx
    388c:	5e                   	pop    %esi
    388d:	5f                   	pop    %edi
    388e:	5d                   	pop    %ebp
    388f:	c3                   	ret    
  buf[i] = '\0';
    3890:	8b 45 08             	mov    0x8(%ebp),%eax
  for(i=0; i+1 < max; ){
    3893:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
    3895:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    3899:	8d 65 f4             	lea    -0xc(%ebp),%esp
    389c:	5b                   	pop    %ebx
    389d:	5e                   	pop    %esi
    389e:	5f                   	pop    %edi
    389f:	5d                   	pop    %ebp
    38a0:	c3                   	ret    
    38a1:	eb 0d                	jmp    38b0 <stat>
    38a3:	90                   	nop
    38a4:	90                   	nop
    38a5:	90                   	nop
    38a6:	90                   	nop
    38a7:	90                   	nop
    38a8:	90                   	nop
    38a9:	90                   	nop
    38aa:	90                   	nop
    38ab:	90                   	nop
    38ac:	90                   	nop
    38ad:	90                   	nop
    38ae:	90                   	nop
    38af:	90                   	nop

000038b0 <stat>:

int
stat(char *n, struct stat *st)
{
    38b0:	55                   	push   %ebp
    38b1:	89 e5                	mov    %esp,%ebp
    38b3:	56                   	push   %esi
    38b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    38b5:	83 ec 08             	sub    $0x8,%esp
    38b8:	6a 00                	push   $0x0
    38ba:	ff 75 08             	pushl  0x8(%ebp)
    38bd:	e8 f0 00 00 00       	call   39b2 <open>
  if(fd < 0)
    38c2:	83 c4 10             	add    $0x10,%esp
    38c5:	85 c0                	test   %eax,%eax
    38c7:	78 27                	js     38f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    38c9:	83 ec 08             	sub    $0x8,%esp
    38cc:	ff 75 0c             	pushl  0xc(%ebp)
    38cf:	89 c3                	mov    %eax,%ebx
    38d1:	50                   	push   %eax
    38d2:	e8 f3 00 00 00       	call   39ca <fstat>
  close(fd);
    38d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    38da:	89 c6                	mov    %eax,%esi
  close(fd);
    38dc:	e8 b9 00 00 00       	call   399a <close>
  return r;
    38e1:	83 c4 10             	add    $0x10,%esp
}
    38e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    38e7:	89 f0                	mov    %esi,%eax
    38e9:	5b                   	pop    %ebx
    38ea:	5e                   	pop    %esi
    38eb:	5d                   	pop    %ebp
    38ec:	c3                   	ret    
    38ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    38f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    38f5:	eb ed                	jmp    38e4 <stat+0x34>
    38f7:	89 f6                	mov    %esi,%esi
    38f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003900 <atoi>:

int
atoi(const char *s)
{
    3900:	55                   	push   %ebp
    3901:	89 e5                	mov    %esp,%ebp
    3903:	53                   	push   %ebx
    3904:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3907:	0f be 11             	movsbl (%ecx),%edx
    390a:	8d 42 d0             	lea    -0x30(%edx),%eax
    390d:	3c 09                	cmp    $0x9,%al
    390f:	b8 00 00 00 00       	mov    $0x0,%eax
    3914:	77 1f                	ja     3935 <atoi+0x35>
    3916:	8d 76 00             	lea    0x0(%esi),%esi
    3919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    3920:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3923:	83 c1 01             	add    $0x1,%ecx
    3926:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    392a:	0f be 11             	movsbl (%ecx),%edx
    392d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3930:	80 fb 09             	cmp    $0x9,%bl
    3933:	76 eb                	jbe    3920 <atoi+0x20>
  return n;
}
    3935:	5b                   	pop    %ebx
    3936:	5d                   	pop    %ebp
    3937:	c3                   	ret    
    3938:	90                   	nop
    3939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003940 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3940:	55                   	push   %ebp
    3941:	89 e5                	mov    %esp,%ebp
    3943:	56                   	push   %esi
    3944:	53                   	push   %ebx
    3945:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3948:	8b 45 08             	mov    0x8(%ebp),%eax
    394b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    394e:	85 db                	test   %ebx,%ebx
    3950:	7e 14                	jle    3966 <memmove+0x26>
    3952:	31 d2                	xor    %edx,%edx
    3954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    3958:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    395c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    395f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    3962:	39 da                	cmp    %ebx,%edx
    3964:	75 f2                	jne    3958 <memmove+0x18>
  return vdst;
}
    3966:	5b                   	pop    %ebx
    3967:	5e                   	pop    %esi
    3968:	5d                   	pop    %ebp
    3969:	c3                   	ret    

0000396a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    396a:	b8 01 00 00 00       	mov    $0x1,%eax
    396f:	cd 40                	int    $0x40
    3971:	c3                   	ret    

00003972 <exit>:
SYSCALL(exit)
    3972:	b8 02 00 00 00       	mov    $0x2,%eax
    3977:	cd 40                	int    $0x40
    3979:	c3                   	ret    

0000397a <wait>:
SYSCALL(wait)
    397a:	b8 03 00 00 00       	mov    $0x3,%eax
    397f:	cd 40                	int    $0x40
    3981:	c3                   	ret    

00003982 <pipe>:
SYSCALL(pipe)
    3982:	b8 04 00 00 00       	mov    $0x4,%eax
    3987:	cd 40                	int    $0x40
    3989:	c3                   	ret    

0000398a <read>:
SYSCALL(read)
    398a:	b8 05 00 00 00       	mov    $0x5,%eax
    398f:	cd 40                	int    $0x40
    3991:	c3                   	ret    

00003992 <write>:
SYSCALL(write)
    3992:	b8 10 00 00 00       	mov    $0x10,%eax
    3997:	cd 40                	int    $0x40
    3999:	c3                   	ret    

0000399a <close>:
SYSCALL(close)
    399a:	b8 15 00 00 00       	mov    $0x15,%eax
    399f:	cd 40                	int    $0x40
    39a1:	c3                   	ret    

000039a2 <kill>:
SYSCALL(kill)
    39a2:	b8 06 00 00 00       	mov    $0x6,%eax
    39a7:	cd 40                	int    $0x40
    39a9:	c3                   	ret    

000039aa <exec>:
SYSCALL(exec)
    39aa:	b8 07 00 00 00       	mov    $0x7,%eax
    39af:	cd 40                	int    $0x40
    39b1:	c3                   	ret    

000039b2 <open>:
SYSCALL(open)
    39b2:	b8 0f 00 00 00       	mov    $0xf,%eax
    39b7:	cd 40                	int    $0x40
    39b9:	c3                   	ret    

000039ba <mknod>:
SYSCALL(mknod)
    39ba:	b8 11 00 00 00       	mov    $0x11,%eax
    39bf:	cd 40                	int    $0x40
    39c1:	c3                   	ret    

000039c2 <unlink>:
SYSCALL(unlink)
    39c2:	b8 12 00 00 00       	mov    $0x12,%eax
    39c7:	cd 40                	int    $0x40
    39c9:	c3                   	ret    

000039ca <fstat>:
SYSCALL(fstat)
    39ca:	b8 08 00 00 00       	mov    $0x8,%eax
    39cf:	cd 40                	int    $0x40
    39d1:	c3                   	ret    

000039d2 <link>:
SYSCALL(link)
    39d2:	b8 13 00 00 00       	mov    $0x13,%eax
    39d7:	cd 40                	int    $0x40
    39d9:	c3                   	ret    

000039da <mkdir>:
SYSCALL(mkdir)
    39da:	b8 14 00 00 00       	mov    $0x14,%eax
    39df:	cd 40                	int    $0x40
    39e1:	c3                   	ret    

000039e2 <chdir>:
SYSCALL(chdir)
    39e2:	b8 09 00 00 00       	mov    $0x9,%eax
    39e7:	cd 40                	int    $0x40
    39e9:	c3                   	ret    

000039ea <dup>:
SYSCALL(dup)
    39ea:	b8 0a 00 00 00       	mov    $0xa,%eax
    39ef:	cd 40                	int    $0x40
    39f1:	c3                   	ret    

000039f2 <getpid>:
SYSCALL(getpid)
    39f2:	b8 0b 00 00 00       	mov    $0xb,%eax
    39f7:	cd 40                	int    $0x40
    39f9:	c3                   	ret    

000039fa <sbrk>:
SYSCALL(sbrk)
    39fa:	b8 0c 00 00 00       	mov    $0xc,%eax
    39ff:	cd 40                	int    $0x40
    3a01:	c3                   	ret    

00003a02 <sleep>:
SYSCALL(sleep)
    3a02:	b8 0d 00 00 00       	mov    $0xd,%eax
    3a07:	cd 40                	int    $0x40
    3a09:	c3                   	ret    

00003a0a <uptime>:
SYSCALL(uptime)
    3a0a:	b8 0e 00 00 00       	mov    $0xe,%eax
    3a0f:	cd 40                	int    $0x40
    3a11:	c3                   	ret    

00003a12 <cps>:
SYSCALL(cps)
    3a12:	b8 16 00 00 00       	mov    $0x16,%eax
    3a17:	cd 40                	int    $0x40
    3a19:	c3                   	ret    

00003a1a <csc>:
SYSCALL(csc)
    3a1a:	b8 17 00 00 00       	mov    $0x17,%eax
    3a1f:	cd 40                	int    $0x40
    3a21:	c3                   	ret    

00003a22 <chpr>:
SYSCALL(chpr)
    3a22:	b8 18 00 00 00       	mov    $0x18,%eax
    3a27:	cd 40                	int    $0x40
    3a29:	c3                   	ret    
    3a2a:	66 90                	xchg   %ax,%ax
    3a2c:	66 90                	xchg   %ax,%ax
    3a2e:	66 90                	xchg   %ax,%ax

00003a30 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3a30:	55                   	push   %ebp
    3a31:	89 e5                	mov    %esp,%ebp
    3a33:	57                   	push   %edi
    3a34:	56                   	push   %esi
    3a35:	53                   	push   %ebx
    3a36:	89 c6                	mov    %eax,%esi
    3a38:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    3a3b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3a3e:	85 db                	test   %ebx,%ebx
    3a40:	74 7e                	je     3ac0 <printint+0x90>
    3a42:	89 d0                	mov    %edx,%eax
    3a44:	c1 e8 1f             	shr    $0x1f,%eax
    3a47:	84 c0                	test   %al,%al
    3a49:	74 75                	je     3ac0 <printint+0x90>
    neg = 1;
    x = -xx;
    3a4b:	89 d0                	mov    %edx,%eax
    neg = 1;
    3a4d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    3a54:	f7 d8                	neg    %eax
    3a56:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    3a59:	31 ff                	xor    %edi,%edi
    3a5b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    3a5e:	89 ce                	mov    %ecx,%esi
    3a60:	eb 08                	jmp    3a6a <printint+0x3a>
    3a62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    3a68:	89 cf                	mov    %ecx,%edi
    3a6a:	31 d2                	xor    %edx,%edx
    3a6c:	8d 4f 01             	lea    0x1(%edi),%ecx
    3a6f:	f7 f6                	div    %esi
    3a71:	0f b6 92 90 55 00 00 	movzbl 0x5590(%edx),%edx
  }while((x /= base) != 0);
    3a78:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    3a7a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    3a7d:	75 e9                	jne    3a68 <printint+0x38>
  if(neg)
    3a7f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3a82:	8b 75 c0             	mov    -0x40(%ebp),%esi
    3a85:	85 c0                	test   %eax,%eax
    3a87:	74 08                	je     3a91 <printint+0x61>
    buf[i++] = '-';
    3a89:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    3a8e:	8d 4f 02             	lea    0x2(%edi),%ecx

  while(--i >= 0)
    3a91:	8d 79 ff             	lea    -0x1(%ecx),%edi
    3a94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3a98:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
  write(fd, &c, 1);
    3a9d:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
    3aa0:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    3aa3:	6a 01                	push   $0x1
    3aa5:	53                   	push   %ebx
    3aa6:	56                   	push   %esi
    3aa7:	88 45 d7             	mov    %al,-0x29(%ebp)
    3aaa:	e8 e3 fe ff ff       	call   3992 <write>
  while(--i >= 0)
    3aaf:	83 c4 10             	add    $0x10,%esp
    3ab2:	83 ff ff             	cmp    $0xffffffff,%edi
    3ab5:	75 e1                	jne    3a98 <printint+0x68>
    putc(fd, buf[i]);
}
    3ab7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3aba:	5b                   	pop    %ebx
    3abb:	5e                   	pop    %esi
    3abc:	5f                   	pop    %edi
    3abd:	5d                   	pop    %ebp
    3abe:	c3                   	ret    
    3abf:	90                   	nop
    x = xx;
    3ac0:	89 d0                	mov    %edx,%eax
  neg = 0;
    3ac2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3ac9:	eb 8b                	jmp    3a56 <printint+0x26>
    3acb:	90                   	nop
    3acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003ad0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3ad0:	55                   	push   %ebp
    3ad1:	89 e5                	mov    %esp,%ebp
    3ad3:	57                   	push   %edi
    3ad4:	56                   	push   %esi
    3ad5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ad6:	8d 45 10             	lea    0x10(%ebp),%eax
{
    3ad9:	83 ec 2c             	sub    $0x2c,%esp
  for(i = 0; fmt[i]; i++){
    3adc:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    3adf:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    3ae2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3ae5:	0f b6 1e             	movzbl (%esi),%ebx
    3ae8:	83 c6 01             	add    $0x1,%esi
    3aeb:	84 db                	test   %bl,%bl
    3aed:	0f 84 b0 00 00 00    	je     3ba3 <printf+0xd3>
    3af3:	31 d2                	xor    %edx,%edx
    3af5:	eb 39                	jmp    3b30 <printf+0x60>
    3af7:	89 f6                	mov    %esi,%esi
    3af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3b00:	83 f8 25             	cmp    $0x25,%eax
    3b03:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    3b06:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    3b0b:	74 18                	je     3b25 <printf+0x55>
  write(fd, &c, 1);
    3b0d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    3b10:	83 ec 04             	sub    $0x4,%esp
    3b13:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    3b16:	6a 01                	push   $0x1
    3b18:	50                   	push   %eax
    3b19:	57                   	push   %edi
    3b1a:	e8 73 fe ff ff       	call   3992 <write>
    3b1f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3b22:	83 c4 10             	add    $0x10,%esp
    3b25:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    3b28:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    3b2c:	84 db                	test   %bl,%bl
    3b2e:	74 73                	je     3ba3 <printf+0xd3>
    if(state == 0){
    3b30:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    3b32:	0f be cb             	movsbl %bl,%ecx
    3b35:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    3b38:	74 c6                	je     3b00 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3b3a:	83 fa 25             	cmp    $0x25,%edx
    3b3d:	75 e6                	jne    3b25 <printf+0x55>
      if(c == 'd'){
    3b3f:	83 f8 64             	cmp    $0x64,%eax
    3b42:	0f 84 f8 00 00 00    	je     3c40 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3b48:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    3b4e:	83 f9 70             	cmp    $0x70,%ecx
    3b51:	74 5d                	je     3bb0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3b53:	83 f8 73             	cmp    $0x73,%eax
    3b56:	0f 84 84 00 00 00    	je     3be0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3b5c:	83 f8 63             	cmp    $0x63,%eax
    3b5f:	0f 84 ea 00 00 00    	je     3c4f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3b65:	83 f8 25             	cmp    $0x25,%eax
    3b68:	0f 84 c2 00 00 00    	je     3c30 <printf+0x160>
  write(fd, &c, 1);
    3b6e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3b71:	83 ec 04             	sub    $0x4,%esp
    3b74:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3b78:	6a 01                	push   $0x1
    3b7a:	50                   	push   %eax
    3b7b:	57                   	push   %edi
    3b7c:	e8 11 fe ff ff       	call   3992 <write>
    3b81:	83 c4 0c             	add    $0xc,%esp
    3b84:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3b87:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    3b8a:	6a 01                	push   $0x1
    3b8c:	50                   	push   %eax
    3b8d:	57                   	push   %edi
    3b8e:	83 c6 01             	add    $0x1,%esi
    3b91:	e8 fc fd ff ff       	call   3992 <write>
  for(i = 0; fmt[i]; i++){
    3b96:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    3b9a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b9d:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    3b9f:	84 db                	test   %bl,%bl
    3ba1:	75 8d                	jne    3b30 <printf+0x60>
    }
  }
}
    3ba3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3ba6:	5b                   	pop    %ebx
    3ba7:	5e                   	pop    %esi
    3ba8:	5f                   	pop    %edi
    3ba9:	5d                   	pop    %ebp
    3baa:	c3                   	ret    
    3bab:	90                   	nop
    3bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
    3bb0:	83 ec 0c             	sub    $0xc,%esp
    3bb3:	b9 10 00 00 00       	mov    $0x10,%ecx
    3bb8:	6a 00                	push   $0x0
    3bba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    3bbd:	89 f8                	mov    %edi,%eax
    3bbf:	8b 13                	mov    (%ebx),%edx
    3bc1:	e8 6a fe ff ff       	call   3a30 <printint>
        ap++;
    3bc6:	89 d8                	mov    %ebx,%eax
    3bc8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3bcb:	31 d2                	xor    %edx,%edx
        ap++;
    3bcd:	83 c0 04             	add    $0x4,%eax
    3bd0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3bd3:	e9 4d ff ff ff       	jmp    3b25 <printf+0x55>
    3bd8:	90                   	nop
    3bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    3be0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3be3:	8b 18                	mov    (%eax),%ebx
        ap++;
    3be5:	83 c0 04             	add    $0x4,%eax
    3be8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    3beb:	85 db                	test   %ebx,%ebx
    3bed:	74 7c                	je     3c6b <printf+0x19b>
        while(*s != 0){
    3bef:	0f b6 03             	movzbl (%ebx),%eax
    3bf2:	84 c0                	test   %al,%al
    3bf4:	74 29                	je     3c1f <printf+0x14f>
    3bf6:	8d 76 00             	lea    0x0(%esi),%esi
    3bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3c00:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    3c03:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    3c06:	83 ec 04             	sub    $0x4,%esp
    3c09:	6a 01                	push   $0x1
          s++;
    3c0b:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    3c0e:	50                   	push   %eax
    3c0f:	57                   	push   %edi
    3c10:	e8 7d fd ff ff       	call   3992 <write>
        while(*s != 0){
    3c15:	0f b6 03             	movzbl (%ebx),%eax
    3c18:	83 c4 10             	add    $0x10,%esp
    3c1b:	84 c0                	test   %al,%al
    3c1d:	75 e1                	jne    3c00 <printf+0x130>
      state = 0;
    3c1f:	31 d2                	xor    %edx,%edx
    3c21:	e9 ff fe ff ff       	jmp    3b25 <printf+0x55>
    3c26:	8d 76 00             	lea    0x0(%esi),%esi
    3c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  write(fd, &c, 1);
    3c30:	83 ec 04             	sub    $0x4,%esp
    3c33:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    3c36:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3c39:	6a 01                	push   $0x1
    3c3b:	e9 4c ff ff ff       	jmp    3b8c <printf+0xbc>
        printint(fd, *ap, 10, 1);
    3c40:	83 ec 0c             	sub    $0xc,%esp
    3c43:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3c48:	6a 01                	push   $0x1
    3c4a:	e9 6b ff ff ff       	jmp    3bba <printf+0xea>
        putc(fd, *ap);
    3c4f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    3c52:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    3c55:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    3c57:	6a 01                	push   $0x1
        putc(fd, *ap);
    3c59:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    3c5c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3c5f:	50                   	push   %eax
    3c60:	57                   	push   %edi
    3c61:	e8 2c fd ff ff       	call   3992 <write>
    3c66:	e9 5b ff ff ff       	jmp    3bc6 <printf+0xf6>
        while(*s != 0){
    3c6b:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    3c70:	bb 88 55 00 00       	mov    $0x5588,%ebx
    3c75:	eb 89                	jmp    3c00 <printf+0x130>
    3c77:	66 90                	xchg   %ax,%ax
    3c79:	66 90                	xchg   %ax,%ax
    3c7b:	66 90                	xchg   %ax,%ax
    3c7d:	66 90                	xchg   %ax,%ax
    3c7f:	90                   	nop

00003c80 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3c80:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c81:	a1 20 5f 00 00       	mov    0x5f20,%eax
{
    3c86:	89 e5                	mov    %esp,%ebp
    3c88:	57                   	push   %edi
    3c89:	56                   	push   %esi
    3c8a:	53                   	push   %ebx
    3c8b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c8e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    3c90:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c93:	39 c8                	cmp    %ecx,%eax
    3c95:	73 19                	jae    3cb0 <free+0x30>
    3c97:	89 f6                	mov    %esi,%esi
    3c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3ca0:	39 d1                	cmp    %edx,%ecx
    3ca2:	72 1c                	jb     3cc0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3ca4:	39 d0                	cmp    %edx,%eax
    3ca6:	73 18                	jae    3cc0 <free+0x40>
{
    3ca8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3caa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3cac:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3cae:	72 f0                	jb     3ca0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3cb0:	39 d0                	cmp    %edx,%eax
    3cb2:	72 f4                	jb     3ca8 <free+0x28>
    3cb4:	39 d1                	cmp    %edx,%ecx
    3cb6:	73 f0                	jae    3ca8 <free+0x28>
    3cb8:	90                   	nop
    3cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    3cc0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3cc3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3cc6:	39 fa                	cmp    %edi,%edx
    3cc8:	74 19                	je     3ce3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3cca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3ccd:	8b 50 04             	mov    0x4(%eax),%edx
    3cd0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3cd3:	39 f1                	cmp    %esi,%ecx
    3cd5:	74 23                	je     3cfa <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3cd7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3cd9:	a3 20 5f 00 00       	mov    %eax,0x5f20
}
    3cde:	5b                   	pop    %ebx
    3cdf:	5e                   	pop    %esi
    3ce0:	5f                   	pop    %edi
    3ce1:	5d                   	pop    %ebp
    3ce2:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    3ce3:	03 72 04             	add    0x4(%edx),%esi
    3ce6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3ce9:	8b 10                	mov    (%eax),%edx
    3ceb:	8b 12                	mov    (%edx),%edx
    3ced:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3cf0:	8b 50 04             	mov    0x4(%eax),%edx
    3cf3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3cf6:	39 f1                	cmp    %esi,%ecx
    3cf8:	75 dd                	jne    3cd7 <free+0x57>
    p->s.size += bp->s.size;
    3cfa:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    3cfd:	a3 20 5f 00 00       	mov    %eax,0x5f20
    p->s.size += bp->s.size;
    3d02:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3d05:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3d08:	89 10                	mov    %edx,(%eax)
}
    3d0a:	5b                   	pop    %ebx
    3d0b:	5e                   	pop    %esi
    3d0c:	5f                   	pop    %edi
    3d0d:	5d                   	pop    %ebp
    3d0e:	c3                   	ret    
    3d0f:	90                   	nop

00003d10 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3d10:	55                   	push   %ebp
    3d11:	89 e5                	mov    %esp,%ebp
    3d13:	57                   	push   %edi
    3d14:	56                   	push   %esi
    3d15:	53                   	push   %ebx
    3d16:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3d19:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3d1c:	8b 15 20 5f 00 00    	mov    0x5f20,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3d22:	8d 78 07             	lea    0x7(%eax),%edi
    3d25:	c1 ef 03             	shr    $0x3,%edi
    3d28:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    3d2b:	85 d2                	test   %edx,%edx
    3d2d:	0f 84 93 00 00 00    	je     3dc6 <malloc+0xb6>
    3d33:	8b 02                	mov    (%edx),%eax
    3d35:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3d38:	39 cf                	cmp    %ecx,%edi
    3d3a:	76 64                	jbe    3da0 <malloc+0x90>
    3d3c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    3d42:	bb 00 10 00 00       	mov    $0x1000,%ebx
    3d47:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    3d4a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    3d51:	eb 0e                	jmp    3d61 <malloc+0x51>
    3d53:	90                   	nop
    3d54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3d58:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3d5a:	8b 48 04             	mov    0x4(%eax),%ecx
    3d5d:	39 cf                	cmp    %ecx,%edi
    3d5f:	76 3f                	jbe    3da0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3d61:	39 05 20 5f 00 00    	cmp    %eax,0x5f20
    3d67:	89 c2                	mov    %eax,%edx
    3d69:	75 ed                	jne    3d58 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    3d6b:	83 ec 0c             	sub    $0xc,%esp
    3d6e:	56                   	push   %esi
    3d6f:	e8 86 fc ff ff       	call   39fa <sbrk>
  if(p == (char*)-1)
    3d74:	83 c4 10             	add    $0x10,%esp
    3d77:	83 f8 ff             	cmp    $0xffffffff,%eax
    3d7a:	74 1c                	je     3d98 <malloc+0x88>
  hp->s.size = nu;
    3d7c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    3d7f:	83 ec 0c             	sub    $0xc,%esp
    3d82:	83 c0 08             	add    $0x8,%eax
    3d85:	50                   	push   %eax
    3d86:	e8 f5 fe ff ff       	call   3c80 <free>
  return freep;
    3d8b:	8b 15 20 5f 00 00    	mov    0x5f20,%edx
      if((p = morecore(nunits)) == 0)
    3d91:	83 c4 10             	add    $0x10,%esp
    3d94:	85 d2                	test   %edx,%edx
    3d96:	75 c0                	jne    3d58 <malloc+0x48>
        return 0;
    3d98:	31 c0                	xor    %eax,%eax
    3d9a:	eb 1c                	jmp    3db8 <malloc+0xa8>
    3d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    3da0:	39 cf                	cmp    %ecx,%edi
    3da2:	74 1c                	je     3dc0 <malloc+0xb0>
        p->s.size -= nunits;
    3da4:	29 f9                	sub    %edi,%ecx
    3da6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3da9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3dac:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    3daf:	89 15 20 5f 00 00    	mov    %edx,0x5f20
      return (void*)(p + 1);
    3db5:	83 c0 08             	add    $0x8,%eax
  }
}
    3db8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3dbb:	5b                   	pop    %ebx
    3dbc:	5e                   	pop    %esi
    3dbd:	5f                   	pop    %edi
    3dbe:	5d                   	pop    %ebp
    3dbf:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    3dc0:	8b 08                	mov    (%eax),%ecx
    3dc2:	89 0a                	mov    %ecx,(%edx)
    3dc4:	eb e9                	jmp    3daf <malloc+0x9f>
    base.s.ptr = freep = prevp = &base;
    3dc6:	c7 05 20 5f 00 00 24 	movl   $0x5f24,0x5f20
    3dcd:	5f 00 00 
    3dd0:	c7 05 24 5f 00 00 24 	movl   $0x5f24,0x5f24
    3dd7:	5f 00 00 
    base.s.size = 0;
    3dda:	b8 24 5f 00 00       	mov    $0x5f24,%eax
    3ddf:	c7 05 28 5f 00 00 00 	movl   $0x0,0x5f28
    3de6:	00 00 00 
    3de9:	e9 4e ff ff ff       	jmp    3d3c <malloc+0x2c>
