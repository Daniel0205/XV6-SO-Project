
_sh:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	90                   	nop
      14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f c9 00 00 00    	jg     ea <main+0xea>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 01 12 00 00       	push   $0x1201
      2b:	e8 f2 0c 00 00       	call   d22 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 25                	jmp    5e <main+0x5e>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d 22 18 00 00 20 	cmpb   $0x20,0x1822
      47:	74 60                	je     a9 <main+0xa9>
      49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      50:	e8 1b 01 00 00       	call   170 <fork1>
      55:	85 c0                	test   %eax,%eax
      57:	74 36                	je     8f <main+0x8f>
      runcmd(parsecmd(buf));
    wait();
      59:	e8 8c 0c 00 00       	call   cea <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
      5e:	83 ec 08             	sub    $0x8,%esp
      61:	6a 64                	push   $0x64
      63:	68 20 18 00 00       	push   $0x1820
      68:	e8 93 00 00 00       	call   100 <getcmd>
      6d:	83 c4 10             	add    $0x10,%esp
      70:	85 c0                	test   %eax,%eax
      72:	78 30                	js     a4 <main+0xa4>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      74:	80 3d 20 18 00 00 63 	cmpb   $0x63,0x1820
      7b:	75 d3                	jne    50 <main+0x50>
      7d:	80 3d 21 18 00 00 64 	cmpb   $0x64,0x1821
      84:	74 ba                	je     40 <main+0x40>
    if(fork1() == 0)
      86:	e8 e5 00 00 00       	call   170 <fork1>
      8b:	85 c0                	test   %eax,%eax
      8d:	75 ca                	jne    59 <main+0x59>
      runcmd(parsecmd(buf));
      8f:	83 ec 0c             	sub    $0xc,%esp
      92:	68 20 18 00 00       	push   $0x1820
      97:	e8 94 09 00 00       	call   a30 <parsecmd>
      9c:	89 04 24             	mov    %eax,(%esp)
      9f:	e8 fc 00 00 00       	call   1a0 <runcmd>
  }
  exit();
      a4:	e8 39 0c 00 00       	call   ce2 <exit>
      buf[strlen(buf)-1] = 0;  // chop \n
      a9:	83 ec 0c             	sub    $0xc,%esp
      ac:	68 20 18 00 00       	push   $0x1820
      b1:	e8 6a 0a 00 00       	call   b20 <strlen>
      if(chdir(buf+3) < 0)
      b6:	c7 04 24 23 18 00 00 	movl   $0x1823,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      bd:	c6 80 1f 18 00 00 00 	movb   $0x0,0x181f(%eax)
      if(chdir(buf+3) < 0)
      c4:	e8 89 0c 00 00       	call   d52 <chdir>
      c9:	83 c4 10             	add    $0x10,%esp
      cc:	85 c0                	test   %eax,%eax
      ce:	79 8e                	jns    5e <main+0x5e>
        printf(2, "cannot cd %s\n", buf+3);
      d0:	50                   	push   %eax
      d1:	68 23 18 00 00       	push   $0x1823
      d6:	68 09 12 00 00       	push   $0x1209
      db:	6a 02                	push   $0x2
      dd:	e8 5e 0d 00 00       	call   e40 <printf>
      e2:	83 c4 10             	add    $0x10,%esp
      e5:	e9 74 ff ff ff       	jmp    5e <main+0x5e>
      close(fd);
      ea:	83 ec 0c             	sub    $0xc,%esp
      ed:	50                   	push   %eax
      ee:	e8 17 0c 00 00       	call   d0a <close>
      break;
      f3:	83 c4 10             	add    $0x10,%esp
      f6:	e9 63 ff ff ff       	jmp    5e <main+0x5e>
      fb:	66 90                	xchg   %ax,%ax
      fd:	66 90                	xchg   %ax,%ax
      ff:	90                   	nop

00000100 <getcmd>:
{
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	56                   	push   %esi
     104:	53                   	push   %ebx
     105:	8b 75 0c             	mov    0xc(%ebp),%esi
     108:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     10b:	83 ec 08             	sub    $0x8,%esp
     10e:	68 60 11 00 00       	push   $0x1160
     113:	6a 02                	push   $0x2
     115:	e8 26 0d 00 00       	call   e40 <printf>
  memset(buf, 0, nbuf);
     11a:	83 c4 0c             	add    $0xc,%esp
     11d:	56                   	push   %esi
     11e:	6a 00                	push   $0x0
     120:	53                   	push   %ebx
     121:	e8 2a 0a 00 00       	call   b50 <memset>
  gets(buf, nbuf);
     126:	58                   	pop    %eax
     127:	5a                   	pop    %edx
     128:	56                   	push   %esi
     129:	53                   	push   %ebx
     12a:	e8 81 0a 00 00       	call   bb0 <gets>
  if(buf[0] == 0) // EOF
     12f:	83 c4 10             	add    $0x10,%esp
     132:	31 c0                	xor    %eax,%eax
     134:	80 3b 00             	cmpb   $0x0,(%ebx)
     137:	0f 94 c0             	sete   %al
}
     13a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  if(buf[0] == 0) // EOF
     13d:	f7 d8                	neg    %eax
}
     13f:	5b                   	pop    %ebx
     140:	5e                   	pop    %esi
     141:	5d                   	pop    %ebp
     142:	c3                   	ret    
     143:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <panic>:
}

void
panic(char *s)
{
     150:	55                   	push   %ebp
     151:	89 e5                	mov    %esp,%ebp
     153:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     156:	ff 75 08             	pushl  0x8(%ebp)
     159:	68 fd 11 00 00       	push   $0x11fd
     15e:	6a 02                	push   $0x2
     160:	e8 db 0c 00 00       	call   e40 <printf>
  exit();
     165:	e8 78 0b 00 00       	call   ce2 <exit>
     16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000170 <fork1>:
}

int
fork1(void)
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 14             	sub    $0x14,%esp
  int pid;

  pid = fork(0);
     176:	6a 00                	push   $0x0
     178:	e8 5d 0b 00 00       	call   cda <fork>
  if(pid == -1)
     17d:	83 c4 10             	add    $0x10,%esp
     180:	83 f8 ff             	cmp    $0xffffffff,%eax
     183:	74 02                	je     187 <fork1+0x17>
    panic("fork");
  return pid;
}
     185:	c9                   	leave  
     186:	c3                   	ret    
    panic("fork");
     187:	83 ec 0c             	sub    $0xc,%esp
     18a:	68 63 11 00 00       	push   $0x1163
     18f:	e8 bc ff ff ff       	call   150 <panic>
     194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     19a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001a0 <runcmd>:
{
     1a0:	55                   	push   %ebp
     1a1:	89 e5                	mov    %esp,%ebp
     1a3:	53                   	push   %ebx
     1a4:	83 ec 14             	sub    $0x14,%esp
     1a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1aa:	85 db                	test   %ebx,%ebx
     1ac:	74 64                	je     212 <runcmd+0x72>
  switch(cmd->type){
     1ae:	83 3b 05             	cmpl   $0x5,(%ebx)
     1b1:	0f 87 d8 00 00 00    	ja     28f <runcmd+0xef>
     1b7:	8b 03                	mov    (%ebx),%eax
     1b9:	ff 24 85 18 12 00 00 	jmp    *0x1218(,%eax,4)
    if(pipe(p) < 0)
     1c0:	8d 45 f0             	lea    -0x10(%ebp),%eax
     1c3:	83 ec 0c             	sub    $0xc,%esp
     1c6:	50                   	push   %eax
     1c7:	e8 26 0b 00 00       	call   cf2 <pipe>
     1cc:	83 c4 10             	add    $0x10,%esp
     1cf:	85 c0                	test   %eax,%eax
     1d1:	0f 88 c5 00 00 00    	js     29c <runcmd+0xfc>
    if(fork1() == 0){
     1d7:	e8 94 ff ff ff       	call   170 <fork1>
     1dc:	85 c0                	test   %eax,%eax
     1de:	0f 84 08 01 00 00    	je     2ec <runcmd+0x14c>
    if(fork1() == 0){
     1e4:	e8 87 ff ff ff       	call   170 <fork1>
     1e9:	85 c0                	test   %eax,%eax
     1eb:	0f 84 cd 00 00 00    	je     2be <runcmd+0x11e>
    close(p[0]);
     1f1:	83 ec 0c             	sub    $0xc,%esp
     1f4:	ff 75 f0             	pushl  -0x10(%ebp)
     1f7:	e8 0e 0b 00 00       	call   d0a <close>
    close(p[1]);
     1fc:	58                   	pop    %eax
     1fd:	ff 75 f4             	pushl  -0xc(%ebp)
     200:	e8 05 0b 00 00       	call   d0a <close>
    wait();
     205:	e8 e0 0a 00 00       	call   cea <wait>
    wait();
     20a:	e8 db 0a 00 00       	call   cea <wait>
    break;
     20f:	83 c4 10             	add    $0x10,%esp
    exit();
     212:	e8 cb 0a 00 00       	call   ce2 <exit>
    if(fork1() == 0)
     217:	e8 54 ff ff ff       	call   170 <fork1>
     21c:	85 c0                	test   %eax,%eax
     21e:	75 f2                	jne    212 <runcmd+0x72>
     220:	eb 62                	jmp    284 <runcmd+0xe4>
    if(ecmd->argv[0] == 0)
     222:	8b 43 04             	mov    0x4(%ebx),%eax
     225:	85 c0                	test   %eax,%eax
     227:	74 e9                	je     212 <runcmd+0x72>
    exec(ecmd->argv[0], ecmd->argv);
     229:	52                   	push   %edx
     22a:	52                   	push   %edx
     22b:	8d 53 04             	lea    0x4(%ebx),%edx
     22e:	52                   	push   %edx
     22f:	50                   	push   %eax
     230:	e8 e5 0a 00 00       	call   d1a <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     235:	83 c4 0c             	add    $0xc,%esp
     238:	ff 73 04             	pushl  0x4(%ebx)
     23b:	68 6f 11 00 00       	push   $0x116f
     240:	6a 02                	push   $0x2
     242:	e8 f9 0b 00 00       	call   e40 <printf>
    break;
     247:	83 c4 10             	add    $0x10,%esp
     24a:	eb c6                	jmp    212 <runcmd+0x72>
    if(fork1() == 0)
     24c:	e8 1f ff ff ff       	call   170 <fork1>
     251:	85 c0                	test   %eax,%eax
     253:	74 2f                	je     284 <runcmd+0xe4>
    wait();
     255:	e8 90 0a 00 00       	call   cea <wait>
    runcmd(lcmd->right);
     25a:	83 ec 0c             	sub    $0xc,%esp
     25d:	ff 73 08             	pushl  0x8(%ebx)
     260:	e8 3b ff ff ff       	call   1a0 <runcmd>
    close(rcmd->fd);
     265:	83 ec 0c             	sub    $0xc,%esp
     268:	ff 73 14             	pushl  0x14(%ebx)
     26b:	e8 9a 0a 00 00       	call   d0a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     270:	59                   	pop    %ecx
     271:	58                   	pop    %eax
     272:	ff 73 10             	pushl  0x10(%ebx)
     275:	ff 73 08             	pushl  0x8(%ebx)
     278:	e8 a5 0a 00 00       	call   d22 <open>
     27d:	83 c4 10             	add    $0x10,%esp
     280:	85 c0                	test   %eax,%eax
     282:	78 25                	js     2a9 <runcmd+0x109>
      runcmd(bcmd->cmd);
     284:	83 ec 0c             	sub    $0xc,%esp
     287:	ff 73 04             	pushl  0x4(%ebx)
     28a:	e8 11 ff ff ff       	call   1a0 <runcmd>
    panic("runcmd");
     28f:	83 ec 0c             	sub    $0xc,%esp
     292:	68 68 11 00 00       	push   $0x1168
     297:	e8 b4 fe ff ff       	call   150 <panic>
      panic("pipe");
     29c:	83 ec 0c             	sub    $0xc,%esp
     29f:	68 8f 11 00 00       	push   $0x118f
     2a4:	e8 a7 fe ff ff       	call   150 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     2a9:	52                   	push   %edx
     2aa:	ff 73 08             	pushl  0x8(%ebx)
     2ad:	68 7f 11 00 00       	push   $0x117f
     2b2:	6a 02                	push   $0x2
     2b4:	e8 87 0b 00 00       	call   e40 <printf>
      exit();
     2b9:	e8 24 0a 00 00       	call   ce2 <exit>
      close(0);
     2be:	83 ec 0c             	sub    $0xc,%esp
     2c1:	6a 00                	push   $0x0
     2c3:	e8 42 0a 00 00       	call   d0a <close>
      dup(p[0]);
     2c8:	5a                   	pop    %edx
     2c9:	ff 75 f0             	pushl  -0x10(%ebp)
     2cc:	e8 89 0a 00 00       	call   d5a <dup>
      close(p[0]);
     2d1:	59                   	pop    %ecx
     2d2:	ff 75 f0             	pushl  -0x10(%ebp)
     2d5:	e8 30 0a 00 00       	call   d0a <close>
      close(p[1]);
     2da:	58                   	pop    %eax
     2db:	ff 75 f4             	pushl  -0xc(%ebp)
     2de:	e8 27 0a 00 00       	call   d0a <close>
      runcmd(pcmd->right);
     2e3:	58                   	pop    %eax
     2e4:	ff 73 08             	pushl  0x8(%ebx)
     2e7:	e8 b4 fe ff ff       	call   1a0 <runcmd>
      close(1);
     2ec:	83 ec 0c             	sub    $0xc,%esp
     2ef:	6a 01                	push   $0x1
     2f1:	e8 14 0a 00 00       	call   d0a <close>
      dup(p[1]);
     2f6:	58                   	pop    %eax
     2f7:	ff 75 f4             	pushl  -0xc(%ebp)
     2fa:	e8 5b 0a 00 00       	call   d5a <dup>
      close(p[0]);
     2ff:	58                   	pop    %eax
     300:	ff 75 f0             	pushl  -0x10(%ebp)
     303:	e8 02 0a 00 00       	call   d0a <close>
      close(p[1]);
     308:	58                   	pop    %eax
     309:	ff 75 f4             	pushl  -0xc(%ebp)
     30c:	e8 f9 09 00 00       	call   d0a <close>
      runcmd(pcmd->left);
     311:	58                   	pop    %eax
     312:	ff 73 04             	pushl  0x4(%ebx)
     315:	e8 86 fe ff ff       	call   1a0 <runcmd>
     31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000320 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     320:	55                   	push   %ebp
     321:	89 e5                	mov    %esp,%ebp
     323:	53                   	push   %ebx
     324:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     327:	6a 54                	push   $0x54
     329:	e8 52 0d 00 00       	call   1080 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     32e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     331:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     333:	6a 54                	push   $0x54
     335:	6a 00                	push   $0x0
     337:	50                   	push   %eax
     338:	e8 13 08 00 00       	call   b50 <memset>
  cmd->type = EXEC;
     33d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     343:	89 d8                	mov    %ebx,%eax
     345:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     348:	c9                   	leave  
     349:	c3                   	ret    
     34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000350 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	53                   	push   %ebx
     354:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     357:	6a 18                	push   $0x18
     359:	e8 22 0d 00 00       	call   1080 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     35e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     361:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     363:	6a 18                	push   $0x18
     365:	6a 00                	push   $0x0
     367:	50                   	push   %eax
     368:	e8 e3 07 00 00       	call   b50 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     36d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     370:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     376:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     379:	8b 45 0c             	mov    0xc(%ebp),%eax
     37c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     37f:	8b 45 10             	mov    0x10(%ebp),%eax
     382:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     385:	8b 45 14             	mov    0x14(%ebp),%eax
     388:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     38b:	8b 45 18             	mov    0x18(%ebp),%eax
     38e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     391:	89 d8                	mov    %ebx,%eax
     393:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     396:	c9                   	leave  
     397:	c3                   	ret    
     398:	90                   	nop
     399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003a0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	53                   	push   %ebx
     3a4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3a7:	6a 0c                	push   $0xc
     3a9:	e8 d2 0c 00 00       	call   1080 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ae:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     3b1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3b3:	6a 0c                	push   $0xc
     3b5:	6a 00                	push   $0x0
     3b7:	50                   	push   %eax
     3b8:	e8 93 07 00 00       	call   b50 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3bd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     3c0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3c6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3c9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3cc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3cf:	89 d8                	mov    %ebx,%eax
     3d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3d4:	c9                   	leave  
     3d5:	c3                   	ret    
     3d6:	8d 76 00             	lea    0x0(%esi),%esi
     3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003e0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3e0:	55                   	push   %ebp
     3e1:	89 e5                	mov    %esp,%ebp
     3e3:	53                   	push   %ebx
     3e4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e7:	6a 0c                	push   $0xc
     3e9:	e8 92 0c 00 00       	call   1080 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ee:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     3f1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3f3:	6a 0c                	push   $0xc
     3f5:	6a 00                	push   $0x0
     3f7:	50                   	push   %eax
     3f8:	e8 53 07 00 00       	call   b50 <memset>
  cmd->type = LIST;
  cmd->left = left;
     3fd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     400:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     406:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     409:	8b 45 0c             	mov    0xc(%ebp),%eax
     40c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     40f:	89 d8                	mov    %ebx,%eax
     411:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     414:	c9                   	leave  
     415:	c3                   	ret    
     416:	8d 76 00             	lea    0x0(%esi),%esi
     419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     420:	55                   	push   %ebp
     421:	89 e5                	mov    %esp,%ebp
     423:	53                   	push   %ebx
     424:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     427:	6a 08                	push   $0x8
     429:	e8 52 0c 00 00       	call   1080 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     42e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     431:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     433:	6a 08                	push   $0x8
     435:	6a 00                	push   $0x0
     437:	50                   	push   %eax
     438:	e8 13 07 00 00       	call   b50 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     43d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     440:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     446:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     449:	89 d8                	mov    %ebx,%eax
     44b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     44e:	c9                   	leave  
     44f:	c3                   	ret    

00000450 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	57                   	push   %edi
     454:	56                   	push   %esi
     455:	53                   	push   %ebx
     456:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     459:	8b 45 08             	mov    0x8(%ebp),%eax
{
     45c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     45f:	8b 7d 10             	mov    0x10(%ebp),%edi
  s = *ps;
     462:	8b 30                	mov    (%eax),%esi
  while(s < es && strchr(whitespace, *s))
     464:	39 de                	cmp    %ebx,%esi
     466:	72 0f                	jb     477 <gettoken+0x27>
     468:	eb 25                	jmp    48f <gettoken+0x3f>
     46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     470:	83 c6 01             	add    $0x1,%esi
  while(s < es && strchr(whitespace, *s))
     473:	39 f3                	cmp    %esi,%ebx
     475:	74 18                	je     48f <gettoken+0x3f>
     477:	0f be 06             	movsbl (%esi),%eax
     47a:	83 ec 08             	sub    $0x8,%esp
     47d:	50                   	push   %eax
     47e:	68 08 18 00 00       	push   $0x1808
     483:	e8 e8 06 00 00       	call   b70 <strchr>
     488:	83 c4 10             	add    $0x10,%esp
     48b:	85 c0                	test   %eax,%eax
     48d:	75 e1                	jne    470 <gettoken+0x20>
  if(q)
     48f:	85 ff                	test   %edi,%edi
     491:	74 02                	je     495 <gettoken+0x45>
    *q = s;
     493:	89 37                	mov    %esi,(%edi)
  ret = *s;
     495:	0f be 06             	movsbl (%esi),%eax
  switch(*s){
     498:	3c 29                	cmp    $0x29,%al
     49a:	7f 54                	jg     4f0 <gettoken+0xa0>
     49c:	3c 28                	cmp    $0x28,%al
     49e:	0f 8d c8 00 00 00    	jge    56c <gettoken+0x11c>
     4a4:	31 ff                	xor    %edi,%edi
     4a6:	84 c0                	test   %al,%al
     4a8:	0f 85 e2 00 00 00    	jne    590 <gettoken+0x140>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4ae:	8b 55 14             	mov    0x14(%ebp),%edx
     4b1:	85 d2                	test   %edx,%edx
     4b3:	74 05                	je     4ba <gettoken+0x6a>
    *eq = s;
     4b5:	8b 45 14             	mov    0x14(%ebp),%eax
     4b8:	89 30                	mov    %esi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4ba:	39 f3                	cmp    %esi,%ebx
     4bc:	77 09                	ja     4c7 <gettoken+0x77>
     4be:	eb 1f                	jmp    4df <gettoken+0x8f>
    s++;
     4c0:	83 c6 01             	add    $0x1,%esi
  while(s < es && strchr(whitespace, *s))
     4c3:	39 f3                	cmp    %esi,%ebx
     4c5:	74 18                	je     4df <gettoken+0x8f>
     4c7:	0f be 06             	movsbl (%esi),%eax
     4ca:	83 ec 08             	sub    $0x8,%esp
     4cd:	50                   	push   %eax
     4ce:	68 08 18 00 00       	push   $0x1808
     4d3:	e8 98 06 00 00       	call   b70 <strchr>
     4d8:	83 c4 10             	add    $0x10,%esp
     4db:	85 c0                	test   %eax,%eax
     4dd:	75 e1                	jne    4c0 <gettoken+0x70>
  *ps = s;
     4df:	8b 45 08             	mov    0x8(%ebp),%eax
     4e2:	89 30                	mov    %esi,(%eax)
  return ret;
}
     4e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4e7:	89 f8                	mov    %edi,%eax
     4e9:	5b                   	pop    %ebx
     4ea:	5e                   	pop    %esi
     4eb:	5f                   	pop    %edi
     4ec:	5d                   	pop    %ebp
     4ed:	c3                   	ret    
     4ee:	66 90                	xchg   %ax,%ax
  switch(*s){
     4f0:	3c 3e                	cmp    $0x3e,%al
     4f2:	75 1c                	jne    510 <gettoken+0xc0>
    if(*s == '>'){
     4f4:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
     4f8:	0f 84 82 00 00 00    	je     580 <gettoken+0x130>
    s++;
     4fe:	83 c6 01             	add    $0x1,%esi
     501:	bf 3e 00 00 00       	mov    $0x3e,%edi
     506:	eb a6                	jmp    4ae <gettoken+0x5e>
     508:	90                   	nop
     509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     510:	7f 56                	jg     568 <gettoken+0x118>
     512:	8d 48 c5             	lea    -0x3b(%eax),%ecx
     515:	80 f9 01             	cmp    $0x1,%cl
     518:	76 52                	jbe    56c <gettoken+0x11c>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     51a:	39 f3                	cmp    %esi,%ebx
     51c:	77 24                	ja     542 <gettoken+0xf2>
     51e:	eb 7a                	jmp    59a <gettoken+0x14a>
     520:	0f be 06             	movsbl (%esi),%eax
     523:	83 ec 08             	sub    $0x8,%esp
     526:	50                   	push   %eax
     527:	68 00 18 00 00       	push   $0x1800
     52c:	e8 3f 06 00 00       	call   b70 <strchr>
     531:	83 c4 10             	add    $0x10,%esp
     534:	85 c0                	test   %eax,%eax
     536:	75 1f                	jne    557 <gettoken+0x107>
      s++;
     538:	83 c6 01             	add    $0x1,%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     53b:	39 f3                	cmp    %esi,%ebx
     53d:	74 5b                	je     59a <gettoken+0x14a>
     53f:	0f be 06             	movsbl (%esi),%eax
     542:	83 ec 08             	sub    $0x8,%esp
     545:	50                   	push   %eax
     546:	68 08 18 00 00       	push   $0x1808
     54b:	e8 20 06 00 00       	call   b70 <strchr>
     550:	83 c4 10             	add    $0x10,%esp
     553:	85 c0                	test   %eax,%eax
     555:	74 c9                	je     520 <gettoken+0xd0>
    ret = 'a';
     557:	bf 61 00 00 00       	mov    $0x61,%edi
     55c:	e9 4d ff ff ff       	jmp    4ae <gettoken+0x5e>
     561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     568:	3c 7c                	cmp    $0x7c,%al
     56a:	75 ae                	jne    51a <gettoken+0xca>
  ret = *s;
     56c:	0f be f8             	movsbl %al,%edi
    s++;
     56f:	83 c6 01             	add    $0x1,%esi
    break;
     572:	e9 37 ff ff ff       	jmp    4ae <gettoken+0x5e>
     577:	89 f6                	mov    %esi,%esi
     579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      s++;
     580:	83 c6 02             	add    $0x2,%esi
      ret = '+';
     583:	bf 2b 00 00 00       	mov    $0x2b,%edi
     588:	e9 21 ff ff ff       	jmp    4ae <gettoken+0x5e>
     58d:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     590:	3c 26                	cmp    $0x26,%al
     592:	0f 85 82 ff ff ff    	jne    51a <gettoken+0xca>
     598:	eb d2                	jmp    56c <gettoken+0x11c>
  if(eq)
     59a:	8b 45 14             	mov    0x14(%ebp),%eax
     59d:	bf 61 00 00 00       	mov    $0x61,%edi
     5a2:	85 c0                	test   %eax,%eax
     5a4:	0f 85 0b ff ff ff    	jne    4b5 <gettoken+0x65>
     5aa:	e9 30 ff ff ff       	jmp    4df <gettoken+0x8f>
     5af:	90                   	nop

000005b0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     5b0:	55                   	push   %ebp
     5b1:	89 e5                	mov    %esp,%ebp
     5b3:	57                   	push   %edi
     5b4:	56                   	push   %esi
     5b5:	53                   	push   %ebx
     5b6:	83 ec 0c             	sub    $0xc,%esp
     5b9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     5bf:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     5c1:	39 f3                	cmp    %esi,%ebx
     5c3:	72 12                	jb     5d7 <peek+0x27>
     5c5:	eb 28                	jmp    5ef <peek+0x3f>
     5c7:	89 f6                	mov    %esi,%esi
     5c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     5d0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     5d3:	39 de                	cmp    %ebx,%esi
     5d5:	74 18                	je     5ef <peek+0x3f>
     5d7:	0f be 03             	movsbl (%ebx),%eax
     5da:	83 ec 08             	sub    $0x8,%esp
     5dd:	50                   	push   %eax
     5de:	68 08 18 00 00       	push   $0x1808
     5e3:	e8 88 05 00 00       	call   b70 <strchr>
     5e8:	83 c4 10             	add    $0x10,%esp
     5eb:	85 c0                	test   %eax,%eax
     5ed:	75 e1                	jne    5d0 <peek+0x20>
  *ps = s;
     5ef:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     5f1:	0f be 13             	movsbl (%ebx),%edx
     5f4:	31 c0                	xor    %eax,%eax
     5f6:	84 d2                	test   %dl,%dl
     5f8:	74 17                	je     611 <peek+0x61>
     5fa:	83 ec 08             	sub    $0x8,%esp
     5fd:	52                   	push   %edx
     5fe:	ff 75 10             	pushl  0x10(%ebp)
     601:	e8 6a 05 00 00       	call   b70 <strchr>
     606:	83 c4 10             	add    $0x10,%esp
     609:	85 c0                	test   %eax,%eax
     60b:	0f 95 c0             	setne  %al
     60e:	0f b6 c0             	movzbl %al,%eax
}
     611:	8d 65 f4             	lea    -0xc(%ebp),%esp
     614:	5b                   	pop    %ebx
     615:	5e                   	pop    %esi
     616:	5f                   	pop    %edi
     617:	5d                   	pop    %ebp
     618:	c3                   	ret    
     619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000620 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     620:	55                   	push   %ebp
     621:	89 e5                	mov    %esp,%ebp
     623:	57                   	push   %edi
     624:	56                   	push   %esi
     625:	53                   	push   %ebx
     626:	83 ec 1c             	sub    $0x1c,%esp
     629:	8b 75 0c             	mov    0xc(%ebp),%esi
     62c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     62f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     630:	83 ec 04             	sub    $0x4,%esp
     633:	68 b1 11 00 00       	push   $0x11b1
     638:	53                   	push   %ebx
     639:	56                   	push   %esi
     63a:	e8 71 ff ff ff       	call   5b0 <peek>
     63f:	83 c4 10             	add    $0x10,%esp
     642:	85 c0                	test   %eax,%eax
     644:	74 6a                	je     6b0 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
     646:	6a 00                	push   $0x0
     648:	6a 00                	push   $0x0
     64a:	53                   	push   %ebx
     64b:	56                   	push   %esi
     64c:	e8 ff fd ff ff       	call   450 <gettoken>
     651:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     653:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     656:	50                   	push   %eax
     657:	8d 45 e0             	lea    -0x20(%ebp),%eax
     65a:	50                   	push   %eax
     65b:	53                   	push   %ebx
     65c:	56                   	push   %esi
     65d:	e8 ee fd ff ff       	call   450 <gettoken>
     662:	83 c4 20             	add    $0x20,%esp
     665:	83 f8 61             	cmp    $0x61,%eax
     668:	75 51                	jne    6bb <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
     66a:	83 ff 3c             	cmp    $0x3c,%edi
     66d:	74 31                	je     6a0 <parseredirs+0x80>
     66f:	83 ff 3e             	cmp    $0x3e,%edi
     672:	74 05                	je     679 <parseredirs+0x59>
     674:	83 ff 2b             	cmp    $0x2b,%edi
     677:	75 b7                	jne    630 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     679:	83 ec 0c             	sub    $0xc,%esp
     67c:	6a 01                	push   $0x1
     67e:	68 01 02 00 00       	push   $0x201
     683:	ff 75 e4             	pushl  -0x1c(%ebp)
     686:	ff 75 e0             	pushl  -0x20(%ebp)
     689:	ff 75 08             	pushl  0x8(%ebp)
     68c:	e8 bf fc ff ff       	call   350 <redircmd>
      break;
     691:	83 c4 20             	add    $0x20,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     694:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     697:	eb 97                	jmp    630 <parseredirs+0x10>
     699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6a0:	83 ec 0c             	sub    $0xc,%esp
     6a3:	6a 00                	push   $0x0
     6a5:	6a 00                	push   $0x0
     6a7:	eb da                	jmp    683 <parseredirs+0x63>
     6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  return cmd;
}
     6b0:	8b 45 08             	mov    0x8(%ebp),%eax
     6b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6b6:	5b                   	pop    %ebx
     6b7:	5e                   	pop    %esi
     6b8:	5f                   	pop    %edi
     6b9:	5d                   	pop    %ebp
     6ba:	c3                   	ret    
      panic("missing file for redirection");
     6bb:	83 ec 0c             	sub    $0xc,%esp
     6be:	68 94 11 00 00       	push   $0x1194
     6c3:	e8 88 fa ff ff       	call   150 <panic>
     6c8:	90                   	nop
     6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006d0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     6d0:	55                   	push   %ebp
     6d1:	89 e5                	mov    %esp,%ebp
     6d3:	57                   	push   %edi
     6d4:	56                   	push   %esi
     6d5:	53                   	push   %ebx
     6d6:	83 ec 30             	sub    $0x30,%esp
     6d9:	8b 75 08             	mov    0x8(%ebp),%esi
     6dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     6df:	68 b4 11 00 00       	push   $0x11b4
     6e4:	57                   	push   %edi
     6e5:	56                   	push   %esi
     6e6:	e8 c5 fe ff ff       	call   5b0 <peek>
     6eb:	83 c4 10             	add    $0x10,%esp
     6ee:	85 c0                	test   %eax,%eax
     6f0:	0f 85 92 00 00 00    	jne    788 <parseexec+0xb8>
     6f6:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     6f8:	e8 23 fc ff ff       	call   320 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     6fd:	83 ec 04             	sub    $0x4,%esp
  ret = execcmd();
     700:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = parseredirs(ret, ps, es);
     703:	57                   	push   %edi
     704:	56                   	push   %esi
     705:	50                   	push   %eax
     706:	e8 15 ff ff ff       	call   620 <parseredirs>
     70b:	83 c4 10             	add    $0x10,%esp
     70e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     711:	eb 18                	jmp    72b <parseexec+0x5b>
     713:	90                   	nop
     714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     718:	83 ec 04             	sub    $0x4,%esp
     71b:	57                   	push   %edi
     71c:	56                   	push   %esi
     71d:	ff 75 d4             	pushl  -0x2c(%ebp)
     720:	e8 fb fe ff ff       	call   620 <parseredirs>
     725:	83 c4 10             	add    $0x10,%esp
     728:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     72b:	83 ec 04             	sub    $0x4,%esp
     72e:	68 cb 11 00 00       	push   $0x11cb
     733:	57                   	push   %edi
     734:	56                   	push   %esi
     735:	e8 76 fe ff ff       	call   5b0 <peek>
     73a:	83 c4 10             	add    $0x10,%esp
     73d:	85 c0                	test   %eax,%eax
     73f:	75 67                	jne    7a8 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     741:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     744:	50                   	push   %eax
     745:	8d 45 e0             	lea    -0x20(%ebp),%eax
     748:	50                   	push   %eax
     749:	57                   	push   %edi
     74a:	56                   	push   %esi
     74b:	e8 00 fd ff ff       	call   450 <gettoken>
     750:	83 c4 10             	add    $0x10,%esp
     753:	85 c0                	test   %eax,%eax
     755:	74 51                	je     7a8 <parseexec+0xd8>
    if(tok != 'a')
     757:	83 f8 61             	cmp    $0x61,%eax
     75a:	75 6b                	jne    7c7 <parseexec+0xf7>
    cmd->argv[argc] = q;
     75c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     75f:	8b 55 d0             	mov    -0x30(%ebp),%edx
     762:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     766:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     769:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     76d:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     770:	83 fb 0a             	cmp    $0xa,%ebx
     773:	75 a3                	jne    718 <parseexec+0x48>
      panic("too many args");
     775:	83 ec 0c             	sub    $0xc,%esp
     778:	68 bd 11 00 00       	push   $0x11bd
     77d:	e8 ce f9 ff ff       	call   150 <panic>
     782:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     788:	83 ec 08             	sub    $0x8,%esp
     78b:	57                   	push   %edi
     78c:	56                   	push   %esi
     78d:	e8 5e 01 00 00       	call   8f0 <parseblock>
     792:	83 c4 10             	add    $0x10,%esp
     795:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     798:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     79b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     79e:	5b                   	pop    %ebx
     79f:	5e                   	pop    %esi
     7a0:	5f                   	pop    %edi
     7a1:	5d                   	pop    %ebp
     7a2:	c3                   	ret    
     7a3:	90                   	nop
     7a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     7a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     7ab:	8d 04 98             	lea    (%eax,%ebx,4),%eax
  cmd->argv[argc] = 0;
     7ae:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     7b5:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     7bc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     7bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7c2:	5b                   	pop    %ebx
     7c3:	5e                   	pop    %esi
     7c4:	5f                   	pop    %edi
     7c5:	5d                   	pop    %ebp
     7c6:	c3                   	ret    
      panic("syntax");
     7c7:	83 ec 0c             	sub    $0xc,%esp
     7ca:	68 b6 11 00 00       	push   $0x11b6
     7cf:	e8 7c f9 ff ff       	call   150 <panic>
     7d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     7da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000007e0 <parsepipe>:
{
     7e0:	55                   	push   %ebp
     7e1:	89 e5                	mov    %esp,%ebp
     7e3:	57                   	push   %edi
     7e4:	56                   	push   %esi
     7e5:	53                   	push   %ebx
     7e6:	83 ec 14             	sub    $0x14,%esp
     7e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     7ec:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parseexec(ps, es);
     7ef:	56                   	push   %esi
     7f0:	53                   	push   %ebx
     7f1:	e8 da fe ff ff       	call   6d0 <parseexec>
  if(peek(ps, es, "|")){
     7f6:	83 c4 0c             	add    $0xc,%esp
  cmd = parseexec(ps, es);
     7f9:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     7fb:	68 d0 11 00 00       	push   $0x11d0
     800:	56                   	push   %esi
     801:	53                   	push   %ebx
     802:	e8 a9 fd ff ff       	call   5b0 <peek>
     807:	83 c4 10             	add    $0x10,%esp
     80a:	85 c0                	test   %eax,%eax
     80c:	75 12                	jne    820 <parsepipe+0x40>
}
     80e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     811:	89 f8                	mov    %edi,%eax
     813:	5b                   	pop    %ebx
     814:	5e                   	pop    %esi
     815:	5f                   	pop    %edi
     816:	5d                   	pop    %ebp
     817:	c3                   	ret    
     818:	90                   	nop
     819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     820:	6a 00                	push   $0x0
     822:	6a 00                	push   $0x0
     824:	56                   	push   %esi
     825:	53                   	push   %ebx
     826:	e8 25 fc ff ff       	call   450 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     82b:	58                   	pop    %eax
     82c:	5a                   	pop    %edx
     82d:	56                   	push   %esi
     82e:	53                   	push   %ebx
     82f:	e8 ac ff ff ff       	call   7e0 <parsepipe>
     834:	89 7d 08             	mov    %edi,0x8(%ebp)
     837:	89 45 0c             	mov    %eax,0xc(%ebp)
     83a:	83 c4 10             	add    $0x10,%esp
}
     83d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     840:	5b                   	pop    %ebx
     841:	5e                   	pop    %esi
     842:	5f                   	pop    %edi
     843:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     844:	e9 57 fb ff ff       	jmp    3a0 <pipecmd>
     849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000850 <parseline>:
{
     850:	55                   	push   %ebp
     851:	89 e5                	mov    %esp,%ebp
     853:	57                   	push   %edi
     854:	56                   	push   %esi
     855:	53                   	push   %ebx
     856:	83 ec 14             	sub    $0x14,%esp
     859:	8b 5d 08             	mov    0x8(%ebp),%ebx
     85c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parsepipe(ps, es);
     85f:	56                   	push   %esi
     860:	53                   	push   %ebx
     861:	e8 7a ff ff ff       	call   7e0 <parsepipe>
  while(peek(ps, es, "&")){
     866:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     869:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     86b:	eb 1b                	jmp    888 <parseline+0x38>
     86d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     870:	6a 00                	push   $0x0
     872:	6a 00                	push   $0x0
     874:	56                   	push   %esi
     875:	53                   	push   %ebx
     876:	e8 d5 fb ff ff       	call   450 <gettoken>
    cmd = backcmd(cmd);
     87b:	89 3c 24             	mov    %edi,(%esp)
     87e:	e8 9d fb ff ff       	call   420 <backcmd>
     883:	83 c4 10             	add    $0x10,%esp
     886:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     888:	83 ec 04             	sub    $0x4,%esp
     88b:	68 d2 11 00 00       	push   $0x11d2
     890:	56                   	push   %esi
     891:	53                   	push   %ebx
     892:	e8 19 fd ff ff       	call   5b0 <peek>
     897:	83 c4 10             	add    $0x10,%esp
     89a:	85 c0                	test   %eax,%eax
     89c:	75 d2                	jne    870 <parseline+0x20>
  if(peek(ps, es, ";")){
     89e:	83 ec 04             	sub    $0x4,%esp
     8a1:	68 ce 11 00 00       	push   $0x11ce
     8a6:	56                   	push   %esi
     8a7:	53                   	push   %ebx
     8a8:	e8 03 fd ff ff       	call   5b0 <peek>
     8ad:	83 c4 10             	add    $0x10,%esp
     8b0:	85 c0                	test   %eax,%eax
     8b2:	75 0c                	jne    8c0 <parseline+0x70>
}
     8b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8b7:	89 f8                	mov    %edi,%eax
     8b9:	5b                   	pop    %ebx
     8ba:	5e                   	pop    %esi
     8bb:	5f                   	pop    %edi
     8bc:	5d                   	pop    %ebp
     8bd:	c3                   	ret    
     8be:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     8c0:	6a 00                	push   $0x0
     8c2:	6a 00                	push   $0x0
     8c4:	56                   	push   %esi
     8c5:	53                   	push   %ebx
     8c6:	e8 85 fb ff ff       	call   450 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     8cb:	58                   	pop    %eax
     8cc:	5a                   	pop    %edx
     8cd:	56                   	push   %esi
     8ce:	53                   	push   %ebx
     8cf:	e8 7c ff ff ff       	call   850 <parseline>
     8d4:	89 7d 08             	mov    %edi,0x8(%ebp)
     8d7:	89 45 0c             	mov    %eax,0xc(%ebp)
     8da:	83 c4 10             	add    $0x10,%esp
}
     8dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8e0:	5b                   	pop    %ebx
     8e1:	5e                   	pop    %esi
     8e2:	5f                   	pop    %edi
     8e3:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
     8e4:	e9 f7 fa ff ff       	jmp    3e0 <listcmd>
     8e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008f0 <parseblock>:
{
     8f0:	55                   	push   %ebp
     8f1:	89 e5                	mov    %esp,%ebp
     8f3:	57                   	push   %edi
     8f4:	56                   	push   %esi
     8f5:	53                   	push   %ebx
     8f6:	83 ec 10             	sub    $0x10,%esp
     8f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     8fc:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     8ff:	68 b4 11 00 00       	push   $0x11b4
     904:	56                   	push   %esi
     905:	53                   	push   %ebx
     906:	e8 a5 fc ff ff       	call   5b0 <peek>
     90b:	83 c4 10             	add    $0x10,%esp
     90e:	85 c0                	test   %eax,%eax
     910:	74 4a                	je     95c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     912:	6a 00                	push   $0x0
     914:	6a 00                	push   $0x0
     916:	56                   	push   %esi
     917:	53                   	push   %ebx
     918:	e8 33 fb ff ff       	call   450 <gettoken>
  cmd = parseline(ps, es);
     91d:	58                   	pop    %eax
     91e:	5a                   	pop    %edx
     91f:	56                   	push   %esi
     920:	53                   	push   %ebx
     921:	e8 2a ff ff ff       	call   850 <parseline>
  if(!peek(ps, es, ")"))
     926:	83 c4 0c             	add    $0xc,%esp
  cmd = parseline(ps, es);
     929:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     92b:	68 f0 11 00 00       	push   $0x11f0
     930:	56                   	push   %esi
     931:	53                   	push   %ebx
     932:	e8 79 fc ff ff       	call   5b0 <peek>
     937:	83 c4 10             	add    $0x10,%esp
     93a:	85 c0                	test   %eax,%eax
     93c:	74 2b                	je     969 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     93e:	6a 00                	push   $0x0
     940:	6a 00                	push   $0x0
     942:	56                   	push   %esi
     943:	53                   	push   %ebx
     944:	e8 07 fb ff ff       	call   450 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     949:	83 c4 0c             	add    $0xc,%esp
     94c:	56                   	push   %esi
     94d:	53                   	push   %ebx
     94e:	57                   	push   %edi
     94f:	e8 cc fc ff ff       	call   620 <parseredirs>
}
     954:	8d 65 f4             	lea    -0xc(%ebp),%esp
     957:	5b                   	pop    %ebx
     958:	5e                   	pop    %esi
     959:	5f                   	pop    %edi
     95a:	5d                   	pop    %ebp
     95b:	c3                   	ret    
    panic("parseblock");
     95c:	83 ec 0c             	sub    $0xc,%esp
     95f:	68 d4 11 00 00       	push   $0x11d4
     964:	e8 e7 f7 ff ff       	call   150 <panic>
    panic("syntax - missing )");
     969:	83 ec 0c             	sub    $0xc,%esp
     96c:	68 df 11 00 00       	push   $0x11df
     971:	e8 da f7 ff ff       	call   150 <panic>
     976:	8d 76 00             	lea    0x0(%esi),%esi
     979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000980 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     980:	55                   	push   %ebp
     981:	89 e5                	mov    %esp,%ebp
     983:	53                   	push   %ebx
     984:	83 ec 04             	sub    $0x4,%esp
     987:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     98a:	85 db                	test   %ebx,%ebx
     98c:	74 20                	je     9ae <nulterminate+0x2e>
    return 0;

  switch(cmd->type){
     98e:	83 3b 05             	cmpl   $0x5,(%ebx)
     991:	77 1b                	ja     9ae <nulterminate+0x2e>
     993:	8b 03                	mov    (%ebx),%eax
     995:	ff 24 85 30 12 00 00 	jmp    *0x1230(,%eax,4)
     99c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     9a0:	83 ec 0c             	sub    $0xc,%esp
     9a3:	ff 73 04             	pushl  0x4(%ebx)
     9a6:	e8 d5 ff ff ff       	call   980 <nulterminate>
    break;
     9ab:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     9ae:	89 d8                	mov    %ebx,%eax
     9b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9b3:	c9                   	leave  
     9b4:	c3                   	ret    
     9b5:	8d 76 00             	lea    0x0(%esi),%esi
    nulterminate(lcmd->left);
     9b8:	83 ec 0c             	sub    $0xc,%esp
     9bb:	ff 73 04             	pushl  0x4(%ebx)
     9be:	e8 bd ff ff ff       	call   980 <nulterminate>
    nulterminate(lcmd->right);
     9c3:	58                   	pop    %eax
     9c4:	ff 73 08             	pushl  0x8(%ebx)
     9c7:	e8 b4 ff ff ff       	call   980 <nulterminate>
}
     9cc:	89 d8                	mov    %ebx,%eax
    break;
     9ce:	83 c4 10             	add    $0x10,%esp
}
     9d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9d4:	c9                   	leave  
     9d5:	c3                   	ret    
     9d6:	8d 76 00             	lea    0x0(%esi),%esi
     9d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    for(i=0; ecmd->argv[i]; i++)
     9e0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     9e3:	8d 43 08             	lea    0x8(%ebx),%eax
     9e6:	85 c9                	test   %ecx,%ecx
     9e8:	74 c4                	je     9ae <nulterminate+0x2e>
     9ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     9f0:	8b 50 24             	mov    0x24(%eax),%edx
     9f3:	83 c0 04             	add    $0x4,%eax
     9f6:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     9f9:	8b 50 fc             	mov    -0x4(%eax),%edx
     9fc:	85 d2                	test   %edx,%edx
     9fe:	75 f0                	jne    9f0 <nulterminate+0x70>
}
     a00:	89 d8                	mov    %ebx,%eax
     a02:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a05:	c9                   	leave  
     a06:	c3                   	ret    
     a07:	89 f6                	mov    %esi,%esi
     a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    nulterminate(rcmd->cmd);
     a10:	83 ec 0c             	sub    $0xc,%esp
     a13:	ff 73 04             	pushl  0x4(%ebx)
     a16:	e8 65 ff ff ff       	call   980 <nulterminate>
    *rcmd->efile = 0;
     a1b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     a1e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     a21:	c6 00 00             	movb   $0x0,(%eax)
}
     a24:	89 d8                	mov    %ebx,%eax
     a26:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a29:	c9                   	leave  
     a2a:	c3                   	ret    
     a2b:	90                   	nop
     a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a30 <parsecmd>:
{
     a30:	55                   	push   %ebp
     a31:	89 e5                	mov    %esp,%ebp
     a33:	56                   	push   %esi
     a34:	53                   	push   %ebx
  es = s + strlen(s);
     a35:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a38:	83 ec 0c             	sub    $0xc,%esp
     a3b:	53                   	push   %ebx
     a3c:	e8 df 00 00 00       	call   b20 <strlen>
  cmd = parseline(&s, es);
     a41:	59                   	pop    %ecx
  es = s + strlen(s);
     a42:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     a44:	8d 45 08             	lea    0x8(%ebp),%eax
     a47:	5e                   	pop    %esi
     a48:	53                   	push   %ebx
     a49:	50                   	push   %eax
     a4a:	e8 01 fe ff ff       	call   850 <parseline>
     a4f:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     a51:	8d 45 08             	lea    0x8(%ebp),%eax
     a54:	83 c4 0c             	add    $0xc,%esp
     a57:	68 7e 11 00 00       	push   $0x117e
     a5c:	53                   	push   %ebx
     a5d:	50                   	push   %eax
     a5e:	e8 4d fb ff ff       	call   5b0 <peek>
  if(s != es){
     a63:	8b 45 08             	mov    0x8(%ebp),%eax
     a66:	83 c4 10             	add    $0x10,%esp
     a69:	39 c3                	cmp    %eax,%ebx
     a6b:	75 12                	jne    a7f <parsecmd+0x4f>
  nulterminate(cmd);
     a6d:	83 ec 0c             	sub    $0xc,%esp
     a70:	56                   	push   %esi
     a71:	e8 0a ff ff ff       	call   980 <nulterminate>
}
     a76:	8d 65 f8             	lea    -0x8(%ebp),%esp
     a79:	89 f0                	mov    %esi,%eax
     a7b:	5b                   	pop    %ebx
     a7c:	5e                   	pop    %esi
     a7d:	5d                   	pop    %ebp
     a7e:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     a7f:	52                   	push   %edx
     a80:	50                   	push   %eax
     a81:	68 f2 11 00 00       	push   $0x11f2
     a86:	6a 02                	push   $0x2
     a88:	e8 b3 03 00 00       	call   e40 <printf>
    panic("syntax");
     a8d:	c7 04 24 b6 11 00 00 	movl   $0x11b6,(%esp)
     a94:	e8 b7 f6 ff ff       	call   150 <panic>
     a99:	66 90                	xchg   %ax,%ax
     a9b:	66 90                	xchg   %ax,%ax
     a9d:	66 90                	xchg   %ax,%ax
     a9f:	90                   	nop

00000aa0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	53                   	push   %ebx
     aa4:	8b 45 08             	mov    0x8(%ebp),%eax
     aa7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     aaa:	89 c2                	mov    %eax,%edx
     aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ab0:	83 c1 01             	add    $0x1,%ecx
     ab3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     ab7:	83 c2 01             	add    $0x1,%edx
     aba:	84 db                	test   %bl,%bl
     abc:	88 5a ff             	mov    %bl,-0x1(%edx)
     abf:	75 ef                	jne    ab0 <strcpy+0x10>
    ;
  return os;
}
     ac1:	5b                   	pop    %ebx
     ac2:	5d                   	pop    %ebp
     ac3:	c3                   	ret    
     ac4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     aca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ad0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	56                   	push   %esi
     ad4:	53                   	push   %ebx
     ad5:	8b 55 08             	mov    0x8(%ebp),%edx
     ad8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     adb:	0f b6 02             	movzbl (%edx),%eax
     ade:	0f b6 19             	movzbl (%ecx),%ebx
     ae1:	84 c0                	test   %al,%al
     ae3:	75 1e                	jne    b03 <strcmp+0x33>
     ae5:	eb 29                	jmp    b10 <strcmp+0x40>
     ae7:	89 f6                	mov    %esi,%esi
     ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     af0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     af3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     af6:	8d 71 01             	lea    0x1(%ecx),%esi
  while(*p && *p == *q)
     af9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     afd:	84 c0                	test   %al,%al
     aff:	74 0f                	je     b10 <strcmp+0x40>
     b01:	89 f1                	mov    %esi,%ecx
     b03:	38 d8                	cmp    %bl,%al
     b05:	74 e9                	je     af0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
     b07:	29 d8                	sub    %ebx,%eax
}
     b09:	5b                   	pop    %ebx
     b0a:	5e                   	pop    %esi
     b0b:	5d                   	pop    %ebp
     b0c:	c3                   	ret    
     b0d:	8d 76 00             	lea    0x0(%esi),%esi
  while(*p && *p == *q)
     b10:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     b12:	29 d8                	sub    %ebx,%eax
}
     b14:	5b                   	pop    %ebx
     b15:	5e                   	pop    %esi
     b16:	5d                   	pop    %ebp
     b17:	c3                   	ret    
     b18:	90                   	nop
     b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b20 <strlen>:

uint
strlen(char *s)
{
     b20:	55                   	push   %ebp
     b21:	89 e5                	mov    %esp,%ebp
     b23:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     b26:	80 39 00             	cmpb   $0x0,(%ecx)
     b29:	74 12                	je     b3d <strlen+0x1d>
     b2b:	31 d2                	xor    %edx,%edx
     b2d:	8d 76 00             	lea    0x0(%esi),%esi
     b30:	83 c2 01             	add    $0x1,%edx
     b33:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     b37:	89 d0                	mov    %edx,%eax
     b39:	75 f5                	jne    b30 <strlen+0x10>
    ;
  return n;
}
     b3b:	5d                   	pop    %ebp
     b3c:	c3                   	ret    
  for(n = 0; s[n]; n++)
     b3d:	31 c0                	xor    %eax,%eax
}
     b3f:	5d                   	pop    %ebp
     b40:	c3                   	ret    
     b41:	eb 0d                	jmp    b50 <memset>
     b43:	90                   	nop
     b44:	90                   	nop
     b45:	90                   	nop
     b46:	90                   	nop
     b47:	90                   	nop
     b48:	90                   	nop
     b49:	90                   	nop
     b4a:	90                   	nop
     b4b:	90                   	nop
     b4c:	90                   	nop
     b4d:	90                   	nop
     b4e:	90                   	nop
     b4f:	90                   	nop

00000b50 <memset>:

void*
memset(void *dst, int c, uint n)
{
     b50:	55                   	push   %ebp
     b51:	89 e5                	mov    %esp,%ebp
     b53:	57                   	push   %edi
     b54:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     b57:	8b 4d 10             	mov    0x10(%ebp),%ecx
     b5a:	8b 45 0c             	mov    0xc(%ebp),%eax
     b5d:	89 d7                	mov    %edx,%edi
     b5f:	fc                   	cld    
     b60:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     b62:	89 d0                	mov    %edx,%eax
     b64:	5f                   	pop    %edi
     b65:	5d                   	pop    %ebp
     b66:	c3                   	ret    
     b67:	89 f6                	mov    %esi,%esi
     b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b70 <strchr>:

char*
strchr(const char *s, char c)
{
     b70:	55                   	push   %ebp
     b71:	89 e5                	mov    %esp,%ebp
     b73:	53                   	push   %ebx
     b74:	8b 45 08             	mov    0x8(%ebp),%eax
     b77:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     b7a:	0f b6 10             	movzbl (%eax),%edx
     b7d:	84 d2                	test   %dl,%dl
     b7f:	74 1d                	je     b9e <strchr+0x2e>
    if(*s == c)
     b81:	38 d3                	cmp    %dl,%bl
     b83:	89 d9                	mov    %ebx,%ecx
     b85:	75 0d                	jne    b94 <strchr+0x24>
     b87:	eb 17                	jmp    ba0 <strchr+0x30>
     b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b90:	38 ca                	cmp    %cl,%dl
     b92:	74 0c                	je     ba0 <strchr+0x30>
  for(; *s; s++)
     b94:	83 c0 01             	add    $0x1,%eax
     b97:	0f b6 10             	movzbl (%eax),%edx
     b9a:	84 d2                	test   %dl,%dl
     b9c:	75 f2                	jne    b90 <strchr+0x20>
      return (char*)s;
  return 0;
     b9e:	31 c0                	xor    %eax,%eax
}
     ba0:	5b                   	pop    %ebx
     ba1:	5d                   	pop    %ebp
     ba2:	c3                   	ret    
     ba3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bb0 <gets>:

char*
gets(char *buf, int max)
{
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	57                   	push   %edi
     bb4:	56                   	push   %esi
     bb5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     bb6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     bb8:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
     bbb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     bbe:	eb 29                	jmp    be9 <gets+0x39>
    cc = read(0, &c, 1);
     bc0:	83 ec 04             	sub    $0x4,%esp
     bc3:	6a 01                	push   $0x1
     bc5:	57                   	push   %edi
     bc6:	6a 00                	push   $0x0
     bc8:	e8 2d 01 00 00       	call   cfa <read>
    if(cc < 1)
     bcd:	83 c4 10             	add    $0x10,%esp
     bd0:	85 c0                	test   %eax,%eax
     bd2:	7e 1d                	jle    bf1 <gets+0x41>
      break;
    buf[i++] = c;
     bd4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     bd8:	8b 55 08             	mov    0x8(%ebp),%edx
     bdb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     bdd:	3c 0a                	cmp    $0xa,%al
    buf[i++] = c;
     bdf:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     be3:	74 1b                	je     c00 <gets+0x50>
     be5:	3c 0d                	cmp    $0xd,%al
     be7:	74 17                	je     c00 <gets+0x50>
  for(i=0; i+1 < max; ){
     be9:	8d 5e 01             	lea    0x1(%esi),%ebx
     bec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     bef:	7c cf                	jl     bc0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     bf1:	8b 45 08             	mov    0x8(%ebp),%eax
     bf4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     bf8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bfb:	5b                   	pop    %ebx
     bfc:	5e                   	pop    %esi
     bfd:	5f                   	pop    %edi
     bfe:	5d                   	pop    %ebp
     bff:	c3                   	ret    
  buf[i] = '\0';
     c00:	8b 45 08             	mov    0x8(%ebp),%eax
  for(i=0; i+1 < max; ){
     c03:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
     c05:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
     c09:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c0c:	5b                   	pop    %ebx
     c0d:	5e                   	pop    %esi
     c0e:	5f                   	pop    %edi
     c0f:	5d                   	pop    %ebp
     c10:	c3                   	ret    
     c11:	eb 0d                	jmp    c20 <stat>
     c13:	90                   	nop
     c14:	90                   	nop
     c15:	90                   	nop
     c16:	90                   	nop
     c17:	90                   	nop
     c18:	90                   	nop
     c19:	90                   	nop
     c1a:	90                   	nop
     c1b:	90                   	nop
     c1c:	90                   	nop
     c1d:	90                   	nop
     c1e:	90                   	nop
     c1f:	90                   	nop

00000c20 <stat>:

int
stat(char *n, struct stat *st)
{
     c20:	55                   	push   %ebp
     c21:	89 e5                	mov    %esp,%ebp
     c23:	56                   	push   %esi
     c24:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     c25:	83 ec 08             	sub    $0x8,%esp
     c28:	6a 00                	push   $0x0
     c2a:	ff 75 08             	pushl  0x8(%ebp)
     c2d:	e8 f0 00 00 00       	call   d22 <open>
  if(fd < 0)
     c32:	83 c4 10             	add    $0x10,%esp
     c35:	85 c0                	test   %eax,%eax
     c37:	78 27                	js     c60 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     c39:	83 ec 08             	sub    $0x8,%esp
     c3c:	ff 75 0c             	pushl  0xc(%ebp)
     c3f:	89 c3                	mov    %eax,%ebx
     c41:	50                   	push   %eax
     c42:	e8 f3 00 00 00       	call   d3a <fstat>
  close(fd);
     c47:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     c4a:	89 c6                	mov    %eax,%esi
  close(fd);
     c4c:	e8 b9 00 00 00       	call   d0a <close>
  return r;
     c51:	83 c4 10             	add    $0x10,%esp
}
     c54:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c57:	89 f0                	mov    %esi,%eax
     c59:	5b                   	pop    %ebx
     c5a:	5e                   	pop    %esi
     c5b:	5d                   	pop    %ebp
     c5c:	c3                   	ret    
     c5d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     c60:	be ff ff ff ff       	mov    $0xffffffff,%esi
     c65:	eb ed                	jmp    c54 <stat+0x34>
     c67:	89 f6                	mov    %esi,%esi
     c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c70 <atoi>:

int
atoi(const char *s)
{
     c70:	55                   	push   %ebp
     c71:	89 e5                	mov    %esp,%ebp
     c73:	53                   	push   %ebx
     c74:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     c77:	0f be 11             	movsbl (%ecx),%edx
     c7a:	8d 42 d0             	lea    -0x30(%edx),%eax
     c7d:	3c 09                	cmp    $0x9,%al
     c7f:	b8 00 00 00 00       	mov    $0x0,%eax
     c84:	77 1f                	ja     ca5 <atoi+0x35>
     c86:	8d 76 00             	lea    0x0(%esi),%esi
     c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     c90:	8d 04 80             	lea    (%eax,%eax,4),%eax
     c93:	83 c1 01             	add    $0x1,%ecx
     c96:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
     c9a:	0f be 11             	movsbl (%ecx),%edx
     c9d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     ca0:	80 fb 09             	cmp    $0x9,%bl
     ca3:	76 eb                	jbe    c90 <atoi+0x20>
  return n;
}
     ca5:	5b                   	pop    %ebx
     ca6:	5d                   	pop    %ebp
     ca7:	c3                   	ret    
     ca8:	90                   	nop
     ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cb0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	56                   	push   %esi
     cb4:	53                   	push   %ebx
     cb5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     cb8:	8b 45 08             	mov    0x8(%ebp),%eax
     cbb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     cbe:	85 db                	test   %ebx,%ebx
     cc0:	7e 14                	jle    cd6 <memmove+0x26>
     cc2:	31 d2                	xor    %edx,%edx
     cc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     cc8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     ccc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     ccf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
     cd2:	39 da                	cmp    %ebx,%edx
     cd4:	75 f2                	jne    cc8 <memmove+0x18>
  return vdst;
}
     cd6:	5b                   	pop    %ebx
     cd7:	5e                   	pop    %esi
     cd8:	5d                   	pop    %ebp
     cd9:	c3                   	ret    

00000cda <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     cda:	b8 01 00 00 00       	mov    $0x1,%eax
     cdf:	cd 40                	int    $0x40
     ce1:	c3                   	ret    

00000ce2 <exit>:
SYSCALL(exit)
     ce2:	b8 02 00 00 00       	mov    $0x2,%eax
     ce7:	cd 40                	int    $0x40
     ce9:	c3                   	ret    

00000cea <wait>:
SYSCALL(wait)
     cea:	b8 03 00 00 00       	mov    $0x3,%eax
     cef:	cd 40                	int    $0x40
     cf1:	c3                   	ret    

00000cf2 <pipe>:
SYSCALL(pipe)
     cf2:	b8 04 00 00 00       	mov    $0x4,%eax
     cf7:	cd 40                	int    $0x40
     cf9:	c3                   	ret    

00000cfa <read>:
SYSCALL(read)
     cfa:	b8 05 00 00 00       	mov    $0x5,%eax
     cff:	cd 40                	int    $0x40
     d01:	c3                   	ret    

00000d02 <write>:
SYSCALL(write)
     d02:	b8 10 00 00 00       	mov    $0x10,%eax
     d07:	cd 40                	int    $0x40
     d09:	c3                   	ret    

00000d0a <close>:
SYSCALL(close)
     d0a:	b8 15 00 00 00       	mov    $0x15,%eax
     d0f:	cd 40                	int    $0x40
     d11:	c3                   	ret    

00000d12 <kill>:
SYSCALL(kill)
     d12:	b8 06 00 00 00       	mov    $0x6,%eax
     d17:	cd 40                	int    $0x40
     d19:	c3                   	ret    

00000d1a <exec>:
SYSCALL(exec)
     d1a:	b8 07 00 00 00       	mov    $0x7,%eax
     d1f:	cd 40                	int    $0x40
     d21:	c3                   	ret    

00000d22 <open>:
SYSCALL(open)
     d22:	b8 0f 00 00 00       	mov    $0xf,%eax
     d27:	cd 40                	int    $0x40
     d29:	c3                   	ret    

00000d2a <mknod>:
SYSCALL(mknod)
     d2a:	b8 11 00 00 00       	mov    $0x11,%eax
     d2f:	cd 40                	int    $0x40
     d31:	c3                   	ret    

00000d32 <unlink>:
SYSCALL(unlink)
     d32:	b8 12 00 00 00       	mov    $0x12,%eax
     d37:	cd 40                	int    $0x40
     d39:	c3                   	ret    

00000d3a <fstat>:
SYSCALL(fstat)
     d3a:	b8 08 00 00 00       	mov    $0x8,%eax
     d3f:	cd 40                	int    $0x40
     d41:	c3                   	ret    

00000d42 <link>:
SYSCALL(link)
     d42:	b8 13 00 00 00       	mov    $0x13,%eax
     d47:	cd 40                	int    $0x40
     d49:	c3                   	ret    

00000d4a <mkdir>:
SYSCALL(mkdir)
     d4a:	b8 14 00 00 00       	mov    $0x14,%eax
     d4f:	cd 40                	int    $0x40
     d51:	c3                   	ret    

00000d52 <chdir>:
SYSCALL(chdir)
     d52:	b8 09 00 00 00       	mov    $0x9,%eax
     d57:	cd 40                	int    $0x40
     d59:	c3                   	ret    

00000d5a <dup>:
SYSCALL(dup)
     d5a:	b8 0a 00 00 00       	mov    $0xa,%eax
     d5f:	cd 40                	int    $0x40
     d61:	c3                   	ret    

00000d62 <getpid>:
SYSCALL(getpid)
     d62:	b8 0b 00 00 00       	mov    $0xb,%eax
     d67:	cd 40                	int    $0x40
     d69:	c3                   	ret    

00000d6a <sbrk>:
SYSCALL(sbrk)
     d6a:	b8 0c 00 00 00       	mov    $0xc,%eax
     d6f:	cd 40                	int    $0x40
     d71:	c3                   	ret    

00000d72 <sleep>:
SYSCALL(sleep)
     d72:	b8 0d 00 00 00       	mov    $0xd,%eax
     d77:	cd 40                	int    $0x40
     d79:	c3                   	ret    

00000d7a <uptime>:
SYSCALL(uptime)
     d7a:	b8 0e 00 00 00       	mov    $0xe,%eax
     d7f:	cd 40                	int    $0x40
     d81:	c3                   	ret    

00000d82 <cps>:
SYSCALL(cps)
     d82:	b8 16 00 00 00       	mov    $0x16,%eax
     d87:	cd 40                	int    $0x40
     d89:	c3                   	ret    

00000d8a <csc>:
SYSCALL(csc)
     d8a:	b8 17 00 00 00       	mov    $0x17,%eax
     d8f:	cd 40                	int    $0x40
     d91:	c3                   	ret    

00000d92 <chpr>:
SYSCALL(chpr)
     d92:	b8 18 00 00 00       	mov    $0x18,%eax
     d97:	cd 40                	int    $0x40
     d99:	c3                   	ret    
     d9a:	66 90                	xchg   %ax,%ax
     d9c:	66 90                	xchg   %ax,%ax
     d9e:	66 90                	xchg   %ax,%ax

00000da0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     da0:	55                   	push   %ebp
     da1:	89 e5                	mov    %esp,%ebp
     da3:	57                   	push   %edi
     da4:	56                   	push   %esi
     da5:	53                   	push   %ebx
     da6:	89 c6                	mov    %eax,%esi
     da8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     dab:	8b 5d 08             	mov    0x8(%ebp),%ebx
     dae:	85 db                	test   %ebx,%ebx
     db0:	74 7e                	je     e30 <printint+0x90>
     db2:	89 d0                	mov    %edx,%eax
     db4:	c1 e8 1f             	shr    $0x1f,%eax
     db7:	84 c0                	test   %al,%al
     db9:	74 75                	je     e30 <printint+0x90>
    neg = 1;
    x = -xx;
     dbb:	89 d0                	mov    %edx,%eax
    neg = 1;
     dbd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     dc4:	f7 d8                	neg    %eax
     dc6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     dc9:	31 ff                	xor    %edi,%edi
     dcb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     dce:	89 ce                	mov    %ecx,%esi
     dd0:	eb 08                	jmp    dda <printint+0x3a>
     dd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     dd8:	89 cf                	mov    %ecx,%edi
     dda:	31 d2                	xor    %edx,%edx
     ddc:	8d 4f 01             	lea    0x1(%edi),%ecx
     ddf:	f7 f6                	div    %esi
     de1:	0f b6 92 50 12 00 00 	movzbl 0x1250(%edx),%edx
  }while((x /= base) != 0);
     de8:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
     dea:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     ded:	75 e9                	jne    dd8 <printint+0x38>
  if(neg)
     def:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     df2:	8b 75 c0             	mov    -0x40(%ebp),%esi
     df5:	85 c0                	test   %eax,%eax
     df7:	74 08                	je     e01 <printint+0x61>
    buf[i++] = '-';
     df9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     dfe:	8d 4f 02             	lea    0x2(%edi),%ecx

  while(--i >= 0)
     e01:	8d 79 ff             	lea    -0x1(%ecx),%edi
     e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e08:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
  write(fd, &c, 1);
     e0d:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
     e10:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
     e13:	6a 01                	push   $0x1
     e15:	53                   	push   %ebx
     e16:	56                   	push   %esi
     e17:	88 45 d7             	mov    %al,-0x29(%ebp)
     e1a:	e8 e3 fe ff ff       	call   d02 <write>
  while(--i >= 0)
     e1f:	83 c4 10             	add    $0x10,%esp
     e22:	83 ff ff             	cmp    $0xffffffff,%edi
     e25:	75 e1                	jne    e08 <printint+0x68>
    putc(fd, buf[i]);
}
     e27:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e2a:	5b                   	pop    %ebx
     e2b:	5e                   	pop    %esi
     e2c:	5f                   	pop    %edi
     e2d:	5d                   	pop    %ebp
     e2e:	c3                   	ret    
     e2f:	90                   	nop
    x = xx;
     e30:	89 d0                	mov    %edx,%eax
  neg = 0;
     e32:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     e39:	eb 8b                	jmp    dc6 <printint+0x26>
     e3b:	90                   	nop
     e3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e40 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	56                   	push   %esi
     e45:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e46:	8d 45 10             	lea    0x10(%ebp),%eax
{
     e49:	83 ec 2c             	sub    $0x2c,%esp
  for(i = 0; fmt[i]; i++){
     e4c:	8b 75 0c             	mov    0xc(%ebp),%esi
{
     e4f:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
     e52:	89 45 d0             	mov    %eax,-0x30(%ebp)
     e55:	0f b6 1e             	movzbl (%esi),%ebx
     e58:	83 c6 01             	add    $0x1,%esi
     e5b:	84 db                	test   %bl,%bl
     e5d:	0f 84 b0 00 00 00    	je     f13 <printf+0xd3>
     e63:	31 d2                	xor    %edx,%edx
     e65:	eb 39                	jmp    ea0 <printf+0x60>
     e67:	89 f6                	mov    %esi,%esi
     e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     e70:	83 f8 25             	cmp    $0x25,%eax
     e73:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     e76:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
     e7b:	74 18                	je     e95 <printf+0x55>
  write(fd, &c, 1);
     e7d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     e80:	83 ec 04             	sub    $0x4,%esp
     e83:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     e86:	6a 01                	push   $0x1
     e88:	50                   	push   %eax
     e89:	57                   	push   %edi
     e8a:	e8 73 fe ff ff       	call   d02 <write>
     e8f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     e92:	83 c4 10             	add    $0x10,%esp
     e95:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
     e98:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     e9c:	84 db                	test   %bl,%bl
     e9e:	74 73                	je     f13 <printf+0xd3>
    if(state == 0){
     ea0:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
     ea2:	0f be cb             	movsbl %bl,%ecx
     ea5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     ea8:	74 c6                	je     e70 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     eaa:	83 fa 25             	cmp    $0x25,%edx
     ead:	75 e6                	jne    e95 <printf+0x55>
      if(c == 'd'){
     eaf:	83 f8 64             	cmp    $0x64,%eax
     eb2:	0f 84 f8 00 00 00    	je     fb0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     eb8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     ebe:	83 f9 70             	cmp    $0x70,%ecx
     ec1:	74 5d                	je     f20 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     ec3:	83 f8 73             	cmp    $0x73,%eax
     ec6:	0f 84 84 00 00 00    	je     f50 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     ecc:	83 f8 63             	cmp    $0x63,%eax
     ecf:	0f 84 ea 00 00 00    	je     fbf <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     ed5:	83 f8 25             	cmp    $0x25,%eax
     ed8:	0f 84 c2 00 00 00    	je     fa0 <printf+0x160>
  write(fd, &c, 1);
     ede:	8d 45 e7             	lea    -0x19(%ebp),%eax
     ee1:	83 ec 04             	sub    $0x4,%esp
     ee4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     ee8:	6a 01                	push   $0x1
     eea:	50                   	push   %eax
     eeb:	57                   	push   %edi
     eec:	e8 11 fe ff ff       	call   d02 <write>
     ef1:	83 c4 0c             	add    $0xc,%esp
     ef4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     ef7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     efa:	6a 01                	push   $0x1
     efc:	50                   	push   %eax
     efd:	57                   	push   %edi
     efe:	83 c6 01             	add    $0x1,%esi
     f01:	e8 fc fd ff ff       	call   d02 <write>
  for(i = 0; fmt[i]; i++){
     f06:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
     f0a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     f0d:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
     f0f:	84 db                	test   %bl,%bl
     f11:	75 8d                	jne    ea0 <printf+0x60>
    }
  }
}
     f13:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f16:	5b                   	pop    %ebx
     f17:	5e                   	pop    %esi
     f18:	5f                   	pop    %edi
     f19:	5d                   	pop    %ebp
     f1a:	c3                   	ret    
     f1b:	90                   	nop
     f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
     f20:	83 ec 0c             	sub    $0xc,%esp
     f23:	b9 10 00 00 00       	mov    $0x10,%ecx
     f28:	6a 00                	push   $0x0
     f2a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     f2d:	89 f8                	mov    %edi,%eax
     f2f:	8b 13                	mov    (%ebx),%edx
     f31:	e8 6a fe ff ff       	call   da0 <printint>
        ap++;
     f36:	89 d8                	mov    %ebx,%eax
     f38:	83 c4 10             	add    $0x10,%esp
      state = 0;
     f3b:	31 d2                	xor    %edx,%edx
        ap++;
     f3d:	83 c0 04             	add    $0x4,%eax
     f40:	89 45 d0             	mov    %eax,-0x30(%ebp)
     f43:	e9 4d ff ff ff       	jmp    e95 <printf+0x55>
     f48:	90                   	nop
     f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
     f50:	8b 45 d0             	mov    -0x30(%ebp),%eax
     f53:	8b 18                	mov    (%eax),%ebx
        ap++;
     f55:	83 c0 04             	add    $0x4,%eax
     f58:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
     f5b:	85 db                	test   %ebx,%ebx
     f5d:	74 7c                	je     fdb <printf+0x19b>
        while(*s != 0){
     f5f:	0f b6 03             	movzbl (%ebx),%eax
     f62:	84 c0                	test   %al,%al
     f64:	74 29                	je     f8f <printf+0x14f>
     f66:	8d 76 00             	lea    0x0(%esi),%esi
     f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     f70:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
     f73:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     f76:	83 ec 04             	sub    $0x4,%esp
     f79:	6a 01                	push   $0x1
          s++;
     f7b:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
     f7e:	50                   	push   %eax
     f7f:	57                   	push   %edi
     f80:	e8 7d fd ff ff       	call   d02 <write>
        while(*s != 0){
     f85:	0f b6 03             	movzbl (%ebx),%eax
     f88:	83 c4 10             	add    $0x10,%esp
     f8b:	84 c0                	test   %al,%al
     f8d:	75 e1                	jne    f70 <printf+0x130>
      state = 0;
     f8f:	31 d2                	xor    %edx,%edx
     f91:	e9 ff fe ff ff       	jmp    e95 <printf+0x55>
     f96:	8d 76 00             	lea    0x0(%esi),%esi
     f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  write(fd, &c, 1);
     fa0:	83 ec 04             	sub    $0x4,%esp
     fa3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     fa6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     fa9:	6a 01                	push   $0x1
     fab:	e9 4c ff ff ff       	jmp    efc <printf+0xbc>
        printint(fd, *ap, 10, 1);
     fb0:	83 ec 0c             	sub    $0xc,%esp
     fb3:	b9 0a 00 00 00       	mov    $0xa,%ecx
     fb8:	6a 01                	push   $0x1
     fba:	e9 6b ff ff ff       	jmp    f2a <printf+0xea>
        putc(fd, *ap);
     fbf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
     fc2:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
     fc5:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
     fc7:	6a 01                	push   $0x1
        putc(fd, *ap);
     fc9:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
     fcc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     fcf:	50                   	push   %eax
     fd0:	57                   	push   %edi
     fd1:	e8 2c fd ff ff       	call   d02 <write>
     fd6:	e9 5b ff ff ff       	jmp    f36 <printf+0xf6>
        while(*s != 0){
     fdb:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
     fe0:	bb 48 12 00 00       	mov    $0x1248,%ebx
     fe5:	eb 89                	jmp    f70 <printf+0x130>
     fe7:	66 90                	xchg   %ax,%ax
     fe9:	66 90                	xchg   %ax,%ax
     feb:	66 90                	xchg   %ax,%ax
     fed:	66 90                	xchg   %ax,%ax
     fef:	90                   	nop

00000ff0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ff0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ff1:	a1 84 18 00 00       	mov    0x1884,%eax
{
     ff6:	89 e5                	mov    %esp,%ebp
     ff8:	57                   	push   %edi
     ff9:	56                   	push   %esi
     ffa:	53                   	push   %ebx
     ffb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     ffe:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    1000:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1003:	39 c8                	cmp    %ecx,%eax
    1005:	73 19                	jae    1020 <free+0x30>
    1007:	89 f6                	mov    %esi,%esi
    1009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1010:	39 d1                	cmp    %edx,%ecx
    1012:	72 1c                	jb     1030 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1014:	39 d0                	cmp    %edx,%eax
    1016:	73 18                	jae    1030 <free+0x40>
{
    1018:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    101a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    101c:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    101e:	72 f0                	jb     1010 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1020:	39 d0                	cmp    %edx,%eax
    1022:	72 f4                	jb     1018 <free+0x28>
    1024:	39 d1                	cmp    %edx,%ecx
    1026:	73 f0                	jae    1018 <free+0x28>
    1028:	90                   	nop
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1030:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1033:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1036:	39 fa                	cmp    %edi,%edx
    1038:	74 19                	je     1053 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    103a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    103d:	8b 50 04             	mov    0x4(%eax),%edx
    1040:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1043:	39 f1                	cmp    %esi,%ecx
    1045:	74 23                	je     106a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1047:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1049:	a3 84 18 00 00       	mov    %eax,0x1884
}
    104e:	5b                   	pop    %ebx
    104f:	5e                   	pop    %esi
    1050:	5f                   	pop    %edi
    1051:	5d                   	pop    %ebp
    1052:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    1053:	03 72 04             	add    0x4(%edx),%esi
    1056:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1059:	8b 10                	mov    (%eax),%edx
    105b:	8b 12                	mov    (%edx),%edx
    105d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1060:	8b 50 04             	mov    0x4(%eax),%edx
    1063:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1066:	39 f1                	cmp    %esi,%ecx
    1068:	75 dd                	jne    1047 <free+0x57>
    p->s.size += bp->s.size;
    106a:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    106d:	a3 84 18 00 00       	mov    %eax,0x1884
    p->s.size += bp->s.size;
    1072:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1075:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1078:	89 10                	mov    %edx,(%eax)
}
    107a:	5b                   	pop    %ebx
    107b:	5e                   	pop    %esi
    107c:	5f                   	pop    %edi
    107d:	5d                   	pop    %ebp
    107e:	c3                   	ret    
    107f:	90                   	nop

00001080 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	57                   	push   %edi
    1084:	56                   	push   %esi
    1085:	53                   	push   %ebx
    1086:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1089:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    108c:	8b 15 84 18 00 00    	mov    0x1884,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1092:	8d 78 07             	lea    0x7(%eax),%edi
    1095:	c1 ef 03             	shr    $0x3,%edi
    1098:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    109b:	85 d2                	test   %edx,%edx
    109d:	0f 84 93 00 00 00    	je     1136 <malloc+0xb6>
    10a3:	8b 02                	mov    (%edx),%eax
    10a5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    10a8:	39 cf                	cmp    %ecx,%edi
    10aa:	76 64                	jbe    1110 <malloc+0x90>
    10ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    10b2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    10b7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    10ba:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    10c1:	eb 0e                	jmp    10d1 <malloc+0x51>
    10c3:	90                   	nop
    10c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    10ca:	8b 48 04             	mov    0x4(%eax),%ecx
    10cd:	39 cf                	cmp    %ecx,%edi
    10cf:	76 3f                	jbe    1110 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    10d1:	39 05 84 18 00 00    	cmp    %eax,0x1884
    10d7:	89 c2                	mov    %eax,%edx
    10d9:	75 ed                	jne    10c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    10db:	83 ec 0c             	sub    $0xc,%esp
    10de:	56                   	push   %esi
    10df:	e8 86 fc ff ff       	call   d6a <sbrk>
  if(p == (char*)-1)
    10e4:	83 c4 10             	add    $0x10,%esp
    10e7:	83 f8 ff             	cmp    $0xffffffff,%eax
    10ea:	74 1c                	je     1108 <malloc+0x88>
  hp->s.size = nu;
    10ec:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    10ef:	83 ec 0c             	sub    $0xc,%esp
    10f2:	83 c0 08             	add    $0x8,%eax
    10f5:	50                   	push   %eax
    10f6:	e8 f5 fe ff ff       	call   ff0 <free>
  return freep;
    10fb:	8b 15 84 18 00 00    	mov    0x1884,%edx
      if((p = morecore(nunits)) == 0)
    1101:	83 c4 10             	add    $0x10,%esp
    1104:	85 d2                	test   %edx,%edx
    1106:	75 c0                	jne    10c8 <malloc+0x48>
        return 0;
    1108:	31 c0                	xor    %eax,%eax
    110a:	eb 1c                	jmp    1128 <malloc+0xa8>
    110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1110:	39 cf                	cmp    %ecx,%edi
    1112:	74 1c                	je     1130 <malloc+0xb0>
        p->s.size -= nunits;
    1114:	29 f9                	sub    %edi,%ecx
    1116:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1119:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    111c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    111f:	89 15 84 18 00 00    	mov    %edx,0x1884
      return (void*)(p + 1);
    1125:	83 c0 08             	add    $0x8,%eax
  }
}
    1128:	8d 65 f4             	lea    -0xc(%ebp),%esp
    112b:	5b                   	pop    %ebx
    112c:	5e                   	pop    %esi
    112d:	5f                   	pop    %edi
    112e:	5d                   	pop    %ebp
    112f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    1130:	8b 08                	mov    (%eax),%ecx
    1132:	89 0a                	mov    %ecx,(%edx)
    1134:	eb e9                	jmp    111f <malloc+0x9f>
    base.s.ptr = freep = prevp = &base;
    1136:	c7 05 84 18 00 00 88 	movl   $0x1888,0x1884
    113d:	18 00 00 
    1140:	c7 05 88 18 00 00 88 	movl   $0x1888,0x1888
    1147:	18 00 00 
    base.s.size = 0;
    114a:	b8 88 18 00 00       	mov    $0x1888,%eax
    114f:	c7 05 8c 18 00 00 00 	movl   $0x0,0x188c
    1156:	00 00 00 
    1159:	e9 4e ff ff ff       	jmp    10ac <malloc+0x2c>
