
kernel:     formato del fichero elf32-i386


Desensamblado de la sección .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc 30 b6 10 80       	mov    $0x8010b630,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 e0 2e 10 80       	mov    $0x80102ee0,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb d4 b6 10 80       	mov    $0x8010b6d4,%ebx
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  initlock(&bcache.lock, "bcache");
8010004c:	68 80 72 10 80       	push   $0x80107280
80100051:	68 a0 b6 10 80       	push   $0x8010b6a0
80100056:	e8 75 44 00 00       	call   801044d0 <initlock>
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 ec fd 10 80 9c 	movl   $0x8010fd9c,0x8010fdec
80100062:	fd 10 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 f0 fd 10 80 9c 	movl   $0x8010fd9c,0x8010fdf0
8010006c:	fd 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba 9c fd 10 80       	mov    $0x8010fd9c,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 9c fd 10 80 	movl   $0x8010fd9c,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 87 72 10 80       	push   $0x80107287
80100097:	50                   	push   %eax
80100098:	e8 23 43 00 00       	call   801043c0 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 f0 fd 10 80       	mov    0x8010fdf0,%eax
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    bcache.head.next = b;
801000b0:	89 1d f0 fd 10 80    	mov    %ebx,0x8010fdf0
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d 9c fd 10 80       	cmp    $0x8010fd9c,%eax
801000bb:	72 c3                	jb     80100080 <binit+0x40>
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  acquire(&bcache.lock);
801000df:	68 a0 b6 10 80       	push   $0x8010b6a0
801000e4:	e8 07 44 00 00       	call   801044f0 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d f0 fd 10 80    	mov    0x8010fdf0,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 9c fd 10 80    	cmp    $0x8010fd9c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 9c fd 10 80    	cmp    $0x8010fd9c,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d ec fd 10 80    	mov    0x8010fdec,%ebx
80100126:	81 fb 9c fd 10 80    	cmp    $0x8010fd9c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 9c fd 10 80    	cmp    $0x8010fd9c,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 a0 b6 10 80       	push   $0x8010b6a0
80100162:	e8 69 45 00 00       	call   801046d0 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 8e 42 00 00       	call   80104400 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
  struct buf *b;

  b = bget(dev, blockno);
  if(!(b->flags & B_VALID)) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 3d 1f 00 00       	call   801020c0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 8e 72 10 80       	push   $0x8010728e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 ed 42 00 00       	call   801044a0 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
  iderw(b);
801001c4:	e9 f7 1e 00 00       	jmp    801020c0 <iderw>
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 9f 72 10 80       	push   $0x8010729f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 ac 42 00 00       	call   801044a0 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 5c 42 00 00       	call   80104460 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 a0 b6 10 80 	movl   $0x8010b6a0,(%esp)
8010020b:	e8 e0 42 00 00       	call   801044f0 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 f0 fd 10 80       	mov    0x8010fdf0,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 9c fd 10 80 	movl   $0x8010fd9c,0x50(%ebx)
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    bcache.head.next->prev = b;
80100241:	a1 f0 fd 10 80       	mov    0x8010fdf0,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d f0 fd 10 80    	mov    %ebx,0x8010fdf0
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 a0 b6 10 80 	movl   $0x8010b6a0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
  release(&bcache.lock);
8010025c:	e9 6f 44 00 00       	jmp    801046d0 <release>
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 a6 72 10 80       	push   $0x801072a6
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 ab 14 00 00       	call   80101730 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
8010028c:	e8 5f 42 00 00       	call   801044f0 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
    while(input.r == input.w){
801002a1:	a1 80 00 11 80       	mov    0x80110080,%eax
801002a6:	3b 05 84 00 11 80    	cmp    0x80110084,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
      if(proc->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 80 a5 10 80       	push   $0x8010a580
801002b8:	68 80 00 11 80       	push   $0x80110080
801002bd:	e8 0e 3c 00 00       	call   80103ed0 <sleep>
    while(input.r == input.w){
801002c2:	a1 80 00 11 80       	mov    0x80110080,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 84 00 11 80    	cmp    0x80110084,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
      if(proc->killed){
801002d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801002d8:	8b 40 24             	mov    0x24(%eax),%eax
801002db:	85 c0                	test   %eax,%eax
801002dd:	74 d1                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002df:	83 ec 0c             	sub    $0xc,%esp
801002e2:	68 80 a5 10 80       	push   $0x8010a580
801002e7:	e8 e4 43 00 00       	call   801046d0 <release>
        ilock(ip);
801002ec:	89 3c 24             	mov    %edi,(%esp)
801002ef:	e8 5c 13 00 00       	call   80101650 <ilock>
        return -1;
801002f4:	83 c4 10             	add    $0x10,%esp
801002f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002ff:	5b                   	pop    %ebx
80100300:	5e                   	pop    %esi
80100301:	5f                   	pop    %edi
80100302:	5d                   	pop    %ebp
80100303:	c3                   	ret    
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = input.buf[input.r++ % INPUT_BUF];
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 80 00 11 80    	mov    %edx,0x80110080
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 00 00 11 80 	movsbl -0x7fef0000(%edx),%edx
    if(c == C('D')){  // EOF
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
    *dst++ = c;
80100322:	83 c6 01             	add    $0x1,%esi
    --n;
80100325:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100328:	83 fa 0a             	cmp    $0xa,%edx
    *dst++ = c;
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
    if(c == '\n')
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
  while(n > 0){
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
  release(&cons.lock);
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 80 a5 10 80       	push   $0x8010a580
80100346:	e8 85 43 00 00       	call   801046d0 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 fd 12 00 00       	call   80101650 <ilock>
  return target - n;
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a1                	jmp    801002fc <consoleread+0x8c>
      if(n < target){
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
        input.r--;
80100360:	a3 80 00 11 80       	mov    %eax,0x80110080
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 38             	sub    $0x38,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100378:	fa                   	cli    
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
80100379:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  cons.locking = 0;
8010037f:	c7 05 b4 a5 10 80 00 	movl   $0x0,0x8010a5b4
80100386:	00 00 00 
  getcallerpcs(&s, pcs);
80100389:	8d 5d d0             	lea    -0x30(%ebp),%ebx
8010038c:	8d 75 f8             	lea    -0x8(%ebp),%esi
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
8010038f:	0f b6 00             	movzbl (%eax),%eax
80100392:	50                   	push   %eax
80100393:	68 ad 72 10 80       	push   $0x801072ad
80100398:	e8 c3 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039d:	58                   	pop    %eax
8010039e:	ff 75 08             	pushl  0x8(%ebp)
801003a1:	e8 ba 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a6:	c7 04 24 a6 77 10 80 	movl   $0x801077a6,(%esp)
801003ad:	e8 ae 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b2:	5a                   	pop    %edx
801003b3:	8d 45 08             	lea    0x8(%ebp),%eax
801003b6:	59                   	pop    %ecx
801003b7:	53                   	push   %ebx
801003b8:	50                   	push   %eax
801003b9:	e8 02 42 00 00       	call   801045c0 <getcallerpcs>
801003be:	83 c4 10             	add    $0x10,%esp
801003c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cprintf(" %p", pcs[i]);
801003c8:	83 ec 08             	sub    $0x8,%esp
801003cb:	ff 33                	pushl  (%ebx)
801003cd:	83 c3 04             	add    $0x4,%ebx
801003d0:	68 c9 72 10 80       	push   $0x801072c9
801003d5:	e8 86 02 00 00       	call   80100660 <cprintf>
  for(i=0; i<10; i++)
801003da:	83 c4 10             	add    $0x10,%esp
801003dd:	39 f3                	cmp    %esi,%ebx
801003df:	75 e7                	jne    801003c8 <panic+0x58>
  panicked = 1; // freeze other CPU
801003e1:	c7 05 b8 a5 10 80 01 	movl   $0x1,0x8010a5b8
801003e8:	00 00 00 
801003eb:	eb fe                	jmp    801003eb <panic+0x7b>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi

801003f0 <consputc>:
  if(panicked){
801003f0:	8b 15 b8 a5 10 80    	mov    0x8010a5b8,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
{
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 51 5a 00 00       	call   80105e70 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100434:	89 ca                	mov    %ecx,%edx
80100436:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c6                	mov    %eax,%esi
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 ca                	mov    %ecx,%edx
80100449:	ec                   	in     (%dx),%al
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 f0                	or     %esi,%eax
  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 
  if(pos < 0 || pos > 25*80)
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
  if((pos/80) >= 24){  // Scroll up.
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 9c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ebx
80100492:	89 f9                	mov    %edi,%ecx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 c8                	mov    %ecx,%eax
801004bd:	ee                   	out    %al,(%dx)
  crt[pos] = ' ' | 0x0700;
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 03             	mov    %ax,(%ebx)
}
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 98 59 00 00       	call   80105e70 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 8c 59 00 00       	call   80105e70 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 80 59 00 00       	call   80105e70 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f8:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
801004fb:	83 ef 50             	sub    $0x50,%edi
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
801004fe:	be 07 00 00 00       	mov    $0x7,%esi
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100503:	68 60 0e 00 00       	push   $0xe60
80100508:	68 a0 80 0b 80       	push   $0x800b80a0
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010050d:	8d 9c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ebx
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100514:	68 00 80 0b 80       	push   $0x800b8000
80100519:	e8 b2 42 00 00       	call   801047d0 <memmove>
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010051e:	b8 80 07 00 00       	mov    $0x780,%eax
80100523:	83 c4 0c             	add    $0xc,%esp
80100526:	29 f8                	sub    %edi,%eax
80100528:	01 c0                	add    %eax,%eax
8010052a:	50                   	push   %eax
8010052b:	6a 00                	push   $0x0
8010052d:	53                   	push   %ebx
8010052e:	e8 ed 41 00 00       	call   80104720 <memset>
80100533:	89 f9                	mov    %edi,%ecx
80100535:	83 c4 10             	add    $0x10,%esp
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
    panic("pos under/overflow");
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 cd 72 10 80       	push   $0x801072cd
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
    if(pos > 0) --pos;
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	bb 00 80 0b 80       	mov    $0x800b8000,%ebx
8010055a:	31 c9                	xor    %ecx,%ecx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
    pos += 80 - pos%80;
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 1c             	sub    $0x1c,%esp
  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	74 04                	je     80100593 <printint+0x13>
8010058f:	85 c0                	test   %eax,%eax
80100591:	78 57                	js     801005ea <printint+0x6a>
    x = xx;
80100593:	31 ff                	xor    %edi,%edi
  i = 0;
80100595:	31 c9                	xor    %ecx,%ecx
80100597:	eb 09                	jmp    801005a2 <printint+0x22>
80100599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    buf[i++] = digits[x % base];
801005a0:	89 d9                	mov    %ebx,%ecx
801005a2:	31 d2                	xor    %edx,%edx
801005a4:	8d 59 01             	lea    0x1(%ecx),%ebx
801005a7:	f7 f6                	div    %esi
801005a9:	0f b6 92 f8 72 10 80 	movzbl -0x7fef8d08(%edx),%edx
  }while((x /= base) != 0);
801005b0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
801005b2:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
  }while((x /= base) != 0);
801005b6:	75 e8                	jne    801005a0 <printint+0x20>
  if(sign)
801005b8:	85 ff                	test   %edi,%edi
801005ba:	74 08                	je     801005c4 <printint+0x44>
    buf[i++] = '-';
801005bc:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
801005c1:	8d 59 02             	lea    0x2(%ecx),%ebx
  while(--i >= 0)
801005c4:	83 eb 01             	sub    $0x1,%ebx
801005c7:	89 f6                	mov    %esi,%esi
801005c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    consputc(buf[i]);
801005d0:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
  while(--i >= 0)
801005d5:	83 eb 01             	sub    $0x1,%ebx
    consputc(buf[i]);
801005d8:	e8 13 fe ff ff       	call   801003f0 <consputc>
  while(--i >= 0)
801005dd:	83 fb ff             	cmp    $0xffffffff,%ebx
801005e0:	75 ee                	jne    801005d0 <printint+0x50>
}
801005e2:	83 c4 1c             	add    $0x1c,%esp
801005e5:	5b                   	pop    %ebx
801005e6:	5e                   	pop    %esi
801005e7:	5f                   	pop    %edi
801005e8:	5d                   	pop    %ebp
801005e9:	c3                   	ret    
    x = -xx;
801005ea:	f7 d8                	neg    %eax
  if(sign && (sign = xx < 0))
801005ec:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
801005f1:	eb a2                	jmp    80100595 <printint+0x15>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100609:	ff 75 08             	pushl  0x8(%ebp)
{
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
  iunlock(ip);
8010060f:	e8 1c 11 00 00       	call   80101730 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
8010061b:	e8 d0 3e 00 00       	call   801044f0 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
  for(i = 0; i < n; i++)
8010063b:	39 fb                	cmp    %edi,%ebx
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 80 a5 10 80       	push   $0x8010a580
80100647:	e8 84 40 00 00       	call   801046d0 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 fb 0f 00 00       	call   80101650 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
80100669:	a1 b4 a5 10 80       	mov    0x8010a5b4,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
  locking = cons.locking;
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100673:	0f 85 27 01 00 00    	jne    801007a0 <cprintf+0x140>
  if (fmt == 0)
80100679:	8b 75 08             	mov    0x8(%ebp),%esi
8010067c:	85 f6                	test   %esi,%esi
8010067e:	0f 84 40 01 00 00    	je     801007c4 <cprintf+0x164>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100684:	0f b6 06             	movzbl (%esi),%eax
80100687:	31 db                	xor    %ebx,%ebx
80100689:	8d 7d 0c             	lea    0xc(%ebp),%edi
8010068c:	85 c0                	test   %eax,%eax
8010068e:	75 51                	jne    801006e1 <cprintf+0x81>
80100690:	eb 64                	jmp    801006f6 <cprintf+0x96>
80100692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    c = fmt[++i] & 0xff;
80100698:	83 c3 01             	add    $0x1,%ebx
8010069b:	0f b6 14 1e          	movzbl (%esi,%ebx,1),%edx
    if(c == 0)
8010069f:	85 d2                	test   %edx,%edx
801006a1:	74 53                	je     801006f6 <cprintf+0x96>
    switch(c){
801006a3:	83 fa 70             	cmp    $0x70,%edx
801006a6:	74 7a                	je     80100722 <cprintf+0xc2>
801006a8:	7f 6e                	jg     80100718 <cprintf+0xb8>
801006aa:	83 fa 25             	cmp    $0x25,%edx
801006ad:	0f 84 ad 00 00 00    	je     80100760 <cprintf+0x100>
801006b3:	83 fa 64             	cmp    $0x64,%edx
801006b6:	0f 85 84 00 00 00    	jne    80100740 <cprintf+0xe0>
      printint(*argp++, 10, 1);
801006bc:	8d 47 04             	lea    0x4(%edi),%eax
801006bf:	b9 01 00 00 00       	mov    $0x1,%ecx
801006c4:	ba 0a 00 00 00       	mov    $0xa,%edx
801006c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006cc:	8b 07                	mov    (%edi),%eax
801006ce:	e8 ad fe ff ff       	call   80100580 <printint>
801006d3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006d6:	83 c3 01             	add    $0x1,%ebx
801006d9:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801006dd:	85 c0                	test   %eax,%eax
801006df:	74 15                	je     801006f6 <cprintf+0x96>
    if(c != '%'){
801006e1:	83 f8 25             	cmp    $0x25,%eax
801006e4:	74 b2                	je     80100698 <cprintf+0x38>
      consputc('%');
801006e6:	e8 05 fd ff ff       	call   801003f0 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006eb:	83 c3 01             	add    $0x1,%ebx
801006ee:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801006f2:	85 c0                	test   %eax,%eax
801006f4:	75 eb                	jne    801006e1 <cprintf+0x81>
  if(locking)
801006f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
801006f9:	85 c0                	test   %eax,%eax
801006fb:	74 10                	je     8010070d <cprintf+0xad>
    release(&cons.lock);
801006fd:	83 ec 0c             	sub    $0xc,%esp
80100700:	68 80 a5 10 80       	push   $0x8010a580
80100705:	e8 c6 3f 00 00       	call   801046d0 <release>
8010070a:	83 c4 10             	add    $0x10,%esp
}
8010070d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100710:	5b                   	pop    %ebx
80100711:	5e                   	pop    %esi
80100712:	5f                   	pop    %edi
80100713:	5d                   	pop    %ebp
80100714:	c3                   	ret    
80100715:	8d 76 00             	lea    0x0(%esi),%esi
    switch(c){
80100718:	83 fa 73             	cmp    $0x73,%edx
8010071b:	74 53                	je     80100770 <cprintf+0x110>
8010071d:	83 fa 78             	cmp    $0x78,%edx
80100720:	75 1e                	jne    80100740 <cprintf+0xe0>
      printint(*argp++, 16, 0);
80100722:	8d 47 04             	lea    0x4(%edi),%eax
80100725:	31 c9                	xor    %ecx,%ecx
80100727:	ba 10 00 00 00       	mov    $0x10,%edx
8010072c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010072f:	8b 07                	mov    (%edi),%eax
80100731:	e8 4a fe ff ff       	call   80100580 <printint>
80100736:	8b 7d e4             	mov    -0x1c(%ebp),%edi
      break;
80100739:	eb 9b                	jmp    801006d6 <cprintf+0x76>
8010073b:	90                   	nop
8010073c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      consputc('%');
80100740:	b8 25 00 00 00       	mov    $0x25,%eax
80100745:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100748:	e8 a3 fc ff ff       	call   801003f0 <consputc>
      consputc(c);
8010074d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100750:	89 d0                	mov    %edx,%eax
80100752:	e8 99 fc ff ff       	call   801003f0 <consputc>
      break;
80100757:	e9 7a ff ff ff       	jmp    801006d6 <cprintf+0x76>
8010075c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      consputc('%');
80100760:	b8 25 00 00 00       	mov    $0x25,%eax
80100765:	e8 86 fc ff ff       	call   801003f0 <consputc>
8010076a:	e9 7c ff ff ff       	jmp    801006eb <cprintf+0x8b>
8010076f:	90                   	nop
      if((s = (char*)*argp++) == 0)
80100770:	8d 47 04             	lea    0x4(%edi),%eax
80100773:	8b 3f                	mov    (%edi),%edi
80100775:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100778:	85 ff                	test   %edi,%edi
8010077a:	75 0c                	jne    80100788 <cprintf+0x128>
8010077c:	eb 3a                	jmp    801007b8 <cprintf+0x158>
8010077e:	66 90                	xchg   %ax,%ax
      for(; *s; s++)
80100780:	83 c7 01             	add    $0x1,%edi
        consputc(*s);
80100783:	e8 68 fc ff ff       	call   801003f0 <consputc>
      for(; *s; s++)
80100788:	0f be 07             	movsbl (%edi),%eax
8010078b:	84 c0                	test   %al,%al
8010078d:	75 f1                	jne    80100780 <cprintf+0x120>
      if((s = (char*)*argp++) == 0)
8010078f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80100792:	e9 3f ff ff ff       	jmp    801006d6 <cprintf+0x76>
80100797:	89 f6                	mov    %esi,%esi
80100799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    acquire(&cons.lock);
801007a0:	83 ec 0c             	sub    $0xc,%esp
801007a3:	68 80 a5 10 80       	push   $0x8010a580
801007a8:	e8 43 3d 00 00       	call   801044f0 <acquire>
801007ad:	83 c4 10             	add    $0x10,%esp
801007b0:	e9 c4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007b5:	8d 76 00             	lea    0x0(%esi),%esi
      for(; *s; s++)
801007b8:	b8 28 00 00 00       	mov    $0x28,%eax
        s = "(null)";
801007bd:	bf e0 72 10 80       	mov    $0x801072e0,%edi
801007c2:	eb bc                	jmp    80100780 <cprintf+0x120>
    panic("null fmt");
801007c4:	83 ec 0c             	sub    $0xc,%esp
801007c7:	68 e7 72 10 80       	push   $0x801072e7
801007cc:	e8 9f fb ff ff       	call   80100370 <panic>
801007d1:	eb 0d                	jmp    801007e0 <consoleintr>
801007d3:	90                   	nop
801007d4:	90                   	nop
801007d5:	90                   	nop
801007d6:	90                   	nop
801007d7:	90                   	nop
801007d8:	90                   	nop
801007d9:	90                   	nop
801007da:	90                   	nop
801007db:	90                   	nop
801007dc:	90                   	nop
801007dd:	90                   	nop
801007de:	90                   	nop
801007df:	90                   	nop

801007e0 <consoleintr>:
{
801007e0:	55                   	push   %ebp
801007e1:	89 e5                	mov    %esp,%ebp
801007e3:	57                   	push   %edi
801007e4:	56                   	push   %esi
801007e5:	53                   	push   %ebx
  int c, doprocdump = 0;
801007e6:	31 f6                	xor    %esi,%esi
{
801007e8:	83 ec 18             	sub    $0x18,%esp
801007eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&cons.lock);
801007ee:	68 80 a5 10 80       	push   $0x8010a580
801007f3:	e8 f8 3c 00 00       	call   801044f0 <acquire>
  while((c = getc()) >= 0){
801007f8:	83 c4 10             	add    $0x10,%esp
801007fb:	90                   	nop
801007fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100800:	ff d3                	call   *%ebx
80100802:	85 c0                	test   %eax,%eax
80100804:	89 c7                	mov    %eax,%edi
80100806:	78 48                	js     80100850 <consoleintr+0x70>
    switch(c){
80100808:	83 ff 10             	cmp    $0x10,%edi
8010080b:	0f 84 3f 01 00 00    	je     80100950 <consoleintr+0x170>
80100811:	7e 5d                	jle    80100870 <consoleintr+0x90>
80100813:	83 ff 15             	cmp    $0x15,%edi
80100816:	0f 84 dc 00 00 00    	je     801008f8 <consoleintr+0x118>
8010081c:	83 ff 7f             	cmp    $0x7f,%edi
8010081f:	75 54                	jne    80100875 <consoleintr+0x95>
      if(input.e != input.w){
80100821:	a1 88 00 11 80       	mov    0x80110088,%eax
80100826:	3b 05 84 00 11 80    	cmp    0x80110084,%eax
8010082c:	74 d2                	je     80100800 <consoleintr+0x20>
        input.e--;
8010082e:	83 e8 01             	sub    $0x1,%eax
80100831:	a3 88 00 11 80       	mov    %eax,0x80110088
        consputc(BACKSPACE);
80100836:	b8 00 01 00 00       	mov    $0x100,%eax
8010083b:	e8 b0 fb ff ff       	call   801003f0 <consputc>
  while((c = getc()) >= 0){
80100840:	ff d3                	call   *%ebx
80100842:	85 c0                	test   %eax,%eax
80100844:	89 c7                	mov    %eax,%edi
80100846:	79 c0                	jns    80100808 <consoleintr+0x28>
80100848:	90                   	nop
80100849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&cons.lock);
80100850:	83 ec 0c             	sub    $0xc,%esp
80100853:	68 80 a5 10 80       	push   $0x8010a580
80100858:	e8 73 3e 00 00       	call   801046d0 <release>
  if(doprocdump) {
8010085d:	83 c4 10             	add    $0x10,%esp
80100860:	85 f6                	test   %esi,%esi
80100862:	0f 85 f8 00 00 00    	jne    80100960 <consoleintr+0x180>
}
80100868:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010086b:	5b                   	pop    %ebx
8010086c:	5e                   	pop    %esi
8010086d:	5f                   	pop    %edi
8010086e:	5d                   	pop    %ebp
8010086f:	c3                   	ret    
    switch(c){
80100870:	83 ff 08             	cmp    $0x8,%edi
80100873:	74 ac                	je     80100821 <consoleintr+0x41>
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100875:	85 ff                	test   %edi,%edi
80100877:	74 87                	je     80100800 <consoleintr+0x20>
80100879:	a1 88 00 11 80       	mov    0x80110088,%eax
8010087e:	89 c2                	mov    %eax,%edx
80100880:	2b 15 80 00 11 80    	sub    0x80110080,%edx
80100886:	83 fa 7f             	cmp    $0x7f,%edx
80100889:	0f 87 71 ff ff ff    	ja     80100800 <consoleintr+0x20>
        input.buf[input.e++ % INPUT_BUF] = c;
8010088f:	8d 50 01             	lea    0x1(%eax),%edx
80100892:	83 e0 7f             	and    $0x7f,%eax
        c = (c == '\r') ? '\n' : c;
80100895:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
80100898:	89 15 88 00 11 80    	mov    %edx,0x80110088
        c = (c == '\r') ? '\n' : c;
8010089e:	0f 84 c8 00 00 00    	je     8010096c <consoleintr+0x18c>
        input.buf[input.e++ % INPUT_BUF] = c;
801008a4:	89 f9                	mov    %edi,%ecx
801008a6:	88 88 00 00 11 80    	mov    %cl,-0x7fef0000(%eax)
        consputc(c);
801008ac:	89 f8                	mov    %edi,%eax
801008ae:	e8 3d fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008b3:	83 ff 0a             	cmp    $0xa,%edi
801008b6:	0f 84 c1 00 00 00    	je     8010097d <consoleintr+0x19d>
801008bc:	83 ff 04             	cmp    $0x4,%edi
801008bf:	0f 84 b8 00 00 00    	je     8010097d <consoleintr+0x19d>
801008c5:	a1 80 00 11 80       	mov    0x80110080,%eax
801008ca:	83 e8 80             	sub    $0xffffff80,%eax
801008cd:	39 05 88 00 11 80    	cmp    %eax,0x80110088
801008d3:	0f 85 27 ff ff ff    	jne    80100800 <consoleintr+0x20>
          wakeup(&input.r);
801008d9:	83 ec 0c             	sub    $0xc,%esp
          input.w = input.e;
801008dc:	a3 84 00 11 80       	mov    %eax,0x80110084
          wakeup(&input.r);
801008e1:	68 80 00 11 80       	push   $0x80110080
801008e6:	e8 a5 37 00 00       	call   80104090 <wakeup>
801008eb:	83 c4 10             	add    $0x10,%esp
801008ee:	e9 0d ff ff ff       	jmp    80100800 <consoleintr+0x20>
801008f3:	90                   	nop
801008f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      while(input.e != input.w &&
801008f8:	a1 88 00 11 80       	mov    0x80110088,%eax
801008fd:	39 05 84 00 11 80    	cmp    %eax,0x80110084
80100903:	75 2b                	jne    80100930 <consoleintr+0x150>
80100905:	e9 f6 fe ff ff       	jmp    80100800 <consoleintr+0x20>
8010090a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        input.e--;
80100910:	a3 88 00 11 80       	mov    %eax,0x80110088
        consputc(BACKSPACE);
80100915:	b8 00 01 00 00       	mov    $0x100,%eax
8010091a:	e8 d1 fa ff ff       	call   801003f0 <consputc>
      while(input.e != input.w &&
8010091f:	a1 88 00 11 80       	mov    0x80110088,%eax
80100924:	3b 05 84 00 11 80    	cmp    0x80110084,%eax
8010092a:	0f 84 d0 fe ff ff    	je     80100800 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100930:	83 e8 01             	sub    $0x1,%eax
80100933:	89 c2                	mov    %eax,%edx
80100935:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
80100938:	80 ba 00 00 11 80 0a 	cmpb   $0xa,-0x7fef0000(%edx)
8010093f:	75 cf                	jne    80100910 <consoleintr+0x130>
80100941:	e9 ba fe ff ff       	jmp    80100800 <consoleintr+0x20>
80100946:	8d 76 00             	lea    0x0(%esi),%esi
80100949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      doprocdump = 1;
80100950:	be 01 00 00 00       	mov    $0x1,%esi
80100955:	e9 a6 fe ff ff       	jmp    80100800 <consoleintr+0x20>
8010095a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}
80100960:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100963:	5b                   	pop    %ebx
80100964:	5e                   	pop    %esi
80100965:	5f                   	pop    %edi
80100966:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
80100967:	e9 14 38 00 00       	jmp    80104180 <procdump>
        input.buf[input.e++ % INPUT_BUF] = c;
8010096c:	c6 80 00 00 11 80 0a 	movb   $0xa,-0x7fef0000(%eax)
        consputc(c);
80100973:	b8 0a 00 00 00       	mov    $0xa,%eax
80100978:	e8 73 fa ff ff       	call   801003f0 <consputc>
8010097d:	a1 88 00 11 80       	mov    0x80110088,%eax
80100982:	e9 52 ff ff ff       	jmp    801008d9 <consoleintr+0xf9>
80100987:	89 f6                	mov    %esi,%esi
80100989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100990 <consoleinit>:

void
consoleinit(void)
{
80100990:	55                   	push   %ebp
80100991:	89 e5                	mov    %esp,%ebp
80100993:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
80100996:	68 f0 72 10 80       	push   $0x801072f0
8010099b:	68 80 a5 10 80       	push   $0x8010a580
801009a0:	e8 2b 3b 00 00       	call   801044d0 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  picenable(IRQ_KBD);
801009a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  devsw[CONSOLE].write = consolewrite;
801009ac:	c7 05 4c 0a 11 80 00 	movl   $0x80100600,0x80110a4c
801009b3:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009b6:	c7 05 48 0a 11 80 70 	movl   $0x80100270,0x80110a48
801009bd:	02 10 80 
  cons.locking = 1;
801009c0:	c7 05 b4 a5 10 80 01 	movl   $0x1,0x8010a5b4
801009c7:	00 00 00 
  picenable(IRQ_KBD);
801009ca:	e8 c1 28 00 00       	call   80103290 <picenable>
  ioapicenable(IRQ_KBD, 0);
801009cf:	58                   	pop    %eax
801009d0:	5a                   	pop    %edx
801009d1:	6a 00                	push   $0x0
801009d3:	6a 01                	push   $0x1
801009d5:	e8 a6 18 00 00       	call   80102280 <ioapicenable>
}
801009da:	83 c4 10             	add    $0x10,%esp
801009dd:	c9                   	leave  
801009de:	c3                   	ret    
801009df:	90                   	nop

801009e0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009e0:	55                   	push   %ebp
801009e1:	89 e5                	mov    %esp,%ebp
801009e3:	57                   	push   %edi
801009e4:	56                   	push   %esi
801009e5:	53                   	push   %ebx
801009e6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;

  begin_op();
801009ec:	e8 df 21 00 00       	call   80102bd0 <begin_op>

  if((ip = namei(path)) == 0){
801009f1:	83 ec 0c             	sub    $0xc,%esp
801009f4:	ff 75 08             	pushl  0x8(%ebp)
801009f7:	e8 84 14 00 00       	call   80101e80 <namei>
801009fc:	83 c4 10             	add    $0x10,%esp
801009ff:	85 c0                	test   %eax,%eax
80100a01:	0f 84 9f 01 00 00    	je     80100ba6 <exec+0x1c6>
    end_op();
    return -1;
  }
  ilock(ip);
80100a07:	83 ec 0c             	sub    $0xc,%esp
80100a0a:	89 c3                	mov    %eax,%ebx
80100a0c:	50                   	push   %eax
80100a0d:	e8 3e 0c 00 00       	call   80101650 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a12:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a18:	6a 34                	push   $0x34
80100a1a:	6a 00                	push   $0x0
80100a1c:	50                   	push   %eax
80100a1d:	53                   	push   %ebx
80100a1e:	e8 ed 0e 00 00       	call   80101910 <readi>
80100a23:	83 c4 20             	add    $0x20,%esp
80100a26:	83 f8 34             	cmp    $0x34,%eax
80100a29:	74 25                	je     80100a50 <exec+0x70>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a2b:	83 ec 0c             	sub    $0xc,%esp
80100a2e:	53                   	push   %ebx
80100a2f:	e8 8c 0e 00 00       	call   801018c0 <iunlockput>
    end_op();
80100a34:	e8 07 22 00 00       	call   80102c40 <end_op>
80100a39:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a3c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a41:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a44:	5b                   	pop    %ebx
80100a45:	5e                   	pop    %esi
80100a46:	5f                   	pop    %edi
80100a47:	5d                   	pop    %ebp
80100a48:	c3                   	ret    
80100a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(elf.magic != ELF_MAGIC)
80100a50:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a57:	45 4c 46 
80100a5a:	75 cf                	jne    80100a2b <exec+0x4b>
  if((pgdir = setupkvm()) == 0)
80100a5c:	e8 cf 61 00 00       	call   80106c30 <setupkvm>
80100a61:	85 c0                	test   %eax,%eax
80100a63:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a69:	74 c0                	je     80100a2b <exec+0x4b>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a6b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a72:	00 
80100a73:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a79:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100a80:	00 00 00 
80100a83:	0f 84 c5 00 00 00    	je     80100b4e <exec+0x16e>
80100a89:	31 ff                	xor    %edi,%edi
80100a8b:	eb 18                	jmp    80100aa5 <exec+0xc5>
80100a8d:	8d 76 00             	lea    0x0(%esi),%esi
80100a90:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100a97:	83 c7 01             	add    $0x1,%edi
80100a9a:	83 c6 20             	add    $0x20,%esi
80100a9d:	39 f8                	cmp    %edi,%eax
80100a9f:	0f 8e a9 00 00 00    	jle    80100b4e <exec+0x16e>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100aa5:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100aab:	6a 20                	push   $0x20
80100aad:	56                   	push   %esi
80100aae:	50                   	push   %eax
80100aaf:	53                   	push   %ebx
80100ab0:	e8 5b 0e 00 00       	call   80101910 <readi>
80100ab5:	83 c4 10             	add    $0x10,%esp
80100ab8:	83 f8 20             	cmp    $0x20,%eax
80100abb:	75 7b                	jne    80100b38 <exec+0x158>
    if(ph.type != ELF_PROG_LOAD)
80100abd:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100ac4:	75 ca                	jne    80100a90 <exec+0xb0>
    if(ph.memsz < ph.filesz)
80100ac6:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100acc:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ad2:	72 64                	jb     80100b38 <exec+0x158>
80100ad4:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ada:	72 5c                	jb     80100b38 <exec+0x158>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100adc:	83 ec 04             	sub    $0x4,%esp
80100adf:	50                   	push   %eax
80100ae0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100ae6:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100aec:	e8 ff 63 00 00       	call   80106ef0 <allocuvm>
80100af1:	83 c4 10             	add    $0x10,%esp
80100af4:	85 c0                	test   %eax,%eax
80100af6:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100afc:	74 3a                	je     80100b38 <exec+0x158>
    if(ph.vaddr % PGSIZE != 0)
80100afe:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b04:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b09:	75 2d                	jne    80100b38 <exec+0x158>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b0b:	83 ec 0c             	sub    $0xc,%esp
80100b0e:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b14:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b1a:	53                   	push   %ebx
80100b1b:	50                   	push   %eax
80100b1c:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b22:	e8 09 63 00 00       	call   80106e30 <loaduvm>
80100b27:	83 c4 20             	add    $0x20,%esp
80100b2a:	85 c0                	test   %eax,%eax
80100b2c:	0f 89 5e ff ff ff    	jns    80100a90 <exec+0xb0>
80100b32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    freevm(pgdir);
80100b38:	83 ec 0c             	sub    $0xc,%esp
80100b3b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b41:	e8 ca 64 00 00       	call   80107010 <freevm>
80100b46:	83 c4 10             	add    $0x10,%esp
80100b49:	e9 dd fe ff ff       	jmp    80100a2b <exec+0x4b>
  iunlockput(ip);
80100b4e:	83 ec 0c             	sub    $0xc,%esp
80100b51:	53                   	push   %ebx
80100b52:	e8 69 0d 00 00       	call   801018c0 <iunlockput>
  end_op();
80100b57:	e8 e4 20 00 00       	call   80102c40 <end_op>
  sz = PGROUNDUP(sz);
80100b5c:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b62:	83 c4 0c             	add    $0xc,%esp
  sz = PGROUNDUP(sz);
80100b65:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b6a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b6f:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b75:	52                   	push   %edx
80100b76:	50                   	push   %eax
80100b77:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b7d:	e8 6e 63 00 00       	call   80106ef0 <allocuvm>
80100b82:	83 c4 10             	add    $0x10,%esp
80100b85:	85 c0                	test   %eax,%eax
80100b87:	89 c6                	mov    %eax,%esi
80100b89:	75 2a                	jne    80100bb5 <exec+0x1d5>
    freevm(pgdir);
80100b8b:	83 ec 0c             	sub    $0xc,%esp
80100b8e:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b94:	e8 77 64 00 00       	call   80107010 <freevm>
80100b99:	83 c4 10             	add    $0x10,%esp
  return -1;
80100b9c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100ba1:	e9 9b fe ff ff       	jmp    80100a41 <exec+0x61>
    end_op();
80100ba6:	e8 95 20 00 00       	call   80102c40 <end_op>
    return -1;
80100bab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb0:	e9 8c fe ff ff       	jmp    80100a41 <exec+0x61>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bb5:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bbb:	83 ec 08             	sub    $0x8,%esp
  for(argc = 0; argv[argc]; argc++) {
80100bbe:	31 ff                	xor    %edi,%edi
80100bc0:	89 f3                	mov    %esi,%ebx
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bc2:	50                   	push   %eax
80100bc3:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100bc9:	e8 c2 64 00 00       	call   80107090 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100bce:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bd1:	83 c4 10             	add    $0x10,%esp
80100bd4:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100bda:	8b 00                	mov    (%eax),%eax
80100bdc:	85 c0                	test   %eax,%eax
80100bde:	74 6d                	je     80100c4d <exec+0x26d>
80100be0:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100be6:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100bec:	eb 07                	jmp    80100bf5 <exec+0x215>
80100bee:	66 90                	xchg   %ax,%ax
    if(argc >= MAXARG)
80100bf0:	83 ff 20             	cmp    $0x20,%edi
80100bf3:	74 96                	je     80100b8b <exec+0x1ab>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100bf5:	83 ec 0c             	sub    $0xc,%esp
80100bf8:	50                   	push   %eax
80100bf9:	e8 42 3d 00 00       	call   80104940 <strlen>
80100bfe:	f7 d0                	not    %eax
80100c00:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c02:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c05:	5a                   	pop    %edx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c06:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c09:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c0c:	e8 2f 3d 00 00       	call   80104940 <strlen>
80100c11:	83 c0 01             	add    $0x1,%eax
80100c14:	50                   	push   %eax
80100c15:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c18:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c1b:	53                   	push   %ebx
80100c1c:	56                   	push   %esi
80100c1d:	e8 be 65 00 00       	call   801071e0 <copyout>
80100c22:	83 c4 20             	add    $0x20,%esp
80100c25:	85 c0                	test   %eax,%eax
80100c27:	0f 88 5e ff ff ff    	js     80100b8b <exec+0x1ab>
  for(argc = 0; argv[argc]; argc++) {
80100c2d:	8b 45 0c             	mov    0xc(%ebp),%eax
    ustack[3+argc] = sp;
80100c30:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100c37:	83 c7 01             	add    $0x1,%edi
    ustack[3+argc] = sp;
80100c3a:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
  for(argc = 0; argv[argc]; argc++) {
80100c40:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c43:	85 c0                	test   %eax,%eax
80100c45:	75 a9                	jne    80100bf0 <exec+0x210>
80100c47:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c4d:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c54:	89 d9                	mov    %ebx,%ecx
  ustack[3+argc] = 0;
80100c56:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c5d:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
80100c61:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c68:	ff ff ff 
  ustack[1] = argc;
80100c6b:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c71:	29 c1                	sub    %eax,%ecx
  sp -= (3+argc+1) * 4;
80100c73:	83 c0 0c             	add    $0xc,%eax
80100c76:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c78:	50                   	push   %eax
80100c79:	52                   	push   %edx
80100c7a:	53                   	push   %ebx
80100c7b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c81:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c87:	e8 54 65 00 00       	call   801071e0 <copyout>
80100c8c:	83 c4 10             	add    $0x10,%esp
80100c8f:	85 c0                	test   %eax,%eax
80100c91:	0f 88 f4 fe ff ff    	js     80100b8b <exec+0x1ab>
  for(last=s=path; *s; s++)
80100c97:	8b 45 08             	mov    0x8(%ebp),%eax
80100c9a:	0f b6 10             	movzbl (%eax),%edx
80100c9d:	84 d2                	test   %dl,%dl
80100c9f:	74 19                	je     80100cba <exec+0x2da>
80100ca1:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100ca4:	83 c0 01             	add    $0x1,%eax
      last = s+1;
80100ca7:	80 fa 2f             	cmp    $0x2f,%dl
  for(last=s=path; *s; s++)
80100caa:	0f b6 10             	movzbl (%eax),%edx
      last = s+1;
80100cad:	0f 44 c8             	cmove  %eax,%ecx
80100cb0:	83 c0 01             	add    $0x1,%eax
  for(last=s=path; *s; s++)
80100cb3:	84 d2                	test   %dl,%dl
80100cb5:	75 f0                	jne    80100ca7 <exec+0x2c7>
80100cb7:	89 4d 08             	mov    %ecx,0x8(%ebp)
  safestrcpy(proc->name, last, sizeof(proc->name));
80100cba:	50                   	push   %eax
80100cbb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cc1:	6a 10                	push   $0x10
80100cc3:	ff 75 08             	pushl  0x8(%ebp)
80100cc6:	83 c0 6c             	add    $0x6c,%eax
80100cc9:	50                   	push   %eax
80100cca:	e8 31 3c 00 00       	call   80104900 <safestrcpy>
  oldpgdir = proc->pgdir;
80100ccf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  proc->pgdir = pgdir;
80100cd5:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
  oldpgdir = proc->pgdir;
80100cdb:	8b 78 04             	mov    0x4(%eax),%edi
  proc->sz = sz;
80100cde:	89 30                	mov    %esi,(%eax)
  proc->pgdir = pgdir;
80100ce0:	89 48 04             	mov    %ecx,0x4(%eax)
  proc->tf->eip = elf.entry;  // main
80100ce3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100ce9:	8b 8d 3c ff ff ff    	mov    -0xc4(%ebp),%ecx
80100cef:	8b 50 18             	mov    0x18(%eax),%edx
80100cf2:	89 4a 38             	mov    %ecx,0x38(%edx)
  proc->tf->esp = sp;
80100cf5:	8b 50 18             	mov    0x18(%eax),%edx
80100cf8:	89 5a 44             	mov    %ebx,0x44(%edx)
  switchuvm(proc);
80100cfb:	89 04 24             	mov    %eax,(%esp)
80100cfe:	e8 dd 5f 00 00       	call   80106ce0 <switchuvm>
  freevm(oldpgdir);
80100d03:	89 3c 24             	mov    %edi,(%esp)
80100d06:	e8 05 63 00 00       	call   80107010 <freevm>
  return 0;
80100d0b:	83 c4 10             	add    $0x10,%esp
80100d0e:	31 c0                	xor    %eax,%eax
80100d10:	e9 2c fd ff ff       	jmp    80100a41 <exec+0x61>
80100d15:	66 90                	xchg   %ax,%ax
80100d17:	66 90                	xchg   %ax,%ax
80100d19:	66 90                	xchg   %ax,%ax
80100d1b:	66 90                	xchg   %ax,%ax
80100d1d:	66 90                	xchg   %ax,%ax
80100d1f:	90                   	nop

80100d20 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d20:	55                   	push   %ebp
80100d21:	89 e5                	mov    %esp,%ebp
80100d23:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d26:	68 09 73 10 80       	push   $0x80107309
80100d2b:	68 a0 00 11 80       	push   $0x801100a0
80100d30:	e8 9b 37 00 00       	call   801044d0 <initlock>
}
80100d35:	83 c4 10             	add    $0x10,%esp
80100d38:	c9                   	leave  
80100d39:	c3                   	ret    
80100d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d40 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d40:	55                   	push   %ebp
80100d41:	89 e5                	mov    %esp,%ebp
80100d43:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d44:	bb d4 00 11 80       	mov    $0x801100d4,%ebx
{
80100d49:	83 ec 10             	sub    $0x10,%esp
  acquire(&ftable.lock);
80100d4c:	68 a0 00 11 80       	push   $0x801100a0
80100d51:	e8 9a 37 00 00       	call   801044f0 <acquire>
80100d56:	83 c4 10             	add    $0x10,%esp
80100d59:	eb 10                	jmp    80100d6b <filealloc+0x2b>
80100d5b:	90                   	nop
80100d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d60:	83 c3 18             	add    $0x18,%ebx
80100d63:	81 fb 34 0a 11 80    	cmp    $0x80110a34,%ebx
80100d69:	73 25                	jae    80100d90 <filealloc+0x50>
    if(f->ref == 0){
80100d6b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d6e:	85 c0                	test   %eax,%eax
80100d70:	75 ee                	jne    80100d60 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100d72:	83 ec 0c             	sub    $0xc,%esp
      f->ref = 1;
80100d75:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100d7c:	68 a0 00 11 80       	push   $0x801100a0
80100d81:	e8 4a 39 00 00       	call   801046d0 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100d86:	89 d8                	mov    %ebx,%eax
      return f;
80100d88:	83 c4 10             	add    $0x10,%esp
}
80100d8b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100d8e:	c9                   	leave  
80100d8f:	c3                   	ret    
  release(&ftable.lock);
80100d90:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80100d93:	31 db                	xor    %ebx,%ebx
  release(&ftable.lock);
80100d95:	68 a0 00 11 80       	push   $0x801100a0
80100d9a:	e8 31 39 00 00       	call   801046d0 <release>
}
80100d9f:	89 d8                	mov    %ebx,%eax
  return 0;
80100da1:	83 c4 10             	add    $0x10,%esp
}
80100da4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100da7:	c9                   	leave  
80100da8:	c3                   	ret    
80100da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100db0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100db0:	55                   	push   %ebp
80100db1:	89 e5                	mov    %esp,%ebp
80100db3:	53                   	push   %ebx
80100db4:	83 ec 10             	sub    $0x10,%esp
80100db7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dba:	68 a0 00 11 80       	push   $0x801100a0
80100dbf:	e8 2c 37 00 00       	call   801044f0 <acquire>
  if(f->ref < 1)
80100dc4:	8b 43 04             	mov    0x4(%ebx),%eax
80100dc7:	83 c4 10             	add    $0x10,%esp
80100dca:	85 c0                	test   %eax,%eax
80100dcc:	7e 1a                	jle    80100de8 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100dce:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100dd1:	83 ec 0c             	sub    $0xc,%esp
  f->ref++;
80100dd4:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100dd7:	68 a0 00 11 80       	push   $0x801100a0
80100ddc:	e8 ef 38 00 00       	call   801046d0 <release>
  return f;
}
80100de1:	89 d8                	mov    %ebx,%eax
80100de3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100de6:	c9                   	leave  
80100de7:	c3                   	ret    
    panic("filedup");
80100de8:	83 ec 0c             	sub    $0xc,%esp
80100deb:	68 10 73 10 80       	push   $0x80107310
80100df0:	e8 7b f5 ff ff       	call   80100370 <panic>
80100df5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e00 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e00:	55                   	push   %ebp
80100e01:	89 e5                	mov    %esp,%ebp
80100e03:	57                   	push   %edi
80100e04:	56                   	push   %esi
80100e05:	53                   	push   %ebx
80100e06:	83 ec 28             	sub    $0x28,%esp
80100e09:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e0c:	68 a0 00 11 80       	push   $0x801100a0
80100e11:	e8 da 36 00 00       	call   801044f0 <acquire>
  if(f->ref < 1)
80100e16:	8b 47 04             	mov    0x4(%edi),%eax
80100e19:	83 c4 10             	add    $0x10,%esp
80100e1c:	85 c0                	test   %eax,%eax
80100e1e:	0f 8e 9b 00 00 00    	jle    80100ebf <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100e24:	83 e8 01             	sub    $0x1,%eax
80100e27:	85 c0                	test   %eax,%eax
80100e29:	89 47 04             	mov    %eax,0x4(%edi)
80100e2c:	74 1a                	je     80100e48 <fileclose+0x48>
    release(&ftable.lock);
80100e2e:	c7 45 08 a0 00 11 80 	movl   $0x801100a0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e38:	5b                   	pop    %ebx
80100e39:	5e                   	pop    %esi
80100e3a:	5f                   	pop    %edi
80100e3b:	5d                   	pop    %ebp
    release(&ftable.lock);
80100e3c:	e9 8f 38 00 00       	jmp    801046d0 <release>
80100e41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ff = *f;
80100e48:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e4c:	8b 1f                	mov    (%edi),%ebx
  release(&ftable.lock);
80100e4e:	83 ec 0c             	sub    $0xc,%esp
  ff = *f;
80100e51:	8b 77 0c             	mov    0xc(%edi),%esi
  f->type = FD_NONE;
80100e54:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
  ff = *f;
80100e5a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e5d:	8b 47 10             	mov    0x10(%edi),%eax
  release(&ftable.lock);
80100e60:	68 a0 00 11 80       	push   $0x801100a0
  ff = *f;
80100e65:	89 45 e0             	mov    %eax,-0x20(%ebp)
  release(&ftable.lock);
80100e68:	e8 63 38 00 00       	call   801046d0 <release>
  if(ff.type == FD_PIPE)
80100e6d:	83 c4 10             	add    $0x10,%esp
80100e70:	83 fb 01             	cmp    $0x1,%ebx
80100e73:	74 13                	je     80100e88 <fileclose+0x88>
  else if(ff.type == FD_INODE){
80100e75:	83 fb 02             	cmp    $0x2,%ebx
80100e78:	74 26                	je     80100ea0 <fileclose+0xa0>
}
80100e7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e7d:	5b                   	pop    %ebx
80100e7e:	5e                   	pop    %esi
80100e7f:	5f                   	pop    %edi
80100e80:	5d                   	pop    %ebp
80100e81:	c3                   	ret    
80100e82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pipeclose(ff.pipe, ff.writable);
80100e88:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100e8c:	83 ec 08             	sub    $0x8,%esp
80100e8f:	53                   	push   %ebx
80100e90:	56                   	push   %esi
80100e91:	e8 ca 25 00 00       	call   80103460 <pipeclose>
80100e96:	83 c4 10             	add    $0x10,%esp
80100e99:	eb df                	jmp    80100e7a <fileclose+0x7a>
80100e9b:	90                   	nop
80100e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    begin_op();
80100ea0:	e8 2b 1d 00 00       	call   80102bd0 <begin_op>
    iput(ff.ip);
80100ea5:	83 ec 0c             	sub    $0xc,%esp
80100ea8:	ff 75 e0             	pushl  -0x20(%ebp)
80100eab:	e8 d0 08 00 00       	call   80101780 <iput>
    end_op();
80100eb0:	83 c4 10             	add    $0x10,%esp
}
80100eb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100eb6:	5b                   	pop    %ebx
80100eb7:	5e                   	pop    %esi
80100eb8:	5f                   	pop    %edi
80100eb9:	5d                   	pop    %ebp
    end_op();
80100eba:	e9 81 1d 00 00       	jmp    80102c40 <end_op>
    panic("fileclose");
80100ebf:	83 ec 0c             	sub    $0xc,%esp
80100ec2:	68 18 73 10 80       	push   $0x80107318
80100ec7:	e8 a4 f4 ff ff       	call   80100370 <panic>
80100ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ed0 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100ed0:	55                   	push   %ebp
80100ed1:	89 e5                	mov    %esp,%ebp
80100ed3:	53                   	push   %ebx
80100ed4:	83 ec 04             	sub    $0x4,%esp
80100ed7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100eda:	83 3b 02             	cmpl   $0x2,(%ebx)
80100edd:	75 31                	jne    80100f10 <filestat+0x40>
    ilock(f->ip);
80100edf:	83 ec 0c             	sub    $0xc,%esp
80100ee2:	ff 73 10             	pushl  0x10(%ebx)
80100ee5:	e8 66 07 00 00       	call   80101650 <ilock>
    stati(f->ip, st);
80100eea:	58                   	pop    %eax
80100eeb:	5a                   	pop    %edx
80100eec:	ff 75 0c             	pushl  0xc(%ebp)
80100eef:	ff 73 10             	pushl  0x10(%ebx)
80100ef2:	e8 e9 09 00 00       	call   801018e0 <stati>
    iunlock(f->ip);
80100ef7:	59                   	pop    %ecx
80100ef8:	ff 73 10             	pushl  0x10(%ebx)
80100efb:	e8 30 08 00 00       	call   80101730 <iunlock>
    return 0;
80100f00:	83 c4 10             	add    $0x10,%esp
80100f03:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f05:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f08:	c9                   	leave  
80100f09:	c3                   	ret    
80100f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return -1;
80100f10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f18:	c9                   	leave  
80100f19:	c3                   	ret    
80100f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f20 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f20:	55                   	push   %ebp
80100f21:	89 e5                	mov    %esp,%ebp
80100f23:	57                   	push   %edi
80100f24:	56                   	push   %esi
80100f25:	53                   	push   %ebx
80100f26:	83 ec 0c             	sub    $0xc,%esp
80100f29:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f2c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f2f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f32:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f36:	74 60                	je     80100f98 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f38:	8b 03                	mov    (%ebx),%eax
80100f3a:	83 f8 01             	cmp    $0x1,%eax
80100f3d:	74 41                	je     80100f80 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f3f:	83 f8 02             	cmp    $0x2,%eax
80100f42:	75 5b                	jne    80100f9f <fileread+0x7f>
    ilock(f->ip);
80100f44:	83 ec 0c             	sub    $0xc,%esp
80100f47:	ff 73 10             	pushl  0x10(%ebx)
80100f4a:	e8 01 07 00 00       	call   80101650 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f4f:	57                   	push   %edi
80100f50:	ff 73 14             	pushl  0x14(%ebx)
80100f53:	56                   	push   %esi
80100f54:	ff 73 10             	pushl  0x10(%ebx)
80100f57:	e8 b4 09 00 00       	call   80101910 <readi>
80100f5c:	83 c4 20             	add    $0x20,%esp
80100f5f:	85 c0                	test   %eax,%eax
80100f61:	89 c6                	mov    %eax,%esi
80100f63:	7e 03                	jle    80100f68 <fileread+0x48>
      f->off += r;
80100f65:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100f68:	83 ec 0c             	sub    $0xc,%esp
80100f6b:	ff 73 10             	pushl  0x10(%ebx)
80100f6e:	e8 bd 07 00 00       	call   80101730 <iunlock>
    return r;
80100f73:	83 c4 10             	add    $0x10,%esp
  }
  panic("fileread");
}
80100f76:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f79:	89 f0                	mov    %esi,%eax
80100f7b:	5b                   	pop    %ebx
80100f7c:	5e                   	pop    %esi
80100f7d:	5f                   	pop    %edi
80100f7e:	5d                   	pop    %ebp
80100f7f:	c3                   	ret    
    return piperead(f->pipe, addr, n);
80100f80:	8b 43 0c             	mov    0xc(%ebx),%eax
80100f83:	89 45 08             	mov    %eax,0x8(%ebp)
}
80100f86:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f89:	5b                   	pop    %ebx
80100f8a:	5e                   	pop    %esi
80100f8b:	5f                   	pop    %edi
80100f8c:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
80100f8d:	e9 9e 26 00 00       	jmp    80103630 <piperead>
80100f92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80100f98:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100f9d:	eb d7                	jmp    80100f76 <fileread+0x56>
  panic("fileread");
80100f9f:	83 ec 0c             	sub    $0xc,%esp
80100fa2:	68 22 73 10 80       	push   $0x80107322
80100fa7:	e8 c4 f3 ff ff       	call   80100370 <panic>
80100fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fb0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fb0:	55                   	push   %ebp
80100fb1:	89 e5                	mov    %esp,%ebp
80100fb3:	57                   	push   %edi
80100fb4:	56                   	push   %esi
80100fb5:	53                   	push   %ebx
80100fb6:	83 ec 1c             	sub    $0x1c,%esp
80100fb9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fbc:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
80100fbf:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
{
80100fc3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fc6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fc9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(f->writable == 0)
80100fcc:	0f 84 aa 00 00 00    	je     8010107c <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80100fd2:	8b 06                	mov    (%esi),%eax
80100fd4:	83 f8 01             	cmp    $0x1,%eax
80100fd7:	0f 84 c2 00 00 00    	je     8010109f <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100fdd:	83 f8 02             	cmp    $0x2,%eax
80100fe0:	0f 85 e4 00 00 00    	jne    801010ca <filewrite+0x11a>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80100fe6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100fe9:	31 ff                	xor    %edi,%edi
80100feb:	85 c0                	test   %eax,%eax
80100fed:	7f 34                	jg     80101023 <filewrite+0x73>
80100fef:	e9 9c 00 00 00       	jmp    80101090 <filewrite+0xe0>
80100ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80100ff8:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
80100ffb:	83 ec 0c             	sub    $0xc,%esp
80100ffe:	ff 76 10             	pushl  0x10(%esi)
        f->off += r;
80101001:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101004:	e8 27 07 00 00       	call   80101730 <iunlock>
      end_op();
80101009:	e8 32 1c 00 00       	call   80102c40 <end_op>
8010100e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101011:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101014:	39 d8                	cmp    %ebx,%eax
80101016:	0f 85 a1 00 00 00    	jne    801010bd <filewrite+0x10d>
        panic("short filewrite");
      i += r;
8010101c:	01 c7                	add    %eax,%edi
    while(i < n){
8010101e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101021:	7e 6d                	jle    80101090 <filewrite+0xe0>
      int n1 = n - i;
80101023:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101026:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010102b:	29 fb                	sub    %edi,%ebx
8010102d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
80101033:	0f 4f d8             	cmovg  %eax,%ebx
      begin_op();
80101036:	e8 95 1b 00 00       	call   80102bd0 <begin_op>
      ilock(f->ip);
8010103b:	83 ec 0c             	sub    $0xc,%esp
8010103e:	ff 76 10             	pushl  0x10(%esi)
80101041:	e8 0a 06 00 00       	call   80101650 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101046:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101049:	53                   	push   %ebx
8010104a:	ff 76 14             	pushl  0x14(%esi)
8010104d:	01 f8                	add    %edi,%eax
8010104f:	50                   	push   %eax
80101050:	ff 76 10             	pushl  0x10(%esi)
80101053:	e8 b8 09 00 00       	call   80101a10 <writei>
80101058:	83 c4 20             	add    $0x20,%esp
8010105b:	85 c0                	test   %eax,%eax
8010105d:	7f 99                	jg     80100ff8 <filewrite+0x48>
      iunlock(f->ip);
8010105f:	83 ec 0c             	sub    $0xc,%esp
80101062:	ff 76 10             	pushl  0x10(%esi)
80101065:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101068:	e8 c3 06 00 00       	call   80101730 <iunlock>
      end_op();
8010106d:	e8 ce 1b 00 00       	call   80102c40 <end_op>
      if(r < 0)
80101072:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101075:	83 c4 10             	add    $0x10,%esp
80101078:	85 c0                	test   %eax,%eax
8010107a:	74 98                	je     80101014 <filewrite+0x64>
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
8010107c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
8010107f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80101084:	5b                   	pop    %ebx
80101085:	5e                   	pop    %esi
80101086:	5f                   	pop    %edi
80101087:	5d                   	pop    %ebp
80101088:	c3                   	ret    
80101089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return i == n ? n : -1;
80101090:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
80101093:	75 e7                	jne    8010107c <filewrite+0xcc>
}
80101095:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101098:	89 f8                	mov    %edi,%eax
8010109a:	5b                   	pop    %ebx
8010109b:	5e                   	pop    %esi
8010109c:	5f                   	pop    %edi
8010109d:	5d                   	pop    %ebp
8010109e:	c3                   	ret    
    return pipewrite(f->pipe, addr, n);
8010109f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801010a2:	89 45 10             	mov    %eax,0x10(%ebp)
801010a5:	8b 45 dc             	mov    -0x24(%ebp),%eax
801010a8:	89 45 0c             	mov    %eax,0xc(%ebp)
801010ab:	8b 46 0c             	mov    0xc(%esi),%eax
801010ae:	89 45 08             	mov    %eax,0x8(%ebp)
}
801010b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010b4:	5b                   	pop    %ebx
801010b5:	5e                   	pop    %esi
801010b6:	5f                   	pop    %edi
801010b7:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
801010b8:	e9 43 24 00 00       	jmp    80103500 <pipewrite>
        panic("short filewrite");
801010bd:	83 ec 0c             	sub    $0xc,%esp
801010c0:	68 2b 73 10 80       	push   $0x8010732b
801010c5:	e8 a6 f2 ff ff       	call   80100370 <panic>
  panic("filewrite");
801010ca:	83 ec 0c             	sub    $0xc,%esp
801010cd:	68 31 73 10 80       	push   $0x80107331
801010d2:	e8 99 f2 ff ff       	call   80100370 <panic>
801010d7:	66 90                	xchg   %ax,%ax
801010d9:	66 90                	xchg   %ax,%ax
801010db:	66 90                	xchg   %ax,%ax
801010dd:	66 90                	xchg   %ax,%ax
801010df:	90                   	nop

801010e0 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801010e0:	55                   	push   %ebp
801010e1:	89 e5                	mov    %esp,%ebp
801010e3:	57                   	push   %edi
801010e4:	56                   	push   %esi
801010e5:	53                   	push   %ebx
801010e6:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801010e9:	8b 0d a0 0a 11 80    	mov    0x80110aa0,%ecx
{
801010ef:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
801010f2:	85 c9                	test   %ecx,%ecx
801010f4:	0f 84 87 00 00 00    	je     80101181 <balloc+0xa1>
801010fa:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101101:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101104:	83 ec 08             	sub    $0x8,%esp
80101107:	89 f0                	mov    %esi,%eax
80101109:	c1 f8 0c             	sar    $0xc,%eax
8010110c:	03 05 b8 0a 11 80    	add    0x80110ab8,%eax
80101112:	50                   	push   %eax
80101113:	ff 75 d8             	pushl  -0x28(%ebp)
80101116:	e8 b5 ef ff ff       	call   801000d0 <bread>
8010111b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010111e:	a1 a0 0a 11 80       	mov    0x80110aa0,%eax
80101123:	83 c4 10             	add    $0x10,%esp
80101126:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101129:	31 c0                	xor    %eax,%eax
8010112b:	eb 2f                	jmp    8010115c <balloc+0x7c>
8010112d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101130:	89 c1                	mov    %eax,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101132:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      m = 1 << (bi % 8);
80101135:	bb 01 00 00 00       	mov    $0x1,%ebx
8010113a:	83 e1 07             	and    $0x7,%ecx
8010113d:	d3 e3                	shl    %cl,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010113f:	89 c1                	mov    %eax,%ecx
80101141:	c1 f9 03             	sar    $0x3,%ecx
80101144:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101149:	85 df                	test   %ebx,%edi
8010114b:	89 fa                	mov    %edi,%edx
8010114d:	74 41                	je     80101190 <balloc+0xb0>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010114f:	83 c0 01             	add    $0x1,%eax
80101152:	83 c6 01             	add    $0x1,%esi
80101155:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010115a:	74 05                	je     80101161 <balloc+0x81>
8010115c:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010115f:	72 cf                	jb     80101130 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
80101161:	83 ec 0c             	sub    $0xc,%esp
80101164:	ff 75 e4             	pushl  -0x1c(%ebp)
80101167:	e8 74 f0 ff ff       	call   801001e0 <brelse>
  for(b = 0; b < sb.size; b += BPB){
8010116c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101173:	83 c4 10             	add    $0x10,%esp
80101176:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101179:	39 05 a0 0a 11 80    	cmp    %eax,0x80110aa0
8010117f:	77 80                	ja     80101101 <balloc+0x21>
  }
  panic("balloc: out of blocks");
80101181:	83 ec 0c             	sub    $0xc,%esp
80101184:	68 3b 73 10 80       	push   $0x8010733b
80101189:	e8 e2 f1 ff ff       	call   80100370 <panic>
8010118e:	66 90                	xchg   %ax,%ax
        bp->data[bi/8] |= m;  // Mark block in use.
80101190:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
80101193:	83 ec 0c             	sub    $0xc,%esp
        bp->data[bi/8] |= m;  // Mark block in use.
80101196:	09 da                	or     %ebx,%edx
80101198:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
8010119c:	57                   	push   %edi
8010119d:	e8 0e 1c 00 00       	call   80102db0 <log_write>
        brelse(bp);
801011a2:	89 3c 24             	mov    %edi,(%esp)
801011a5:	e8 36 f0 ff ff       	call   801001e0 <brelse>
  bp = bread(dev, bno);
801011aa:	58                   	pop    %eax
801011ab:	5a                   	pop    %edx
801011ac:	56                   	push   %esi
801011ad:	ff 75 d8             	pushl  -0x28(%ebp)
801011b0:	e8 1b ef ff ff       	call   801000d0 <bread>
801011b5:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011b7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ba:	83 c4 0c             	add    $0xc,%esp
801011bd:	68 00 02 00 00       	push   $0x200
801011c2:	6a 00                	push   $0x0
801011c4:	50                   	push   %eax
801011c5:	e8 56 35 00 00       	call   80104720 <memset>
  log_write(bp);
801011ca:	89 1c 24             	mov    %ebx,(%esp)
801011cd:	e8 de 1b 00 00       	call   80102db0 <log_write>
  brelse(bp);
801011d2:	89 1c 24             	mov    %ebx,(%esp)
801011d5:	e8 06 f0 ff ff       	call   801001e0 <brelse>
}
801011da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011dd:	89 f0                	mov    %esi,%eax
801011df:	5b                   	pop    %ebx
801011e0:	5e                   	pop    %esi
801011e1:	5f                   	pop    %edi
801011e2:	5d                   	pop    %ebp
801011e3:	c3                   	ret    
801011e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801011ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801011f0 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
801011f0:	55                   	push   %ebp
801011f1:	89 e5                	mov    %esp,%ebp
801011f3:	57                   	push   %edi
801011f4:	56                   	push   %esi
801011f5:	53                   	push   %ebx
801011f6:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
801011f8:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801011fa:	bb f4 0a 11 80       	mov    $0x80110af4,%ebx
{
801011ff:	83 ec 28             	sub    $0x28,%esp
80101202:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
80101205:	68 c0 0a 11 80       	push   $0x80110ac0
8010120a:	e8 e1 32 00 00       	call   801044f0 <acquire>
8010120f:	83 c4 10             	add    $0x10,%esp
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101212:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101215:	eb 1b                	jmp    80101232 <iget+0x42>
80101217:	89 f6                	mov    %esi,%esi
80101219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101220:	85 f6                	test   %esi,%esi
80101222:	74 44                	je     80101268 <iget+0x78>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101224:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010122a:	81 fb 14 27 11 80    	cmp    $0x80112714,%ebx
80101230:	73 4e                	jae    80101280 <iget+0x90>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101232:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101235:	85 c9                	test   %ecx,%ecx
80101237:	7e e7                	jle    80101220 <iget+0x30>
80101239:	39 3b                	cmp    %edi,(%ebx)
8010123b:	75 e3                	jne    80101220 <iget+0x30>
8010123d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101240:	75 de                	jne    80101220 <iget+0x30>
      release(&icache.lock);
80101242:	83 ec 0c             	sub    $0xc,%esp
      ip->ref++;
80101245:	83 c1 01             	add    $0x1,%ecx
      return ip;
80101248:	89 de                	mov    %ebx,%esi
      release(&icache.lock);
8010124a:	68 c0 0a 11 80       	push   $0x80110ac0
      ip->ref++;
8010124f:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101252:	e8 79 34 00 00       	call   801046d0 <release>
      return ip;
80101257:	83 c4 10             	add    $0x10,%esp
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);

  return ip;
}
8010125a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010125d:	89 f0                	mov    %esi,%eax
8010125f:	5b                   	pop    %ebx
80101260:	5e                   	pop    %esi
80101261:	5f                   	pop    %edi
80101262:	5d                   	pop    %ebp
80101263:	c3                   	ret    
80101264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101268:	85 c9                	test   %ecx,%ecx
8010126a:	0f 44 f3             	cmove  %ebx,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010126d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101273:	81 fb 14 27 11 80    	cmp    $0x80112714,%ebx
80101279:	72 b7                	jb     80101232 <iget+0x42>
8010127b:	90                   	nop
8010127c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(empty == 0)
80101280:	85 f6                	test   %esi,%esi
80101282:	74 2d                	je     801012b1 <iget+0xc1>
  release(&icache.lock);
80101284:	83 ec 0c             	sub    $0xc,%esp
  ip->dev = dev;
80101287:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101289:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
8010128c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->flags = 0;
80101293:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
8010129a:	68 c0 0a 11 80       	push   $0x80110ac0
8010129f:	e8 2c 34 00 00       	call   801046d0 <release>
  return ip;
801012a4:	83 c4 10             	add    $0x10,%esp
}
801012a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012aa:	89 f0                	mov    %esi,%eax
801012ac:	5b                   	pop    %ebx
801012ad:	5e                   	pop    %esi
801012ae:	5f                   	pop    %edi
801012af:	5d                   	pop    %ebp
801012b0:	c3                   	ret    
    panic("iget: no inodes");
801012b1:	83 ec 0c             	sub    $0xc,%esp
801012b4:	68 51 73 10 80       	push   $0x80107351
801012b9:	e8 b2 f0 ff ff       	call   80100370 <panic>
801012be:	66 90                	xchg   %ax,%ax

801012c0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012c0:	55                   	push   %ebp
801012c1:	89 e5                	mov    %esp,%ebp
801012c3:	57                   	push   %edi
801012c4:	56                   	push   %esi
801012c5:	53                   	push   %ebx
801012c6:	89 c6                	mov    %eax,%esi
801012c8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012cb:	83 fa 0b             	cmp    $0xb,%edx
801012ce:	77 18                	ja     801012e8 <bmap+0x28>
801012d0:	8d 3c 90             	lea    (%eax,%edx,4),%edi
    if((addr = ip->addrs[bn]) == 0)
801012d3:	8b 5f 5c             	mov    0x5c(%edi),%ebx
801012d6:	85 db                	test   %ebx,%ebx
801012d8:	74 76                	je     80101350 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801012da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012dd:	89 d8                	mov    %ebx,%eax
801012df:	5b                   	pop    %ebx
801012e0:	5e                   	pop    %esi
801012e1:	5f                   	pop    %edi
801012e2:	5d                   	pop    %ebp
801012e3:	c3                   	ret    
801012e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bn -= NDIRECT;
801012e8:	8d 5a f4             	lea    -0xc(%edx),%ebx
  if(bn < NINDIRECT){
801012eb:	83 fb 7f             	cmp    $0x7f,%ebx
801012ee:	0f 87 8e 00 00 00    	ja     80101382 <bmap+0xc2>
    if((addr = ip->addrs[NDIRECT]) == 0)
801012f4:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
801012fa:	85 c0                	test   %eax,%eax
801012fc:	74 72                	je     80101370 <bmap+0xb0>
    bp = bread(ip->dev, addr);
801012fe:	83 ec 08             	sub    $0x8,%esp
80101301:	50                   	push   %eax
80101302:	ff 36                	pushl  (%esi)
80101304:	e8 c7 ed ff ff       	call   801000d0 <bread>
    if((addr = a[bn]) == 0){
80101309:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010130d:	83 c4 10             	add    $0x10,%esp
    bp = bread(ip->dev, addr);
80101310:	89 c7                	mov    %eax,%edi
    if((addr = a[bn]) == 0){
80101312:	8b 1a                	mov    (%edx),%ebx
80101314:	85 db                	test   %ebx,%ebx
80101316:	75 1d                	jne    80101335 <bmap+0x75>
      a[bn] = addr = balloc(ip->dev);
80101318:	8b 06                	mov    (%esi),%eax
8010131a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010131d:	e8 be fd ff ff       	call   801010e0 <balloc>
80101322:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101325:	83 ec 0c             	sub    $0xc,%esp
      a[bn] = addr = balloc(ip->dev);
80101328:	89 c3                	mov    %eax,%ebx
8010132a:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010132c:	57                   	push   %edi
8010132d:	e8 7e 1a 00 00       	call   80102db0 <log_write>
80101332:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
80101335:	83 ec 0c             	sub    $0xc,%esp
80101338:	57                   	push   %edi
80101339:	e8 a2 ee ff ff       	call   801001e0 <brelse>
8010133e:	83 c4 10             	add    $0x10,%esp
}
80101341:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101344:	89 d8                	mov    %ebx,%eax
80101346:	5b                   	pop    %ebx
80101347:	5e                   	pop    %esi
80101348:	5f                   	pop    %edi
80101349:	5d                   	pop    %ebp
8010134a:	c3                   	ret    
8010134b:	90                   	nop
8010134c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ip->addrs[bn] = addr = balloc(ip->dev);
80101350:	8b 00                	mov    (%eax),%eax
80101352:	e8 89 fd ff ff       	call   801010e0 <balloc>
80101357:	89 47 5c             	mov    %eax,0x5c(%edi)
}
8010135a:	8d 65 f4             	lea    -0xc(%ebp),%esp
      ip->addrs[bn] = addr = balloc(ip->dev);
8010135d:	89 c3                	mov    %eax,%ebx
}
8010135f:	89 d8                	mov    %ebx,%eax
80101361:	5b                   	pop    %ebx
80101362:	5e                   	pop    %esi
80101363:	5f                   	pop    %edi
80101364:	5d                   	pop    %ebp
80101365:	c3                   	ret    
80101366:	8d 76 00             	lea    0x0(%esi),%esi
80101369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101370:	8b 06                	mov    (%esi),%eax
80101372:	e8 69 fd ff ff       	call   801010e0 <balloc>
80101377:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
8010137d:	e9 7c ff ff ff       	jmp    801012fe <bmap+0x3e>
  panic("bmap: out of range");
80101382:	83 ec 0c             	sub    $0xc,%esp
80101385:	68 61 73 10 80       	push   $0x80107361
8010138a:	e8 e1 ef ff ff       	call   80100370 <panic>
8010138f:	90                   	nop

80101390 <readsb>:
{
80101390:	55                   	push   %ebp
80101391:	89 e5                	mov    %esp,%ebp
80101393:	56                   	push   %esi
80101394:	53                   	push   %ebx
80101395:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
80101398:	83 ec 08             	sub    $0x8,%esp
8010139b:	6a 01                	push   $0x1
8010139d:	ff 75 08             	pushl  0x8(%ebp)
801013a0:	e8 2b ed ff ff       	call   801000d0 <bread>
801013a5:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013a7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013aa:	83 c4 0c             	add    $0xc,%esp
801013ad:	6a 1c                	push   $0x1c
801013af:	50                   	push   %eax
801013b0:	56                   	push   %esi
801013b1:	e8 1a 34 00 00       	call   801047d0 <memmove>
  brelse(bp);
801013b6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013b9:	83 c4 10             	add    $0x10,%esp
}
801013bc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013bf:	5b                   	pop    %ebx
801013c0:	5e                   	pop    %esi
801013c1:	5d                   	pop    %ebp
  brelse(bp);
801013c2:	e9 19 ee ff ff       	jmp    801001e0 <brelse>
801013c7:	89 f6                	mov    %esi,%esi
801013c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013d0 <bfree>:
{
801013d0:	55                   	push   %ebp
801013d1:	89 e5                	mov    %esp,%ebp
801013d3:	56                   	push   %esi
801013d4:	53                   	push   %ebx
801013d5:	89 d3                	mov    %edx,%ebx
801013d7:	89 c6                	mov    %eax,%esi
  readsb(dev, &sb);
801013d9:	83 ec 08             	sub    $0x8,%esp
801013dc:	68 a0 0a 11 80       	push   $0x80110aa0
801013e1:	50                   	push   %eax
801013e2:	e8 a9 ff ff ff       	call   80101390 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
801013e7:	58                   	pop    %eax
801013e8:	5a                   	pop    %edx
801013e9:	89 da                	mov    %ebx,%edx
801013eb:	c1 ea 0c             	shr    $0xc,%edx
801013ee:	03 15 b8 0a 11 80    	add    0x80110ab8,%edx
801013f4:	52                   	push   %edx
801013f5:	56                   	push   %esi
801013f6:	e8 d5 ec ff ff       	call   801000d0 <bread>
  m = 1 << (bi % 8);
801013fb:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
801013fd:	c1 fb 03             	sar    $0x3,%ebx
  m = 1 << (bi % 8);
80101400:	ba 01 00 00 00       	mov    $0x1,%edx
80101405:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
80101408:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010140e:	83 c4 10             	add    $0x10,%esp
  m = 1 << (bi % 8);
80101411:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101413:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101418:	85 d1                	test   %edx,%ecx
8010141a:	74 25                	je     80101441 <bfree+0x71>
  bp->data[bi/8] &= ~m;
8010141c:	f7 d2                	not    %edx
8010141e:	89 c6                	mov    %eax,%esi
  log_write(bp);
80101420:	83 ec 0c             	sub    $0xc,%esp
  bp->data[bi/8] &= ~m;
80101423:	21 ca                	and    %ecx,%edx
80101425:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
  log_write(bp);
80101429:	56                   	push   %esi
8010142a:	e8 81 19 00 00       	call   80102db0 <log_write>
  brelse(bp);
8010142f:	89 34 24             	mov    %esi,(%esp)
80101432:	e8 a9 ed ff ff       	call   801001e0 <brelse>
}
80101437:	83 c4 10             	add    $0x10,%esp
8010143a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010143d:	5b                   	pop    %ebx
8010143e:	5e                   	pop    %esi
8010143f:	5d                   	pop    %ebp
80101440:	c3                   	ret    
    panic("freeing free block");
80101441:	83 ec 0c             	sub    $0xc,%esp
80101444:	68 74 73 10 80       	push   $0x80107374
80101449:	e8 22 ef ff ff       	call   80100370 <panic>
8010144e:	66 90                	xchg   %ax,%ax

80101450 <iinit>:
{
80101450:	55                   	push   %ebp
80101451:	89 e5                	mov    %esp,%ebp
80101453:	53                   	push   %ebx
80101454:	bb 00 0b 11 80       	mov    $0x80110b00,%ebx
80101459:	83 ec 0c             	sub    $0xc,%esp
  initlock(&icache.lock, "icache");
8010145c:	68 87 73 10 80       	push   $0x80107387
80101461:	68 c0 0a 11 80       	push   $0x80110ac0
80101466:	e8 65 30 00 00       	call   801044d0 <initlock>
8010146b:	83 c4 10             	add    $0x10,%esp
8010146e:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
80101470:	83 ec 08             	sub    $0x8,%esp
80101473:	68 8e 73 10 80       	push   $0x8010738e
80101478:	53                   	push   %ebx
80101479:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010147f:	e8 3c 2f 00 00       	call   801043c0 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
80101484:	83 c4 10             	add    $0x10,%esp
80101487:	81 fb 20 27 11 80    	cmp    $0x80112720,%ebx
8010148d:	75 e1                	jne    80101470 <iinit+0x20>
  readsb(dev, &sb);
8010148f:	83 ec 08             	sub    $0x8,%esp
80101492:	68 a0 0a 11 80       	push   $0x80110aa0
80101497:	ff 75 08             	pushl  0x8(%ebp)
8010149a:	e8 f1 fe ff ff       	call   80101390 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
8010149f:	ff 35 b8 0a 11 80    	pushl  0x80110ab8
801014a5:	ff 35 b4 0a 11 80    	pushl  0x80110ab4
801014ab:	ff 35 b0 0a 11 80    	pushl  0x80110ab0
801014b1:	ff 35 ac 0a 11 80    	pushl  0x80110aac
801014b7:	ff 35 a8 0a 11 80    	pushl  0x80110aa8
801014bd:	ff 35 a4 0a 11 80    	pushl  0x80110aa4
801014c3:	ff 35 a0 0a 11 80    	pushl  0x80110aa0
801014c9:	68 e4 73 10 80       	push   $0x801073e4
801014ce:	e8 8d f1 ff ff       	call   80100660 <cprintf>
}
801014d3:	83 c4 30             	add    $0x30,%esp
801014d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014d9:	c9                   	leave  
801014da:	c3                   	ret    
801014db:	90                   	nop
801014dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801014e0 <ialloc>:
{
801014e0:	55                   	push   %ebp
801014e1:	89 e5                	mov    %esp,%ebp
801014e3:	57                   	push   %edi
801014e4:	56                   	push   %esi
801014e5:	53                   	push   %ebx
801014e6:	83 ec 1c             	sub    $0x1c,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
801014e9:	83 3d a8 0a 11 80 01 	cmpl   $0x1,0x80110aa8
{
801014f0:	8b 45 0c             	mov    0xc(%ebp),%eax
801014f3:	8b 75 08             	mov    0x8(%ebp),%esi
801014f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
801014f9:	0f 86 91 00 00 00    	jbe    80101590 <ialloc+0xb0>
801014ff:	bb 01 00 00 00       	mov    $0x1,%ebx
80101504:	eb 21                	jmp    80101527 <ialloc+0x47>
80101506:	8d 76 00             	lea    0x0(%esi),%esi
80101509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    brelse(bp);
80101510:	83 ec 0c             	sub    $0xc,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101513:	83 c3 01             	add    $0x1,%ebx
    brelse(bp);
80101516:	57                   	push   %edi
80101517:	e8 c4 ec ff ff       	call   801001e0 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
8010151c:	83 c4 10             	add    $0x10,%esp
8010151f:	39 1d a8 0a 11 80    	cmp    %ebx,0x80110aa8
80101525:	76 69                	jbe    80101590 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101527:	89 d8                	mov    %ebx,%eax
80101529:	83 ec 08             	sub    $0x8,%esp
8010152c:	c1 e8 03             	shr    $0x3,%eax
8010152f:	03 05 b4 0a 11 80    	add    0x80110ab4,%eax
80101535:	50                   	push   %eax
80101536:	56                   	push   %esi
80101537:	e8 94 eb ff ff       	call   801000d0 <bread>
8010153c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010153e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101540:	83 c4 10             	add    $0x10,%esp
    dip = (struct dinode*)bp->data + inum%IPB;
80101543:	83 e0 07             	and    $0x7,%eax
80101546:	c1 e0 06             	shl    $0x6,%eax
80101549:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010154d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101551:	75 bd                	jne    80101510 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101553:	83 ec 04             	sub    $0x4,%esp
80101556:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101559:	6a 40                	push   $0x40
8010155b:	6a 00                	push   $0x0
8010155d:	51                   	push   %ecx
8010155e:	e8 bd 31 00 00       	call   80104720 <memset>
      dip->type = type;
80101563:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101567:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010156a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010156d:	89 3c 24             	mov    %edi,(%esp)
80101570:	e8 3b 18 00 00       	call   80102db0 <log_write>
      brelse(bp);
80101575:	89 3c 24             	mov    %edi,(%esp)
80101578:	e8 63 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
8010157d:	83 c4 10             	add    $0x10,%esp
}
80101580:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return iget(dev, inum);
80101583:	89 da                	mov    %ebx,%edx
80101585:	89 f0                	mov    %esi,%eax
}
80101587:	5b                   	pop    %ebx
80101588:	5e                   	pop    %esi
80101589:	5f                   	pop    %edi
8010158a:	5d                   	pop    %ebp
      return iget(dev, inum);
8010158b:	e9 60 fc ff ff       	jmp    801011f0 <iget>
  panic("ialloc: no inodes");
80101590:	83 ec 0c             	sub    $0xc,%esp
80101593:	68 94 73 10 80       	push   $0x80107394
80101598:	e8 d3 ed ff ff       	call   80100370 <panic>
8010159d:	8d 76 00             	lea    0x0(%esi),%esi

801015a0 <iupdate>:
{
801015a0:	55                   	push   %ebp
801015a1:	89 e5                	mov    %esp,%ebp
801015a3:	56                   	push   %esi
801015a4:	53                   	push   %ebx
801015a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015a8:	83 ec 08             	sub    $0x8,%esp
801015ab:	8b 43 04             	mov    0x4(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ae:	83 c3 5c             	add    $0x5c,%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015b1:	c1 e8 03             	shr    $0x3,%eax
801015b4:	03 05 b4 0a 11 80    	add    0x80110ab4,%eax
801015ba:	50                   	push   %eax
801015bb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015be:	e8 0d eb ff ff       	call   801000d0 <bread>
801015c3:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015c5:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
801015c8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015cc:	83 c4 0c             	add    $0xc,%esp
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015cf:	83 e0 07             	and    $0x7,%eax
801015d2:	c1 e0 06             	shl    $0x6,%eax
801015d5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
801015d9:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
801015dc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015e0:	83 c0 0c             	add    $0xc,%eax
  dip->major = ip->major;
801015e3:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
801015e7:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801015eb:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
801015ef:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
801015f3:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
801015f7:	8b 53 fc             	mov    -0x4(%ebx),%edx
801015fa:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015fd:	6a 34                	push   $0x34
801015ff:	53                   	push   %ebx
80101600:	50                   	push   %eax
80101601:	e8 ca 31 00 00       	call   801047d0 <memmove>
  log_write(bp);
80101606:	89 34 24             	mov    %esi,(%esp)
80101609:	e8 a2 17 00 00       	call   80102db0 <log_write>
  brelse(bp);
8010160e:	89 75 08             	mov    %esi,0x8(%ebp)
80101611:	83 c4 10             	add    $0x10,%esp
}
80101614:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101617:	5b                   	pop    %ebx
80101618:	5e                   	pop    %esi
80101619:	5d                   	pop    %ebp
  brelse(bp);
8010161a:	e9 c1 eb ff ff       	jmp    801001e0 <brelse>
8010161f:	90                   	nop

80101620 <idup>:
{
80101620:	55                   	push   %ebp
80101621:	89 e5                	mov    %esp,%ebp
80101623:	53                   	push   %ebx
80101624:	83 ec 10             	sub    $0x10,%esp
80101627:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010162a:	68 c0 0a 11 80       	push   $0x80110ac0
8010162f:	e8 bc 2e 00 00       	call   801044f0 <acquire>
  ip->ref++;
80101634:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101638:	c7 04 24 c0 0a 11 80 	movl   $0x80110ac0,(%esp)
8010163f:	e8 8c 30 00 00       	call   801046d0 <release>
}
80101644:	89 d8                	mov    %ebx,%eax
80101646:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101649:	c9                   	leave  
8010164a:	c3                   	ret    
8010164b:	90                   	nop
8010164c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101650 <ilock>:
{
80101650:	55                   	push   %ebp
80101651:	89 e5                	mov    %esp,%ebp
80101653:	56                   	push   %esi
80101654:	53                   	push   %ebx
80101655:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
80101658:	85 db                	test   %ebx,%ebx
8010165a:	0f 84 b4 00 00 00    	je     80101714 <ilock+0xc4>
80101660:	8b 43 08             	mov    0x8(%ebx),%eax
80101663:	85 c0                	test   %eax,%eax
80101665:	0f 8e a9 00 00 00    	jle    80101714 <ilock+0xc4>
  acquiresleep(&ip->lock);
8010166b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010166e:	83 ec 0c             	sub    $0xc,%esp
80101671:	50                   	push   %eax
80101672:	e8 89 2d 00 00       	call   80104400 <acquiresleep>
  if(!(ip->flags & I_VALID)){
80101677:	83 c4 10             	add    $0x10,%esp
8010167a:	f6 43 4c 02          	testb  $0x2,0x4c(%ebx)
8010167e:	74 10                	je     80101690 <ilock+0x40>
}
80101680:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101683:	5b                   	pop    %ebx
80101684:	5e                   	pop    %esi
80101685:	5d                   	pop    %ebp
80101686:	c3                   	ret    
80101687:	89 f6                	mov    %esi,%esi
80101689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101690:	8b 43 04             	mov    0x4(%ebx),%eax
80101693:	83 ec 08             	sub    $0x8,%esp
80101696:	c1 e8 03             	shr    $0x3,%eax
80101699:	03 05 b4 0a 11 80    	add    0x80110ab4,%eax
8010169f:	50                   	push   %eax
801016a0:	ff 33                	pushl  (%ebx)
801016a2:	e8 29 ea ff ff       	call   801000d0 <bread>
801016a7:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016a9:	8b 43 04             	mov    0x4(%ebx),%eax
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016ac:	83 c4 0c             	add    $0xc,%esp
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016af:	83 e0 07             	and    $0x7,%eax
801016b2:	c1 e0 06             	shl    $0x6,%eax
801016b5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801016b9:	0f b7 10             	movzwl (%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016bc:	83 c0 0c             	add    $0xc,%eax
    ip->type = dip->type;
801016bf:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801016c3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016c7:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801016cb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016cf:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
801016d3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016d7:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
801016db:	8b 50 fc             	mov    -0x4(%eax),%edx
801016de:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016e1:	6a 34                	push   $0x34
801016e3:	50                   	push   %eax
801016e4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801016e7:	50                   	push   %eax
801016e8:	e8 e3 30 00 00       	call   801047d0 <memmove>
    brelse(bp);
801016ed:	89 34 24             	mov    %esi,(%esp)
801016f0:	e8 eb ea ff ff       	call   801001e0 <brelse>
    ip->flags |= I_VALID;
801016f5:	83 4b 4c 02          	orl    $0x2,0x4c(%ebx)
    if(ip->type == 0)
801016f9:	83 c4 10             	add    $0x10,%esp
801016fc:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101701:	0f 85 79 ff ff ff    	jne    80101680 <ilock+0x30>
      panic("ilock: no type");
80101707:	83 ec 0c             	sub    $0xc,%esp
8010170a:	68 ac 73 10 80       	push   $0x801073ac
8010170f:	e8 5c ec ff ff       	call   80100370 <panic>
    panic("ilock");
80101714:	83 ec 0c             	sub    $0xc,%esp
80101717:	68 a6 73 10 80       	push   $0x801073a6
8010171c:	e8 4f ec ff ff       	call   80100370 <panic>
80101721:	eb 0d                	jmp    80101730 <iunlock>
80101723:	90                   	nop
80101724:	90                   	nop
80101725:	90                   	nop
80101726:	90                   	nop
80101727:	90                   	nop
80101728:	90                   	nop
80101729:	90                   	nop
8010172a:	90                   	nop
8010172b:	90                   	nop
8010172c:	90                   	nop
8010172d:	90                   	nop
8010172e:	90                   	nop
8010172f:	90                   	nop

80101730 <iunlock>:
{
80101730:	55                   	push   %ebp
80101731:	89 e5                	mov    %esp,%ebp
80101733:	56                   	push   %esi
80101734:	53                   	push   %ebx
80101735:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101738:	85 db                	test   %ebx,%ebx
8010173a:	74 28                	je     80101764 <iunlock+0x34>
8010173c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010173f:	83 ec 0c             	sub    $0xc,%esp
80101742:	56                   	push   %esi
80101743:	e8 58 2d 00 00       	call   801044a0 <holdingsleep>
80101748:	83 c4 10             	add    $0x10,%esp
8010174b:	85 c0                	test   %eax,%eax
8010174d:	74 15                	je     80101764 <iunlock+0x34>
8010174f:	8b 43 08             	mov    0x8(%ebx),%eax
80101752:	85 c0                	test   %eax,%eax
80101754:	7e 0e                	jle    80101764 <iunlock+0x34>
  releasesleep(&ip->lock);
80101756:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101759:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010175c:	5b                   	pop    %ebx
8010175d:	5e                   	pop    %esi
8010175e:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
8010175f:	e9 fc 2c 00 00       	jmp    80104460 <releasesleep>
    panic("iunlock");
80101764:	83 ec 0c             	sub    $0xc,%esp
80101767:	68 bb 73 10 80       	push   $0x801073bb
8010176c:	e8 ff eb ff ff       	call   80100370 <panic>
80101771:	eb 0d                	jmp    80101780 <iput>
80101773:	90                   	nop
80101774:	90                   	nop
80101775:	90                   	nop
80101776:	90                   	nop
80101777:	90                   	nop
80101778:	90                   	nop
80101779:	90                   	nop
8010177a:	90                   	nop
8010177b:	90                   	nop
8010177c:	90                   	nop
8010177d:	90                   	nop
8010177e:	90                   	nop
8010177f:	90                   	nop

80101780 <iput>:
{
80101780:	55                   	push   %ebp
80101781:	89 e5                	mov    %esp,%ebp
80101783:	57                   	push   %edi
80101784:	56                   	push   %esi
80101785:	53                   	push   %ebx
80101786:	83 ec 28             	sub    $0x28,%esp
80101789:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&icache.lock);
8010178c:	68 c0 0a 11 80       	push   $0x80110ac0
80101791:	e8 5a 2d 00 00       	call   801044f0 <acquire>
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
80101796:	8b 46 08             	mov    0x8(%esi),%eax
80101799:	83 c4 10             	add    $0x10,%esp
8010179c:	83 f8 01             	cmp    $0x1,%eax
8010179f:	74 1f                	je     801017c0 <iput+0x40>
  ip->ref--;
801017a1:	83 e8 01             	sub    $0x1,%eax
801017a4:	89 46 08             	mov    %eax,0x8(%esi)
  release(&icache.lock);
801017a7:	c7 45 08 c0 0a 11 80 	movl   $0x80110ac0,0x8(%ebp)
}
801017ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017b1:	5b                   	pop    %ebx
801017b2:	5e                   	pop    %esi
801017b3:	5f                   	pop    %edi
801017b4:	5d                   	pop    %ebp
  release(&icache.lock);
801017b5:	e9 16 2f 00 00       	jmp    801046d0 <release>
801017ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
801017c0:	f6 46 4c 02          	testb  $0x2,0x4c(%esi)
801017c4:	74 db                	je     801017a1 <iput+0x21>
801017c6:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017cb:	75 d4                	jne    801017a1 <iput+0x21>
    release(&icache.lock);
801017cd:	83 ec 0c             	sub    $0xc,%esp
801017d0:	8d 5e 5c             	lea    0x5c(%esi),%ebx
801017d3:	8d be 8c 00 00 00    	lea    0x8c(%esi),%edi
801017d9:	68 c0 0a 11 80       	push   $0x80110ac0
801017de:	e8 ed 2e 00 00       	call   801046d0 <release>
801017e3:	83 c4 10             	add    $0x10,%esp
801017e6:	eb 0f                	jmp    801017f7 <iput+0x77>
801017e8:	90                   	nop
801017e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801017f0:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
801017f3:	39 fb                	cmp    %edi,%ebx
801017f5:	74 19                	je     80101810 <iput+0x90>
    if(ip->addrs[i]){
801017f7:	8b 13                	mov    (%ebx),%edx
801017f9:	85 d2                	test   %edx,%edx
801017fb:	74 f3                	je     801017f0 <iput+0x70>
      bfree(ip->dev, ip->addrs[i]);
801017fd:	8b 06                	mov    (%esi),%eax
801017ff:	e8 cc fb ff ff       	call   801013d0 <bfree>
      ip->addrs[i] = 0;
80101804:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010180a:	eb e4                	jmp    801017f0 <iput+0x70>
8010180c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101810:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101816:	85 c0                	test   %eax,%eax
80101818:	75 46                	jne    80101860 <iput+0xe0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010181a:	83 ec 0c             	sub    $0xc,%esp
  ip->size = 0;
8010181d:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101824:	56                   	push   %esi
80101825:	e8 76 fd ff ff       	call   801015a0 <iupdate>
    ip->type = 0;
8010182a:	31 c0                	xor    %eax,%eax
8010182c:	66 89 46 50          	mov    %ax,0x50(%esi)
    iupdate(ip);
80101830:	89 34 24             	mov    %esi,(%esp)
80101833:	e8 68 fd ff ff       	call   801015a0 <iupdate>
    acquire(&icache.lock);
80101838:	c7 04 24 c0 0a 11 80 	movl   $0x80110ac0,(%esp)
8010183f:	e8 ac 2c 00 00       	call   801044f0 <acquire>
    ip->flags = 0;
80101844:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010184b:	8b 46 08             	mov    0x8(%esi),%eax
8010184e:	83 c4 10             	add    $0x10,%esp
80101851:	e9 4b ff ff ff       	jmp    801017a1 <iput+0x21>
80101856:	8d 76 00             	lea    0x0(%esi),%esi
80101859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101860:	83 ec 08             	sub    $0x8,%esp
80101863:	50                   	push   %eax
80101864:	ff 36                	pushl  (%esi)
80101866:	e8 65 e8 ff ff       	call   801000d0 <bread>
8010186b:	83 c4 10             	add    $0x10,%esp
8010186e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
80101871:	8d 58 5c             	lea    0x5c(%eax),%ebx
80101874:	8d b8 5c 02 00 00    	lea    0x25c(%eax),%edi
8010187a:	eb 0b                	jmp    80101887 <iput+0x107>
8010187c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101880:	83 c3 04             	add    $0x4,%ebx
    for(j = 0; j < NINDIRECT; j++){
80101883:	39 df                	cmp    %ebx,%edi
80101885:	74 0f                	je     80101896 <iput+0x116>
      if(a[j])
80101887:	8b 13                	mov    (%ebx),%edx
80101889:	85 d2                	test   %edx,%edx
8010188b:	74 f3                	je     80101880 <iput+0x100>
        bfree(ip->dev, a[j]);
8010188d:	8b 06                	mov    (%esi),%eax
8010188f:	e8 3c fb ff ff       	call   801013d0 <bfree>
80101894:	eb ea                	jmp    80101880 <iput+0x100>
    brelse(bp);
80101896:	83 ec 0c             	sub    $0xc,%esp
80101899:	ff 75 e4             	pushl  -0x1c(%ebp)
8010189c:	e8 3f e9 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018a1:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018a7:	8b 06                	mov    (%esi),%eax
801018a9:	e8 22 fb ff ff       	call   801013d0 <bfree>
    ip->addrs[NDIRECT] = 0;
801018ae:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018b5:	00 00 00 
801018b8:	83 c4 10             	add    $0x10,%esp
801018bb:	e9 5a ff ff ff       	jmp    8010181a <iput+0x9a>

801018c0 <iunlockput>:
{
801018c0:	55                   	push   %ebp
801018c1:	89 e5                	mov    %esp,%ebp
801018c3:	53                   	push   %ebx
801018c4:	83 ec 10             	sub    $0x10,%esp
801018c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
801018ca:	53                   	push   %ebx
801018cb:	e8 60 fe ff ff       	call   80101730 <iunlock>
  iput(ip);
801018d0:	89 5d 08             	mov    %ebx,0x8(%ebp)
801018d3:	83 c4 10             	add    $0x10,%esp
}
801018d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801018d9:	c9                   	leave  
  iput(ip);
801018da:	e9 a1 fe ff ff       	jmp    80101780 <iput>
801018df:	90                   	nop

801018e0 <stati>:
}

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
801018e0:	55                   	push   %ebp
801018e1:	89 e5                	mov    %esp,%ebp
801018e3:	8b 55 08             	mov    0x8(%ebp),%edx
801018e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
801018e9:	8b 0a                	mov    (%edx),%ecx
801018eb:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
801018ee:	8b 4a 04             	mov    0x4(%edx),%ecx
801018f1:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
801018f4:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
801018f8:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
801018fb:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
801018ff:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101903:	8b 52 58             	mov    0x58(%edx),%edx
80101906:	89 50 10             	mov    %edx,0x10(%eax)
}
80101909:	5d                   	pop    %ebp
8010190a:	c3                   	ret    
8010190b:	90                   	nop
8010190c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101910 <readi>:

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101910:	55                   	push   %ebp
80101911:	89 e5                	mov    %esp,%ebp
80101913:	57                   	push   %edi
80101914:	56                   	push   %esi
80101915:	53                   	push   %ebx
80101916:	83 ec 1c             	sub    $0x1c,%esp
80101919:	8b 45 08             	mov    0x8(%ebp),%eax
8010191c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010191f:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101922:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101927:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010192a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010192d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101930:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  if(ip->type == T_DEV){
80101933:	0f 84 a7 00 00 00    	je     801019e0 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101939:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010193c:	8b 40 58             	mov    0x58(%eax),%eax
8010193f:	39 f0                	cmp    %esi,%eax
80101941:	0f 82 ba 00 00 00    	jb     80101a01 <readi+0xf1>
80101947:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010194a:	89 f9                	mov    %edi,%ecx
8010194c:	01 f1                	add    %esi,%ecx
8010194e:	0f 82 ad 00 00 00    	jb     80101a01 <readi+0xf1>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101954:	89 c2                	mov    %eax,%edx
80101956:	29 f2                	sub    %esi,%edx
80101958:	39 c8                	cmp    %ecx,%eax
8010195a:	0f 43 d7             	cmovae %edi,%edx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010195d:	31 ff                	xor    %edi,%edi
8010195f:	85 d2                	test   %edx,%edx
    n = ip->size - off;
80101961:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101964:	74 6c                	je     801019d2 <readi+0xc2>
80101966:	8d 76 00             	lea    0x0(%esi),%esi
80101969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101970:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101973:	89 f2                	mov    %esi,%edx
80101975:	c1 ea 09             	shr    $0x9,%edx
80101978:	89 d8                	mov    %ebx,%eax
8010197a:	e8 41 f9 ff ff       	call   801012c0 <bmap>
8010197f:	83 ec 08             	sub    $0x8,%esp
80101982:	50                   	push   %eax
80101983:	ff 33                	pushl  (%ebx)
80101985:	e8 46 e7 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
8010198a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
8010198d:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
8010198f:	89 f0                	mov    %esi,%eax
80101991:	25 ff 01 00 00       	and    $0x1ff,%eax
80101996:	b9 00 02 00 00       	mov    $0x200,%ecx
8010199b:	83 c4 0c             	add    $0xc,%esp
8010199e:	29 c1                	sub    %eax,%ecx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019a0:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
801019a4:	89 55 dc             	mov    %edx,-0x24(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
801019a7:	29 fb                	sub    %edi,%ebx
801019a9:	39 d9                	cmp    %ebx,%ecx
801019ab:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
801019ae:	53                   	push   %ebx
801019af:	50                   	push   %eax
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019b0:	01 df                	add    %ebx,%edi
    memmove(dst, bp->data + off%BSIZE, m);
801019b2:	ff 75 e0             	pushl  -0x20(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019b5:	01 de                	add    %ebx,%esi
    memmove(dst, bp->data + off%BSIZE, m);
801019b7:	e8 14 2e 00 00       	call   801047d0 <memmove>
    brelse(bp);
801019bc:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019bf:	89 14 24             	mov    %edx,(%esp)
801019c2:	e8 19 e8 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019c7:	01 5d e0             	add    %ebx,-0x20(%ebp)
801019ca:	83 c4 10             	add    $0x10,%esp
801019cd:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801019d0:	77 9e                	ja     80101970 <readi+0x60>
  }
  return n;
801019d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
801019d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019d8:	5b                   	pop    %ebx
801019d9:	5e                   	pop    %esi
801019da:	5f                   	pop    %edi
801019db:	5d                   	pop    %ebp
801019dc:	c3                   	ret    
801019dd:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
801019e0:	0f bf 40 52          	movswl 0x52(%eax),%eax
801019e4:	66 83 f8 09          	cmp    $0x9,%ax
801019e8:	77 17                	ja     80101a01 <readi+0xf1>
801019ea:	8b 04 c5 40 0a 11 80 	mov    -0x7feef5c0(,%eax,8),%eax
801019f1:	85 c0                	test   %eax,%eax
801019f3:	74 0c                	je     80101a01 <readi+0xf1>
    return devsw[ip->major].read(ip, dst, n);
801019f5:	89 7d 10             	mov    %edi,0x10(%ebp)
}
801019f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019fb:	5b                   	pop    %ebx
801019fc:	5e                   	pop    %esi
801019fd:	5f                   	pop    %edi
801019fe:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
801019ff:	ff e0                	jmp    *%eax
      return -1;
80101a01:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a06:	eb cd                	jmp    801019d5 <readi+0xc5>
80101a08:	90                   	nop
80101a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101a10 <writei>:

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a10:	55                   	push   %ebp
80101a11:	89 e5                	mov    %esp,%ebp
80101a13:	57                   	push   %edi
80101a14:	56                   	push   %esi
80101a15:	53                   	push   %ebx
80101a16:	83 ec 1c             	sub    $0x1c,%esp
80101a19:	8b 45 08             	mov    0x8(%ebp),%eax
80101a1c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a1f:	8b 4d 14             	mov    0x14(%ebp),%ecx
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a22:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101a27:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a2a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a2d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a30:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  if(ip->type == T_DEV){
80101a33:	0f 84 b7 00 00 00    	je     80101af0 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a39:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a3c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a3f:	0f 82 eb 00 00 00    	jb     80101b30 <writei+0x120>
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101a45:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101a48:	89 c8                	mov    %ecx,%eax
80101a4a:	01 f0                	add    %esi,%eax
80101a4c:	0f 82 de 00 00 00    	jb     80101b30 <writei+0x120>
80101a52:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a57:	0f 87 d3 00 00 00    	ja     80101b30 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101a5d:	85 c9                	test   %ecx,%ecx
80101a5f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101a66:	74 79                	je     80101ae1 <writei+0xd1>
80101a68:	90                   	nop
80101a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a70:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101a73:	89 f2                	mov    %esi,%edx
80101a75:	c1 ea 09             	shr    $0x9,%edx
80101a78:	89 f8                	mov    %edi,%eax
80101a7a:	e8 41 f8 ff ff       	call   801012c0 <bmap>
80101a7f:	83 ec 08             	sub    $0x8,%esp
80101a82:	50                   	push   %eax
80101a83:	ff 37                	pushl  (%edi)
80101a85:	e8 46 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101a8a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101a8d:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a90:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101a92:	89 f0                	mov    %esi,%eax
80101a94:	b9 00 02 00 00       	mov    $0x200,%ecx
80101a99:	83 c4 0c             	add    $0xc,%esp
80101a9c:	25 ff 01 00 00       	and    $0x1ff,%eax
80101aa1:	29 c1                	sub    %eax,%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101aa3:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101aa7:	39 d9                	cmp    %ebx,%ecx
80101aa9:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101aac:	53                   	push   %ebx
80101aad:	ff 75 dc             	pushl  -0x24(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ab0:	01 de                	add    %ebx,%esi
    memmove(bp->data + off%BSIZE, src, m);
80101ab2:	50                   	push   %eax
80101ab3:	e8 18 2d 00 00       	call   801047d0 <memmove>
    log_write(bp);
80101ab8:	89 3c 24             	mov    %edi,(%esp)
80101abb:	e8 f0 12 00 00       	call   80102db0 <log_write>
    brelse(bp);
80101ac0:	89 3c 24             	mov    %edi,(%esp)
80101ac3:	e8 18 e7 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ac8:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101acb:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101ace:	83 c4 10             	add    $0x10,%esp
80101ad1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101ad4:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101ad7:	77 97                	ja     80101a70 <writei+0x60>
  }

  if(n > 0 && off > ip->size){
80101ad9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101adc:	3b 70 58             	cmp    0x58(%eax),%esi
80101adf:	77 37                	ja     80101b18 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101ae1:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101ae4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ae7:	5b                   	pop    %ebx
80101ae8:	5e                   	pop    %esi
80101ae9:	5f                   	pop    %edi
80101aea:	5d                   	pop    %ebp
80101aeb:	c3                   	ret    
80101aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101af0:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101af4:	66 83 f8 09          	cmp    $0x9,%ax
80101af8:	77 36                	ja     80101b30 <writei+0x120>
80101afa:	8b 04 c5 44 0a 11 80 	mov    -0x7feef5bc(,%eax,8),%eax
80101b01:	85 c0                	test   %eax,%eax
80101b03:	74 2b                	je     80101b30 <writei+0x120>
    return devsw[ip->major].write(ip, src, n);
80101b05:	89 4d 10             	mov    %ecx,0x10(%ebp)
}
80101b08:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b0b:	5b                   	pop    %ebx
80101b0c:	5e                   	pop    %esi
80101b0d:	5f                   	pop    %edi
80101b0e:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101b0f:	ff e0                	jmp    *%eax
80101b11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ip->size = off;
80101b18:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b1b:	83 ec 0c             	sub    $0xc,%esp
    ip->size = off;
80101b1e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b21:	50                   	push   %eax
80101b22:	e8 79 fa ff ff       	call   801015a0 <iupdate>
80101b27:	83 c4 10             	add    $0x10,%esp
80101b2a:	eb b5                	jmp    80101ae1 <writei+0xd1>
80101b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80101b30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b35:	eb ad                	jmp    80101ae4 <writei+0xd4>
80101b37:	89 f6                	mov    %esi,%esi
80101b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b40 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b40:	55                   	push   %ebp
80101b41:	89 e5                	mov    %esp,%ebp
80101b43:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101b46:	6a 0e                	push   $0xe
80101b48:	ff 75 0c             	pushl  0xc(%ebp)
80101b4b:	ff 75 08             	pushl  0x8(%ebp)
80101b4e:	e8 ed 2c 00 00       	call   80104840 <strncmp>
}
80101b53:	c9                   	leave  
80101b54:	c3                   	ret    
80101b55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b60 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101b60:	55                   	push   %ebp
80101b61:	89 e5                	mov    %esp,%ebp
80101b63:	57                   	push   %edi
80101b64:	56                   	push   %esi
80101b65:	53                   	push   %ebx
80101b66:	83 ec 1c             	sub    $0x1c,%esp
80101b69:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101b6c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101b71:	0f 85 80 00 00 00    	jne    80101bf7 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101b77:	8b 53 58             	mov    0x58(%ebx),%edx
80101b7a:	31 ff                	xor    %edi,%edi
80101b7c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101b7f:	85 d2                	test   %edx,%edx
80101b81:	75 0d                	jne    80101b90 <dirlookup+0x30>
80101b83:	eb 5b                	jmp    80101be0 <dirlookup+0x80>
80101b85:	8d 76 00             	lea    0x0(%esi),%esi
80101b88:	83 c7 10             	add    $0x10,%edi
80101b8b:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101b8e:	76 50                	jbe    80101be0 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101b90:	6a 10                	push   $0x10
80101b92:	57                   	push   %edi
80101b93:	56                   	push   %esi
80101b94:	53                   	push   %ebx
80101b95:	e8 76 fd ff ff       	call   80101910 <readi>
80101b9a:	83 c4 10             	add    $0x10,%esp
80101b9d:	83 f8 10             	cmp    $0x10,%eax
80101ba0:	75 48                	jne    80101bea <dirlookup+0x8a>
      panic("dirlink read");
    if(de.inum == 0)
80101ba2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101ba7:	74 df                	je     80101b88 <dirlookup+0x28>
  return strncmp(s, t, DIRSIZ);
80101ba9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bac:	83 ec 04             	sub    $0x4,%esp
80101baf:	6a 0e                	push   $0xe
80101bb1:	50                   	push   %eax
80101bb2:	ff 75 0c             	pushl  0xc(%ebp)
80101bb5:	e8 86 2c 00 00       	call   80104840 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101bba:	83 c4 10             	add    $0x10,%esp
80101bbd:	85 c0                	test   %eax,%eax
80101bbf:	75 c7                	jne    80101b88 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101bc1:	8b 45 10             	mov    0x10(%ebp),%eax
80101bc4:	85 c0                	test   %eax,%eax
80101bc6:	74 05                	je     80101bcd <dirlookup+0x6d>
        *poff = off;
80101bc8:	8b 45 10             	mov    0x10(%ebp),%eax
80101bcb:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101bcd:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101bd1:	8b 03                	mov    (%ebx),%eax
80101bd3:	e8 18 f6 ff ff       	call   801011f0 <iget>
    }
  }

  return 0;
}
80101bd8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101bdb:	5b                   	pop    %ebx
80101bdc:	5e                   	pop    %esi
80101bdd:	5f                   	pop    %edi
80101bde:	5d                   	pop    %ebp
80101bdf:	c3                   	ret    
80101be0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80101be3:	31 c0                	xor    %eax,%eax
}
80101be5:	5b                   	pop    %ebx
80101be6:	5e                   	pop    %esi
80101be7:	5f                   	pop    %edi
80101be8:	5d                   	pop    %ebp
80101be9:	c3                   	ret    
      panic("dirlink read");
80101bea:	83 ec 0c             	sub    $0xc,%esp
80101bed:	68 d5 73 10 80       	push   $0x801073d5
80101bf2:	e8 79 e7 ff ff       	call   80100370 <panic>
    panic("dirlookup not DIR");
80101bf7:	83 ec 0c             	sub    $0xc,%esp
80101bfa:	68 c3 73 10 80       	push   $0x801073c3
80101bff:	e8 6c e7 ff ff       	call   80100370 <panic>
80101c04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c10 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c10:	55                   	push   %ebp
80101c11:	89 e5                	mov    %esp,%ebp
80101c13:	57                   	push   %edi
80101c14:	56                   	push   %esi
80101c15:	53                   	push   %ebx
80101c16:	89 cf                	mov    %ecx,%edi
80101c18:	89 c3                	mov    %eax,%ebx
80101c1a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c1d:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101c20:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(*path == '/')
80101c23:	0f 84 55 01 00 00    	je     80101d7e <namex+0x16e>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101c29:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  acquire(&icache.lock);
80101c2f:	83 ec 0c             	sub    $0xc,%esp
    ip = idup(proc->cwd);
80101c32:	8b 70 68             	mov    0x68(%eax),%esi
  acquire(&icache.lock);
80101c35:	68 c0 0a 11 80       	push   $0x80110ac0
80101c3a:	e8 b1 28 00 00       	call   801044f0 <acquire>
  ip->ref++;
80101c3f:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101c43:	c7 04 24 c0 0a 11 80 	movl   $0x80110ac0,(%esp)
80101c4a:	e8 81 2a 00 00       	call   801046d0 <release>
80101c4f:	83 c4 10             	add    $0x10,%esp
80101c52:	eb 07                	jmp    80101c5b <namex+0x4b>
80101c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101c58:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101c5b:	0f b6 03             	movzbl (%ebx),%eax
80101c5e:	3c 2f                	cmp    $0x2f,%al
80101c60:	74 f6                	je     80101c58 <namex+0x48>
  if(*path == 0)
80101c62:	84 c0                	test   %al,%al
80101c64:	0f 84 e3 00 00 00    	je     80101d4d <namex+0x13d>
  while(*path != '/' && *path != 0)
80101c6a:	0f b6 03             	movzbl (%ebx),%eax
80101c6d:	89 da                	mov    %ebx,%edx
80101c6f:	84 c0                	test   %al,%al
80101c71:	0f 84 ac 00 00 00    	je     80101d23 <namex+0x113>
80101c77:	3c 2f                	cmp    $0x2f,%al
80101c79:	75 09                	jne    80101c84 <namex+0x74>
80101c7b:	e9 a3 00 00 00       	jmp    80101d23 <namex+0x113>
80101c80:	84 c0                	test   %al,%al
80101c82:	74 0a                	je     80101c8e <namex+0x7e>
    path++;
80101c84:	83 c2 01             	add    $0x1,%edx
  while(*path != '/' && *path != 0)
80101c87:	0f b6 02             	movzbl (%edx),%eax
80101c8a:	3c 2f                	cmp    $0x2f,%al
80101c8c:	75 f2                	jne    80101c80 <namex+0x70>
80101c8e:	89 d1                	mov    %edx,%ecx
80101c90:	29 d9                	sub    %ebx,%ecx
  if(len >= DIRSIZ)
80101c92:	83 f9 0d             	cmp    $0xd,%ecx
80101c95:	0f 8e 8d 00 00 00    	jle    80101d28 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101c9b:	83 ec 04             	sub    $0x4,%esp
80101c9e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101ca1:	6a 0e                	push   $0xe
80101ca3:	53                   	push   %ebx
80101ca4:	57                   	push   %edi
80101ca5:	e8 26 2b 00 00       	call   801047d0 <memmove>
    path++;
80101caa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    memmove(name, s, DIRSIZ);
80101cad:	83 c4 10             	add    $0x10,%esp
    path++;
80101cb0:	89 d3                	mov    %edx,%ebx
  while(*path == '/')
80101cb2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101cb5:	75 11                	jne    80101cc8 <namex+0xb8>
80101cb7:	89 f6                	mov    %esi,%esi
80101cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101cc0:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101cc3:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101cc6:	74 f8                	je     80101cc0 <namex+0xb0>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101cc8:	83 ec 0c             	sub    $0xc,%esp
80101ccb:	56                   	push   %esi
80101ccc:	e8 7f f9 ff ff       	call   80101650 <ilock>
    if(ip->type != T_DIR){
80101cd1:	83 c4 10             	add    $0x10,%esp
80101cd4:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101cd9:	0f 85 7f 00 00 00    	jne    80101d5e <namex+0x14e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101cdf:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101ce2:	85 d2                	test   %edx,%edx
80101ce4:	74 09                	je     80101cef <namex+0xdf>
80101ce6:	80 3b 00             	cmpb   $0x0,(%ebx)
80101ce9:	0f 84 a5 00 00 00    	je     80101d94 <namex+0x184>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101cef:	83 ec 04             	sub    $0x4,%esp
80101cf2:	6a 00                	push   $0x0
80101cf4:	57                   	push   %edi
80101cf5:	56                   	push   %esi
80101cf6:	e8 65 fe ff ff       	call   80101b60 <dirlookup>
80101cfb:	83 c4 10             	add    $0x10,%esp
80101cfe:	85 c0                	test   %eax,%eax
80101d00:	74 5c                	je     80101d5e <namex+0x14e>
  iunlock(ip);
80101d02:	83 ec 0c             	sub    $0xc,%esp
80101d05:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d08:	56                   	push   %esi
80101d09:	e8 22 fa ff ff       	call   80101730 <iunlock>
  iput(ip);
80101d0e:	89 34 24             	mov    %esi,(%esp)
80101d11:	e8 6a fa ff ff       	call   80101780 <iput>
80101d16:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d19:	83 c4 10             	add    $0x10,%esp
80101d1c:	89 c6                	mov    %eax,%esi
80101d1e:	e9 38 ff ff ff       	jmp    80101c5b <namex+0x4b>
  while(*path != '/' && *path != 0)
80101d23:	31 c9                	xor    %ecx,%ecx
80101d25:	8d 76 00             	lea    0x0(%esi),%esi
    memmove(name, s, len);
80101d28:	83 ec 04             	sub    $0x4,%esp
80101d2b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d2e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d31:	51                   	push   %ecx
80101d32:	53                   	push   %ebx
80101d33:	57                   	push   %edi
80101d34:	e8 97 2a 00 00       	call   801047d0 <memmove>
    name[len] = 0;
80101d39:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d3c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d3f:	83 c4 10             	add    $0x10,%esp
80101d42:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d46:	89 d3                	mov    %edx,%ebx
80101d48:	e9 65 ff ff ff       	jmp    80101cb2 <namex+0xa2>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d4d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d50:	85 c0                	test   %eax,%eax
80101d52:	75 56                	jne    80101daa <namex+0x19a>
    iput(ip);
    return 0;
  }
  return ip;
}
80101d54:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d57:	89 f0                	mov    %esi,%eax
80101d59:	5b                   	pop    %ebx
80101d5a:	5e                   	pop    %esi
80101d5b:	5f                   	pop    %edi
80101d5c:	5d                   	pop    %ebp
80101d5d:	c3                   	ret    
  iunlock(ip);
80101d5e:	83 ec 0c             	sub    $0xc,%esp
80101d61:	56                   	push   %esi
80101d62:	e8 c9 f9 ff ff       	call   80101730 <iunlock>
  iput(ip);
80101d67:	89 34 24             	mov    %esi,(%esp)
      return 0;
80101d6a:	31 f6                	xor    %esi,%esi
  iput(ip);
80101d6c:	e8 0f fa ff ff       	call   80101780 <iput>
      return 0;
80101d71:	83 c4 10             	add    $0x10,%esp
}
80101d74:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d77:	89 f0                	mov    %esi,%eax
80101d79:	5b                   	pop    %ebx
80101d7a:	5e                   	pop    %esi
80101d7b:	5f                   	pop    %edi
80101d7c:	5d                   	pop    %ebp
80101d7d:	c3                   	ret    
    ip = iget(ROOTDEV, ROOTINO);
80101d7e:	ba 01 00 00 00       	mov    $0x1,%edx
80101d83:	b8 01 00 00 00       	mov    $0x1,%eax
80101d88:	e8 63 f4 ff ff       	call   801011f0 <iget>
80101d8d:	89 c6                	mov    %eax,%esi
80101d8f:	e9 c7 fe ff ff       	jmp    80101c5b <namex+0x4b>
      iunlock(ip);
80101d94:	83 ec 0c             	sub    $0xc,%esp
80101d97:	56                   	push   %esi
80101d98:	e8 93 f9 ff ff       	call   80101730 <iunlock>
      return ip;
80101d9d:	83 c4 10             	add    $0x10,%esp
}
80101da0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101da3:	89 f0                	mov    %esi,%eax
80101da5:	5b                   	pop    %ebx
80101da6:	5e                   	pop    %esi
80101da7:	5f                   	pop    %edi
80101da8:	5d                   	pop    %ebp
80101da9:	c3                   	ret    
    iput(ip);
80101daa:	83 ec 0c             	sub    $0xc,%esp
80101dad:	56                   	push   %esi
    return 0;
80101dae:	31 f6                	xor    %esi,%esi
    iput(ip);
80101db0:	e8 cb f9 ff ff       	call   80101780 <iput>
    return 0;
80101db5:	83 c4 10             	add    $0x10,%esp
80101db8:	eb 9a                	jmp    80101d54 <namex+0x144>
80101dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101dc0 <dirlink>:
{
80101dc0:	55                   	push   %ebp
80101dc1:	89 e5                	mov    %esp,%ebp
80101dc3:	57                   	push   %edi
80101dc4:	56                   	push   %esi
80101dc5:	53                   	push   %ebx
80101dc6:	83 ec 20             	sub    $0x20,%esp
80101dc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
80101dcc:	6a 00                	push   $0x0
80101dce:	ff 75 0c             	pushl  0xc(%ebp)
80101dd1:	53                   	push   %ebx
80101dd2:	e8 89 fd ff ff       	call   80101b60 <dirlookup>
80101dd7:	83 c4 10             	add    $0x10,%esp
80101dda:	85 c0                	test   %eax,%eax
80101ddc:	75 67                	jne    80101e45 <dirlink+0x85>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101dde:	8b 7b 58             	mov    0x58(%ebx),%edi
80101de1:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101de4:	85 ff                	test   %edi,%edi
80101de6:	74 29                	je     80101e11 <dirlink+0x51>
80101de8:	31 ff                	xor    %edi,%edi
80101dea:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101ded:	eb 09                	jmp    80101df8 <dirlink+0x38>
80101def:	90                   	nop
80101df0:	83 c7 10             	add    $0x10,%edi
80101df3:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101df6:	76 19                	jbe    80101e11 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101df8:	6a 10                	push   $0x10
80101dfa:	57                   	push   %edi
80101dfb:	56                   	push   %esi
80101dfc:	53                   	push   %ebx
80101dfd:	e8 0e fb ff ff       	call   80101910 <readi>
80101e02:	83 c4 10             	add    $0x10,%esp
80101e05:	83 f8 10             	cmp    $0x10,%eax
80101e08:	75 4e                	jne    80101e58 <dirlink+0x98>
    if(de.inum == 0)
80101e0a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e0f:	75 df                	jne    80101df0 <dirlink+0x30>
  strncpy(de.name, name, DIRSIZ);
80101e11:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e14:	83 ec 04             	sub    $0x4,%esp
80101e17:	6a 0e                	push   $0xe
80101e19:	ff 75 0c             	pushl  0xc(%ebp)
80101e1c:	50                   	push   %eax
80101e1d:	e8 7e 2a 00 00       	call   801048a0 <strncpy>
  de.inum = inum;
80101e22:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e25:	6a 10                	push   $0x10
80101e27:	57                   	push   %edi
80101e28:	56                   	push   %esi
80101e29:	53                   	push   %ebx
  de.inum = inum;
80101e2a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e2e:	e8 dd fb ff ff       	call   80101a10 <writei>
80101e33:	83 c4 20             	add    $0x20,%esp
80101e36:	83 f8 10             	cmp    $0x10,%eax
80101e39:	75 2a                	jne    80101e65 <dirlink+0xa5>
  return 0;
80101e3b:	31 c0                	xor    %eax,%eax
}
80101e3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e40:	5b                   	pop    %ebx
80101e41:	5e                   	pop    %esi
80101e42:	5f                   	pop    %edi
80101e43:	5d                   	pop    %ebp
80101e44:	c3                   	ret    
    iput(ip);
80101e45:	83 ec 0c             	sub    $0xc,%esp
80101e48:	50                   	push   %eax
80101e49:	e8 32 f9 ff ff       	call   80101780 <iput>
    return -1;
80101e4e:	83 c4 10             	add    $0x10,%esp
80101e51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e56:	eb e5                	jmp    80101e3d <dirlink+0x7d>
      panic("dirlink read");
80101e58:	83 ec 0c             	sub    $0xc,%esp
80101e5b:	68 d5 73 10 80       	push   $0x801073d5
80101e60:	e8 0b e5 ff ff       	call   80100370 <panic>
    panic("dirlink");
80101e65:	83 ec 0c             	sub    $0xc,%esp
80101e68:	68 4a 7b 10 80       	push   $0x80107b4a
80101e6d:	e8 fe e4 ff ff       	call   80100370 <panic>
80101e72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101e80 <namei>:

struct inode*
namei(char *path)
{
80101e80:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101e81:	31 d2                	xor    %edx,%edx
{
80101e83:	89 e5                	mov    %esp,%ebp
80101e85:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
80101e88:	8b 45 08             	mov    0x8(%ebp),%eax
80101e8b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101e8e:	e8 7d fd ff ff       	call   80101c10 <namex>
}
80101e93:	c9                   	leave  
80101e94:	c3                   	ret    
80101e95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ea0 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101ea0:	55                   	push   %ebp
  return namex(path, 1, name);
80101ea1:	ba 01 00 00 00       	mov    $0x1,%edx
{
80101ea6:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101ea8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101eab:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101eae:	5d                   	pop    %ebp
  return namex(path, 1, name);
80101eaf:	e9 5c fd ff ff       	jmp    80101c10 <namex>
80101eb4:	66 90                	xchg   %ax,%ax
80101eb6:	66 90                	xchg   %ax,%ax
80101eb8:	66 90                	xchg   %ax,%ax
80101eba:	66 90                	xchg   %ax,%ax
80101ebc:	66 90                	xchg   %ax,%ax
80101ebe:	66 90                	xchg   %ax,%ax

80101ec0 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101ec0:	55                   	push   %ebp
  if(b == 0)
80101ec1:	85 c0                	test   %eax,%eax
{
80101ec3:	89 e5                	mov    %esp,%ebp
80101ec5:	56                   	push   %esi
80101ec6:	53                   	push   %ebx
  if(b == 0)
80101ec7:	0f 84 ad 00 00 00    	je     80101f7a <idestart+0xba>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101ecd:	8b 58 08             	mov    0x8(%eax),%ebx
80101ed0:	89 c1                	mov    %eax,%ecx
80101ed2:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101ed8:	0f 87 8f 00 00 00    	ja     80101f6d <idestart+0xad>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101ede:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101ee3:	90                   	nop
80101ee4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ee8:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101ee9:	83 e0 c0             	and    $0xffffffc0,%eax
80101eec:	3c 40                	cmp    $0x40,%al
80101eee:	75 f8                	jne    80101ee8 <idestart+0x28>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101ef0:	31 f6                	xor    %esi,%esi
80101ef2:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101ef7:	89 f0                	mov    %esi,%eax
80101ef9:	ee                   	out    %al,(%dx)
80101efa:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101eff:	b8 01 00 00 00       	mov    $0x1,%eax
80101f04:	ee                   	out    %al,(%dx)
80101f05:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f0a:	89 d8                	mov    %ebx,%eax
80101f0c:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101f0d:	89 d8                	mov    %ebx,%eax
80101f0f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f14:	c1 f8 08             	sar    $0x8,%eax
80101f17:	ee                   	out    %al,(%dx)
80101f18:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f1d:	89 f0                	mov    %esi,%eax
80101f1f:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101f20:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f24:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f29:	c1 e0 04             	shl    $0x4,%eax
80101f2c:	83 e0 10             	and    $0x10,%eax
80101f2f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f32:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101f33:	f6 01 04             	testb  $0x4,(%ecx)
80101f36:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f3b:	75 13                	jne    80101f50 <idestart+0x90>
80101f3d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f42:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f43:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f46:	5b                   	pop    %ebx
80101f47:	5e                   	pop    %esi
80101f48:	5d                   	pop    %ebp
80101f49:	c3                   	ret    
80101f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f50:	b8 30 00 00 00       	mov    $0x30,%eax
80101f55:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
80101f56:	ba f0 01 00 00       	mov    $0x1f0,%edx
    outsl(0x1f0, b->data, BSIZE/4);
80101f5b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f5e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101f63:	fc                   	cld    
80101f64:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
80101f66:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f69:	5b                   	pop    %ebx
80101f6a:	5e                   	pop    %esi
80101f6b:	5d                   	pop    %ebp
80101f6c:	c3                   	ret    
    panic("incorrect blockno");
80101f6d:	83 ec 0c             	sub    $0xc,%esp
80101f70:	68 40 74 10 80       	push   $0x80107440
80101f75:	e8 f6 e3 ff ff       	call   80100370 <panic>
    panic("idestart");
80101f7a:	83 ec 0c             	sub    $0xc,%esp
80101f7d:	68 37 74 10 80       	push   $0x80107437
80101f82:	e8 e9 e3 ff ff       	call   80100370 <panic>
80101f87:	89 f6                	mov    %esi,%esi
80101f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f90 <ideinit>:
{
80101f90:	55                   	push   %ebp
80101f91:	89 e5                	mov    %esp,%ebp
80101f93:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
80101f96:	68 52 74 10 80       	push   $0x80107452
80101f9b:	68 e0 a5 10 80       	push   $0x8010a5e0
80101fa0:	e8 2b 25 00 00       	call   801044d0 <initlock>
  picenable(IRQ_IDE);
80101fa5:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80101fac:	e8 df 12 00 00       	call   80103290 <picenable>
  ioapicenable(IRQ_IDE, ncpu - 1);
80101fb1:	58                   	pop    %eax
80101fb2:	a1 40 2e 11 80       	mov    0x80112e40,%eax
80101fb7:	5a                   	pop    %edx
80101fb8:	83 e8 01             	sub    $0x1,%eax
80101fbb:	50                   	push   %eax
80101fbc:	6a 0e                	push   $0xe
80101fbe:	e8 bd 02 00 00       	call   80102280 <ioapicenable>
80101fc3:	83 c4 10             	add    $0x10,%esp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101fc6:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fcb:	90                   	nop
80101fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101fd0:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101fd1:	83 e0 c0             	and    $0xffffffc0,%eax
80101fd4:	3c 40                	cmp    $0x40,%al
80101fd6:	75 f8                	jne    80101fd0 <ideinit+0x40>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101fd8:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fdd:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80101fe2:	ee                   	out    %al,(%dx)
80101fe3:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101fe8:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fed:	eb 06                	jmp    80101ff5 <ideinit+0x65>
80101fef:	90                   	nop
  for(i=0; i<1000; i++){
80101ff0:	83 e9 01             	sub    $0x1,%ecx
80101ff3:	74 0f                	je     80102004 <ideinit+0x74>
80101ff5:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80101ff6:	84 c0                	test   %al,%al
80101ff8:	74 f6                	je     80101ff0 <ideinit+0x60>
      havedisk1 = 1;
80101ffa:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80102001:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102004:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102009:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010200e:	ee                   	out    %al,(%dx)
}
8010200f:	c9                   	leave  
80102010:	c3                   	ret    
80102011:	eb 0d                	jmp    80102020 <ideintr>
80102013:	90                   	nop
80102014:	90                   	nop
80102015:	90                   	nop
80102016:	90                   	nop
80102017:	90                   	nop
80102018:	90                   	nop
80102019:	90                   	nop
8010201a:	90                   	nop
8010201b:	90                   	nop
8010201c:	90                   	nop
8010201d:	90                   	nop
8010201e:	90                   	nop
8010201f:	90                   	nop

80102020 <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
80102020:	55                   	push   %ebp
80102021:	89 e5                	mov    %esp,%ebp
80102023:	57                   	push   %edi
80102024:	56                   	push   %esi
80102025:	53                   	push   %ebx
80102026:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102029:	68 e0 a5 10 80       	push   $0x8010a5e0
8010202e:	e8 bd 24 00 00       	call   801044f0 <acquire>
  if((b = idequeue) == 0){
80102033:	8b 1d c4 a5 10 80    	mov    0x8010a5c4,%ebx
80102039:	83 c4 10             	add    $0x10,%esp
8010203c:	85 db                	test   %ebx,%ebx
8010203e:	74 34                	je     80102074 <ideintr+0x54>
    release(&idelock);
    // cprintf("spurious IDE interrupt\n");
    return;
  }
  idequeue = b->qnext;
80102040:	8b 43 58             	mov    0x58(%ebx),%eax
80102043:	a3 c4 a5 10 80       	mov    %eax,0x8010a5c4

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102048:	8b 33                	mov    (%ebx),%esi
8010204a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102050:	74 3e                	je     80102090 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102052:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
80102055:	83 ec 0c             	sub    $0xc,%esp
  b->flags &= ~B_DIRTY;
80102058:	83 ce 02             	or     $0x2,%esi
8010205b:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
8010205d:	53                   	push   %ebx
8010205e:	e8 2d 20 00 00       	call   80104090 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102063:	a1 c4 a5 10 80       	mov    0x8010a5c4,%eax
80102068:	83 c4 10             	add    $0x10,%esp
8010206b:	85 c0                	test   %eax,%eax
8010206d:	74 05                	je     80102074 <ideintr+0x54>
    idestart(idequeue);
8010206f:	e8 4c fe ff ff       	call   80101ec0 <idestart>
    release(&idelock);
80102074:	83 ec 0c             	sub    $0xc,%esp
80102077:	68 e0 a5 10 80       	push   $0x8010a5e0
8010207c:	e8 4f 26 00 00       	call   801046d0 <release>

  release(&idelock);
}
80102081:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102084:	5b                   	pop    %ebx
80102085:	5e                   	pop    %esi
80102086:	5f                   	pop    %edi
80102087:	5d                   	pop    %ebp
80102088:	c3                   	ret    
80102089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102090:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102095:	8d 76 00             	lea    0x0(%esi),%esi
80102098:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102099:	89 c1                	mov    %eax,%ecx
8010209b:	83 e1 c0             	and    $0xffffffc0,%ecx
8010209e:	80 f9 40             	cmp    $0x40,%cl
801020a1:	75 f5                	jne    80102098 <ideintr+0x78>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020a3:	a8 21                	test   $0x21,%al
801020a5:	75 ab                	jne    80102052 <ideintr+0x32>
    insl(0x1f0, b->data, BSIZE/4);
801020a7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
801020aa:	b9 80 00 00 00       	mov    $0x80,%ecx
801020af:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020b4:	fc                   	cld    
801020b5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020b7:	8b 33                	mov    (%ebx),%esi
801020b9:	eb 97                	jmp    80102052 <ideintr+0x32>
801020bb:	90                   	nop
801020bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020c0 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801020c0:	55                   	push   %ebp
801020c1:	89 e5                	mov    %esp,%ebp
801020c3:	53                   	push   %ebx
801020c4:	83 ec 10             	sub    $0x10,%esp
801020c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
801020ca:	8d 43 0c             	lea    0xc(%ebx),%eax
801020cd:	50                   	push   %eax
801020ce:	e8 cd 23 00 00       	call   801044a0 <holdingsleep>
801020d3:	83 c4 10             	add    $0x10,%esp
801020d6:	85 c0                	test   %eax,%eax
801020d8:	0f 84 ad 00 00 00    	je     8010218b <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801020de:	8b 03                	mov    (%ebx),%eax
801020e0:	83 e0 06             	and    $0x6,%eax
801020e3:	83 f8 02             	cmp    $0x2,%eax
801020e6:	0f 84 b9 00 00 00    	je     801021a5 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
801020ec:	8b 53 04             	mov    0x4(%ebx),%edx
801020ef:	85 d2                	test   %edx,%edx
801020f1:	74 0d                	je     80102100 <iderw+0x40>
801020f3:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
801020f8:	85 c0                	test   %eax,%eax
801020fa:	0f 84 98 00 00 00    	je     80102198 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102100:	83 ec 0c             	sub    $0xc,%esp
80102103:	68 e0 a5 10 80       	push   $0x8010a5e0
80102108:	e8 e3 23 00 00       	call   801044f0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010210d:	8b 15 c4 a5 10 80    	mov    0x8010a5c4,%edx
80102113:	83 c4 10             	add    $0x10,%esp
  b->qnext = 0;
80102116:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010211d:	85 d2                	test   %edx,%edx
8010211f:	75 09                	jne    8010212a <iderw+0x6a>
80102121:	eb 58                	jmp    8010217b <iderw+0xbb>
80102123:	90                   	nop
80102124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102128:	89 c2                	mov    %eax,%edx
8010212a:	8b 42 58             	mov    0x58(%edx),%eax
8010212d:	85 c0                	test   %eax,%eax
8010212f:	75 f7                	jne    80102128 <iderw+0x68>
80102131:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80102134:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80102136:	3b 1d c4 a5 10 80    	cmp    0x8010a5c4,%ebx
8010213c:	74 44                	je     80102182 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010213e:	8b 03                	mov    (%ebx),%eax
80102140:	83 e0 06             	and    $0x6,%eax
80102143:	83 f8 02             	cmp    $0x2,%eax
80102146:	74 23                	je     8010216b <iderw+0xab>
80102148:	90                   	nop
80102149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
80102150:	83 ec 08             	sub    $0x8,%esp
80102153:	68 e0 a5 10 80       	push   $0x8010a5e0
80102158:	53                   	push   %ebx
80102159:	e8 72 1d 00 00       	call   80103ed0 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010215e:	8b 03                	mov    (%ebx),%eax
80102160:	83 c4 10             	add    $0x10,%esp
80102163:	83 e0 06             	and    $0x6,%eax
80102166:	83 f8 02             	cmp    $0x2,%eax
80102169:	75 e5                	jne    80102150 <iderw+0x90>
  }

  release(&idelock);
8010216b:	c7 45 08 e0 a5 10 80 	movl   $0x8010a5e0,0x8(%ebp)
}
80102172:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102175:	c9                   	leave  
  release(&idelock);
80102176:	e9 55 25 00 00       	jmp    801046d0 <release>
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010217b:	ba c4 a5 10 80       	mov    $0x8010a5c4,%edx
80102180:	eb b2                	jmp    80102134 <iderw+0x74>
    idestart(b);
80102182:	89 d8                	mov    %ebx,%eax
80102184:	e8 37 fd ff ff       	call   80101ec0 <idestart>
80102189:	eb b3                	jmp    8010213e <iderw+0x7e>
    panic("iderw: buf not locked");
8010218b:	83 ec 0c             	sub    $0xc,%esp
8010218e:	68 56 74 10 80       	push   $0x80107456
80102193:	e8 d8 e1 ff ff       	call   80100370 <panic>
    panic("iderw: ide disk 1 not present");
80102198:	83 ec 0c             	sub    $0xc,%esp
8010219b:	68 81 74 10 80       	push   $0x80107481
801021a0:	e8 cb e1 ff ff       	call   80100370 <panic>
    panic("iderw: nothing to do");
801021a5:	83 ec 0c             	sub    $0xc,%esp
801021a8:	68 6c 74 10 80       	push   $0x8010746c
801021ad:	e8 be e1 ff ff       	call   80100370 <panic>
801021b2:	66 90                	xchg   %ax,%ax
801021b4:	66 90                	xchg   %ax,%ax
801021b6:	66 90                	xchg   %ax,%ax
801021b8:	66 90                	xchg   %ax,%ax
801021ba:	66 90                	xchg   %ax,%ax
801021bc:	66 90                	xchg   %ax,%ax
801021be:	66 90                	xchg   %ax,%ax

801021c0 <ioapicinit>:
void
ioapicinit(void)
{
  int i, id, maxintr;

  if(!ismp)
801021c0:	a1 44 28 11 80       	mov    0x80112844,%eax
801021c5:	85 c0                	test   %eax,%eax
801021c7:	0f 84 a8 00 00 00    	je     80102275 <ioapicinit+0xb5>
{
801021cd:	55                   	push   %ebp
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
801021ce:	c7 05 14 27 11 80 00 	movl   $0xfec00000,0x80112714
801021d5:	00 c0 fe 
{
801021d8:	89 e5                	mov    %esp,%ebp
801021da:	56                   	push   %esi
801021db:	53                   	push   %ebx
  ioapic->reg = reg;
801021dc:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801021e3:	00 00 00 
  return ioapic->data;
801021e6:	8b 15 14 27 11 80    	mov    0x80112714,%edx
801021ec:	8b 72 10             	mov    0x10(%edx),%esi
  ioapic->reg = reg;
801021ef:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
801021f5:	8b 0d 14 27 11 80    	mov    0x80112714,%ecx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
801021fb:	0f b6 15 40 28 11 80 	movzbl 0x80112840,%edx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102202:	c1 ee 10             	shr    $0x10,%esi
80102205:	89 f0                	mov    %esi,%eax
80102207:	0f b6 f0             	movzbl %al,%esi
  return ioapic->data;
8010220a:	8b 41 10             	mov    0x10(%ecx),%eax
  id = ioapicread(REG_ID) >> 24;
8010220d:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
80102210:	39 d0                	cmp    %edx,%eax
80102212:	74 16                	je     8010222a <ioapicinit+0x6a>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102214:	83 ec 0c             	sub    $0xc,%esp
80102217:	68 a0 74 10 80       	push   $0x801074a0
8010221c:	e8 3f e4 ff ff       	call   80100660 <cprintf>
80102221:	8b 0d 14 27 11 80    	mov    0x80112714,%ecx
80102227:	83 c4 10             	add    $0x10,%esp
8010222a:	83 c6 21             	add    $0x21,%esi
{
8010222d:	ba 10 00 00 00       	mov    $0x10,%edx
80102232:	b8 20 00 00 00       	mov    $0x20,%eax
80102237:	89 f6                	mov    %esi,%esi
80102239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ioapic->reg = reg;
80102240:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
80102242:	8b 0d 14 27 11 80    	mov    0x80112714,%ecx

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80102248:	89 c3                	mov    %eax,%ebx
8010224a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102250:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
80102253:	89 59 10             	mov    %ebx,0x10(%ecx)
80102256:	8d 5a 01             	lea    0x1(%edx),%ebx
80102259:	83 c2 02             	add    $0x2,%edx
  for(i = 0; i <= maxintr; i++){
8010225c:	39 f0                	cmp    %esi,%eax
  ioapic->reg = reg;
8010225e:	89 19                	mov    %ebx,(%ecx)
  ioapic->data = data;
80102260:	8b 0d 14 27 11 80    	mov    0x80112714,%ecx
80102266:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  for(i = 0; i <= maxintr; i++){
8010226d:	75 d1                	jne    80102240 <ioapicinit+0x80>
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
8010226f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102272:	5b                   	pop    %ebx
80102273:	5e                   	pop    %esi
80102274:	5d                   	pop    %ebp
80102275:	f3 c3                	repz ret 
80102277:	89 f6                	mov    %esi,%esi
80102279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102280 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
  if(!ismp)
80102280:	8b 15 44 28 11 80    	mov    0x80112844,%edx
{
80102286:	55                   	push   %ebp
80102287:	89 e5                	mov    %esp,%ebp
  if(!ismp)
80102289:	85 d2                	test   %edx,%edx
{
8010228b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!ismp)
8010228e:	74 2b                	je     801022bb <ioapicenable+0x3b>
  ioapic->reg = reg;
80102290:	8b 0d 14 27 11 80    	mov    0x80112714,%ecx
    return;

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
80102296:	8d 50 20             	lea    0x20(%eax),%edx
80102299:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
  ioapic->reg = reg;
8010229d:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
8010229f:	8b 0d 14 27 11 80    	mov    0x80112714,%ecx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022a5:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
801022a8:	89 51 10             	mov    %edx,0x10(%ecx)
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  ioapic->reg = reg;
801022ae:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801022b0:	a1 14 27 11 80       	mov    0x80112714,%eax
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022b5:	c1 e2 18             	shl    $0x18,%edx
  ioapic->data = data;
801022b8:	89 50 10             	mov    %edx,0x10(%eax)
}
801022bb:	5d                   	pop    %ebp
801022bc:	c3                   	ret    
801022bd:	66 90                	xchg   %ax,%ax
801022bf:	90                   	nop

801022c0 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
801022c0:	55                   	push   %ebp
801022c1:	89 e5                	mov    %esp,%ebp
801022c3:	53                   	push   %ebx
801022c4:	83 ec 04             	sub    $0x4,%esp
801022c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
801022ca:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022d0:	75 70                	jne    80102342 <kfree+0x82>
801022d2:	81 fb e8 57 11 80    	cmp    $0x801157e8,%ebx
801022d8:	72 68                	jb     80102342 <kfree+0x82>
801022da:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801022e0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801022e5:	77 5b                	ja     80102342 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
801022e7:	83 ec 04             	sub    $0x4,%esp
801022ea:	68 00 10 00 00       	push   $0x1000
801022ef:	6a 01                	push   $0x1
801022f1:	53                   	push   %ebx
801022f2:	e8 29 24 00 00       	call   80104720 <memset>

  if(kmem.use_lock)
801022f7:	8b 15 54 27 11 80    	mov    0x80112754,%edx
801022fd:	83 c4 10             	add    $0x10,%esp
80102300:	85 d2                	test   %edx,%edx
80102302:	75 2c                	jne    80102330 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102304:	a1 58 27 11 80       	mov    0x80112758,%eax
80102309:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010230b:	a1 54 27 11 80       	mov    0x80112754,%eax
  kmem.freelist = r;
80102310:	89 1d 58 27 11 80    	mov    %ebx,0x80112758
  if(kmem.use_lock)
80102316:	85 c0                	test   %eax,%eax
80102318:	75 06                	jne    80102320 <kfree+0x60>
    release(&kmem.lock);
}
8010231a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010231d:	c9                   	leave  
8010231e:	c3                   	ret    
8010231f:	90                   	nop
    release(&kmem.lock);
80102320:	c7 45 08 20 27 11 80 	movl   $0x80112720,0x8(%ebp)
}
80102327:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010232a:	c9                   	leave  
    release(&kmem.lock);
8010232b:	e9 a0 23 00 00       	jmp    801046d0 <release>
    acquire(&kmem.lock);
80102330:	83 ec 0c             	sub    $0xc,%esp
80102333:	68 20 27 11 80       	push   $0x80112720
80102338:	e8 b3 21 00 00       	call   801044f0 <acquire>
8010233d:	83 c4 10             	add    $0x10,%esp
80102340:	eb c2                	jmp    80102304 <kfree+0x44>
    panic("kfree");
80102342:	83 ec 0c             	sub    $0xc,%esp
80102345:	68 d2 74 10 80       	push   $0x801074d2
8010234a:	e8 21 e0 ff ff       	call   80100370 <panic>
8010234f:	90                   	nop

80102350 <freerange>:
{
80102350:	55                   	push   %ebp
80102351:	89 e5                	mov    %esp,%ebp
80102353:	56                   	push   %esi
80102354:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
80102355:	8b 45 08             	mov    0x8(%ebp),%eax
{
80102358:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
8010235b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102361:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102367:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010236d:	39 de                	cmp    %ebx,%esi
8010236f:	72 23                	jb     80102394 <freerange+0x44>
80102371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102378:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010237e:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102381:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102387:	50                   	push   %eax
80102388:	e8 33 ff ff ff       	call   801022c0 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010238d:	83 c4 10             	add    $0x10,%esp
80102390:	39 f3                	cmp    %esi,%ebx
80102392:	76 e4                	jbe    80102378 <freerange+0x28>
}
80102394:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102397:	5b                   	pop    %ebx
80102398:	5e                   	pop    %esi
80102399:	5d                   	pop    %ebp
8010239a:	c3                   	ret    
8010239b:	90                   	nop
8010239c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023a0 <kinit1>:
{
801023a0:	55                   	push   %ebp
801023a1:	89 e5                	mov    %esp,%ebp
801023a3:	56                   	push   %esi
801023a4:	53                   	push   %ebx
801023a5:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
801023a8:	83 ec 08             	sub    $0x8,%esp
801023ab:	68 d8 74 10 80       	push   $0x801074d8
801023b0:	68 20 27 11 80       	push   $0x80112720
801023b5:	e8 16 21 00 00       	call   801044d0 <initlock>
  p = (char*)PGROUNDUP((uint)vstart);
801023ba:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023bd:	83 c4 10             	add    $0x10,%esp
  kmem.use_lock = 0;
801023c0:	c7 05 54 27 11 80 00 	movl   $0x0,0x80112754
801023c7:	00 00 00 
  p = (char*)PGROUNDUP((uint)vstart);
801023ca:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023d0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023d6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023dc:	39 de                	cmp    %ebx,%esi
801023de:	72 1c                	jb     801023fc <kinit1+0x5c>
    kfree(p);
801023e0:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023e6:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023e9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801023ef:	50                   	push   %eax
801023f0:	e8 cb fe ff ff       	call   801022c0 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023f5:	83 c4 10             	add    $0x10,%esp
801023f8:	39 de                	cmp    %ebx,%esi
801023fa:	73 e4                	jae    801023e0 <kinit1+0x40>
}
801023fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023ff:	5b                   	pop    %ebx
80102400:	5e                   	pop    %esi
80102401:	5d                   	pop    %ebp
80102402:	c3                   	ret    
80102403:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102410 <kinit2>:
{
80102410:	55                   	push   %ebp
80102411:	89 e5                	mov    %esp,%ebp
80102413:	56                   	push   %esi
80102414:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
80102415:	8b 45 08             	mov    0x8(%ebp),%eax
{
80102418:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
8010241b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102421:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102427:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010242d:	39 de                	cmp    %ebx,%esi
8010242f:	72 23                	jb     80102454 <kinit2+0x44>
80102431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102438:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010243e:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102441:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102447:	50                   	push   %eax
80102448:	e8 73 fe ff ff       	call   801022c0 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010244d:	83 c4 10             	add    $0x10,%esp
80102450:	39 de                	cmp    %ebx,%esi
80102452:	73 e4                	jae    80102438 <kinit2+0x28>
  kmem.use_lock = 1;
80102454:	c7 05 54 27 11 80 01 	movl   $0x1,0x80112754
8010245b:	00 00 00 
}
8010245e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102461:	5b                   	pop    %ebx
80102462:	5e                   	pop    %esi
80102463:	5d                   	pop    %ebp
80102464:	c3                   	ret    
80102465:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102470 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
80102470:	55                   	push   %ebp
80102471:	89 e5                	mov    %esp,%ebp
80102473:	53                   	push   %ebx
80102474:	83 ec 04             	sub    $0x4,%esp
  struct run *r;

  if(kmem.use_lock)
80102477:	a1 54 27 11 80       	mov    0x80112754,%eax
8010247c:	85 c0                	test   %eax,%eax
8010247e:	75 30                	jne    801024b0 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
80102480:	8b 1d 58 27 11 80    	mov    0x80112758,%ebx
  if(r)
80102486:	85 db                	test   %ebx,%ebx
80102488:	74 1c                	je     801024a6 <kalloc+0x36>
    kmem.freelist = r->next;
8010248a:	8b 13                	mov    (%ebx),%edx
8010248c:	89 15 58 27 11 80    	mov    %edx,0x80112758
  if(kmem.use_lock)
80102492:	85 c0                	test   %eax,%eax
80102494:	74 10                	je     801024a6 <kalloc+0x36>
    release(&kmem.lock);
80102496:	83 ec 0c             	sub    $0xc,%esp
80102499:	68 20 27 11 80       	push   $0x80112720
8010249e:	e8 2d 22 00 00       	call   801046d0 <release>
801024a3:	83 c4 10             	add    $0x10,%esp
  return (char*)r;
}
801024a6:	89 d8                	mov    %ebx,%eax
801024a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024ab:	c9                   	leave  
801024ac:	c3                   	ret    
801024ad:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&kmem.lock);
801024b0:	83 ec 0c             	sub    $0xc,%esp
801024b3:	68 20 27 11 80       	push   $0x80112720
801024b8:	e8 33 20 00 00       	call   801044f0 <acquire>
  r = kmem.freelist;
801024bd:	8b 1d 58 27 11 80    	mov    0x80112758,%ebx
  if(r)
801024c3:	83 c4 10             	add    $0x10,%esp
801024c6:	a1 54 27 11 80       	mov    0x80112754,%eax
801024cb:	85 db                	test   %ebx,%ebx
801024cd:	75 bb                	jne    8010248a <kalloc+0x1a>
801024cf:	eb c1                	jmp    80102492 <kalloc+0x22>
801024d1:	66 90                	xchg   %ax,%ax
801024d3:	66 90                	xchg   %ax,%ax
801024d5:	66 90                	xchg   %ax,%ax
801024d7:	66 90                	xchg   %ax,%ax
801024d9:	66 90                	xchg   %ax,%ax
801024db:	66 90                	xchg   %ax,%ax
801024dd:	66 90                	xchg   %ax,%ax
801024df:	90                   	nop

801024e0 <kbdgetc>:
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801024e0:	ba 64 00 00 00       	mov    $0x64,%edx
801024e5:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
801024e6:	a8 01                	test   $0x1,%al
801024e8:	0f 84 c2 00 00 00    	je     801025b0 <kbdgetc+0xd0>
801024ee:	ba 60 00 00 00       	mov    $0x60,%edx
801024f3:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
801024f4:	0f b6 d0             	movzbl %al,%edx

  if(data == 0xE0){
801024f7:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
801024fd:	0f 84 9d 00 00 00    	je     801025a0 <kbdgetc+0xc0>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102503:	84 c0                	test   %al,%al
80102505:	78 59                	js     80102560 <kbdgetc+0x80>
{
80102507:	55                   	push   %ebp
80102508:	89 e5                	mov    %esp,%ebp
8010250a:	53                   	push   %ebx
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
8010250b:	8b 1d 14 a6 10 80    	mov    0x8010a614,%ebx
80102511:	f6 c3 40             	test   $0x40,%bl
80102514:	74 09                	je     8010251f <kbdgetc+0x3f>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102516:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102519:	83 e3 bf             	and    $0xffffffbf,%ebx
    data |= 0x80;
8010251c:	0f b6 d0             	movzbl %al,%edx
  }

  shift |= shiftcode[data];
8010251f:	0f b6 8a 00 76 10 80 	movzbl -0x7fef8a00(%edx),%ecx
  shift ^= togglecode[data];
80102526:	0f b6 82 00 75 10 80 	movzbl -0x7fef8b00(%edx),%eax
  shift |= shiftcode[data];
8010252d:	09 d9                	or     %ebx,%ecx
  shift ^= togglecode[data];
8010252f:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
80102531:	89 c8                	mov    %ecx,%eax
  shift ^= togglecode[data];
80102533:	89 0d 14 a6 10 80    	mov    %ecx,0x8010a614
  c = charcode[shift & (CTL | SHIFT)][data];
80102539:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
8010253c:	83 e1 08             	and    $0x8,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
8010253f:	8b 04 85 e0 74 10 80 	mov    -0x7fef8b20(,%eax,4),%eax
80102546:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
8010254a:	74 0b                	je     80102557 <kbdgetc+0x77>
    if('a' <= c && c <= 'z')
8010254c:	8d 50 9f             	lea    -0x61(%eax),%edx
8010254f:	83 fa 19             	cmp    $0x19,%edx
80102552:	77 3c                	ja     80102590 <kbdgetc+0xb0>
      c += 'A' - 'a';
80102554:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102557:	5b                   	pop    %ebx
80102558:	5d                   	pop    %ebp
80102559:	c3                   	ret    
8010255a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    data = (shift & E0ESC ? data : data & 0x7F);
80102560:	8b 0d 14 a6 10 80    	mov    0x8010a614,%ecx
80102566:	83 e0 7f             	and    $0x7f,%eax
80102569:	f6 c1 40             	test   $0x40,%cl
8010256c:	0f 44 d0             	cmove  %eax,%edx
    shift &= ~(shiftcode[data] | E0ESC);
8010256f:	0f b6 82 00 76 10 80 	movzbl -0x7fef8a00(%edx),%eax
80102576:	83 c8 40             	or     $0x40,%eax
80102579:	0f b6 c0             	movzbl %al,%eax
8010257c:	f7 d0                	not    %eax
8010257e:	21 c8                	and    %ecx,%eax
80102580:	a3 14 a6 10 80       	mov    %eax,0x8010a614
    return 0;
80102585:	31 c0                	xor    %eax,%eax
80102587:	c3                   	ret    
80102588:	90                   	nop
80102589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    else if('A' <= c && c <= 'Z')
80102590:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
80102593:	8d 50 20             	lea    0x20(%eax),%edx
}
80102596:	5b                   	pop    %ebx
      c += 'a' - 'A';
80102597:	83 f9 19             	cmp    $0x19,%ecx
8010259a:	0f 46 c2             	cmovbe %edx,%eax
}
8010259d:	5d                   	pop    %ebp
8010259e:	c3                   	ret    
8010259f:	90                   	nop
    shift |= E0ESC;
801025a0:	83 0d 14 a6 10 80 40 	orl    $0x40,0x8010a614
    return 0;
801025a7:	31 c0                	xor    %eax,%eax
801025a9:	c3                   	ret    
801025aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
801025b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025b5:	c3                   	ret    
801025b6:	8d 76 00             	lea    0x0(%esi),%esi
801025b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025c0 <kbdintr>:

void
kbdintr(void)
{
801025c0:	55                   	push   %ebp
801025c1:	89 e5                	mov    %esp,%ebp
801025c3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
801025c6:	68 e0 24 10 80       	push   $0x801024e0
801025cb:	e8 10 e2 ff ff       	call   801007e0 <consoleintr>
}
801025d0:	83 c4 10             	add    $0x10,%esp
801025d3:	c9                   	leave  
801025d4:	c3                   	ret    
801025d5:	66 90                	xchg   %ax,%ax
801025d7:	66 90                	xchg   %ax,%ax
801025d9:	66 90                	xchg   %ax,%ax
801025db:	66 90                	xchg   %ax,%ax
801025dd:	66 90                	xchg   %ax,%ax
801025df:	90                   	nop

801025e0 <lapicinit>:
//PAGEBREAK!

void
lapicinit(void)
{
  if(!lapic)
801025e0:	a1 5c 27 11 80       	mov    0x8011275c,%eax
{
801025e5:	55                   	push   %ebp
801025e6:	89 e5                	mov    %esp,%ebp
  if(!lapic)
801025e8:	85 c0                	test   %eax,%eax
801025ea:	0f 84 c8 00 00 00    	je     801026b8 <lapicinit+0xd8>
  lapic[index] = value;
801025f0:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801025f7:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
801025fa:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801025fd:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102604:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102607:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010260a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102611:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
80102614:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102617:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010261e:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102621:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102624:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010262b:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010262e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102631:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102638:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010263b:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010263e:	8b 50 30             	mov    0x30(%eax),%edx
80102641:	c1 ea 10             	shr    $0x10,%edx
80102644:	80 fa 03             	cmp    $0x3,%dl
80102647:	77 77                	ja     801026c0 <lapicinit+0xe0>
  lapic[index] = value;
80102649:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102650:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102653:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102656:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010265d:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102660:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102663:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010266a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010266d:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102670:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102677:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010267a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010267d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102684:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102687:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010268a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102691:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102694:	8b 50 20             	mov    0x20(%eax),%edx
80102697:	89 f6                	mov    %esi,%esi
80102699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
801026a0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026a6:	80 e6 10             	and    $0x10,%dh
801026a9:	75 f5                	jne    801026a0 <lapicinit+0xc0>
  lapic[index] = value;
801026ab:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026b2:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026b5:	8b 40 20             	mov    0x20(%eax),%eax
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
801026b8:	5d                   	pop    %ebp
801026b9:	c3                   	ret    
801026ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  lapic[index] = value;
801026c0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026c7:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026ca:	8b 50 20             	mov    0x20(%eax),%edx
801026cd:	e9 77 ff ff ff       	jmp    80102649 <lapicinit+0x69>
801026d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026e0 <cpunum>:

int
cpunum(void)
{
801026e0:	55                   	push   %ebp
801026e1:	89 e5                	mov    %esp,%ebp
801026e3:	56                   	push   %esi
801026e4:	53                   	push   %ebx
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801026e5:	9c                   	pushf  
801026e6:	58                   	pop    %eax
  // Cannot call cpu when interrupts are enabled:
  // result not guaranteed to last long enough to be used!
  // Would prefer to panic but even printing is chancy here:
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
801026e7:	f6 c4 02             	test   $0x2,%ah
801026ea:	74 12                	je     801026fe <cpunum+0x1e>
    static int n;
    if(n++ == 0)
801026ec:	a1 18 a6 10 80       	mov    0x8010a618,%eax
801026f1:	8d 50 01             	lea    0x1(%eax),%edx
801026f4:	85 c0                	test   %eax,%eax
801026f6:	89 15 18 a6 10 80    	mov    %edx,0x8010a618
801026fc:	74 4d                	je     8010274b <cpunum+0x6b>
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
801026fe:	a1 5c 27 11 80       	mov    0x8011275c,%eax
80102703:	85 c0                	test   %eax,%eax
80102705:	74 60                	je     80102767 <cpunum+0x87>
    return 0;

  apicid = lapic[ID] >> 24;
80102707:	8b 58 20             	mov    0x20(%eax),%ebx
  for (i = 0; i < ncpu; ++i) {
8010270a:	8b 35 40 2e 11 80    	mov    0x80112e40,%esi
  apicid = lapic[ID] >> 24;
80102710:	c1 eb 18             	shr    $0x18,%ebx
  for (i = 0; i < ncpu; ++i) {
80102713:	85 f6                	test   %esi,%esi
80102715:	7e 59                	jle    80102770 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
80102717:	0f b6 05 60 28 11 80 	movzbl 0x80112860,%eax
8010271e:	39 c3                	cmp    %eax,%ebx
80102720:	74 45                	je     80102767 <cpunum+0x87>
80102722:	ba 1c 29 11 80       	mov    $0x8011291c,%edx
80102727:	31 c0                	xor    %eax,%eax
80102729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i < ncpu; ++i) {
80102730:	83 c0 01             	add    $0x1,%eax
80102733:	39 f0                	cmp    %esi,%eax
80102735:	74 39                	je     80102770 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
80102737:	0f b6 0a             	movzbl (%edx),%ecx
8010273a:	81 c2 bc 00 00 00    	add    $0xbc,%edx
80102740:	39 cb                	cmp    %ecx,%ebx
80102742:	75 ec                	jne    80102730 <cpunum+0x50>
      return i;
  }
  panic("unknown apicid\n");
}
80102744:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102747:	5b                   	pop    %ebx
80102748:	5e                   	pop    %esi
80102749:	5d                   	pop    %ebp
8010274a:	c3                   	ret    
      cprintf("cpu called from %x with interrupts enabled\n",
8010274b:	83 ec 08             	sub    $0x8,%esp
8010274e:	ff 75 04             	pushl  0x4(%ebp)
80102751:	68 00 77 10 80       	push   $0x80107700
80102756:	e8 05 df ff ff       	call   80100660 <cprintf>
  if (!lapic)
8010275b:	a1 5c 27 11 80       	mov    0x8011275c,%eax
      cprintf("cpu called from %x with interrupts enabled\n",
80102760:	83 c4 10             	add    $0x10,%esp
  if (!lapic)
80102763:	85 c0                	test   %eax,%eax
80102765:	75 a0                	jne    80102707 <cpunum+0x27>
}
80102767:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
8010276a:	31 c0                	xor    %eax,%eax
}
8010276c:	5b                   	pop    %ebx
8010276d:	5e                   	pop    %esi
8010276e:	5d                   	pop    %ebp
8010276f:	c3                   	ret    
  panic("unknown apicid\n");
80102770:	83 ec 0c             	sub    $0xc,%esp
80102773:	68 2c 77 10 80       	push   $0x8010772c
80102778:	e8 f3 db ff ff       	call   80100370 <panic>
8010277d:	8d 76 00             	lea    0x0(%esi),%esi

80102780 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102780:	a1 5c 27 11 80       	mov    0x8011275c,%eax
{
80102785:	55                   	push   %ebp
80102786:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102788:	85 c0                	test   %eax,%eax
8010278a:	74 0d                	je     80102799 <lapiceoi+0x19>
  lapic[index] = value;
8010278c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102793:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102796:	8b 40 20             	mov    0x20(%eax),%eax
    lapicw(EOI, 0);
}
80102799:	5d                   	pop    %ebp
8010279a:	c3                   	ret    
8010279b:	90                   	nop
8010279c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027a0 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
801027a0:	55                   	push   %ebp
801027a1:	89 e5                	mov    %esp,%ebp
}
801027a3:	5d                   	pop    %ebp
801027a4:	c3                   	ret    
801027a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027b0 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
801027b0:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801027b1:	ba 70 00 00 00       	mov    $0x70,%edx
801027b6:	b8 0f 00 00 00       	mov    $0xf,%eax
801027bb:	89 e5                	mov    %esp,%ebp
801027bd:	53                   	push   %ebx
801027be:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801027c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801027c4:	ee                   	out    %al,(%dx)
801027c5:	ba 71 00 00 00       	mov    $0x71,%edx
801027ca:	b8 0a 00 00 00       	mov    $0xa,%eax
801027cf:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
801027d0:	31 c0                	xor    %eax,%eax
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
801027d2:	c1 e3 18             	shl    $0x18,%ebx
  wrv[0] = 0;
801027d5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
801027db:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
801027dd:	c1 e9 0c             	shr    $0xc,%ecx
  wrv[1] = addr >> 4;
801027e0:	c1 e8 04             	shr    $0x4,%eax
  lapicw(ICRHI, apicid<<24);
801027e3:	89 da                	mov    %ebx,%edx
    lapicw(ICRLO, STARTUP | (addr>>12));
801027e5:	80 cd 06             	or     $0x6,%ch
  wrv[1] = addr >> 4;
801027e8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
  lapic[index] = value;
801027ee:	a1 5c 27 11 80       	mov    0x8011275c,%eax
801027f3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027f9:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801027fc:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102803:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102806:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102809:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102810:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102813:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102816:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010281c:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
8010281f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102825:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102828:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010282e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102831:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102837:	8b 40 20             	mov    0x20(%eax),%eax
    microdelay(200);
  }
}
8010283a:	5b                   	pop    %ebx
8010283b:	5d                   	pop    %ebp
8010283c:	c3                   	ret    
8010283d:	8d 76 00             	lea    0x0(%esi),%esi

80102840 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
80102840:	55                   	push   %ebp
80102841:	ba 70 00 00 00       	mov    $0x70,%edx
80102846:	b8 0b 00 00 00       	mov    $0xb,%eax
8010284b:	89 e5                	mov    %esp,%ebp
8010284d:	57                   	push   %edi
8010284e:	56                   	push   %esi
8010284f:	53                   	push   %ebx
80102850:	83 ec 5c             	sub    $0x5c,%esp
80102853:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102854:	ba 71 00 00 00       	mov    $0x71,%edx
80102859:	ec                   	in     (%dx),%al
8010285a:	83 e0 04             	and    $0x4,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010285d:	bb 70 00 00 00       	mov    $0x70,%ebx
80102862:	88 45 a7             	mov    %al,-0x59(%ebp)
80102865:	8d 76 00             	lea    0x0(%esi),%esi
80102868:	31 c0                	xor    %eax,%eax
8010286a:	89 da                	mov    %ebx,%edx
8010286c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010286d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102872:	89 ca                	mov    %ecx,%edx
80102874:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
80102875:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102878:	89 da                	mov    %ebx,%edx
8010287a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010287d:	b8 02 00 00 00       	mov    $0x2,%eax
80102882:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102883:	89 ca                	mov    %ecx,%edx
80102885:	ec                   	in     (%dx),%al
80102886:	0f b6 f0             	movzbl %al,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102889:	89 da                	mov    %ebx,%edx
8010288b:	b8 04 00 00 00       	mov    $0x4,%eax
80102890:	89 75 b0             	mov    %esi,-0x50(%ebp)
80102893:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102894:	89 ca                	mov    %ecx,%edx
80102896:	ec                   	in     (%dx),%al
80102897:	0f b6 f8             	movzbl %al,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010289a:	89 da                	mov    %ebx,%edx
8010289c:	b8 07 00 00 00       	mov    $0x7,%eax
801028a1:	89 7d ac             	mov    %edi,-0x54(%ebp)
801028a4:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028a5:	89 ca                	mov    %ecx,%edx
801028a7:	ec                   	in     (%dx),%al
801028a8:	0f b6 d0             	movzbl %al,%edx
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028ab:	b8 08 00 00 00       	mov    $0x8,%eax
801028b0:	89 55 a8             	mov    %edx,-0x58(%ebp)
801028b3:	89 da                	mov    %ebx,%edx
801028b5:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028b6:	89 ca                	mov    %ecx,%edx
801028b8:	ec                   	in     (%dx),%al
801028b9:	0f b6 f8             	movzbl %al,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028bc:	89 da                	mov    %ebx,%edx
801028be:	b8 09 00 00 00       	mov    $0x9,%eax
801028c3:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028c4:	89 ca                	mov    %ecx,%edx
801028c6:	ec                   	in     (%dx),%al
801028c7:	0f b6 f0             	movzbl %al,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028ca:	89 da                	mov    %ebx,%edx
801028cc:	b8 0a 00 00 00       	mov    $0xa,%eax
801028d1:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028d2:	89 ca                	mov    %ecx,%edx
801028d4:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
801028d5:	84 c0                	test   %al,%al
801028d7:	78 8f                	js     80102868 <cmostime+0x28>
801028d9:	8b 45 b4             	mov    -0x4c(%ebp),%eax
801028dc:	8b 55 a8             	mov    -0x58(%ebp),%edx
801028df:	89 7d c8             	mov    %edi,-0x38(%ebp)
801028e2:	89 75 cc             	mov    %esi,-0x34(%ebp)
801028e5:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028e8:	8b 45 b0             	mov    -0x50(%ebp),%eax
801028eb:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028ee:	89 da                	mov    %ebx,%edx
801028f0:	89 45 bc             	mov    %eax,-0x44(%ebp)
801028f3:	8b 45 ac             	mov    -0x54(%ebp),%eax
801028f6:	89 45 c0             	mov    %eax,-0x40(%ebp)
801028f9:	31 c0                	xor    %eax,%eax
801028fb:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028fc:	89 ca                	mov    %ecx,%edx
801028fe:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
801028ff:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102902:	89 da                	mov    %ebx,%edx
80102904:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102907:	b8 02 00 00 00       	mov    $0x2,%eax
8010290c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010290d:	89 ca                	mov    %ecx,%edx
8010290f:	ec                   	in     (%dx),%al
80102910:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102913:	89 da                	mov    %ebx,%edx
80102915:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102918:	b8 04 00 00 00       	mov    $0x4,%eax
8010291d:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010291e:	89 ca                	mov    %ecx,%edx
80102920:	ec                   	in     (%dx),%al
80102921:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102924:	89 da                	mov    %ebx,%edx
80102926:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102929:	b8 07 00 00 00       	mov    $0x7,%eax
8010292e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010292f:	89 ca                	mov    %ecx,%edx
80102931:	ec                   	in     (%dx),%al
80102932:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102935:	89 da                	mov    %ebx,%edx
80102937:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010293a:	b8 08 00 00 00       	mov    $0x8,%eax
8010293f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102940:	89 ca                	mov    %ecx,%edx
80102942:	ec                   	in     (%dx),%al
80102943:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102946:	89 da                	mov    %ebx,%edx
80102948:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010294b:	b8 09 00 00 00       	mov    $0x9,%eax
80102950:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102951:	89 ca                	mov    %ecx,%edx
80102953:	ec                   	in     (%dx),%al
80102954:	0f b6 c0             	movzbl %al,%eax
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102957:	83 ec 04             	sub    $0x4,%esp
  return inb(CMOS_RETURN);
8010295a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
8010295d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102960:	6a 18                	push   $0x18
80102962:	50                   	push   %eax
80102963:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102966:	50                   	push   %eax
80102967:	e8 04 1e 00 00       	call   80104770 <memcmp>
8010296c:	83 c4 10             	add    $0x10,%esp
8010296f:	85 c0                	test   %eax,%eax
80102971:	0f 85 f1 fe ff ff    	jne    80102868 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
80102977:	80 7d a7 00          	cmpb   $0x0,-0x59(%ebp)
8010297b:	75 78                	jne    801029f5 <cmostime+0x1b5>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
8010297d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102980:	89 c2                	mov    %eax,%edx
80102982:	83 e0 0f             	and    $0xf,%eax
80102985:	c1 ea 04             	shr    $0x4,%edx
80102988:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010298b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010298e:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
80102991:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102994:	89 c2                	mov    %eax,%edx
80102996:	83 e0 0f             	and    $0xf,%eax
80102999:	c1 ea 04             	shr    $0x4,%edx
8010299c:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010299f:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029a2:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
801029a5:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029a8:	89 c2                	mov    %eax,%edx
801029aa:	83 e0 0f             	and    $0xf,%eax
801029ad:	c1 ea 04             	shr    $0x4,%edx
801029b0:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029b3:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029b6:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
801029b9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029bc:	89 c2                	mov    %eax,%edx
801029be:	83 e0 0f             	and    $0xf,%eax
801029c1:	c1 ea 04             	shr    $0x4,%edx
801029c4:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029c7:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029ca:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
801029cd:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029d0:	89 c2                	mov    %eax,%edx
801029d2:	83 e0 0f             	and    $0xf,%eax
801029d5:	c1 ea 04             	shr    $0x4,%edx
801029d8:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029db:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029de:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
801029e1:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029e4:	89 c2                	mov    %eax,%edx
801029e6:	83 e0 0f             	and    $0xf,%eax
801029e9:	c1 ea 04             	shr    $0x4,%edx
801029ec:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029ef:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029f2:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
801029f5:	8b 75 08             	mov    0x8(%ebp),%esi
801029f8:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029fb:	89 06                	mov    %eax,(%esi)
801029fd:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102a00:	89 46 04             	mov    %eax,0x4(%esi)
80102a03:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102a06:	89 46 08             	mov    %eax,0x8(%esi)
80102a09:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102a0c:	89 46 0c             	mov    %eax,0xc(%esi)
80102a0f:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102a12:	89 46 10             	mov    %eax,0x10(%esi)
80102a15:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102a18:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
80102a1b:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
80102a22:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a25:	5b                   	pop    %ebx
80102a26:	5e                   	pop    %esi
80102a27:	5f                   	pop    %edi
80102a28:	5d                   	pop    %ebp
80102a29:	c3                   	ret    
80102a2a:	66 90                	xchg   %ax,%ax
80102a2c:	66 90                	xchg   %ax,%ax
80102a2e:	66 90                	xchg   %ax,%ax

80102a30 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a30:	8b 0d a8 27 11 80    	mov    0x801127a8,%ecx
80102a36:	85 c9                	test   %ecx,%ecx
80102a38:	0f 8e 85 00 00 00    	jle    80102ac3 <install_trans+0x93>
{
80102a3e:	55                   	push   %ebp
80102a3f:	89 e5                	mov    %esp,%ebp
80102a41:	57                   	push   %edi
80102a42:	56                   	push   %esi
80102a43:	53                   	push   %ebx
80102a44:	31 db                	xor    %ebx,%ebx
80102a46:	83 ec 0c             	sub    $0xc,%esp
80102a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102a50:	a1 94 27 11 80       	mov    0x80112794,%eax
80102a55:	83 ec 08             	sub    $0x8,%esp
80102a58:	01 d8                	add    %ebx,%eax
80102a5a:	83 c0 01             	add    $0x1,%eax
80102a5d:	50                   	push   %eax
80102a5e:	ff 35 a4 27 11 80    	pushl  0x801127a4
80102a64:	e8 67 d6 ff ff       	call   801000d0 <bread>
80102a69:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a6b:	58                   	pop    %eax
80102a6c:	5a                   	pop    %edx
80102a6d:	ff 34 9d ac 27 11 80 	pushl  -0x7feed854(,%ebx,4)
80102a74:	ff 35 a4 27 11 80    	pushl  0x801127a4
  for (tail = 0; tail < log.lh.n; tail++) {
80102a7a:	83 c3 01             	add    $0x1,%ebx
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a7d:	e8 4e d6 ff ff       	call   801000d0 <bread>
80102a82:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102a84:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a87:	83 c4 0c             	add    $0xc,%esp
80102a8a:	68 00 02 00 00       	push   $0x200
80102a8f:	50                   	push   %eax
80102a90:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a93:	50                   	push   %eax
80102a94:	e8 37 1d 00 00       	call   801047d0 <memmove>
    bwrite(dbuf);  // write dst to disk
80102a99:	89 34 24             	mov    %esi,(%esp)
80102a9c:	e8 ff d6 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102aa1:	89 3c 24             	mov    %edi,(%esp)
80102aa4:	e8 37 d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102aa9:	89 34 24             	mov    %esi,(%esp)
80102aac:	e8 2f d7 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102ab1:	83 c4 10             	add    $0x10,%esp
80102ab4:	39 1d a8 27 11 80    	cmp    %ebx,0x801127a8
80102aba:	7f 94                	jg     80102a50 <install_trans+0x20>
  }
}
80102abc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102abf:	5b                   	pop    %ebx
80102ac0:	5e                   	pop    %esi
80102ac1:	5f                   	pop    %edi
80102ac2:	5d                   	pop    %ebp
80102ac3:	f3 c3                	repz ret 
80102ac5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ad0 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102ad0:	55                   	push   %ebp
80102ad1:	89 e5                	mov    %esp,%ebp
80102ad3:	53                   	push   %ebx
80102ad4:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102ad7:	ff 35 94 27 11 80    	pushl  0x80112794
80102add:	ff 35 a4 27 11 80    	pushl  0x801127a4
80102ae3:	e8 e8 d5 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102ae8:	8b 0d a8 27 11 80    	mov    0x801127a8,%ecx
  for (i = 0; i < log.lh.n; i++) {
80102aee:	83 c4 10             	add    $0x10,%esp
  struct buf *buf = bread(log.dev, log.start);
80102af1:	89 c3                	mov    %eax,%ebx
  for (i = 0; i < log.lh.n; i++) {
80102af3:	85 c9                	test   %ecx,%ecx
  hb->n = log.lh.n;
80102af5:	89 48 5c             	mov    %ecx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102af8:	7e 1f                	jle    80102b19 <write_head+0x49>
80102afa:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102b01:	31 d2                	xor    %edx,%edx
80102b03:	90                   	nop
80102b04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102b08:	8b 8a ac 27 11 80    	mov    -0x7feed854(%edx),%ecx
80102b0e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102b12:	83 c2 04             	add    $0x4,%edx
  for (i = 0; i < log.lh.n; i++) {
80102b15:	39 c2                	cmp    %eax,%edx
80102b17:	75 ef                	jne    80102b08 <write_head+0x38>
  }
  bwrite(buf);
80102b19:	83 ec 0c             	sub    $0xc,%esp
80102b1c:	53                   	push   %ebx
80102b1d:	e8 7e d6 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102b22:	89 1c 24             	mov    %ebx,(%esp)
80102b25:	e8 b6 d6 ff ff       	call   801001e0 <brelse>
}
80102b2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b2d:	c9                   	leave  
80102b2e:	c3                   	ret    
80102b2f:	90                   	nop

80102b30 <initlog>:
{
80102b30:	55                   	push   %ebp
80102b31:	89 e5                	mov    %esp,%ebp
80102b33:	53                   	push   %ebx
80102b34:	83 ec 2c             	sub    $0x2c,%esp
80102b37:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&log.lock, "log");
80102b3a:	68 3c 77 10 80       	push   $0x8010773c
80102b3f:	68 60 27 11 80       	push   $0x80112760
80102b44:	e8 87 19 00 00       	call   801044d0 <initlock>
  readsb(dev, &sb);
80102b49:	58                   	pop    %eax
80102b4a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b4d:	5a                   	pop    %edx
80102b4e:	50                   	push   %eax
80102b4f:	53                   	push   %ebx
80102b50:	e8 3b e8 ff ff       	call   80101390 <readsb>
  log.size = sb.nlog;
80102b55:	8b 55 e8             	mov    -0x18(%ebp),%edx
  log.start = sb.logstart;
80102b58:	8b 45 ec             	mov    -0x14(%ebp),%eax
  struct buf *buf = bread(log.dev, log.start);
80102b5b:	59                   	pop    %ecx
  log.dev = dev;
80102b5c:	89 1d a4 27 11 80    	mov    %ebx,0x801127a4
  log.size = sb.nlog;
80102b62:	89 15 98 27 11 80    	mov    %edx,0x80112798
  log.start = sb.logstart;
80102b68:	a3 94 27 11 80       	mov    %eax,0x80112794
  struct buf *buf = bread(log.dev, log.start);
80102b6d:	5a                   	pop    %edx
80102b6e:	50                   	push   %eax
80102b6f:	53                   	push   %ebx
80102b70:	e8 5b d5 ff ff       	call   801000d0 <bread>
  log.lh.n = lh->n;
80102b75:	8b 48 5c             	mov    0x5c(%eax),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102b78:	83 c4 10             	add    $0x10,%esp
80102b7b:	85 c9                	test   %ecx,%ecx
  log.lh.n = lh->n;
80102b7d:	89 0d a8 27 11 80    	mov    %ecx,0x801127a8
  for (i = 0; i < log.lh.n; i++) {
80102b83:	7e 1c                	jle    80102ba1 <initlog+0x71>
80102b85:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b8c:	31 d2                	xor    %edx,%edx
80102b8e:	66 90                	xchg   %ax,%ax
    log.lh.block[i] = lh->block[i];
80102b90:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b94:	83 c2 04             	add    $0x4,%edx
80102b97:	89 8a a8 27 11 80    	mov    %ecx,-0x7feed858(%edx)
  for (i = 0; i < log.lh.n; i++) {
80102b9d:	39 da                	cmp    %ebx,%edx
80102b9f:	75 ef                	jne    80102b90 <initlog+0x60>
  brelse(buf);
80102ba1:	83 ec 0c             	sub    $0xc,%esp
80102ba4:	50                   	push   %eax
80102ba5:	e8 36 d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102baa:	e8 81 fe ff ff       	call   80102a30 <install_trans>
  log.lh.n = 0;
80102baf:	c7 05 a8 27 11 80 00 	movl   $0x0,0x801127a8
80102bb6:	00 00 00 
  write_head(); // clear the log
80102bb9:	e8 12 ff ff ff       	call   80102ad0 <write_head>
}
80102bbe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102bc1:	c9                   	leave  
80102bc2:	c3                   	ret    
80102bc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bd0 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102bd0:	55                   	push   %ebp
80102bd1:	89 e5                	mov    %esp,%ebp
80102bd3:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102bd6:	68 60 27 11 80       	push   $0x80112760
80102bdb:	e8 10 19 00 00       	call   801044f0 <acquire>
80102be0:	83 c4 10             	add    $0x10,%esp
80102be3:	eb 18                	jmp    80102bfd <begin_op+0x2d>
80102be5:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102be8:	83 ec 08             	sub    $0x8,%esp
80102beb:	68 60 27 11 80       	push   $0x80112760
80102bf0:	68 60 27 11 80       	push   $0x80112760
80102bf5:	e8 d6 12 00 00       	call   80103ed0 <sleep>
80102bfa:	83 c4 10             	add    $0x10,%esp
    if(log.committing){
80102bfd:	a1 a0 27 11 80       	mov    0x801127a0,%eax
80102c02:	85 c0                	test   %eax,%eax
80102c04:	75 e2                	jne    80102be8 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102c06:	a1 9c 27 11 80       	mov    0x8011279c,%eax
80102c0b:	8b 15 a8 27 11 80    	mov    0x801127a8,%edx
80102c11:	83 c0 01             	add    $0x1,%eax
80102c14:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102c17:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102c1a:	83 fa 1e             	cmp    $0x1e,%edx
80102c1d:	7f c9                	jg     80102be8 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102c1f:	83 ec 0c             	sub    $0xc,%esp
      log.outstanding += 1;
80102c22:	a3 9c 27 11 80       	mov    %eax,0x8011279c
      release(&log.lock);
80102c27:	68 60 27 11 80       	push   $0x80112760
80102c2c:	e8 9f 1a 00 00       	call   801046d0 <release>
      break;
    }
  }
}
80102c31:	83 c4 10             	add    $0x10,%esp
80102c34:	c9                   	leave  
80102c35:	c3                   	ret    
80102c36:	8d 76 00             	lea    0x0(%esi),%esi
80102c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c40 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102c40:	55                   	push   %ebp
80102c41:	89 e5                	mov    %esp,%ebp
80102c43:	57                   	push   %edi
80102c44:	56                   	push   %esi
80102c45:	53                   	push   %ebx
80102c46:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102c49:	68 60 27 11 80       	push   $0x80112760
80102c4e:	e8 9d 18 00 00       	call   801044f0 <acquire>
  log.outstanding -= 1;
80102c53:	a1 9c 27 11 80       	mov    0x8011279c,%eax
  if(log.committing)
80102c58:	8b 35 a0 27 11 80    	mov    0x801127a0,%esi
80102c5e:	83 c4 10             	add    $0x10,%esp
  log.outstanding -= 1;
80102c61:	8d 58 ff             	lea    -0x1(%eax),%ebx
  if(log.committing)
80102c64:	85 f6                	test   %esi,%esi
  log.outstanding -= 1;
80102c66:	89 1d 9c 27 11 80    	mov    %ebx,0x8011279c
  if(log.committing)
80102c6c:	0f 85 22 01 00 00    	jne    80102d94 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102c72:	85 db                	test   %ebx,%ebx
80102c74:	0f 85 f6 00 00 00    	jne    80102d70 <end_op+0x130>
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102c7a:	83 ec 0c             	sub    $0xc,%esp
    log.committing = 1;
80102c7d:	c7 05 a0 27 11 80 01 	movl   $0x1,0x801127a0
80102c84:	00 00 00 
  release(&log.lock);
80102c87:	68 60 27 11 80       	push   $0x80112760
80102c8c:	e8 3f 1a 00 00       	call   801046d0 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c91:	8b 0d a8 27 11 80    	mov    0x801127a8,%ecx
80102c97:	83 c4 10             	add    $0x10,%esp
80102c9a:	85 c9                	test   %ecx,%ecx
80102c9c:	0f 8e 8b 00 00 00    	jle    80102d2d <end_op+0xed>
80102ca2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102ca8:	a1 94 27 11 80       	mov    0x80112794,%eax
80102cad:	83 ec 08             	sub    $0x8,%esp
80102cb0:	01 d8                	add    %ebx,%eax
80102cb2:	83 c0 01             	add    $0x1,%eax
80102cb5:	50                   	push   %eax
80102cb6:	ff 35 a4 27 11 80    	pushl  0x801127a4
80102cbc:	e8 0f d4 ff ff       	call   801000d0 <bread>
80102cc1:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102cc3:	58                   	pop    %eax
80102cc4:	5a                   	pop    %edx
80102cc5:	ff 34 9d ac 27 11 80 	pushl  -0x7feed854(,%ebx,4)
80102ccc:	ff 35 a4 27 11 80    	pushl  0x801127a4
  for (tail = 0; tail < log.lh.n; tail++) {
80102cd2:	83 c3 01             	add    $0x1,%ebx
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102cd5:	e8 f6 d3 ff ff       	call   801000d0 <bread>
80102cda:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102cdc:	8d 40 5c             	lea    0x5c(%eax),%eax
80102cdf:	83 c4 0c             	add    $0xc,%esp
80102ce2:	68 00 02 00 00       	push   $0x200
80102ce7:	50                   	push   %eax
80102ce8:	8d 46 5c             	lea    0x5c(%esi),%eax
80102ceb:	50                   	push   %eax
80102cec:	e8 df 1a 00 00       	call   801047d0 <memmove>
    bwrite(to);  // write the log
80102cf1:	89 34 24             	mov    %esi,(%esp)
80102cf4:	e8 a7 d4 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102cf9:	89 3c 24             	mov    %edi,(%esp)
80102cfc:	e8 df d4 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102d01:	89 34 24             	mov    %esi,(%esp)
80102d04:	e8 d7 d4 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102d09:	83 c4 10             	add    $0x10,%esp
80102d0c:	3b 1d a8 27 11 80    	cmp    0x801127a8,%ebx
80102d12:	7c 94                	jl     80102ca8 <end_op+0x68>
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102d14:	e8 b7 fd ff ff       	call   80102ad0 <write_head>
    install_trans(); // Now install writes to home locations
80102d19:	e8 12 fd ff ff       	call   80102a30 <install_trans>
    log.lh.n = 0;
80102d1e:	c7 05 a8 27 11 80 00 	movl   $0x0,0x801127a8
80102d25:	00 00 00 
    write_head();    // Erase the transaction from the log
80102d28:	e8 a3 fd ff ff       	call   80102ad0 <write_head>
    acquire(&log.lock);
80102d2d:	83 ec 0c             	sub    $0xc,%esp
80102d30:	68 60 27 11 80       	push   $0x80112760
80102d35:	e8 b6 17 00 00       	call   801044f0 <acquire>
    wakeup(&log);
80102d3a:	c7 04 24 60 27 11 80 	movl   $0x80112760,(%esp)
    log.committing = 0;
80102d41:	c7 05 a0 27 11 80 00 	movl   $0x0,0x801127a0
80102d48:	00 00 00 
    wakeup(&log);
80102d4b:	e8 40 13 00 00       	call   80104090 <wakeup>
    release(&log.lock);
80102d50:	c7 04 24 60 27 11 80 	movl   $0x80112760,(%esp)
80102d57:	e8 74 19 00 00       	call   801046d0 <release>
80102d5c:	83 c4 10             	add    $0x10,%esp
}
80102d5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d62:	5b                   	pop    %ebx
80102d63:	5e                   	pop    %esi
80102d64:	5f                   	pop    %edi
80102d65:	5d                   	pop    %ebp
80102d66:	c3                   	ret    
80102d67:	89 f6                	mov    %esi,%esi
80102d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    wakeup(&log);
80102d70:	83 ec 0c             	sub    $0xc,%esp
80102d73:	68 60 27 11 80       	push   $0x80112760
80102d78:	e8 13 13 00 00       	call   80104090 <wakeup>
  release(&log.lock);
80102d7d:	c7 04 24 60 27 11 80 	movl   $0x80112760,(%esp)
80102d84:	e8 47 19 00 00       	call   801046d0 <release>
80102d89:	83 c4 10             	add    $0x10,%esp
}
80102d8c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d8f:	5b                   	pop    %ebx
80102d90:	5e                   	pop    %esi
80102d91:	5f                   	pop    %edi
80102d92:	5d                   	pop    %ebp
80102d93:	c3                   	ret    
    panic("log.committing");
80102d94:	83 ec 0c             	sub    $0xc,%esp
80102d97:	68 40 77 10 80       	push   $0x80107740
80102d9c:	e8 cf d5 ff ff       	call   80100370 <panic>
80102da1:	eb 0d                	jmp    80102db0 <log_write>
80102da3:	90                   	nop
80102da4:	90                   	nop
80102da5:	90                   	nop
80102da6:	90                   	nop
80102da7:	90                   	nop
80102da8:	90                   	nop
80102da9:	90                   	nop
80102daa:	90                   	nop
80102dab:	90                   	nop
80102dac:	90                   	nop
80102dad:	90                   	nop
80102dae:	90                   	nop
80102daf:	90                   	nop

80102db0 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102db0:	55                   	push   %ebp
80102db1:	89 e5                	mov    %esp,%ebp
80102db3:	53                   	push   %ebx
80102db4:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102db7:	8b 15 a8 27 11 80    	mov    0x801127a8,%edx
{
80102dbd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102dc0:	83 fa 1d             	cmp    $0x1d,%edx
80102dc3:	0f 8f 97 00 00 00    	jg     80102e60 <log_write+0xb0>
80102dc9:	a1 98 27 11 80       	mov    0x80112798,%eax
80102dce:	83 e8 01             	sub    $0x1,%eax
80102dd1:	39 c2                	cmp    %eax,%edx
80102dd3:	0f 8d 87 00 00 00    	jge    80102e60 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102dd9:	a1 9c 27 11 80       	mov    0x8011279c,%eax
80102dde:	85 c0                	test   %eax,%eax
80102de0:	0f 8e 87 00 00 00    	jle    80102e6d <log_write+0xbd>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102de6:	83 ec 0c             	sub    $0xc,%esp
80102de9:	68 60 27 11 80       	push   $0x80112760
80102dee:	e8 fd 16 00 00       	call   801044f0 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102df3:	8b 0d a8 27 11 80    	mov    0x801127a8,%ecx
80102df9:	83 c4 10             	add    $0x10,%esp
80102dfc:	83 f9 00             	cmp    $0x0,%ecx
80102dff:	7e 50                	jle    80102e51 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102e01:	8b 53 08             	mov    0x8(%ebx),%edx
  for (i = 0; i < log.lh.n; i++) {
80102e04:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102e06:	3b 15 ac 27 11 80    	cmp    0x801127ac,%edx
80102e0c:	75 0b                	jne    80102e19 <log_write+0x69>
80102e0e:	eb 38                	jmp    80102e48 <log_write+0x98>
80102e10:	39 14 85 ac 27 11 80 	cmp    %edx,-0x7feed854(,%eax,4)
80102e17:	74 2f                	je     80102e48 <log_write+0x98>
  for (i = 0; i < log.lh.n; i++) {
80102e19:	83 c0 01             	add    $0x1,%eax
80102e1c:	39 c8                	cmp    %ecx,%eax
80102e1e:	75 f0                	jne    80102e10 <log_write+0x60>
      break;
  }
  log.lh.block[i] = b->blockno;
80102e20:	89 14 85 ac 27 11 80 	mov    %edx,-0x7feed854(,%eax,4)
  if (i == log.lh.n)
    log.lh.n++;
80102e27:	83 c0 01             	add    $0x1,%eax
80102e2a:	a3 a8 27 11 80       	mov    %eax,0x801127a8
  b->flags |= B_DIRTY; // prevent eviction
80102e2f:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102e32:	c7 45 08 60 27 11 80 	movl   $0x80112760,0x8(%ebp)
}
80102e39:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e3c:	c9                   	leave  
  release(&log.lock);
80102e3d:	e9 8e 18 00 00       	jmp    801046d0 <release>
80102e42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  log.lh.block[i] = b->blockno;
80102e48:	89 14 85 ac 27 11 80 	mov    %edx,-0x7feed854(,%eax,4)
80102e4f:	eb de                	jmp    80102e2f <log_write+0x7f>
80102e51:	8b 43 08             	mov    0x8(%ebx),%eax
80102e54:	a3 ac 27 11 80       	mov    %eax,0x801127ac
  if (i == log.lh.n)
80102e59:	75 d4                	jne    80102e2f <log_write+0x7f>
80102e5b:	31 c0                	xor    %eax,%eax
80102e5d:	eb c8                	jmp    80102e27 <log_write+0x77>
80102e5f:	90                   	nop
    panic("too big a transaction");
80102e60:	83 ec 0c             	sub    $0xc,%esp
80102e63:	68 4f 77 10 80       	push   $0x8010774f
80102e68:	e8 03 d5 ff ff       	call   80100370 <panic>
    panic("log_write outside of trans");
80102e6d:	83 ec 0c             	sub    $0xc,%esp
80102e70:	68 65 77 10 80       	push   $0x80107765
80102e75:	e8 f6 d4 ff ff       	call   80100370 <panic>
80102e7a:	66 90                	xchg   %ax,%ax
80102e7c:	66 90                	xchg   %ax,%ax
80102e7e:	66 90                	xchg   %ax,%ax

80102e80 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102e80:	55                   	push   %ebp
80102e81:	89 e5                	mov    %esp,%ebp
80102e83:	83 ec 08             	sub    $0x8,%esp
  cprintf("cpu%d: starting\n", cpunum());
80102e86:	e8 55 f8 ff ff       	call   801026e0 <cpunum>
80102e8b:	83 ec 08             	sub    $0x8,%esp
80102e8e:	50                   	push   %eax
80102e8f:	68 80 77 10 80       	push   $0x80107780
80102e94:	e8 c7 d7 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102e99:	e8 12 2c 00 00       	call   80105ab0 <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
80102e9e:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102ea5:	b8 01 00 00 00       	mov    $0x1,%eax
80102eaa:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
  scheduler();     // start running processes
80102eb1:	e8 ca 0c 00 00       	call   80103b80 <scheduler>
80102eb6:	8d 76 00             	lea    0x0(%esi),%esi
80102eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ec0 <mpenter>:
{
80102ec0:	55                   	push   %ebp
80102ec1:	89 e5                	mov    %esp,%ebp
80102ec3:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102ec6:	e8 f5 3d 00 00       	call   80106cc0 <switchkvm>
  seginit();
80102ecb:	e8 10 3c 00 00       	call   80106ae0 <seginit>
  lapicinit();
80102ed0:	e8 0b f7 ff ff       	call   801025e0 <lapicinit>
  mpmain();
80102ed5:	e8 a6 ff ff ff       	call   80102e80 <mpmain>
80102eda:	66 90                	xchg   %ax,%ax
80102edc:	66 90                	xchg   %ax,%ax
80102ede:	66 90                	xchg   %ax,%ax

80102ee0 <main>:
{
80102ee0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102ee4:	83 e4 f0             	and    $0xfffffff0,%esp
80102ee7:	ff 71 fc             	pushl  -0x4(%ecx)
80102eea:	55                   	push   %ebp
80102eeb:	89 e5                	mov    %esp,%ebp
80102eed:	53                   	push   %ebx
80102eee:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102eef:	83 ec 08             	sub    $0x8,%esp
80102ef2:	68 00 00 40 80       	push   $0x80400000
80102ef7:	68 e8 57 11 80       	push   $0x801157e8
80102efc:	e8 9f f4 ff ff       	call   801023a0 <kinit1>
  kvmalloc();      // kernel page table
80102f01:	e8 9a 3d 00 00       	call   80106ca0 <kvmalloc>
  mpinit();        // detect other processors
80102f06:	e8 a5 01 00 00       	call   801030b0 <mpinit>
  lapicinit();     // interrupt controller
80102f0b:	e8 d0 f6 ff ff       	call   801025e0 <lapicinit>
  seginit();       // segment descriptors
80102f10:	e8 cb 3b 00 00       	call   80106ae0 <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpunum());
80102f15:	e8 c6 f7 ff ff       	call   801026e0 <cpunum>
80102f1a:	5a                   	pop    %edx
80102f1b:	59                   	pop    %ecx
80102f1c:	50                   	push   %eax
80102f1d:	68 91 77 10 80       	push   $0x80107791
80102f22:	e8 39 d7 ff ff       	call   80100660 <cprintf>
  picinit();       // another interrupt controller
80102f27:	e8 94 03 00 00       	call   801032c0 <picinit>
  ioapicinit();    // another interrupt controller
80102f2c:	e8 8f f2 ff ff       	call   801021c0 <ioapicinit>
  consoleinit();   // console hardware
80102f31:	e8 5a da ff ff       	call   80100990 <consoleinit>
  uartinit();      // serial port
80102f36:	e8 75 2e 00 00       	call   80105db0 <uartinit>
  pinit();         // process table
80102f3b:	e8 30 09 00 00       	call   80103870 <pinit>
  tvinit();        // trap vectors
80102f40:	e8 cb 2a 00 00       	call   80105a10 <tvinit>
  binit();         // buffer cache
80102f45:	e8 f6 d0 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102f4a:	e8 d1 dd ff ff       	call   80100d20 <fileinit>
  ideinit();       // disk
80102f4f:	e8 3c f0 ff ff       	call   80101f90 <ideinit>
  if(!ismp)
80102f54:	8b 1d 44 28 11 80    	mov    0x80112844,%ebx
80102f5a:	83 c4 10             	add    $0x10,%esp
80102f5d:	85 db                	test   %ebx,%ebx
80102f5f:	0f 84 ca 00 00 00    	je     8010302f <main+0x14f>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102f65:	83 ec 04             	sub    $0x4,%esp

  for(c = cpus; c < cpus+ncpu; c++){
80102f68:	bb 60 28 11 80       	mov    $0x80112860,%ebx
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102f6d:	68 8a 00 00 00       	push   $0x8a
80102f72:	68 ec a4 10 80       	push   $0x8010a4ec
80102f77:	68 00 70 00 80       	push   $0x80007000
80102f7c:	e8 4f 18 00 00       	call   801047d0 <memmove>
  for(c = cpus; c < cpus+ncpu; c++){
80102f81:	69 05 40 2e 11 80 bc 	imul   $0xbc,0x80112e40,%eax
80102f88:	00 00 00 
80102f8b:	83 c4 10             	add    $0x10,%esp
80102f8e:	05 60 28 11 80       	add    $0x80112860,%eax
80102f93:	39 d8                	cmp    %ebx,%eax
80102f95:	76 7c                	jbe    80103013 <main+0x133>
80102f97:	89 f6                	mov    %esi,%esi
80102f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c == cpus+cpunum())  // We've started already.
80102fa0:	e8 3b f7 ff ff       	call   801026e0 <cpunum>
80102fa5:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80102fab:	05 60 28 11 80       	add    $0x80112860,%eax
80102fb0:	39 c3                	cmp    %eax,%ebx
80102fb2:	74 46                	je     80102ffa <main+0x11a>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102fb4:	e8 b7 f4 ff ff       	call   80102470 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102fb9:	83 ec 08             	sub    $0x8,%esp
    *(void**)(code-4) = stack + KSTACKSIZE;
80102fbc:	05 00 10 00 00       	add    $0x1000,%eax
    *(void**)(code-8) = mpenter;
80102fc1:	c7 05 f8 6f 00 80 c0 	movl   $0x80102ec0,0x80006ff8
80102fc8:	2e 10 80 
    *(void**)(code-4) = stack + KSTACKSIZE;
80102fcb:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102fd0:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102fd7:	90 10 00 
    lapicstartap(c->apicid, V2P(code));
80102fda:	68 00 70 00 00       	push   $0x7000
80102fdf:	0f b6 03             	movzbl (%ebx),%eax
80102fe2:	50                   	push   %eax
80102fe3:	e8 c8 f7 ff ff       	call   801027b0 <lapicstartap>
80102fe8:	83 c4 10             	add    $0x10,%esp
80102feb:	90                   	nop
80102fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102ff0:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80102ff6:	85 c0                	test   %eax,%eax
80102ff8:	74 f6                	je     80102ff0 <main+0x110>
  for(c = cpus; c < cpus+ncpu; c++){
80102ffa:	69 05 40 2e 11 80 bc 	imul   $0xbc,0x80112e40,%eax
80103001:	00 00 00 
80103004:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
8010300a:	05 60 28 11 80       	add    $0x80112860,%eax
8010300f:	39 c3                	cmp    %eax,%ebx
80103011:	72 8d                	jb     80102fa0 <main+0xc0>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80103013:	83 ec 08             	sub    $0x8,%esp
80103016:	68 00 00 00 8e       	push   $0x8e000000
8010301b:	68 00 00 40 80       	push   $0x80400000
80103020:	e8 eb f3 ff ff       	call   80102410 <kinit2>
  userinit();      // first user process
80103025:	e8 66 08 00 00       	call   80103890 <userinit>
  mpmain();        // finish this processor's setup
8010302a:	e8 51 fe ff ff       	call   80102e80 <mpmain>
    timerinit();   // uniprocessor timer
8010302f:	e8 7c 29 00 00       	call   801059b0 <timerinit>
80103034:	e9 2c ff ff ff       	jmp    80102f65 <main+0x85>
80103039:	66 90                	xchg   %ax,%ax
8010303b:	66 90                	xchg   %ax,%ax
8010303d:	66 90                	xchg   %ax,%ax
8010303f:	90                   	nop

80103040 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80103040:	55                   	push   %ebp
80103041:	89 e5                	mov    %esp,%ebp
80103043:	57                   	push   %edi
80103044:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80103045:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
{
8010304b:	53                   	push   %ebx
  e = addr+len;
8010304c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
{
8010304f:	83 ec 0c             	sub    $0xc,%esp
  for(p = addr; p < e; p += sizeof(struct mp))
80103052:	39 de                	cmp    %ebx,%esi
80103054:	73 40                	jae    80103096 <mpsearch1+0x56>
80103056:	8d 76 00             	lea    0x0(%esi),%esi
80103059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103060:	83 ec 04             	sub    $0x4,%esp
80103063:	8d 7e 10             	lea    0x10(%esi),%edi
80103066:	6a 04                	push   $0x4
80103068:	68 a8 77 10 80       	push   $0x801077a8
8010306d:	56                   	push   %esi
8010306e:	e8 fd 16 00 00       	call   80104770 <memcmp>
80103073:	83 c4 10             	add    $0x10,%esp
80103076:	85 c0                	test   %eax,%eax
80103078:	75 16                	jne    80103090 <mpsearch1+0x50>
8010307a:	8d 7e 10             	lea    0x10(%esi),%edi
8010307d:	89 f2                	mov    %esi,%edx
8010307f:	90                   	nop
    sum += addr[i];
80103080:	0f b6 0a             	movzbl (%edx),%ecx
80103083:	83 c2 01             	add    $0x1,%edx
80103086:	01 c8                	add    %ecx,%eax
  for(i=0; i<len; i++)
80103088:	39 fa                	cmp    %edi,%edx
8010308a:	75 f4                	jne    80103080 <mpsearch1+0x40>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
8010308c:	84 c0                	test   %al,%al
8010308e:	74 10                	je     801030a0 <mpsearch1+0x60>
  for(p = addr; p < e; p += sizeof(struct mp))
80103090:	39 fb                	cmp    %edi,%ebx
80103092:	89 fe                	mov    %edi,%esi
80103094:	77 ca                	ja     80103060 <mpsearch1+0x20>
      return (struct mp*)p;
  return 0;
}
80103096:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80103099:	31 c0                	xor    %eax,%eax
}
8010309b:	5b                   	pop    %ebx
8010309c:	5e                   	pop    %esi
8010309d:	5f                   	pop    %edi
8010309e:	5d                   	pop    %ebp
8010309f:	c3                   	ret    
801030a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030a3:	89 f0                	mov    %esi,%eax
801030a5:	5b                   	pop    %ebx
801030a6:	5e                   	pop    %esi
801030a7:	5f                   	pop    %edi
801030a8:	5d                   	pop    %ebp
801030a9:	c3                   	ret    
801030aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801030b0 <mpinit>:
  return conf;
}

void
mpinit(void)
{
801030b0:	55                   	push   %ebp
801030b1:	89 e5                	mov    %esp,%ebp
801030b3:	57                   	push   %edi
801030b4:	56                   	push   %esi
801030b5:	53                   	push   %ebx
801030b6:	83 ec 1c             	sub    $0x1c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
801030b9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
801030c0:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
801030c7:	c1 e0 08             	shl    $0x8,%eax
801030ca:	09 d0                	or     %edx,%eax
801030cc:	c1 e0 04             	shl    $0x4,%eax
801030cf:	85 c0                	test   %eax,%eax
801030d1:	75 1b                	jne    801030ee <mpinit+0x3e>
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
801030d3:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
801030da:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
801030e1:	c1 e0 08             	shl    $0x8,%eax
801030e4:	09 d0                	or     %edx,%eax
801030e6:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
801030e9:	2d 00 04 00 00       	sub    $0x400,%eax
    if((mp = mpsearch1(p, 1024)))
801030ee:	ba 00 04 00 00       	mov    $0x400,%edx
801030f3:	e8 48 ff ff ff       	call   80103040 <mpsearch1>
801030f8:	85 c0                	test   %eax,%eax
801030fa:	89 c6                	mov    %eax,%esi
801030fc:	0f 84 66 01 00 00    	je     80103268 <mpinit+0x1b8>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103102:	8b 5e 04             	mov    0x4(%esi),%ebx
80103105:	85 db                	test   %ebx,%ebx
80103107:	0f 84 d6 00 00 00    	je     801031e3 <mpinit+0x133>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010310d:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
80103113:	83 ec 04             	sub    $0x4,%esp
80103116:	6a 04                	push   $0x4
80103118:	68 ad 77 10 80       	push   $0x801077ad
8010311d:	50                   	push   %eax
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010311e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
80103121:	e8 4a 16 00 00       	call   80104770 <memcmp>
80103126:	83 c4 10             	add    $0x10,%esp
80103129:	85 c0                	test   %eax,%eax
8010312b:	0f 85 b2 00 00 00    	jne    801031e3 <mpinit+0x133>
  if(conf->version != 1 && conf->version != 4)
80103131:	0f b6 93 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%edx
80103138:	80 fa 01             	cmp    $0x1,%dl
8010313b:	74 09                	je     80103146 <mpinit+0x96>
8010313d:	80 fa 04             	cmp    $0x4,%dl
80103140:	0f 85 9d 00 00 00    	jne    801031e3 <mpinit+0x133>
  if(sum((uchar*)conf, conf->length) != 0)
80103146:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
  for(i=0; i<len; i++)
8010314d:	85 ff                	test   %edi,%edi
8010314f:	74 1c                	je     8010316d <mpinit+0xbd>
80103151:	31 d2                	xor    %edx,%edx
80103153:	90                   	nop
80103154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
80103158:	0f b6 8c 13 00 00 00 	movzbl -0x80000000(%ebx,%edx,1),%ecx
8010315f:	80 
  for(i=0; i<len; i++)
80103160:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
80103163:	01 c8                	add    %ecx,%eax
  for(i=0; i<len; i++)
80103165:	39 d7                	cmp    %edx,%edi
80103167:	75 ef                	jne    80103158 <mpinit+0xa8>
  if(sum((uchar*)conf, conf->length) != 0)
80103169:	84 c0                	test   %al,%al
8010316b:	75 76                	jne    801031e3 <mpinit+0x133>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
8010316d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103170:	85 ff                	test   %edi,%edi
80103172:	74 6f                	je     801031e3 <mpinit+0x133>
    return;
  ismp = 1;
80103174:	c7 05 44 28 11 80 01 	movl   $0x1,0x80112844
8010317b:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
8010317e:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103184:	a3 5c 27 11 80       	mov    %eax,0x8011275c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103189:	0f b7 8b 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%ecx
80103190:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
80103196:	01 f9                	add    %edi,%ecx
80103198:	39 c8                	cmp    %ecx,%eax
8010319a:	0f 83 a0 00 00 00    	jae    80103240 <mpinit+0x190>
    switch(*p){
801031a0:	80 38 04             	cmpb   $0x4,(%eax)
801031a3:	0f 87 87 00 00 00    	ja     80103230 <mpinit+0x180>
801031a9:	0f b6 10             	movzbl (%eax),%edx
801031ac:	ff 24 95 b4 77 10 80 	jmp    *-0x7fef884c(,%edx,4)
801031b3:	90                   	nop
801031b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
801031b8:	83 c0 08             	add    $0x8,%eax
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801031bb:	39 c1                	cmp    %eax,%ecx
801031bd:	77 e1                	ja     801031a0 <mpinit+0xf0>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp){
801031bf:	a1 44 28 11 80       	mov    0x80112844,%eax
801031c4:	85 c0                	test   %eax,%eax
801031c6:	75 78                	jne    80103240 <mpinit+0x190>
    // Didn't like what we found; fall back to no MP.
    ncpu = 1;
801031c8:	c7 05 40 2e 11 80 01 	movl   $0x1,0x80112e40
801031cf:	00 00 00 
    lapic = 0;
801031d2:	c7 05 5c 27 11 80 00 	movl   $0x0,0x8011275c
801031d9:	00 00 00 
    ioapicid = 0;
801031dc:	c6 05 40 28 11 80 00 	movb   $0x0,0x80112840
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
801031e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801031e6:	5b                   	pop    %ebx
801031e7:	5e                   	pop    %esi
801031e8:	5f                   	pop    %edi
801031e9:	5d                   	pop    %ebp
801031ea:	c3                   	ret    
801031eb:	90                   	nop
801031ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(ncpu < NCPU) {
801031f0:	8b 15 40 2e 11 80    	mov    0x80112e40,%edx
801031f6:	83 fa 07             	cmp    $0x7,%edx
801031f9:	7f 19                	jg     80103214 <mpinit+0x164>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801031fb:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
801031ff:	69 fa bc 00 00 00    	imul   $0xbc,%edx,%edi
        ncpu++;
80103205:	83 c2 01             	add    $0x1,%edx
80103208:	89 15 40 2e 11 80    	mov    %edx,0x80112e40
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
8010320e:	88 9f 60 28 11 80    	mov    %bl,-0x7feed7a0(%edi)
      p += sizeof(struct mpproc);
80103214:	83 c0 14             	add    $0x14,%eax
      continue;
80103217:	eb a2                	jmp    801031bb <mpinit+0x10b>
80103219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      ioapicid = ioapic->apicno;
80103220:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
80103224:	83 c0 08             	add    $0x8,%eax
      ioapicid = ioapic->apicno;
80103227:	88 15 40 28 11 80    	mov    %dl,0x80112840
      continue;
8010322d:	eb 8c                	jmp    801031bb <mpinit+0x10b>
8010322f:	90                   	nop
      ismp = 0;
80103230:	c7 05 44 28 11 80 00 	movl   $0x0,0x80112844
80103237:	00 00 00 
      break;
8010323a:	e9 7c ff ff ff       	jmp    801031bb <mpinit+0x10b>
8010323f:	90                   	nop
  if(mp->imcrp){
80103240:	80 7e 0c 00          	cmpb   $0x0,0xc(%esi)
80103244:	74 9d                	je     801031e3 <mpinit+0x133>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103246:	ba 22 00 00 00       	mov    $0x22,%edx
8010324b:	b8 70 00 00 00       	mov    $0x70,%eax
80103250:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103251:	ba 23 00 00 00       	mov    $0x23,%edx
80103256:	ec                   	in     (%dx),%al
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80103257:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010325a:	ee                   	out    %al,(%dx)
}
8010325b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010325e:	5b                   	pop    %ebx
8010325f:	5e                   	pop    %esi
80103260:	5f                   	pop    %edi
80103261:	5d                   	pop    %ebp
80103262:	c3                   	ret    
80103263:	90                   	nop
80103264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return mpsearch1(0xF0000, 0x10000);
80103268:	ba 00 00 01 00       	mov    $0x10000,%edx
8010326d:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103272:	e8 c9 fd ff ff       	call   80103040 <mpsearch1>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103277:	85 c0                	test   %eax,%eax
  return mpsearch1(0xF0000, 0x10000);
80103279:	89 c6                	mov    %eax,%esi
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010327b:	0f 85 81 fe ff ff    	jne    80103102 <mpinit+0x52>
80103281:	e9 5d ff ff ff       	jmp    801031e3 <mpinit+0x133>
80103286:	66 90                	xchg   %ax,%ax
80103288:	66 90                	xchg   %ax,%ax
8010328a:	66 90                	xchg   %ax,%ax
8010328c:	66 90                	xchg   %ax,%ax
8010328e:	66 90                	xchg   %ax,%ax

80103290 <picenable>:
  outb(IO_PIC2+1, mask >> 8);
}

void
picenable(int irq)
{
80103290:	55                   	push   %ebp
  picsetmask(irqmask & ~(1<<irq));
80103291:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
80103296:	ba 21 00 00 00       	mov    $0x21,%edx
{
8010329b:	89 e5                	mov    %esp,%ebp
  picsetmask(irqmask & ~(1<<irq));
8010329d:	8b 4d 08             	mov    0x8(%ebp),%ecx
801032a0:	d3 c0                	rol    %cl,%eax
801032a2:	66 23 05 00 a0 10 80 	and    0x8010a000,%ax
  irqmask = mask;
801032a9:	66 a3 00 a0 10 80    	mov    %ax,0x8010a000
801032af:	ee                   	out    %al,(%dx)
801032b0:	ba a1 00 00 00       	mov    $0xa1,%edx
  outb(IO_PIC2+1, mask >> 8);
801032b5:	66 c1 e8 08          	shr    $0x8,%ax
801032b9:	ee                   	out    %al,(%dx)
}
801032ba:	5d                   	pop    %ebp
801032bb:	c3                   	ret    
801032bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801032c0 <picinit>:

// Initialize the 8259A interrupt controllers.
void
picinit(void)
{
801032c0:	55                   	push   %ebp
801032c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032c6:	89 e5                	mov    %esp,%ebp
801032c8:	57                   	push   %edi
801032c9:	56                   	push   %esi
801032ca:	53                   	push   %ebx
801032cb:	bb 21 00 00 00       	mov    $0x21,%ebx
801032d0:	89 da                	mov    %ebx,%edx
801032d2:	ee                   	out    %al,(%dx)
801032d3:	b9 a1 00 00 00       	mov    $0xa1,%ecx
801032d8:	89 ca                	mov    %ecx,%edx
801032da:	ee                   	out    %al,(%dx)
801032db:	bf 11 00 00 00       	mov    $0x11,%edi
801032e0:	be 20 00 00 00       	mov    $0x20,%esi
801032e5:	89 f8                	mov    %edi,%eax
801032e7:	89 f2                	mov    %esi,%edx
801032e9:	ee                   	out    %al,(%dx)
801032ea:	b8 20 00 00 00       	mov    $0x20,%eax
801032ef:	89 da                	mov    %ebx,%edx
801032f1:	ee                   	out    %al,(%dx)
801032f2:	b8 04 00 00 00       	mov    $0x4,%eax
801032f7:	ee                   	out    %al,(%dx)
801032f8:	b8 03 00 00 00       	mov    $0x3,%eax
801032fd:	ee                   	out    %al,(%dx)
801032fe:	bb a0 00 00 00       	mov    $0xa0,%ebx
80103303:	89 f8                	mov    %edi,%eax
80103305:	89 da                	mov    %ebx,%edx
80103307:	ee                   	out    %al,(%dx)
80103308:	b8 28 00 00 00       	mov    $0x28,%eax
8010330d:	89 ca                	mov    %ecx,%edx
8010330f:	ee                   	out    %al,(%dx)
80103310:	b8 02 00 00 00       	mov    $0x2,%eax
80103315:	ee                   	out    %al,(%dx)
80103316:	b8 03 00 00 00       	mov    $0x3,%eax
8010331b:	ee                   	out    %al,(%dx)
8010331c:	bf 68 00 00 00       	mov    $0x68,%edi
80103321:	89 f2                	mov    %esi,%edx
80103323:	89 f8                	mov    %edi,%eax
80103325:	ee                   	out    %al,(%dx)
80103326:	b9 0a 00 00 00       	mov    $0xa,%ecx
8010332b:	89 c8                	mov    %ecx,%eax
8010332d:	ee                   	out    %al,(%dx)
8010332e:	89 f8                	mov    %edi,%eax
80103330:	89 da                	mov    %ebx,%edx
80103332:	ee                   	out    %al,(%dx)
80103333:	89 c8                	mov    %ecx,%eax
80103335:	ee                   	out    %al,(%dx)
  outb(IO_PIC1, 0x0a);             // read IRR by default

  outb(IO_PIC2, 0x68);             // OCW3
  outb(IO_PIC2, 0x0a);             // OCW3

  if(irqmask != 0xFFFF)
80103336:	0f b7 05 00 a0 10 80 	movzwl 0x8010a000,%eax
8010333d:	66 83 f8 ff          	cmp    $0xffff,%ax
80103341:	74 10                	je     80103353 <picinit+0x93>
80103343:	ba 21 00 00 00       	mov    $0x21,%edx
80103348:	ee                   	out    %al,(%dx)
80103349:	ba a1 00 00 00       	mov    $0xa1,%edx
  outb(IO_PIC2+1, mask >> 8);
8010334e:	66 c1 e8 08          	shr    $0x8,%ax
80103352:	ee                   	out    %al,(%dx)
    picsetmask(irqmask);
}
80103353:	5b                   	pop    %ebx
80103354:	5e                   	pop    %esi
80103355:	5f                   	pop    %edi
80103356:	5d                   	pop    %ebp
80103357:	c3                   	ret    
80103358:	66 90                	xchg   %ax,%ax
8010335a:	66 90                	xchg   %ax,%ax
8010335c:	66 90                	xchg   %ax,%ax
8010335e:	66 90                	xchg   %ax,%ax

80103360 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103360:	55                   	push   %ebp
80103361:	89 e5                	mov    %esp,%ebp
80103363:	57                   	push   %edi
80103364:	56                   	push   %esi
80103365:	53                   	push   %ebx
80103366:	83 ec 0c             	sub    $0xc,%esp
80103369:	8b 75 08             	mov    0x8(%ebp),%esi
8010336c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010336f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103375:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010337b:	e8 c0 d9 ff ff       	call   80100d40 <filealloc>
80103380:	85 c0                	test   %eax,%eax
80103382:	89 06                	mov    %eax,(%esi)
80103384:	0f 84 a8 00 00 00    	je     80103432 <pipealloc+0xd2>
8010338a:	e8 b1 d9 ff ff       	call   80100d40 <filealloc>
8010338f:	85 c0                	test   %eax,%eax
80103391:	89 03                	mov    %eax,(%ebx)
80103393:	0f 84 87 00 00 00    	je     80103420 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103399:	e8 d2 f0 ff ff       	call   80102470 <kalloc>
8010339e:	85 c0                	test   %eax,%eax
801033a0:	89 c7                	mov    %eax,%edi
801033a2:	0f 84 b0 00 00 00    	je     80103458 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
801033a8:	83 ec 08             	sub    $0x8,%esp
  p->readopen = 1;
801033ab:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801033b2:	00 00 00 
  p->writeopen = 1;
801033b5:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801033bc:	00 00 00 
  p->nwrite = 0;
801033bf:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801033c6:	00 00 00 
  p->nread = 0;
801033c9:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801033d0:	00 00 00 
  initlock(&p->lock, "pipe");
801033d3:	68 c8 77 10 80       	push   $0x801077c8
801033d8:	50                   	push   %eax
801033d9:	e8 f2 10 00 00       	call   801044d0 <initlock>
  (*f0)->type = FD_PIPE;
801033de:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
801033e0:	83 c4 10             	add    $0x10,%esp
  (*f0)->type = FD_PIPE;
801033e3:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
801033e9:	8b 06                	mov    (%esi),%eax
801033eb:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
801033ef:	8b 06                	mov    (%esi),%eax
801033f1:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
801033f5:	8b 06                	mov    (%esi),%eax
801033f7:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
801033fa:	8b 03                	mov    (%ebx),%eax
801033fc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103402:	8b 03                	mov    (%ebx),%eax
80103404:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103408:	8b 03                	mov    (%ebx),%eax
8010340a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
8010340e:	8b 03                	mov    (%ebx),%eax
80103410:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103413:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80103416:	31 c0                	xor    %eax,%eax
}
80103418:	5b                   	pop    %ebx
80103419:	5e                   	pop    %esi
8010341a:	5f                   	pop    %edi
8010341b:	5d                   	pop    %ebp
8010341c:	c3                   	ret    
8010341d:	8d 76 00             	lea    0x0(%esi),%esi
  if(*f0)
80103420:	8b 06                	mov    (%esi),%eax
80103422:	85 c0                	test   %eax,%eax
80103424:	74 1e                	je     80103444 <pipealloc+0xe4>
    fileclose(*f0);
80103426:	83 ec 0c             	sub    $0xc,%esp
80103429:	50                   	push   %eax
8010342a:	e8 d1 d9 ff ff       	call   80100e00 <fileclose>
8010342f:	83 c4 10             	add    $0x10,%esp
  if(*f1)
80103432:	8b 03                	mov    (%ebx),%eax
80103434:	85 c0                	test   %eax,%eax
80103436:	74 0c                	je     80103444 <pipealloc+0xe4>
    fileclose(*f1);
80103438:	83 ec 0c             	sub    $0xc,%esp
8010343b:	50                   	push   %eax
8010343c:	e8 bf d9 ff ff       	call   80100e00 <fileclose>
80103441:	83 c4 10             	add    $0x10,%esp
}
80103444:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
80103447:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010344c:	5b                   	pop    %ebx
8010344d:	5e                   	pop    %esi
8010344e:	5f                   	pop    %edi
8010344f:	5d                   	pop    %ebp
80103450:	c3                   	ret    
80103451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(*f0)
80103458:	8b 06                	mov    (%esi),%eax
8010345a:	85 c0                	test   %eax,%eax
8010345c:	75 c8                	jne    80103426 <pipealloc+0xc6>
8010345e:	eb d2                	jmp    80103432 <pipealloc+0xd2>

80103460 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103460:	55                   	push   %ebp
80103461:	89 e5                	mov    %esp,%ebp
80103463:	56                   	push   %esi
80103464:	53                   	push   %ebx
80103465:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103468:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010346b:	83 ec 0c             	sub    $0xc,%esp
8010346e:	53                   	push   %ebx
8010346f:	e8 7c 10 00 00       	call   801044f0 <acquire>
  if(writable){
80103474:	83 c4 10             	add    $0x10,%esp
80103477:	85 f6                	test   %esi,%esi
80103479:	74 45                	je     801034c0 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
8010347b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103481:	83 ec 0c             	sub    $0xc,%esp
    p->writeopen = 0;
80103484:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010348b:	00 00 00 
    wakeup(&p->nread);
8010348e:	50                   	push   %eax
8010348f:	e8 fc 0b 00 00       	call   80104090 <wakeup>
80103494:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103497:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010349d:	85 d2                	test   %edx,%edx
8010349f:	75 0a                	jne    801034ab <pipeclose+0x4b>
801034a1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801034a7:	85 c0                	test   %eax,%eax
801034a9:	74 35                	je     801034e0 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801034ab:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801034ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034b1:	5b                   	pop    %ebx
801034b2:	5e                   	pop    %esi
801034b3:	5d                   	pop    %ebp
    release(&p->lock);
801034b4:	e9 17 12 00 00       	jmp    801046d0 <release>
801034b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&p->nwrite);
801034c0:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801034c6:	83 ec 0c             	sub    $0xc,%esp
    p->readopen = 0;
801034c9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801034d0:	00 00 00 
    wakeup(&p->nwrite);
801034d3:	50                   	push   %eax
801034d4:	e8 b7 0b 00 00       	call   80104090 <wakeup>
801034d9:	83 c4 10             	add    $0x10,%esp
801034dc:	eb b9                	jmp    80103497 <pipeclose+0x37>
801034de:	66 90                	xchg   %ax,%ax
    release(&p->lock);
801034e0:	83 ec 0c             	sub    $0xc,%esp
801034e3:	53                   	push   %ebx
801034e4:	e8 e7 11 00 00       	call   801046d0 <release>
    kfree((char*)p);
801034e9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801034ec:	83 c4 10             	add    $0x10,%esp
}
801034ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034f2:	5b                   	pop    %ebx
801034f3:	5e                   	pop    %esi
801034f4:	5d                   	pop    %ebp
    kfree((char*)p);
801034f5:	e9 c6 ed ff ff       	jmp    801022c0 <kfree>
801034fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103500 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103500:	55                   	push   %ebp
80103501:	89 e5                	mov    %esp,%ebp
80103503:	57                   	push   %edi
80103504:	56                   	push   %esi
80103505:	53                   	push   %ebx
80103506:	83 ec 28             	sub    $0x28,%esp
80103509:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i;

  acquire(&p->lock);
8010350c:	57                   	push   %edi
8010350d:	e8 de 0f 00 00       	call   801044f0 <acquire>
  for(i = 0; i < n; i++){
80103512:	8b 45 10             	mov    0x10(%ebp),%eax
80103515:	83 c4 10             	add    $0x10,%esp
80103518:	85 c0                	test   %eax,%eax
8010351a:	0f 8e c6 00 00 00    	jle    801035e6 <pipewrite+0xe6>
80103520:	8b 45 0c             	mov    0xc(%ebp),%eax
80103523:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
80103529:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
8010352f:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
80103535:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103538:	03 45 10             	add    0x10(%ebp),%eax
8010353b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010353e:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
80103544:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
8010354a:	39 d1                	cmp    %edx,%ecx
8010354c:	0f 85 cf 00 00 00    	jne    80103621 <pipewrite+0x121>
      if(p->readopen == 0 || proc->killed){
80103552:	8b 97 3c 02 00 00    	mov    0x23c(%edi),%edx
80103558:	85 d2                	test   %edx,%edx
8010355a:	0f 84 a8 00 00 00    	je     80103608 <pipewrite+0x108>
80103560:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103567:	8b 42 24             	mov    0x24(%edx),%eax
8010356a:	85 c0                	test   %eax,%eax
8010356c:	74 25                	je     80103593 <pipewrite+0x93>
8010356e:	e9 95 00 00 00       	jmp    80103608 <pipewrite+0x108>
80103573:	90                   	nop
80103574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103578:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
8010357e:	85 c0                	test   %eax,%eax
80103580:	0f 84 82 00 00 00    	je     80103608 <pipewrite+0x108>
80103586:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010358c:	8b 40 24             	mov    0x24(%eax),%eax
8010358f:	85 c0                	test   %eax,%eax
80103591:	75 75                	jne    80103608 <pipewrite+0x108>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80103593:	83 ec 0c             	sub    $0xc,%esp
80103596:	56                   	push   %esi
80103597:	e8 f4 0a 00 00       	call   80104090 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010359c:	59                   	pop    %ecx
8010359d:	58                   	pop    %eax
8010359e:	57                   	push   %edi
8010359f:	53                   	push   %ebx
801035a0:	e8 2b 09 00 00       	call   80103ed0 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801035a5:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
801035ab:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
801035b1:	83 c4 10             	add    $0x10,%esp
801035b4:	05 00 02 00 00       	add    $0x200,%eax
801035b9:	39 c2                	cmp    %eax,%edx
801035bb:	74 bb                	je     80103578 <pipewrite+0x78>
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801035bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801035c0:	8d 4a 01             	lea    0x1(%edx),%ecx
801035c3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
801035c7:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801035cd:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
801035d3:	0f b6 00             	movzbl (%eax),%eax
801035d6:	88 44 17 34          	mov    %al,0x34(%edi,%edx,1)
801035da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  for(i = 0; i < n; i++){
801035dd:	39 45 e0             	cmp    %eax,-0x20(%ebp)
801035e0:	0f 85 58 ff ff ff    	jne    8010353e <pipewrite+0x3e>
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
801035e6:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
801035ec:	83 ec 0c             	sub    $0xc,%esp
801035ef:	52                   	push   %edx
801035f0:	e8 9b 0a 00 00       	call   80104090 <wakeup>
  release(&p->lock);
801035f5:	89 3c 24             	mov    %edi,(%esp)
801035f8:	e8 d3 10 00 00       	call   801046d0 <release>
  return n;
801035fd:	83 c4 10             	add    $0x10,%esp
80103600:	8b 45 10             	mov    0x10(%ebp),%eax
80103603:	eb 14                	jmp    80103619 <pipewrite+0x119>
80103605:	8d 76 00             	lea    0x0(%esi),%esi
        release(&p->lock);
80103608:	83 ec 0c             	sub    $0xc,%esp
8010360b:	57                   	push   %edi
8010360c:	e8 bf 10 00 00       	call   801046d0 <release>
        return -1;
80103611:	83 c4 10             	add    $0x10,%esp
80103614:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103619:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010361c:	5b                   	pop    %ebx
8010361d:	5e                   	pop    %esi
8010361e:	5f                   	pop    %edi
8010361f:	5d                   	pop    %ebp
80103620:	c3                   	ret    
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103621:	89 ca                	mov    %ecx,%edx
80103623:	eb 98                	jmp    801035bd <pipewrite+0xbd>
80103625:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103630 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
80103630:	55                   	push   %ebp
80103631:	89 e5                	mov    %esp,%ebp
80103633:	57                   	push   %edi
80103634:	56                   	push   %esi
80103635:	53                   	push   %ebx
80103636:	83 ec 18             	sub    $0x18,%esp
80103639:	8b 75 08             	mov    0x8(%ebp),%esi
8010363c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010363f:	56                   	push   %esi
80103640:	e8 ab 0e 00 00       	call   801044f0 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103645:	83 c4 10             	add    $0x10,%esp
80103648:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
8010364e:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103654:	75 72                	jne    801036c8 <piperead+0x98>
80103656:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
8010365c:	85 db                	test   %ebx,%ebx
8010365e:	0f 84 cc 00 00 00    	je     80103730 <piperead+0x100>
80103664:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
8010366a:	eb 2d                	jmp    80103699 <piperead+0x69>
8010366c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80103670:	83 ec 08             	sub    $0x8,%esp
80103673:	56                   	push   %esi
80103674:	53                   	push   %ebx
80103675:	e8 56 08 00 00       	call   80103ed0 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
8010367a:	83 c4 10             	add    $0x10,%esp
8010367d:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103683:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103689:	75 3d                	jne    801036c8 <piperead+0x98>
8010368b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103691:	85 d2                	test   %edx,%edx
80103693:	0f 84 97 00 00 00    	je     80103730 <piperead+0x100>
    if(proc->killed){
80103699:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010369f:	8b 48 24             	mov    0x24(%eax),%ecx
801036a2:	85 c9                	test   %ecx,%ecx
801036a4:	74 ca                	je     80103670 <piperead+0x40>
      release(&p->lock);
801036a6:	83 ec 0c             	sub    $0xc,%esp
      return -1;
801036a9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
      release(&p->lock);
801036ae:	56                   	push   %esi
801036af:	e8 1c 10 00 00       	call   801046d0 <release>
      return -1;
801036b4:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801036b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801036ba:	89 d8                	mov    %ebx,%eax
801036bc:	5b                   	pop    %ebx
801036bd:	5e                   	pop    %esi
801036be:	5f                   	pop    %edi
801036bf:	5d                   	pop    %ebp
801036c0:	c3                   	ret    
801036c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801036c8:	8b 45 10             	mov    0x10(%ebp),%eax
801036cb:	85 c0                	test   %eax,%eax
801036cd:	7e 61                	jle    80103730 <piperead+0x100>
    if(p->nread == p->nwrite)
801036cf:	31 db                	xor    %ebx,%ebx
801036d1:	eb 13                	jmp    801036e6 <piperead+0xb6>
801036d3:	90                   	nop
801036d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036d8:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801036de:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801036e4:	74 1f                	je     80103705 <piperead+0xd5>
    addr[i] = p->data[p->nread++ % PIPESIZE];
801036e6:	8d 41 01             	lea    0x1(%ecx),%eax
801036e9:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801036ef:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
801036f5:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
801036fa:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801036fd:	83 c3 01             	add    $0x1,%ebx
80103700:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80103703:	75 d3                	jne    801036d8 <piperead+0xa8>
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103705:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
8010370b:	83 ec 0c             	sub    $0xc,%esp
8010370e:	50                   	push   %eax
8010370f:	e8 7c 09 00 00       	call   80104090 <wakeup>
  release(&p->lock);
80103714:	89 34 24             	mov    %esi,(%esp)
80103717:	e8 b4 0f 00 00       	call   801046d0 <release>
  return i;
8010371c:	83 c4 10             	add    $0x10,%esp
}
8010371f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103722:	89 d8                	mov    %ebx,%eax
80103724:	5b                   	pop    %ebx
80103725:	5e                   	pop    %esi
80103726:	5f                   	pop    %edi
80103727:	5d                   	pop    %ebp
80103728:	c3                   	ret    
80103729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p->nread == p->nwrite)
80103730:	31 db                	xor    %ebx,%ebx
80103732:	eb d1                	jmp    80103705 <piperead+0xd5>
80103734:	66 90                	xchg   %ax,%ax
80103736:	66 90                	xchg   %ax,%ax
80103738:	66 90                	xchg   %ax,%ax
8010373a:	66 90                	xchg   %ax,%ax
8010373c:	66 90                	xchg   %ax,%ax
8010373e:	66 90                	xchg   %ax,%ax

80103740 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103740:	55                   	push   %ebp
80103741:	89 e5                	mov    %esp,%ebp
80103743:	53                   	push   %ebx
  struct proc *p;
  char *sp;

   acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103744:	bb 94 2e 11 80       	mov    $0x80112e94,%ebx
{
80103749:	83 ec 10             	sub    $0x10,%esp
   acquire(&ptable.lock);
8010374c:	68 60 2e 11 80       	push   $0x80112e60
80103751:	e8 9a 0d 00 00       	call   801044f0 <acquire>
80103756:	83 c4 10             	add    $0x10,%esp
80103759:	eb 17                	jmp    80103772 <allocproc+0x32>
8010375b:	90                   	nop
8010375c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103760:	81 c3 84 00 00 00    	add    $0x84,%ebx
80103766:	81 fb 94 4f 11 80    	cmp    $0x80114f94,%ebx
8010376c:	0f 83 7e 00 00 00    	jae    801037f0 <allocproc+0xb0>
      if(p->state == UNUSED)
80103772:	8b 43 0c             	mov    0xc(%ebx),%eax
80103775:	85 c0                	test   %eax,%eax
80103777:	75 e7                	jne    80103760 <allocproc+0x20>
    release(&ptable.lock);
    return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103779:	a1 08 a0 10 80       	mov    0x8010a008,%eax
  p->priority = 10; //Default priority
  release(&ptable.lock);
8010377e:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
80103781:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->priority = 10; //Default priority
80103788:	c7 83 80 00 00 00 0a 	movl   $0xa,0x80(%ebx)
8010378f:	00 00 00 
  p->pid = nextpid++;
80103792:	8d 50 01             	lea    0x1(%eax),%edx
80103795:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
80103798:	68 60 2e 11 80       	push   $0x80112e60
  p->pid = nextpid++;
8010379d:	89 15 08 a0 10 80    	mov    %edx,0x8010a008
  release(&ptable.lock);
801037a3:	e8 28 0f 00 00       	call   801046d0 <release>
  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
801037a8:	e8 c3 ec ff ff       	call   80102470 <kalloc>
801037ad:	83 c4 10             	add    $0x10,%esp
801037b0:	85 c0                	test   %eax,%eax
801037b2:	89 43 08             	mov    %eax,0x8(%ebx)
801037b5:	74 52                	je     80103809 <allocproc+0xc9>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801037b7:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
801037bd:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
801037c0:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
801037c5:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
801037c8:	c7 40 14 fe 59 10 80 	movl   $0x801059fe,0x14(%eax)
  p->context = (struct context*)sp;
801037cf:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
801037d2:	6a 14                	push   $0x14
801037d4:	6a 00                	push   $0x0
801037d6:	50                   	push   %eax
801037d7:	e8 44 0f 00 00       	call   80104720 <memset>
  p->context->eip = (uint)forkret;
801037dc:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
801037df:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
801037e2:	c7 40 10 20 38 10 80 	movl   $0x80103820,0x10(%eax)
}
801037e9:	89 d8                	mov    %ebx,%eax
801037eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037ee:	c9                   	leave  
801037ef:	c3                   	ret    
    release(&ptable.lock);
801037f0:	83 ec 0c             	sub    $0xc,%esp
    return 0;
801037f3:	31 db                	xor    %ebx,%ebx
    release(&ptable.lock);
801037f5:	68 60 2e 11 80       	push   $0x80112e60
801037fa:	e8 d1 0e 00 00       	call   801046d0 <release>
}
801037ff:	89 d8                	mov    %ebx,%eax
    return 0;
80103801:	83 c4 10             	add    $0x10,%esp
}
80103804:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103807:	c9                   	leave  
80103808:	c3                   	ret    
    p->state = UNUSED;
80103809:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103810:	31 db                	xor    %ebx,%ebx
80103812:	eb d5                	jmp    801037e9 <allocproc+0xa9>
80103814:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010381a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103820 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103820:	55                   	push   %ebp
80103821:	89 e5                	mov    %esp,%ebp
80103823:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103826:	68 60 2e 11 80       	push   $0x80112e60
8010382b:	e8 a0 0e 00 00       	call   801046d0 <release>

  if (first) {
80103830:	a1 04 a0 10 80       	mov    0x8010a004,%eax
80103835:	83 c4 10             	add    $0x10,%esp
80103838:	85 c0                	test   %eax,%eax
8010383a:	75 04                	jne    80103840 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010383c:	c9                   	leave  
8010383d:	c3                   	ret    
8010383e:	66 90                	xchg   %ax,%ax
    iinit(ROOTDEV);
80103840:	83 ec 0c             	sub    $0xc,%esp
    first = 0;
80103843:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
8010384a:	00 00 00 
    iinit(ROOTDEV);
8010384d:	6a 01                	push   $0x1
8010384f:	e8 fc db ff ff       	call   80101450 <iinit>
    initlog(ROOTDEV);
80103854:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010385b:	e8 d0 f2 ff ff       	call   80102b30 <initlog>
80103860:	83 c4 10             	add    $0x10,%esp
}
80103863:	c9                   	leave  
80103864:	c3                   	ret    
80103865:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103870 <pinit>:
{
80103870:	55                   	push   %ebp
80103871:	89 e5                	mov    %esp,%ebp
80103873:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103876:	68 cd 77 10 80       	push   $0x801077cd
8010387b:	68 60 2e 11 80       	push   $0x80112e60
80103880:	e8 4b 0c 00 00       	call   801044d0 <initlock>
}
80103885:	83 c4 10             	add    $0x10,%esp
80103888:	c9                   	leave  
80103889:	c3                   	ret    
8010388a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103890 <userinit>:
{
80103890:	55                   	push   %ebp
80103891:	89 e5                	mov    %esp,%ebp
80103893:	53                   	push   %ebx
80103894:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
80103897:	e8 a4 fe ff ff       	call   80103740 <allocproc>
8010389c:	89 c3                	mov    %eax,%ebx
  initproc = p;
8010389e:	a3 1c a6 10 80       	mov    %eax,0x8010a61c
  if((p->pgdir = setupkvm()) == 0)
801038a3:	e8 88 33 00 00       	call   80106c30 <setupkvm>
801038a8:	85 c0                	test   %eax,%eax
801038aa:	89 43 04             	mov    %eax,0x4(%ebx)
801038ad:	0f 84 c4 00 00 00    	je     80103977 <userinit+0xe7>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801038b3:	83 ec 04             	sub    $0x4,%esp
801038b6:	68 2c 00 00 00       	push   $0x2c
801038bb:	68 c0 a4 10 80       	push   $0x8010a4c0
801038c0:	50                   	push   %eax
801038c1:	e8 ea 34 00 00       	call   80106db0 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
801038c6:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
801038c9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801038cf:	6a 4c                	push   $0x4c
801038d1:	6a 00                	push   $0x0
801038d3:	ff 73 18             	pushl  0x18(%ebx)
801038d6:	e8 45 0e 00 00       	call   80104720 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801038db:	8b 43 18             	mov    0x18(%ebx),%eax
801038de:	ba 23 00 00 00       	mov    $0x23,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801038e3:	b9 2b 00 00 00       	mov    $0x2b,%ecx
  safestrcpy(p->name, "initcode", sizeof(p->name));
801038e8:	83 c4 0c             	add    $0xc,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801038eb:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801038ef:	8b 43 18             	mov    0x18(%ebx),%eax
801038f2:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
801038f6:	8b 43 18             	mov    0x18(%ebx),%eax
801038f9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038fd:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103901:	8b 43 18             	mov    0x18(%ebx),%eax
80103904:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103908:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010390c:	8b 43 18             	mov    0x18(%ebx),%eax
8010390f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103916:	8b 43 18             	mov    0x18(%ebx),%eax
80103919:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103920:	8b 43 18             	mov    0x18(%ebx),%eax
80103923:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
8010392a:	8d 43 6c             	lea    0x6c(%ebx),%eax
  p->tickets = MAX_TICKETS; //initcode also needs tickets
8010392d:	c7 43 7c 0f 00 00 00 	movl   $0xf,0x7c(%ebx)
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103934:	6a 10                	push   $0x10
80103936:	68 ed 77 10 80       	push   $0x801077ed
8010393b:	50                   	push   %eax
8010393c:	e8 bf 0f 00 00       	call   80104900 <safestrcpy>
  p->cwd = namei("/");
80103941:	c7 04 24 f6 77 10 80 	movl   $0x801077f6,(%esp)
80103948:	e8 33 e5 ff ff       	call   80101e80 <namei>
8010394d:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
80103950:	c7 04 24 60 2e 11 80 	movl   $0x80112e60,(%esp)
80103957:	e8 94 0b 00 00       	call   801044f0 <acquire>
  p->state = RUNNABLE;
8010395c:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
80103963:	c7 04 24 60 2e 11 80 	movl   $0x80112e60,(%esp)
8010396a:	e8 61 0d 00 00       	call   801046d0 <release>
}
8010396f:	83 c4 10             	add    $0x10,%esp
80103972:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103975:	c9                   	leave  
80103976:	c3                   	ret    
    panic("userinit: out of memory?");
80103977:	83 ec 0c             	sub    $0xc,%esp
8010397a:	68 d4 77 10 80       	push   $0x801077d4
8010397f:	e8 ec c9 ff ff       	call   80100370 <panic>
80103984:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010398a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103990 <growproc>:
{
80103990:	55                   	push   %ebp
80103991:	89 e5                	mov    %esp,%ebp
80103993:	83 ec 08             	sub    $0x8,%esp
  sz = proc->sz;
80103996:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
{
8010399d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  sz = proc->sz;
801039a0:	8b 02                	mov    (%edx),%eax
  if(n > 0){
801039a2:	83 f9 00             	cmp    $0x0,%ecx
801039a5:	7e 39                	jle    801039e0 <growproc+0x50>
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
801039a7:	83 ec 04             	sub    $0x4,%esp
801039aa:	01 c1                	add    %eax,%ecx
801039ac:	51                   	push   %ecx
801039ad:	50                   	push   %eax
801039ae:	ff 72 04             	pushl  0x4(%edx)
801039b1:	e8 3a 35 00 00       	call   80106ef0 <allocuvm>
801039b6:	83 c4 10             	add    $0x10,%esp
801039b9:	85 c0                	test   %eax,%eax
801039bb:	74 3b                	je     801039f8 <growproc+0x68>
801039bd:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  proc->sz = sz;
801039c4:	89 02                	mov    %eax,(%edx)
  switchuvm(proc);
801039c6:	83 ec 0c             	sub    $0xc,%esp
801039c9:	65 ff 35 04 00 00 00 	pushl  %gs:0x4
801039d0:	e8 0b 33 00 00       	call   80106ce0 <switchuvm>
  return 0;
801039d5:	83 c4 10             	add    $0x10,%esp
801039d8:	31 c0                	xor    %eax,%eax
}
801039da:	c9                   	leave  
801039db:	c3                   	ret    
801039dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else if(n < 0){
801039e0:	74 e2                	je     801039c4 <growproc+0x34>
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
801039e2:	83 ec 04             	sub    $0x4,%esp
801039e5:	01 c1                	add    %eax,%ecx
801039e7:	51                   	push   %ecx
801039e8:	50                   	push   %eax
801039e9:	ff 72 04             	pushl  0x4(%edx)
801039ec:	e8 ef 35 00 00       	call   80106fe0 <deallocuvm>
801039f1:	83 c4 10             	add    $0x10,%esp
801039f4:	85 c0                	test   %eax,%eax
801039f6:	75 c5                	jne    801039bd <growproc+0x2d>
      return -1;
801039f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801039fd:	c9                   	leave  
801039fe:	c3                   	ret    
801039ff:	90                   	nop

80103a00 <fork>:
{
80103a00:	55                   	push   %ebp
80103a01:	89 e5                	mov    %esp,%ebp
80103a03:	57                   	push   %edi
80103a04:	56                   	push   %esi
80103a05:	53                   	push   %ebx
80103a06:	83 ec 0c             	sub    $0xc,%esp
  if((np = allocproc()) == 0){
80103a09:	e8 32 fd ff ff       	call   80103740 <allocproc>
80103a0e:	85 c0                	test   %eax,%eax
80103a10:	0f 84 ef 00 00 00    	je     80103b05 <fork+0x105>
80103a16:	89 c3                	mov    %eax,%ebx
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
80103a18:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a1e:	83 ec 08             	sub    $0x8,%esp
80103a21:	ff 30                	pushl  (%eax)
80103a23:	ff 70 04             	pushl  0x4(%eax)
80103a26:	e8 95 36 00 00       	call   801070c0 <copyuvm>
80103a2b:	83 c4 10             	add    $0x10,%esp
80103a2e:	85 c0                	test   %eax,%eax
80103a30:	89 43 04             	mov    %eax,0x4(%ebx)
80103a33:	0f 84 e3 00 00 00    	je     80103b1c <fork+0x11c>
  np->sz = proc->sz;
80103a39:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  *np->tf = *proc->tf;
80103a3f:	8b 7b 18             	mov    0x18(%ebx),%edi
80103a42:	b9 13 00 00 00       	mov    $0x13,%ecx
  np->sz = proc->sz;
80103a47:	8b 00                	mov    (%eax),%eax
80103a49:	89 03                	mov    %eax,(%ebx)
  np->parent = proc;
80103a4b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a51:	89 43 14             	mov    %eax,0x14(%ebx)
  *np->tf = *proc->tf;
80103a54:	8b 70 18             	mov    0x18(%eax),%esi
80103a57:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  np->tickets=INITIAL_TICKETS;
80103a59:	c7 43 7c 0a 00 00 00 	movl   $0xa,0x7c(%ebx)
  for(i = 0; i < NOFILE; i++)
80103a60:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103a62:	8b 43 18             	mov    0x18(%ebx),%eax
80103a65:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103a6c:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103a73:	90                   	nop
80103a74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->ofile[i])
80103a78:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
80103a7c:	85 c0                	test   %eax,%eax
80103a7e:	74 17                	je     80103a97 <fork+0x97>
      np->ofile[i] = filedup(proc->ofile[i]);
80103a80:	83 ec 0c             	sub    $0xc,%esp
80103a83:	50                   	push   %eax
80103a84:	e8 27 d3 ff ff       	call   80100db0 <filedup>
80103a89:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
80103a8d:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103a94:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NOFILE; i++)
80103a97:	83 c6 01             	add    $0x1,%esi
80103a9a:	83 fe 10             	cmp    $0x10,%esi
80103a9d:	75 d9                	jne    80103a78 <fork+0x78>
  np->cwd = idup(proc->cwd);
80103a9f:	83 ec 0c             	sub    $0xc,%esp
80103aa2:	ff 72 68             	pushl  0x68(%edx)
80103aa5:	e8 76 db ff ff       	call   80101620 <idup>
80103aaa:	89 43 68             	mov    %eax,0x68(%ebx)
  safestrcpy(np->name, proc->name, sizeof(proc->name));
80103aad:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ab3:	83 c4 0c             	add    $0xc,%esp
80103ab6:	6a 10                	push   $0x10
80103ab8:	83 c0 6c             	add    $0x6c,%eax
80103abb:	50                   	push   %eax
80103abc:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103abf:	50                   	push   %eax
80103ac0:	e8 3b 0e 00 00       	call   80104900 <safestrcpy>
  pid = np->pid;
80103ac5:	8b 73 10             	mov    0x10(%ebx),%esi
  cprintf("PROCESO CREADO - PID: %d TICKETS: %d\n", np->pid, np->tickets);
80103ac8:	83 c4 0c             	add    $0xc,%esp
80103acb:	ff 73 7c             	pushl  0x7c(%ebx)
80103ace:	56                   	push   %esi
80103acf:	68 10 79 10 80       	push   $0x80107910
80103ad4:	e8 87 cb ff ff       	call   80100660 <cprintf>
  acquire(&ptable.lock);
80103ad9:	c7 04 24 60 2e 11 80 	movl   $0x80112e60,(%esp)
80103ae0:	e8 0b 0a 00 00       	call   801044f0 <acquire>
  np->state = RUNNABLE;
80103ae5:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
80103aec:	c7 04 24 60 2e 11 80 	movl   $0x80112e60,(%esp)
80103af3:	e8 d8 0b 00 00       	call   801046d0 <release>
  return pid;
80103af8:	83 c4 10             	add    $0x10,%esp
}
80103afb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103afe:	89 f0                	mov    %esi,%eax
80103b00:	5b                   	pop    %ebx
80103b01:	5e                   	pop    %esi
80103b02:	5f                   	pop    %edi
80103b03:	5d                   	pop    %ebp
80103b04:	c3                   	ret    
    release(&ptable.lock);
80103b05:	83 ec 0c             	sub    $0xc,%esp
    return -1;
80103b08:	be ff ff ff ff       	mov    $0xffffffff,%esi
    release(&ptable.lock);
80103b0d:	68 60 2e 11 80       	push   $0x80112e60
80103b12:	e8 b9 0b 00 00       	call   801046d0 <release>
    return -1;
80103b17:	83 c4 10             	add    $0x10,%esp
80103b1a:	eb df                	jmp    80103afb <fork+0xfb>
    kfree(np->kstack);
80103b1c:	83 ec 0c             	sub    $0xc,%esp
80103b1f:	ff 73 08             	pushl  0x8(%ebx)
    return -1;
80103b22:	be ff ff ff ff       	mov    $0xffffffff,%esi
    kfree(np->kstack);
80103b27:	e8 94 e7 ff ff       	call   801022c0 <kfree>
    np->kstack = 0;
80103b2c:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103b33:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103b3a:	83 c4 10             	add    $0x10,%esp
80103b3d:	eb bc                	jmp    80103afb <fork+0xfb>
80103b3f:	90                   	nop

80103b40 <lotteryTotal>:
int lotteryTotal(void){
80103b40:	55                   	push   %ebp
  int total_tickets=0;
80103b41:	31 c0                	xor    %eax,%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b43:	ba 94 2e 11 80       	mov    $0x80112e94,%edx
int lotteryTotal(void){
80103b48:	89 e5                	mov    %esp,%ebp
80103b4a:	eb 12                	jmp    80103b5e <lotteryTotal+0x1e>
80103b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b50:	81 c2 84 00 00 00    	add    $0x84,%edx
80103b56:	81 fa 94 4f 11 80    	cmp    $0x80114f94,%edx
80103b5c:	73 17                	jae    80103b75 <lotteryTotal+0x35>
    if(p->state==RUNNABLE){
80103b5e:	83 7a 0c 03          	cmpl   $0x3,0xc(%edx)
80103b62:	75 ec                	jne    80103b50 <lotteryTotal+0x10>
      total_tickets+=p->tickets;
80103b64:	03 42 7c             	add    0x7c(%edx),%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b67:	81 c2 84 00 00 00    	add    $0x84,%edx
80103b6d:	81 fa 94 4f 11 80    	cmp    $0x80114f94,%edx
80103b73:	72 e9                	jb     80103b5e <lotteryTotal+0x1e>
}
80103b75:	5d                   	pop    %ebp
80103b76:	c3                   	ret    
80103b77:	89 f6                	mov    %esi,%esi
80103b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b80 <scheduler>:
{
80103b80:	55                   	push   %ebp
80103b81:	89 e5                	mov    %esp,%ebp
80103b83:	57                   	push   %edi
80103b84:	56                   	push   %esi
80103b85:	53                   	push   %ebx
80103b86:	bb c1 60 a8 10       	mov    $0x10a860c1,%ebx
80103b8b:	83 ec 0c             	sub    $0xc,%esp
80103b8e:	66 90                	xchg   %ax,%ax
  asm volatile("sti");
80103b90:	fb                   	sti    
    acquire(&ptable.lock);
80103b91:	83 ec 0c             	sub    $0xc,%esp
80103b94:	68 60 2e 11 80       	push   $0x80112e60
80103b99:	e8 52 09 00 00       	call   801044f0 <acquire>
80103b9e:	83 c4 10             	add    $0x10,%esp
  int total_tickets=0;
80103ba1:	31 c9                	xor    %ecx,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ba3:	b8 94 2e 11 80       	mov    $0x80112e94,%eax
80103ba8:	eb 12                	jmp    80103bbc <scheduler+0x3c>
80103baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103bb0:	05 84 00 00 00       	add    $0x84,%eax
80103bb5:	3d 94 4f 11 80       	cmp    $0x80114f94,%eax
80103bba:	73 15                	jae    80103bd1 <scheduler+0x51>
    if(p->state==RUNNABLE){
80103bbc:	83 78 0c 03          	cmpl   $0x3,0xc(%eax)
80103bc0:	75 ee                	jne    80103bb0 <scheduler+0x30>
      total_tickets+=p->tickets;
80103bc2:	03 48 7c             	add    0x7c(%eax),%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bc5:	05 84 00 00 00       	add    $0x84,%eax
80103bca:	3d 94 4f 11 80       	cmp    $0x80114f94,%eax
80103bcf:	72 eb                	jb     80103bbc <scheduler+0x3c>
    if(total_tickets > 0){
80103bd1:	85 c9                	test   %ecx,%ecx
80103bd3:	0f 8e 9f 00 00 00    	jle    80103c78 <scheduler+0xf8>
  return (a * b) % c;
80103bd9:	31 c0                	xor    %eax,%eax
80103bdb:	83 fb fb             	cmp    $0xfffffffb,%ebx
80103bde:	0f 93 c0             	setae  %al
80103be1:	89 c7                	mov    %eax,%edi
80103be3:	8d 04 bb             	lea    (%ebx,%edi,4),%eax
80103be6:	01 c7                	add    %eax,%edi
      if(total_tickets < ticketGanador ){
80103be8:	39 cf                	cmp    %ecx,%edi
80103bea:	7e 07                	jle    80103bf3 <scheduler+0x73>
        ticketGanador %= total_tickets;  //Chosen is in the interval of tickets
80103bec:	89 f8                	mov    %edi,%eax
80103bee:	99                   	cltd   
80103bef:	f7 f9                	idiv   %ecx
80103bf1:	89 d7                	mov    %edx,%edi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bf3:	be 94 2e 11 80       	mov    $0x80112e94,%esi
80103bf8:	eb 14                	jmp    80103c0e <scheduler+0x8e>
80103bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c00:	81 c6 84 00 00 00    	add    $0x84,%esi
80103c06:	81 fe 94 4f 11 80    	cmp    $0x80114f94,%esi
80103c0c:	73 6a                	jae    80103c78 <scheduler+0xf8>
        if(p->state == RUNNABLE){
80103c0e:	83 7e 0c 03          	cmpl   $0x3,0xc(%esi)
80103c12:	75 ec                	jne    80103c00 <scheduler+0x80>
        if(p->state !=RUNNABLE || ticketGanador >= 0){
80103c14:	2b 7e 7c             	sub    0x7c(%esi),%edi
80103c17:	79 e7                	jns    80103c00 <scheduler+0x80>
        cprintf("PROCESO GANADOR: #%s \n",p->name);
80103c19:	8d 46 6c             	lea    0x6c(%esi),%eax
80103c1c:	83 ec 08             	sub    $0x8,%esp
80103c1f:	50                   	push   %eax
80103c20:	68 f8 77 10 80       	push   $0x801077f8
80103c25:	e8 36 ca ff ff       	call   80100660 <cprintf>
        switchuvm(p);
80103c2a:	89 34 24             	mov    %esi,(%esp)
        proc = p;
80103c2d:	65 89 35 04 00 00 00 	mov    %esi,%gs:0x4
      for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c34:	81 c6 84 00 00 00    	add    $0x84,%esi
        switchuvm(p);
80103c3a:	e8 a1 30 00 00       	call   80106ce0 <switchuvm>
        swtch(&cpu->scheduler, p->context);
80103c3f:	58                   	pop    %eax
80103c40:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
        p->state = RUNNING;
80103c46:	c7 46 88 04 00 00 00 	movl   $0x4,-0x78(%esi)
        swtch(&cpu->scheduler, p->context);
80103c4d:	5a                   	pop    %edx
80103c4e:	ff 76 98             	pushl  -0x68(%esi)
80103c51:	83 c0 04             	add    $0x4,%eax
80103c54:	50                   	push   %eax
80103c55:	e8 01 0d 00 00       	call   8010495b <swtch>
        switchkvm();
80103c5a:	e8 61 30 00 00       	call   80106cc0 <switchkvm>
        proc = 0;
80103c5f:	83 c4 10             	add    $0x10,%esp
      for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c62:	81 fe 94 4f 11 80    	cmp    $0x80114f94,%esi
        proc = 0;
80103c68:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103c6f:	00 00 00 00 
      for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c73:	72 99                	jb     80103c0e <scheduler+0x8e>
80103c75:	8d 76 00             	lea    0x0(%esi),%esi
    release(&ptable.lock);
80103c78:	83 ec 0c             	sub    $0xc,%esp
80103c7b:	81 c3 c1 60 a8 10    	add    $0x10a860c1,%ebx
80103c81:	68 60 2e 11 80       	push   $0x80112e60
80103c86:	e8 45 0a 00 00       	call   801046d0 <release>
    runval++;
80103c8b:	83 c4 10             	add    $0x10,%esp
80103c8e:	e9 fd fe ff ff       	jmp    80103b90 <scheduler+0x10>
80103c93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ca0 <sched>:
{
80103ca0:	55                   	push   %ebp
80103ca1:	89 e5                	mov    %esp,%ebp
80103ca3:	53                   	push   %ebx
80103ca4:	83 ec 10             	sub    $0x10,%esp
  if(!holding(&ptable.lock))
80103ca7:	68 60 2e 11 80       	push   $0x80112e60
80103cac:	e8 6f 09 00 00       	call   80104620 <holding>
80103cb1:	83 c4 10             	add    $0x10,%esp
80103cb4:	85 c0                	test   %eax,%eax
80103cb6:	74 4c                	je     80103d04 <sched+0x64>
  if(cpu->ncli != 1)
80103cb8:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80103cbf:	83 ba ac 00 00 00 01 	cmpl   $0x1,0xac(%edx)
80103cc6:	75 63                	jne    80103d2b <sched+0x8b>
  if(proc->state == RUNNING)
80103cc8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103cce:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80103cd2:	74 4a                	je     80103d1e <sched+0x7e>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103cd4:	9c                   	pushf  
80103cd5:	59                   	pop    %ecx
  if(readeflags()&FL_IF)
80103cd6:	80 e5 02             	and    $0x2,%ch
80103cd9:	75 36                	jne    80103d11 <sched+0x71>
  swtch(&proc->context, cpu->scheduler);
80103cdb:	83 ec 08             	sub    $0x8,%esp
80103cde:	83 c0 1c             	add    $0x1c,%eax
  intena = cpu->intena;
80103ce1:	8b 9a b0 00 00 00    	mov    0xb0(%edx),%ebx
  swtch(&proc->context, cpu->scheduler);
80103ce7:	ff 72 04             	pushl  0x4(%edx)
80103cea:	50                   	push   %eax
80103ceb:	e8 6b 0c 00 00       	call   8010495b <swtch>
  cpu->intena = intena;
80103cf0:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
}
80103cf6:	83 c4 10             	add    $0x10,%esp
  cpu->intena = intena;
80103cf9:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
80103cff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d02:	c9                   	leave  
80103d03:	c3                   	ret    
    panic("sched ptable.lock");
80103d04:	83 ec 0c             	sub    $0xc,%esp
80103d07:	68 0f 78 10 80       	push   $0x8010780f
80103d0c:	e8 5f c6 ff ff       	call   80100370 <panic>
    panic("sched interruptible");
80103d11:	83 ec 0c             	sub    $0xc,%esp
80103d14:	68 3b 78 10 80       	push   $0x8010783b
80103d19:	e8 52 c6 ff ff       	call   80100370 <panic>
    panic("sched running");
80103d1e:	83 ec 0c             	sub    $0xc,%esp
80103d21:	68 2d 78 10 80       	push   $0x8010782d
80103d26:	e8 45 c6 ff ff       	call   80100370 <panic>
    panic("sched locks");
80103d2b:	83 ec 0c             	sub    $0xc,%esp
80103d2e:	68 21 78 10 80       	push   $0x80107821
80103d33:	e8 38 c6 ff ff       	call   80100370 <panic>
80103d38:	90                   	nop
80103d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103d40 <exit>:
  if(proc == initproc)
80103d40:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103d47:	3b 15 1c a6 10 80    	cmp    0x8010a61c,%edx
{
80103d4d:	55                   	push   %ebp
80103d4e:	89 e5                	mov    %esp,%ebp
80103d50:	56                   	push   %esi
80103d51:	53                   	push   %ebx
  if(proc == initproc)
80103d52:	0f 84 29 01 00 00    	je     80103e81 <exit+0x141>
80103d58:	31 db                	xor    %ebx,%ebx
80103d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(proc->ofile[fd]){
80103d60:	8d 73 08             	lea    0x8(%ebx),%esi
80103d63:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103d67:	85 c0                	test   %eax,%eax
80103d69:	74 1b                	je     80103d86 <exit+0x46>
      fileclose(proc->ofile[fd]);
80103d6b:	83 ec 0c             	sub    $0xc,%esp
80103d6e:	50                   	push   %eax
80103d6f:	e8 8c d0 ff ff       	call   80100e00 <fileclose>
      proc->ofile[fd] = 0;
80103d74:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103d7b:	83 c4 10             	add    $0x10,%esp
80103d7e:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103d85:	00 
  for(fd = 0; fd < NOFILE; fd++){
80103d86:	83 c3 01             	add    $0x1,%ebx
80103d89:	83 fb 10             	cmp    $0x10,%ebx
80103d8c:	75 d2                	jne    80103d60 <exit+0x20>
  begin_op();
80103d8e:	e8 3d ee ff ff       	call   80102bd0 <begin_op>
  iput(proc->cwd);
80103d93:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d99:	83 ec 0c             	sub    $0xc,%esp
80103d9c:	ff 70 68             	pushl  0x68(%eax)
80103d9f:	e8 dc d9 ff ff       	call   80101780 <iput>
  end_op();
80103da4:	e8 97 ee ff ff       	call   80102c40 <end_op>
  proc->cwd = 0;
80103da9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103daf:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)
  acquire(&ptable.lock);
80103db6:	c7 04 24 60 2e 11 80 	movl   $0x80112e60,(%esp)
80103dbd:	e8 2e 07 00 00       	call   801044f0 <acquire>
  wakeup1(proc->parent);
80103dc2:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80103dc9:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103dcc:	b8 94 2e 11 80       	mov    $0x80112e94,%eax
  wakeup1(proc->parent);
80103dd1:	8b 51 14             	mov    0x14(%ecx),%edx
80103dd4:	eb 16                	jmp    80103dec <exit+0xac>
80103dd6:	8d 76 00             	lea    0x0(%esi),%esi
80103dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103de0:	05 84 00 00 00       	add    $0x84,%eax
80103de5:	3d 94 4f 11 80       	cmp    $0x80114f94,%eax
80103dea:	73 1e                	jae    80103e0a <exit+0xca>
    if(p->state == SLEEPING && p->chan == chan)
80103dec:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103df0:	75 ee                	jne    80103de0 <exit+0xa0>
80103df2:	3b 50 20             	cmp    0x20(%eax),%edx
80103df5:	75 e9                	jne    80103de0 <exit+0xa0>
      p->state = RUNNABLE;
80103df7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103dfe:	05 84 00 00 00       	add    $0x84,%eax
80103e03:	3d 94 4f 11 80       	cmp    $0x80114f94,%eax
80103e08:	72 e2                	jb     80103dec <exit+0xac>
      p->parent = initproc;
80103e0a:	8b 1d 1c a6 10 80    	mov    0x8010a61c,%ebx
80103e10:	ba 94 2e 11 80       	mov    $0x80112e94,%edx
80103e15:	eb 17                	jmp    80103e2e <exit+0xee>
80103e17:	89 f6                	mov    %esi,%esi
80103e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e20:	81 c2 84 00 00 00    	add    $0x84,%edx
80103e26:	81 fa 94 4f 11 80    	cmp    $0x80114f94,%edx
80103e2c:	73 3a                	jae    80103e68 <exit+0x128>
    if(p->parent == proc){
80103e2e:	3b 4a 14             	cmp    0x14(%edx),%ecx
80103e31:	75 ed                	jne    80103e20 <exit+0xe0>
      if(p->state == ZOMBIE)
80103e33:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
      p->parent = initproc;
80103e37:	89 5a 14             	mov    %ebx,0x14(%edx)
      if(p->state == ZOMBIE)
80103e3a:	75 e4                	jne    80103e20 <exit+0xe0>
80103e3c:	b8 94 2e 11 80       	mov    $0x80112e94,%eax
80103e41:	eb 11                	jmp    80103e54 <exit+0x114>
80103e43:	90                   	nop
80103e44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e48:	05 84 00 00 00       	add    $0x84,%eax
80103e4d:	3d 94 4f 11 80       	cmp    $0x80114f94,%eax
80103e52:	73 cc                	jae    80103e20 <exit+0xe0>
    if(p->state == SLEEPING && p->chan == chan)
80103e54:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e58:	75 ee                	jne    80103e48 <exit+0x108>
80103e5a:	3b 58 20             	cmp    0x20(%eax),%ebx
80103e5d:	75 e9                	jne    80103e48 <exit+0x108>
      p->state = RUNNABLE;
80103e5f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e66:	eb e0                	jmp    80103e48 <exit+0x108>
  proc->state = ZOMBIE;
80103e68:	c7 41 0c 05 00 00 00 	movl   $0x5,0xc(%ecx)
  sched();
80103e6f:	e8 2c fe ff ff       	call   80103ca0 <sched>
  panic("zombie exit");
80103e74:	83 ec 0c             	sub    $0xc,%esp
80103e77:	68 5c 78 10 80       	push   $0x8010785c
80103e7c:	e8 ef c4 ff ff       	call   80100370 <panic>
    panic("init exiting");
80103e81:	83 ec 0c             	sub    $0xc,%esp
80103e84:	68 4f 78 10 80       	push   $0x8010784f
80103e89:	e8 e2 c4 ff ff       	call   80100370 <panic>
80103e8e:	66 90                	xchg   %ax,%ax

80103e90 <yield>:
{
80103e90:	55                   	push   %ebp
80103e91:	89 e5                	mov    %esp,%ebp
80103e93:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103e96:	68 60 2e 11 80       	push   $0x80112e60
80103e9b:	e8 50 06 00 00       	call   801044f0 <acquire>
  proc->state = RUNNABLE;
80103ea0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ea6:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103ead:	e8 ee fd ff ff       	call   80103ca0 <sched>
  release(&ptable.lock);
80103eb2:	c7 04 24 60 2e 11 80 	movl   $0x80112e60,(%esp)
80103eb9:	e8 12 08 00 00       	call   801046d0 <release>
}
80103ebe:	83 c4 10             	add    $0x10,%esp
80103ec1:	c9                   	leave  
80103ec2:	c3                   	ret    
80103ec3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ed0 <sleep>:
  if(proc == 0)
80103ed0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
{
80103ed6:	55                   	push   %ebp
80103ed7:	89 e5                	mov    %esp,%ebp
80103ed9:	56                   	push   %esi
80103eda:	53                   	push   %ebx
  if(proc == 0)
80103edb:	85 c0                	test   %eax,%eax
{
80103edd:	8b 75 08             	mov    0x8(%ebp),%esi
80103ee0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(proc == 0)
80103ee3:	0f 84 97 00 00 00    	je     80103f80 <sleep+0xb0>
  if(lk == 0)
80103ee9:	85 db                	test   %ebx,%ebx
80103eeb:	0f 84 82 00 00 00    	je     80103f73 <sleep+0xa3>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103ef1:	81 fb 60 2e 11 80    	cmp    $0x80112e60,%ebx
80103ef7:	74 57                	je     80103f50 <sleep+0x80>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103ef9:	83 ec 0c             	sub    $0xc,%esp
80103efc:	68 60 2e 11 80       	push   $0x80112e60
80103f01:	e8 ea 05 00 00       	call   801044f0 <acquire>
    release(lk);
80103f06:	89 1c 24             	mov    %ebx,(%esp)
80103f09:	e8 c2 07 00 00       	call   801046d0 <release>
  proc->chan = chan;
80103f0e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f14:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103f17:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103f1e:	e8 7d fd ff ff       	call   80103ca0 <sched>
  proc->chan = 0;
80103f23:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f29:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
    release(&ptable.lock);
80103f30:	c7 04 24 60 2e 11 80 	movl   $0x80112e60,(%esp)
80103f37:	e8 94 07 00 00       	call   801046d0 <release>
    acquire(lk);
80103f3c:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103f3f:	83 c4 10             	add    $0x10,%esp
}
80103f42:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f45:	5b                   	pop    %ebx
80103f46:	5e                   	pop    %esi
80103f47:	5d                   	pop    %ebp
    acquire(lk);
80103f48:	e9 a3 05 00 00       	jmp    801044f0 <acquire>
80103f4d:	8d 76 00             	lea    0x0(%esi),%esi
  proc->chan = chan;
80103f50:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103f53:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103f5a:	e8 41 fd ff ff       	call   80103ca0 <sched>
  proc->chan = 0;
80103f5f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f65:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
80103f6c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f6f:	5b                   	pop    %ebx
80103f70:	5e                   	pop    %esi
80103f71:	5d                   	pop    %ebp
80103f72:	c3                   	ret    
    panic("sleep without lk");
80103f73:	83 ec 0c             	sub    $0xc,%esp
80103f76:	68 6e 78 10 80       	push   $0x8010786e
80103f7b:	e8 f0 c3 ff ff       	call   80100370 <panic>
    panic("sleep");
80103f80:	83 ec 0c             	sub    $0xc,%esp
80103f83:	68 68 78 10 80       	push   $0x80107868
80103f88:	e8 e3 c3 ff ff       	call   80100370 <panic>
80103f8d:	8d 76 00             	lea    0x0(%esi),%esi

80103f90 <wait>:
{
80103f90:	55                   	push   %ebp
80103f91:	89 e5                	mov    %esp,%ebp
80103f93:	56                   	push   %esi
80103f94:	53                   	push   %ebx
  acquire(&ptable.lock);
80103f95:	83 ec 0c             	sub    $0xc,%esp
80103f98:	68 60 2e 11 80       	push   $0x80112e60
80103f9d:	e8 4e 05 00 00       	call   801044f0 <acquire>
80103fa2:	83 c4 10             	add    $0x10,%esp
80103fa5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    havekids = 0;
80103fab:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fad:	bb 94 2e 11 80       	mov    $0x80112e94,%ebx
80103fb2:	eb 12                	jmp    80103fc6 <wait+0x36>
80103fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fb8:	81 c3 84 00 00 00    	add    $0x84,%ebx
80103fbe:	81 fb 94 4f 11 80    	cmp    $0x80114f94,%ebx
80103fc4:	73 22                	jae    80103fe8 <wait+0x58>
      if(p->parent != proc)
80103fc6:	3b 43 14             	cmp    0x14(%ebx),%eax
80103fc9:	75 ed                	jne    80103fb8 <wait+0x28>
      if(p->state == ZOMBIE){
80103fcb:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103fcf:	74 35                	je     80104006 <wait+0x76>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fd1:	81 c3 84 00 00 00    	add    $0x84,%ebx
      havekids = 1;
80103fd7:	ba 01 00 00 00       	mov    $0x1,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fdc:	81 fb 94 4f 11 80    	cmp    $0x80114f94,%ebx
80103fe2:	72 e2                	jb     80103fc6 <wait+0x36>
80103fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(!havekids || proc->killed){
80103fe8:	85 d2                	test   %edx,%edx
80103fea:	74 7e                	je     8010406a <wait+0xda>
80103fec:	8b 50 24             	mov    0x24(%eax),%edx
80103fef:	85 d2                	test   %edx,%edx
80103ff1:	75 77                	jne    8010406a <wait+0xda>
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
80103ff3:	83 ec 08             	sub    $0x8,%esp
80103ff6:	68 60 2e 11 80       	push   $0x80112e60
80103ffb:	50                   	push   %eax
80103ffc:	e8 cf fe ff ff       	call   80103ed0 <sleep>
    havekids = 0;
80104001:	83 c4 10             	add    $0x10,%esp
80104004:	eb 9f                	jmp    80103fa5 <wait+0x15>
        cprintf("PROCESO TERMINO - PID: %d\n", p->pid);
80104006:	83 ec 08             	sub    $0x8,%esp
80104009:	ff 73 10             	pushl  0x10(%ebx)
8010400c:	68 7f 78 10 80       	push   $0x8010787f
80104011:	e8 4a c6 ff ff       	call   80100660 <cprintf>
        kfree(p->kstack);
80104016:	59                   	pop    %ecx
80104017:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
8010401a:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
8010401d:	e8 9e e2 ff ff       	call   801022c0 <kfree>
        freevm(p->pgdir);
80104022:	58                   	pop    %eax
80104023:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
80104026:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
8010402d:	e8 de 2f 00 00       	call   80107010 <freevm>
        p->pid = 0;
80104032:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80104039:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80104040:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80104044:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
8010404b:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80104052:	c7 04 24 60 2e 11 80 	movl   $0x80112e60,(%esp)
80104059:	e8 72 06 00 00       	call   801046d0 <release>
        return pid;
8010405e:	83 c4 10             	add    $0x10,%esp
}
80104061:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104064:	89 f0                	mov    %esi,%eax
80104066:	5b                   	pop    %ebx
80104067:	5e                   	pop    %esi
80104068:	5d                   	pop    %ebp
80104069:	c3                   	ret    
      release(&ptable.lock);
8010406a:	83 ec 0c             	sub    $0xc,%esp
      return -1;
8010406d:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
80104072:	68 60 2e 11 80       	push   $0x80112e60
80104077:	e8 54 06 00 00       	call   801046d0 <release>
      return -1;
8010407c:	83 c4 10             	add    $0x10,%esp
}
8010407f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104082:	89 f0                	mov    %esi,%eax
80104084:	5b                   	pop    %ebx
80104085:	5e                   	pop    %esi
80104086:	5d                   	pop    %ebp
80104087:	c3                   	ret    
80104088:	90                   	nop
80104089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104090 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104090:	55                   	push   %ebp
80104091:	89 e5                	mov    %esp,%ebp
80104093:	53                   	push   %ebx
80104094:	83 ec 10             	sub    $0x10,%esp
80104097:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010409a:	68 60 2e 11 80       	push   $0x80112e60
8010409f:	e8 4c 04 00 00       	call   801044f0 <acquire>
801040a4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040a7:	b8 94 2e 11 80       	mov    $0x80112e94,%eax
801040ac:	eb 0e                	jmp    801040bc <wakeup+0x2c>
801040ae:	66 90                	xchg   %ax,%ax
801040b0:	05 84 00 00 00       	add    $0x84,%eax
801040b5:	3d 94 4f 11 80       	cmp    $0x80114f94,%eax
801040ba:	73 1e                	jae    801040da <wakeup+0x4a>
    if(p->state == SLEEPING && p->chan == chan)
801040bc:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801040c0:	75 ee                	jne    801040b0 <wakeup+0x20>
801040c2:	3b 58 20             	cmp    0x20(%eax),%ebx
801040c5:	75 e9                	jne    801040b0 <wakeup+0x20>
      p->state = RUNNABLE;
801040c7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040ce:	05 84 00 00 00       	add    $0x84,%eax
801040d3:	3d 94 4f 11 80       	cmp    $0x80114f94,%eax
801040d8:	72 e2                	jb     801040bc <wakeup+0x2c>
  wakeup1(chan);
  release(&ptable.lock);
801040da:	c7 45 08 60 2e 11 80 	movl   $0x80112e60,0x8(%ebp)
}
801040e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040e4:	c9                   	leave  
  release(&ptable.lock);
801040e5:	e9 e6 05 00 00       	jmp    801046d0 <release>
801040ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801040f0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
801040f0:	55                   	push   %ebp
801040f1:	89 e5                	mov    %esp,%ebp
801040f3:	53                   	push   %ebx
801040f4:	83 ec 10             	sub    $0x10,%esp
801040f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
801040fa:	68 60 2e 11 80       	push   $0x80112e60
801040ff:	e8 ec 03 00 00       	call   801044f0 <acquire>
80104104:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104107:	b8 94 2e 11 80       	mov    $0x80112e94,%eax
8010410c:	eb 0e                	jmp    8010411c <kill+0x2c>
8010410e:	66 90                	xchg   %ax,%ax
80104110:	05 84 00 00 00       	add    $0x84,%eax
80104115:	3d 94 4f 11 80       	cmp    $0x80114f94,%eax
8010411a:	73 3c                	jae    80104158 <kill+0x68>
    if(p->pid == pid){
8010411c:	39 58 10             	cmp    %ebx,0x10(%eax)
8010411f:	75 ef                	jne    80104110 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104121:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
80104125:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
8010412c:	74 1a                	je     80104148 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
8010412e:	83 ec 0c             	sub    $0xc,%esp
80104131:	68 60 2e 11 80       	push   $0x80112e60
80104136:	e8 95 05 00 00       	call   801046d0 <release>
      return 0;
8010413b:	83 c4 10             	add    $0x10,%esp
8010413e:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104140:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104143:	c9                   	leave  
80104144:	c3                   	ret    
80104145:	8d 76 00             	lea    0x0(%esi),%esi
        p->state = RUNNABLE;
80104148:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
8010414f:	eb dd                	jmp    8010412e <kill+0x3e>
80104151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80104158:	83 ec 0c             	sub    $0xc,%esp
8010415b:	68 60 2e 11 80       	push   $0x80112e60
80104160:	e8 6b 05 00 00       	call   801046d0 <release>
  return -1;
80104165:	83 c4 10             	add    $0x10,%esp
80104168:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010416d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104170:	c9                   	leave  
80104171:	c3                   	ret    
80104172:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104180 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104180:	55                   	push   %ebp
80104181:	89 e5                	mov    %esp,%ebp
80104183:	57                   	push   %edi
80104184:	56                   	push   %esi
80104185:	53                   	push   %ebx
      state = states[p->state];
    else
      state = "???";
    cprintf("%d\t%s\t%s\t%d\t%d", p->pid, state, p->name, p->tickets, p->priority);
    if(p->state == SLEEPING)
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104186:	8d 7d c0             	lea    -0x40(%ebp),%edi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104189:	bb 94 2e 11 80       	mov    $0x80112e94,%ebx
      state = "???";
8010418e:	be 9a 78 10 80       	mov    $0x8010789a,%esi
{
80104193:	83 ec 48             	sub    $0x48,%esp
  cprintf("\npid\tstate\tproc\ttickets\tpriority\n");
80104196:	68 38 79 10 80       	push   $0x80107938
8010419b:	e8 c0 c4 ff ff       	call   80100660 <cprintf>
801041a0:	83 c4 10             	add    $0x10,%esp
801041a3:	eb 21                	jmp    801041c6 <procdump+0x46>
801041a5:	8d 76 00             	lea    0x0(%esi),%esi
    cprintf("\n");
801041a8:	83 ec 0c             	sub    $0xc,%esp
801041ab:	68 a6 77 10 80       	push   $0x801077a6
801041b0:	e8 ab c4 ff ff       	call   80100660 <cprintf>
801041b5:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801041b8:	81 c3 84 00 00 00    	add    $0x84,%ebx
801041be:	81 fb 94 4f 11 80    	cmp    $0x80114f94,%ebx
801041c4:	73 62                	jae    80104228 <procdump+0xa8>
    if(p->state == UNUSED)
801041c6:	8b 43 0c             	mov    0xc(%ebx),%eax
801041c9:	85 c0                	test   %eax,%eax
801041cb:	74 eb                	je     801041b8 <procdump+0x38>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041cd:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
801041d0:	ba 9a 78 10 80       	mov    $0x8010789a,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041d5:	77 0c                	ja     801041e3 <procdump+0x63>
801041d7:	8b 14 85 e8 79 10 80 	mov    -0x7fef8618(,%eax,4),%edx
      state = "???";
801041de:	85 d2                	test   %edx,%edx
801041e0:	0f 44 d6             	cmove  %esi,%edx
    cprintf("%d\t%s\t%s\t%d\t%d", p->pid, state, p->name, p->tickets, p->priority);
801041e3:	8d 43 6c             	lea    0x6c(%ebx),%eax
801041e6:	83 ec 08             	sub    $0x8,%esp
801041e9:	ff b3 80 00 00 00    	pushl  0x80(%ebx)
801041ef:	ff 73 7c             	pushl  0x7c(%ebx)
801041f2:	50                   	push   %eax
801041f3:	52                   	push   %edx
801041f4:	ff 73 10             	pushl  0x10(%ebx)
801041f7:	68 9e 78 10 80       	push   $0x8010789e
801041fc:	e8 5f c4 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING)
80104201:	83 c4 20             	add    $0x20,%esp
80104204:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80104208:	75 9e                	jne    801041a8 <procdump+0x28>
      getcallerpcs((uint*)p->context->ebp+2, pc);
8010420a:	8b 43 1c             	mov    0x1c(%ebx),%eax
8010420d:	83 ec 08             	sub    $0x8,%esp
80104210:	57                   	push   %edi
80104211:	8b 40 0c             	mov    0xc(%eax),%eax
80104214:	83 c0 08             	add    $0x8,%eax
80104217:	50                   	push   %eax
80104218:	e8 a3 03 00 00       	call   801045c0 <getcallerpcs>
8010421d:	83 c4 10             	add    $0x10,%esp
80104220:	eb 86                	jmp    801041a8 <procdump+0x28>
80104222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
}
80104228:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010422b:	5b                   	pop    %ebx
8010422c:	5e                   	pop    %esi
8010422d:	5f                   	pop    %edi
8010422e:	5d                   	pop    %ebp
8010422f:	c3                   	ret    

80104230 <cps>:


//Current process status
int
cps()
{
80104230:	55                   	push   %ebp
80104231:	89 e5                	mov    %esp,%ebp
80104233:	53                   	push   %ebx
80104234:	83 ec 10             	sub    $0x10,%esp
  asm volatile("sti");
80104237:	fb                   	sti    

  //Enable interrupts on this procesor
  sti();

  //Loop over process table looking for a process with pid.
  acquire(&ptable.lock);
80104238:	68 60 2e 11 80       	push   $0x80112e60
8010423d:	bb 00 2f 11 80       	mov    $0x80112f00,%ebx
80104242:	e8 a9 02 00 00       	call   801044f0 <acquire>
  cprintf("name \t pid \t state \t\t tickets \t priority \n");
80104247:	c7 04 24 5c 79 10 80 	movl   $0x8010795c,(%esp)
8010424e:	e8 0d c4 ff ff       	call   80100660 <cprintf>
80104253:	83 c4 10             	add    $0x10,%esp
80104256:	eb 25                	jmp    8010427d <cps+0x4d>
80104258:	90                   	nop
80104259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if( p->state == SLEEPING )
	cprintf("%s \t %d \t SLEEPING \t %d \t\t %d\n ", p->name, p->pid, p->tickets, p->priority);
      else if ( p->state == RUNNING )
80104260:	83 f8 04             	cmp    $0x4,%eax
80104263:	74 43                	je     801042a8 <cps+0x78>
	cprintf("%s \t %d \t RUNNING \t %d \t\t %d\n ", p->name, p->pid, p->tickets, p->priority);
      else if ( p->state == RUNNABLE )
80104265:	83 f8 03             	cmp    $0x3,%eax
80104268:	74 5e                	je     801042c8 <cps+0x98>
8010426a:	8d 83 84 00 00 00    	lea    0x84(%ebx),%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104270:	83 c3 18             	add    $0x18,%ebx
80104273:	81 fb 94 4f 11 80    	cmp    $0x80114f94,%ebx
80104279:	73 6d                	jae    801042e8 <cps+0xb8>
8010427b:	89 c3                	mov    %eax,%ebx
      if( p->state == SLEEPING )
8010427d:	8b 43 a0             	mov    -0x60(%ebx),%eax
80104280:	83 f8 02             	cmp    $0x2,%eax
80104283:	75 db                	jne    80104260 <cps+0x30>
	cprintf("%s \t %d \t SLEEPING \t %d \t\t %d\n ", p->name, p->pid, p->tickets, p->priority);
80104285:	83 ec 0c             	sub    $0xc,%esp
80104288:	ff 73 14             	pushl  0x14(%ebx)
8010428b:	ff 73 10             	pushl  0x10(%ebx)
8010428e:	ff 73 a4             	pushl  -0x5c(%ebx)
80104291:	53                   	push   %ebx
80104292:	68 88 79 10 80       	push   $0x80107988
80104297:	e8 c4 c3 ff ff       	call   80100660 <cprintf>
8010429c:	83 c4 20             	add    $0x20,%esp
8010429f:	eb c9                	jmp    8010426a <cps+0x3a>
801042a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	cprintf("%s \t %d \t RUNNING \t %d \t\t %d\n ", p->name, p->pid, p->tickets, p->priority);
801042a8:	83 ec 0c             	sub    $0xc,%esp
801042ab:	ff 73 14             	pushl  0x14(%ebx)
801042ae:	ff 73 10             	pushl  0x10(%ebx)
801042b1:	ff 73 a4             	pushl  -0x5c(%ebx)
801042b4:	53                   	push   %ebx
801042b5:	68 a8 79 10 80       	push   $0x801079a8
801042ba:	e8 a1 c3 ff ff       	call   80100660 <cprintf>
801042bf:	83 c4 20             	add    $0x20,%esp
801042c2:	eb a6                	jmp    8010426a <cps+0x3a>
801042c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	cprintf("%s \t %d \t RUNNABLE \t %d \t\t %d\n ", p->name, p->pid, p->tickets, p->priority);
801042c8:	83 ec 0c             	sub    $0xc,%esp
801042cb:	ff 73 14             	pushl  0x14(%ebx)
801042ce:	ff 73 10             	pushl  0x10(%ebx)
801042d1:	ff 73 a4             	pushl  -0x5c(%ebx)
801042d4:	53                   	push   %ebx
801042d5:	68 c8 79 10 80       	push   $0x801079c8
801042da:	e8 81 c3 ff ff       	call   80100660 <cprintf>
801042df:	83 c4 20             	add    $0x20,%esp
801042e2:	eb 86                	jmp    8010426a <cps+0x3a>
801042e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  release(&ptable.lock);
801042e8:	83 ec 0c             	sub    $0xc,%esp
801042eb:	68 60 2e 11 80       	push   $0x80112e60
801042f0:	e8 db 03 00 00       	call   801046d0 <release>

  return 22;
}
801042f5:	b8 16 00 00 00       	mov    $0x16,%eax
801042fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801042fd:	c9                   	leave  
801042fe:	c3                   	ret    
801042ff:	90                   	nop

80104300 <csc>:


//counter of system calls 
void
csc()
{
80104300:	55                   	push   %ebp
80104301:	89 e5                	mov    %esp,%ebp
80104303:	56                   	push   %esi
80104304:	53                   	push   %ebx
	int aux = 0;
	cprintf(" #proc\tsyscall\ttimes\n");
80104305:	31 f6                	xor    %esi,%esi
80104307:	bb 01 00 00 00       	mov    $0x1,%ebx
8010430c:	83 ec 0c             	sub    $0xc,%esp
8010430f:	68 ad 78 10 80       	push   $0x801078ad
80104314:	e8 47 c3 ff ff       	call   80100660 <cprintf>
80104319:	83 c4 10             	add    $0x10,%esp
8010431c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for(int i=0; i<sizeof(syscls)/sizeof(syscls[0]); i++){
			if(syscls[i]>0){
80104320:	8b 04 9d 3c b6 10 80 	mov    -0x7fef49c4(,%ebx,4),%eax
80104327:	85 c0                	test   %eax,%eax
80104329:	7e 1d                	jle    80104348 <csc+0x48>
			  cprintf("   %d\t%s:\t  %d\n", i+1, syscls_names[i], syscls[i]);
8010432b:	50                   	push   %eax
8010432c:	ff 34 9d 1c a0 10 80 	pushl  -0x7fef5fe4(,%ebx,4)
80104333:	53                   	push   %ebx
80104334:	68 c3 78 10 80       	push   $0x801078c3
80104339:	e8 22 c3 ff ff       	call   80100660 <cprintf>
			aux += syscls[i];}
8010433e:	03 34 9d 3c b6 10 80 	add    -0x7fef49c4(,%ebx,4),%esi
80104345:	83 c4 10             	add    $0x10,%esp
80104348:	83 c3 01             	add    $0x1,%ebx
	for(int i=0; i<sizeof(syscls)/sizeof(syscls[0]); i++){
8010434b:	83 fb 19             	cmp    $0x19,%ebx
8010434e:	75 d0                	jne    80104320 <csc+0x20>
		}
    cprintf("\t[Total]  [%d]\n", aux);
80104350:	83 ec 08             	sub    $0x8,%esp
80104353:	56                   	push   %esi
80104354:	68 d3 78 10 80       	push   $0x801078d3
80104359:	e8 02 c3 ff ff       	call   80100660 <cprintf>
}
8010435e:	83 c4 10             	add    $0x10,%esp
80104361:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104364:	5b                   	pop    %ebx
80104365:	5e                   	pop    %esi
80104366:	5d                   	pop    %ebp
80104367:	c3                   	ret    
80104368:	90                   	nop
80104369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104370 <chpr>:

//change priority
int
chpr( int pid, int priority)
{
80104370:	55                   	push   %ebp
80104371:	89 e5                	mov    %esp,%ebp
80104373:	53                   	push   %ebx
80104374:	83 ec 10             	sub    $0x10,%esp
80104377:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010437a:	68 60 2e 11 80       	push   $0x80112e60
8010437f:	e8 6c 01 00 00       	call   801044f0 <acquire>
80104384:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104387:	ba 94 2e 11 80       	mov    $0x80112e94,%edx
8010438c:	eb 10                	jmp    8010439e <chpr+0x2e>
8010438e:	66 90                	xchg   %ax,%ax
80104390:	81 c2 84 00 00 00    	add    $0x84,%edx
80104396:	81 fa 94 4f 11 80    	cmp    $0x80114f94,%edx
8010439c:	73 0e                	jae    801043ac <chpr+0x3c>
    if(p->pid == pid){
8010439e:	39 5a 10             	cmp    %ebx,0x10(%edx)
801043a1:	75 ed                	jne    80104390 <chpr+0x20>
        p->priority = priority;
801043a3:	8b 45 0c             	mov    0xc(%ebp),%eax
801043a6:	89 82 80 00 00 00    	mov    %eax,0x80(%edx)
        break;
    }
  }
  release(&ptable.lock);
801043ac:	83 ec 0c             	sub    $0xc,%esp
801043af:	68 60 2e 11 80       	push   $0x80112e60
801043b4:	e8 17 03 00 00       	call   801046d0 <release>

  return pid;
}
801043b9:	89 d8                	mov    %ebx,%eax
801043bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801043be:	c9                   	leave  
801043bf:	c3                   	ret    

801043c0 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
801043c0:	55                   	push   %ebp
801043c1:	89 e5                	mov    %esp,%ebp
801043c3:	53                   	push   %ebx
801043c4:	83 ec 0c             	sub    $0xc,%esp
801043c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
801043ca:	68 00 7a 10 80       	push   $0x80107a00
801043cf:	8d 43 04             	lea    0x4(%ebx),%eax
801043d2:	50                   	push   %eax
801043d3:	e8 f8 00 00 00       	call   801044d0 <initlock>
  lk->name = name;
801043d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801043db:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
801043e1:	83 c4 10             	add    $0x10,%esp
  lk->pid = 0;
801043e4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
801043eb:	89 43 38             	mov    %eax,0x38(%ebx)
}
801043ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801043f1:	c9                   	leave  
801043f2:	c3                   	ret    
801043f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801043f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104400 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104400:	55                   	push   %ebp
80104401:	89 e5                	mov    %esp,%ebp
80104403:	56                   	push   %esi
80104404:	53                   	push   %ebx
80104405:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104408:	83 ec 0c             	sub    $0xc,%esp
8010440b:	8d 73 04             	lea    0x4(%ebx),%esi
8010440e:	56                   	push   %esi
8010440f:	e8 dc 00 00 00       	call   801044f0 <acquire>
  while (lk->locked) {
80104414:	8b 13                	mov    (%ebx),%edx
80104416:	83 c4 10             	add    $0x10,%esp
80104419:	85 d2                	test   %edx,%edx
8010441b:	74 16                	je     80104433 <acquiresleep+0x33>
8010441d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104420:	83 ec 08             	sub    $0x8,%esp
80104423:	56                   	push   %esi
80104424:	53                   	push   %ebx
80104425:	e8 a6 fa ff ff       	call   80103ed0 <sleep>
  while (lk->locked) {
8010442a:	8b 03                	mov    (%ebx),%eax
8010442c:	83 c4 10             	add    $0x10,%esp
8010442f:	85 c0                	test   %eax,%eax
80104431:	75 ed                	jne    80104420 <acquiresleep+0x20>
  }
  lk->locked = 1;
80104433:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = proc->pid;
80104439:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010443f:	8b 40 10             	mov    0x10(%eax),%eax
80104442:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104445:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104448:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010444b:	5b                   	pop    %ebx
8010444c:	5e                   	pop    %esi
8010444d:	5d                   	pop    %ebp
  release(&lk->lk);
8010444e:	e9 7d 02 00 00       	jmp    801046d0 <release>
80104453:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104460 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
80104460:	55                   	push   %ebp
80104461:	89 e5                	mov    %esp,%ebp
80104463:	56                   	push   %esi
80104464:	53                   	push   %ebx
80104465:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104468:	83 ec 0c             	sub    $0xc,%esp
8010446b:	8d 73 04             	lea    0x4(%ebx),%esi
8010446e:	56                   	push   %esi
8010446f:	e8 7c 00 00 00       	call   801044f0 <acquire>
  lk->locked = 0;
80104474:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010447a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104481:	89 1c 24             	mov    %ebx,(%esp)
80104484:	e8 07 fc ff ff       	call   80104090 <wakeup>
  release(&lk->lk);
80104489:	89 75 08             	mov    %esi,0x8(%ebp)
8010448c:	83 c4 10             	add    $0x10,%esp
}
8010448f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104492:	5b                   	pop    %ebx
80104493:	5e                   	pop    %esi
80104494:	5d                   	pop    %ebp
  release(&lk->lk);
80104495:	e9 36 02 00 00       	jmp    801046d0 <release>
8010449a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801044a0 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
801044a0:	55                   	push   %ebp
801044a1:	89 e5                	mov    %esp,%ebp
801044a3:	56                   	push   %esi
801044a4:	53                   	push   %ebx
801044a5:	8b 75 08             	mov    0x8(%ebp),%esi
  int r;
  
  acquire(&lk->lk);
801044a8:	83 ec 0c             	sub    $0xc,%esp
801044ab:	8d 5e 04             	lea    0x4(%esi),%ebx
801044ae:	53                   	push   %ebx
801044af:	e8 3c 00 00 00       	call   801044f0 <acquire>
  r = lk->locked;
801044b4:	8b 36                	mov    (%esi),%esi
  release(&lk->lk);
801044b6:	89 1c 24             	mov    %ebx,(%esp)
801044b9:	e8 12 02 00 00       	call   801046d0 <release>
  return r;
}
801044be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801044c1:	89 f0                	mov    %esi,%eax
801044c3:	5b                   	pop    %ebx
801044c4:	5e                   	pop    %esi
801044c5:	5d                   	pop    %ebp
801044c6:	c3                   	ret    
801044c7:	66 90                	xchg   %ax,%ax
801044c9:	66 90                	xchg   %ax,%ax
801044cb:	66 90                	xchg   %ax,%ax
801044cd:	66 90                	xchg   %ax,%ax
801044cf:	90                   	nop

801044d0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801044d0:	55                   	push   %ebp
801044d1:	89 e5                	mov    %esp,%ebp
801044d3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801044d6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801044d9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
801044df:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
801044e2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801044e9:	5d                   	pop    %ebp
801044ea:	c3                   	ret    
801044eb:	90                   	nop
801044ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801044f0 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
801044f0:	55                   	push   %ebp
801044f1:	89 e5                	mov    %esp,%ebp
801044f3:	53                   	push   %ebx
801044f4:	83 ec 04             	sub    $0x4,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801044f7:	9c                   	pushf  
801044f8:	5a                   	pop    %edx
  asm volatile("cli");
801044f9:	fa                   	cli    
{
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
801044fa:	65 8b 0d 00 00 00 00 	mov    %gs:0x0,%ecx
80104501:	8b 81 ac 00 00 00    	mov    0xac(%ecx),%eax
80104507:	85 c0                	test   %eax,%eax
80104509:	75 0c                	jne    80104517 <acquire+0x27>
    cpu->intena = eflags & FL_IF;
8010450b:	81 e2 00 02 00 00    	and    $0x200,%edx
80104511:	89 91 b0 00 00 00    	mov    %edx,0xb0(%ecx)
  if(holding(lk))
80104517:	8b 55 08             	mov    0x8(%ebp),%edx
  cpu->ncli += 1;
8010451a:	83 c0 01             	add    $0x1,%eax
8010451d:	89 81 ac 00 00 00    	mov    %eax,0xac(%ecx)
  return lock->locked && lock->cpu == cpu;
80104523:	8b 02                	mov    (%edx),%eax
80104525:	85 c0                	test   %eax,%eax
80104527:	74 05                	je     8010452e <acquire+0x3e>
80104529:	39 4a 08             	cmp    %ecx,0x8(%edx)
8010452c:	74 7a                	je     801045a8 <acquire+0xb8>
  asm volatile("lock; xchgl %0, %1" :
8010452e:	b9 01 00 00 00       	mov    $0x1,%ecx
80104533:	90                   	nop
80104534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104538:	89 c8                	mov    %ecx,%eax
8010453a:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lk->locked, 1) != 0)
8010453d:	85 c0                	test   %eax,%eax
8010453f:	75 f7                	jne    80104538 <acquire+0x48>
  __sync_synchronize();
80104541:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = cpu;
80104546:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104549:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  ebp = (uint*)v - 2;
8010454f:	89 ea                	mov    %ebp,%edx
  lk->cpu = cpu;
80104551:	89 41 08             	mov    %eax,0x8(%ecx)
  getcallerpcs(&lk, lk->pcs);
80104554:	83 c1 0c             	add    $0xc,%ecx
  for(i = 0; i < 10; i++){
80104557:	31 c0                	xor    %eax,%eax
80104559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104560:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104566:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010456c:	77 1a                	ja     80104588 <acquire+0x98>
    pcs[i] = ebp[1];     // saved %eip
8010456e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104571:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
  for(i = 0; i < 10; i++){
80104574:	83 c0 01             	add    $0x1,%eax
    ebp = (uint*)ebp[0]; // saved %ebp
80104577:	8b 12                	mov    (%edx),%edx
  for(i = 0; i < 10; i++){
80104579:	83 f8 0a             	cmp    $0xa,%eax
8010457c:	75 e2                	jne    80104560 <acquire+0x70>
}
8010457e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104581:	c9                   	leave  
80104582:	c3                   	ret    
80104583:	90                   	nop
80104584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pcs[i] = 0;
80104588:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
  for(; i < 10; i++)
8010458f:	83 c0 01             	add    $0x1,%eax
80104592:	83 f8 0a             	cmp    $0xa,%eax
80104595:	74 e7                	je     8010457e <acquire+0x8e>
    pcs[i] = 0;
80104597:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
  for(; i < 10; i++)
8010459e:	83 c0 01             	add    $0x1,%eax
801045a1:	83 f8 0a             	cmp    $0xa,%eax
801045a4:	75 e2                	jne    80104588 <acquire+0x98>
801045a6:	eb d6                	jmp    8010457e <acquire+0x8e>
    panic("acquire");
801045a8:	83 ec 0c             	sub    $0xc,%esp
801045ab:	68 0b 7a 10 80       	push   $0x80107a0b
801045b0:	e8 bb bd ff ff       	call   80100370 <panic>
801045b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045c0 <getcallerpcs>:
{
801045c0:	55                   	push   %ebp
801045c1:	89 e5                	mov    %esp,%ebp
801045c3:	53                   	push   %ebx
  ebp = (uint*)v - 2;
801045c4:	8b 45 08             	mov    0x8(%ebp),%eax
{
801045c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ebp = (uint*)v - 2;
801045ca:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
801045cd:	31 c0                	xor    %eax,%eax
801045cf:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801045d0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801045d6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801045dc:	77 1a                	ja     801045f8 <getcallerpcs+0x38>
    pcs[i] = ebp[1];     // saved %eip
801045de:	8b 5a 04             	mov    0x4(%edx),%ebx
801045e1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
  for(i = 0; i < 10; i++){
801045e4:	83 c0 01             	add    $0x1,%eax
    ebp = (uint*)ebp[0]; // saved %ebp
801045e7:	8b 12                	mov    (%edx),%edx
  for(i = 0; i < 10; i++){
801045e9:	83 f8 0a             	cmp    $0xa,%eax
801045ec:	75 e2                	jne    801045d0 <getcallerpcs+0x10>
}
801045ee:	5b                   	pop    %ebx
801045ef:	5d                   	pop    %ebp
801045f0:	c3                   	ret    
801045f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    pcs[i] = 0;
801045f8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
  for(; i < 10; i++)
801045ff:	83 c0 01             	add    $0x1,%eax
80104602:	83 f8 0a             	cmp    $0xa,%eax
80104605:	74 e7                	je     801045ee <getcallerpcs+0x2e>
    pcs[i] = 0;
80104607:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
  for(; i < 10; i++)
8010460e:	83 c0 01             	add    $0x1,%eax
80104611:	83 f8 0a             	cmp    $0xa,%eax
80104614:	75 e2                	jne    801045f8 <getcallerpcs+0x38>
80104616:	eb d6                	jmp    801045ee <getcallerpcs+0x2e>
80104618:	90                   	nop
80104619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104620 <holding>:
{
80104620:	55                   	push   %ebp
80104621:	89 e5                	mov    %esp,%ebp
80104623:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == cpu;
80104626:	8b 02                	mov    (%edx),%eax
80104628:	85 c0                	test   %eax,%eax
8010462a:	74 14                	je     80104640 <holding+0x20>
8010462c:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104632:	39 42 08             	cmp    %eax,0x8(%edx)
}
80104635:	5d                   	pop    %ebp
  return lock->locked && lock->cpu == cpu;
80104636:	0f 94 c0             	sete   %al
80104639:	0f b6 c0             	movzbl %al,%eax
}
8010463c:	c3                   	ret    
8010463d:	8d 76 00             	lea    0x0(%esi),%esi
80104640:	31 c0                	xor    %eax,%eax
  return lock->locked && lock->cpu == cpu;
80104642:	0f b6 c0             	movzbl %al,%eax
}
80104645:	5d                   	pop    %ebp
80104646:	c3                   	ret    
80104647:	89 f6                	mov    %esi,%esi
80104649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104650 <pushcli>:
{
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104653:	9c                   	pushf  
80104654:	59                   	pop    %ecx
  asm volatile("cli");
80104655:	fa                   	cli    
  if(cpu->ncli == 0)
80104656:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
8010465d:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
80104663:	85 c0                	test   %eax,%eax
80104665:	75 0c                	jne    80104673 <pushcli+0x23>
    cpu->intena = eflags & FL_IF;
80104667:	81 e1 00 02 00 00    	and    $0x200,%ecx
8010466d:	89 8a b0 00 00 00    	mov    %ecx,0xb0(%edx)
  cpu->ncli += 1;
80104673:	83 c0 01             	add    $0x1,%eax
80104676:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
}
8010467c:	5d                   	pop    %ebp
8010467d:	c3                   	ret    
8010467e:	66 90                	xchg   %ax,%ax

80104680 <popcli>:

void
popcli(void)
{
80104680:	55                   	push   %ebp
80104681:	89 e5                	mov    %esp,%ebp
80104683:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104686:	9c                   	pushf  
80104687:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104688:	f6 c4 02             	test   $0x2,%ah
8010468b:	75 2c                	jne    801046b9 <popcli+0x39>
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
8010468d:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104694:	83 aa ac 00 00 00 01 	subl   $0x1,0xac(%edx)
8010469b:	78 0f                	js     801046ac <popcli+0x2c>
    panic("popcli");
  if(cpu->ncli == 0 && cpu->intena)
8010469d:	75 0b                	jne    801046aa <popcli+0x2a>
8010469f:	8b 82 b0 00 00 00    	mov    0xb0(%edx),%eax
801046a5:	85 c0                	test   %eax,%eax
801046a7:	74 01                	je     801046aa <popcli+0x2a>
  asm volatile("sti");
801046a9:	fb                   	sti    
    sti();
}
801046aa:	c9                   	leave  
801046ab:	c3                   	ret    
    panic("popcli");
801046ac:	83 ec 0c             	sub    $0xc,%esp
801046af:	68 2a 7a 10 80       	push   $0x80107a2a
801046b4:	e8 b7 bc ff ff       	call   80100370 <panic>
    panic("popcli - interruptible");
801046b9:	83 ec 0c             	sub    $0xc,%esp
801046bc:	68 13 7a 10 80       	push   $0x80107a13
801046c1:	e8 aa bc ff ff       	call   80100370 <panic>
801046c6:	8d 76 00             	lea    0x0(%esi),%esi
801046c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046d0 <release>:
{
801046d0:	55                   	push   %ebp
801046d1:	89 e5                	mov    %esp,%ebp
801046d3:	83 ec 08             	sub    $0x8,%esp
801046d6:	8b 45 08             	mov    0x8(%ebp),%eax
  return lock->locked && lock->cpu == cpu;
801046d9:	8b 10                	mov    (%eax),%edx
801046db:	85 d2                	test   %edx,%edx
801046dd:	74 0c                	je     801046eb <release+0x1b>
801046df:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801046e6:	39 50 08             	cmp    %edx,0x8(%eax)
801046e9:	74 15                	je     80104700 <release+0x30>
    panic("release");
801046eb:	83 ec 0c             	sub    $0xc,%esp
801046ee:	68 31 7a 10 80       	push   $0x80107a31
801046f3:	e8 78 bc ff ff       	call   80100370 <panic>
801046f8:	90                   	nop
801046f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  lk->pcs[0] = 0;
80104700:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
80104707:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  __sync_synchronize();
8010470e:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
80104713:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
80104719:	c9                   	leave  
  popcli();
8010471a:	e9 61 ff ff ff       	jmp    80104680 <popcli>
8010471f:	90                   	nop

80104720 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104720:	55                   	push   %ebp
80104721:	89 e5                	mov    %esp,%ebp
80104723:	57                   	push   %edi
80104724:	53                   	push   %ebx
80104725:	8b 55 08             	mov    0x8(%ebp),%edx
80104728:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
8010472b:	f6 c2 03             	test   $0x3,%dl
8010472e:	75 05                	jne    80104735 <memset+0x15>
80104730:	f6 c1 03             	test   $0x3,%cl
80104733:	74 13                	je     80104748 <memset+0x28>
  asm volatile("cld; rep stosb" :
80104735:	89 d7                	mov    %edx,%edi
80104737:	8b 45 0c             	mov    0xc(%ebp),%eax
8010473a:	fc                   	cld    
8010473b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
8010473d:	5b                   	pop    %ebx
8010473e:	89 d0                	mov    %edx,%eax
80104740:	5f                   	pop    %edi
80104741:	5d                   	pop    %ebp
80104742:	c3                   	ret    
80104743:	90                   	nop
80104744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c &= 0xFF;
80104748:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
8010474c:	c1 e9 02             	shr    $0x2,%ecx
8010474f:	89 f8                	mov    %edi,%eax
80104751:	89 fb                	mov    %edi,%ebx
80104753:	c1 e0 18             	shl    $0x18,%eax
80104756:	c1 e3 10             	shl    $0x10,%ebx
80104759:	09 d8                	or     %ebx,%eax
8010475b:	09 f8                	or     %edi,%eax
8010475d:	c1 e7 08             	shl    $0x8,%edi
80104760:	09 f8                	or     %edi,%eax
  asm volatile("cld; rep stosl" :
80104762:	89 d7                	mov    %edx,%edi
80104764:	fc                   	cld    
80104765:	f3 ab                	rep stos %eax,%es:(%edi)
}
80104767:	5b                   	pop    %ebx
80104768:	89 d0                	mov    %edx,%eax
8010476a:	5f                   	pop    %edi
8010476b:	5d                   	pop    %ebp
8010476c:	c3                   	ret    
8010476d:	8d 76 00             	lea    0x0(%esi),%esi

80104770 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104770:	55                   	push   %ebp
80104771:	89 e5                	mov    %esp,%ebp
80104773:	57                   	push   %edi
80104774:	56                   	push   %esi
80104775:	53                   	push   %ebx
80104776:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104779:	8b 75 08             	mov    0x8(%ebp),%esi
8010477c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010477f:	85 db                	test   %ebx,%ebx
80104781:	74 29                	je     801047ac <memcmp+0x3c>
    if(*s1 != *s2)
80104783:	0f b6 16             	movzbl (%esi),%edx
80104786:	0f b6 0f             	movzbl (%edi),%ecx
80104789:	38 d1                	cmp    %dl,%cl
8010478b:	75 2b                	jne    801047b8 <memcmp+0x48>
8010478d:	b8 01 00 00 00       	mov    $0x1,%eax
80104792:	eb 14                	jmp    801047a8 <memcmp+0x38>
80104794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104798:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
8010479c:	83 c0 01             	add    $0x1,%eax
8010479f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
801047a4:	38 ca                	cmp    %cl,%dl
801047a6:	75 10                	jne    801047b8 <memcmp+0x48>
  while(n-- > 0){
801047a8:	39 d8                	cmp    %ebx,%eax
801047aa:	75 ec                	jne    80104798 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
801047ac:	5b                   	pop    %ebx
  return 0;
801047ad:	31 c0                	xor    %eax,%eax
}
801047af:	5e                   	pop    %esi
801047b0:	5f                   	pop    %edi
801047b1:	5d                   	pop    %ebp
801047b2:	c3                   	ret    
801047b3:	90                   	nop
801047b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return *s1 - *s2;
801047b8:	0f b6 c2             	movzbl %dl,%eax
}
801047bb:	5b                   	pop    %ebx
      return *s1 - *s2;
801047bc:	29 c8                	sub    %ecx,%eax
}
801047be:	5e                   	pop    %esi
801047bf:	5f                   	pop    %edi
801047c0:	5d                   	pop    %ebp
801047c1:	c3                   	ret    
801047c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047d0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
801047d0:	55                   	push   %ebp
801047d1:	89 e5                	mov    %esp,%ebp
801047d3:	56                   	push   %esi
801047d4:	53                   	push   %ebx
801047d5:	8b 45 08             	mov    0x8(%ebp),%eax
801047d8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801047db:	8b 75 10             	mov    0x10(%ebp),%esi
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
801047de:	39 c3                	cmp    %eax,%ebx
801047e0:	73 26                	jae    80104808 <memmove+0x38>
801047e2:	8d 14 33             	lea    (%ebx,%esi,1),%edx
801047e5:	39 d0                	cmp    %edx,%eax
801047e7:	73 1f                	jae    80104808 <memmove+0x38>
    s += n;
    d += n;
    while(n-- > 0)
801047e9:	85 f6                	test   %esi,%esi
801047eb:	8d 56 ff             	lea    -0x1(%esi),%edx
801047ee:	74 0f                	je     801047ff <memmove+0x2f>
      *--d = *--s;
801047f0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801047f4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    while(n-- > 0)
801047f7:	83 ea 01             	sub    $0x1,%edx
801047fa:	83 fa ff             	cmp    $0xffffffff,%edx
801047fd:	75 f1                	jne    801047f0 <memmove+0x20>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
801047ff:	5b                   	pop    %ebx
80104800:	5e                   	pop    %esi
80104801:	5d                   	pop    %ebp
80104802:	c3                   	ret    
80104803:	90                   	nop
80104804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(n-- > 0)
80104808:	31 d2                	xor    %edx,%edx
8010480a:	85 f6                	test   %esi,%esi
8010480c:	74 f1                	je     801047ff <memmove+0x2f>
8010480e:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
80104810:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104814:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104817:	83 c2 01             	add    $0x1,%edx
    while(n-- > 0)
8010481a:	39 f2                	cmp    %esi,%edx
8010481c:	75 f2                	jne    80104810 <memmove+0x40>
}
8010481e:	5b                   	pop    %ebx
8010481f:	5e                   	pop    %esi
80104820:	5d                   	pop    %ebp
80104821:	c3                   	ret    
80104822:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104830 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104830:	55                   	push   %ebp
80104831:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104833:	5d                   	pop    %ebp
  return memmove(dst, src, n);
80104834:	eb 9a                	jmp    801047d0 <memmove>
80104836:	8d 76 00             	lea    0x0(%esi),%esi
80104839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104840 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
80104840:	55                   	push   %ebp
80104841:	89 e5                	mov    %esp,%ebp
80104843:	57                   	push   %edi
80104844:	56                   	push   %esi
80104845:	8b 7d 10             	mov    0x10(%ebp),%edi
80104848:	53                   	push   %ebx
80104849:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010484c:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
8010484f:	85 ff                	test   %edi,%edi
80104851:	74 2f                	je     80104882 <strncmp+0x42>
80104853:	0f b6 11             	movzbl (%ecx),%edx
80104856:	0f b6 1e             	movzbl (%esi),%ebx
80104859:	84 d2                	test   %dl,%dl
8010485b:	74 37                	je     80104894 <strncmp+0x54>
8010485d:	38 d3                	cmp    %dl,%bl
8010485f:	75 33                	jne    80104894 <strncmp+0x54>
80104861:	01 f7                	add    %esi,%edi
80104863:	eb 13                	jmp    80104878 <strncmp+0x38>
80104865:	8d 76 00             	lea    0x0(%esi),%esi
80104868:	0f b6 11             	movzbl (%ecx),%edx
8010486b:	84 d2                	test   %dl,%dl
8010486d:	74 21                	je     80104890 <strncmp+0x50>
8010486f:	0f b6 18             	movzbl (%eax),%ebx
80104872:	89 c6                	mov    %eax,%esi
80104874:	38 da                	cmp    %bl,%dl
80104876:	75 1c                	jne    80104894 <strncmp+0x54>
    n--, p++, q++;
80104878:	8d 46 01             	lea    0x1(%esi),%eax
8010487b:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
8010487e:	39 f8                	cmp    %edi,%eax
80104880:	75 e6                	jne    80104868 <strncmp+0x28>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
80104882:	5b                   	pop    %ebx
    return 0;
80104883:	31 c0                	xor    %eax,%eax
}
80104885:	5e                   	pop    %esi
80104886:	5f                   	pop    %edi
80104887:	5d                   	pop    %ebp
80104888:	c3                   	ret    
80104889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104890:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
  return (uchar)*p - (uchar)*q;
80104894:	0f b6 c2             	movzbl %dl,%eax
80104897:	29 d8                	sub    %ebx,%eax
}
80104899:	5b                   	pop    %ebx
8010489a:	5e                   	pop    %esi
8010489b:	5f                   	pop    %edi
8010489c:	5d                   	pop    %ebp
8010489d:	c3                   	ret    
8010489e:	66 90                	xchg   %ax,%ax

801048a0 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
801048a0:	55                   	push   %ebp
801048a1:	89 e5                	mov    %esp,%ebp
801048a3:	56                   	push   %esi
801048a4:	53                   	push   %ebx
801048a5:	8b 45 08             	mov    0x8(%ebp),%eax
801048a8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801048ab:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
801048ae:	89 c2                	mov    %eax,%edx
801048b0:	eb 19                	jmp    801048cb <strncpy+0x2b>
801048b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048b8:	83 c3 01             	add    $0x1,%ebx
801048bb:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
801048bf:	83 c2 01             	add    $0x1,%edx
801048c2:	84 c9                	test   %cl,%cl
801048c4:	88 4a ff             	mov    %cl,-0x1(%edx)
801048c7:	74 09                	je     801048d2 <strncpy+0x32>
801048c9:	89 f1                	mov    %esi,%ecx
801048cb:	85 c9                	test   %ecx,%ecx
801048cd:	8d 71 ff             	lea    -0x1(%ecx),%esi
801048d0:	7f e6                	jg     801048b8 <strncpy+0x18>
    ;
  while(n-- > 0)
801048d2:	31 c9                	xor    %ecx,%ecx
801048d4:	85 f6                	test   %esi,%esi
801048d6:	7e 17                	jle    801048ef <strncpy+0x4f>
801048d8:	90                   	nop
801048d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
801048e0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
801048e4:	89 f3                	mov    %esi,%ebx
801048e6:	83 c1 01             	add    $0x1,%ecx
801048e9:	29 cb                	sub    %ecx,%ebx
  while(n-- > 0)
801048eb:	85 db                	test   %ebx,%ebx
801048ed:	7f f1                	jg     801048e0 <strncpy+0x40>
  return os;
}
801048ef:	5b                   	pop    %ebx
801048f0:	5e                   	pop    %esi
801048f1:	5d                   	pop    %ebp
801048f2:	c3                   	ret    
801048f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104900 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104900:	55                   	push   %ebp
80104901:	89 e5                	mov    %esp,%ebp
80104903:	56                   	push   %esi
80104904:	53                   	push   %ebx
80104905:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104908:	8b 45 08             	mov    0x8(%ebp),%eax
8010490b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
8010490e:	85 c9                	test   %ecx,%ecx
80104910:	7e 26                	jle    80104938 <safestrcpy+0x38>
80104912:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104916:	89 c1                	mov    %eax,%ecx
80104918:	eb 17                	jmp    80104931 <safestrcpy+0x31>
8010491a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104920:	83 c2 01             	add    $0x1,%edx
80104923:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104927:	83 c1 01             	add    $0x1,%ecx
8010492a:	84 db                	test   %bl,%bl
8010492c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010492f:	74 04                	je     80104935 <safestrcpy+0x35>
80104931:	39 f2                	cmp    %esi,%edx
80104933:	75 eb                	jne    80104920 <safestrcpy+0x20>
    ;
  *s = 0;
80104935:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104938:	5b                   	pop    %ebx
80104939:	5e                   	pop    %esi
8010493a:	5d                   	pop    %ebp
8010493b:	c3                   	ret    
8010493c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104940 <strlen>:

int
strlen(const char *s)
{
80104940:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104941:	31 c0                	xor    %eax,%eax
{
80104943:	89 e5                	mov    %esp,%ebp
80104945:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
80104948:	80 3a 00             	cmpb   $0x0,(%edx)
8010494b:	74 0c                	je     80104959 <strlen+0x19>
8010494d:	8d 76 00             	lea    0x0(%esi),%esi
80104950:	83 c0 01             	add    $0x1,%eax
80104953:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104957:	75 f7                	jne    80104950 <strlen+0x10>
    ;
  return n;
}
80104959:	5d                   	pop    %ebp
8010495a:	c3                   	ret    

8010495b <swtch>:
# Save current register context in old
# and then load register context from new.

.globl swtch
swtch:
  movl 4(%esp), %eax
8010495b:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
8010495f:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
80104963:	55                   	push   %ebp
  pushl %ebx
80104964:	53                   	push   %ebx
  pushl %esi
80104965:	56                   	push   %esi
  pushl %edi
80104966:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104967:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104969:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
8010496b:	5f                   	pop    %edi
  popl %esi
8010496c:	5e                   	pop    %esi
  popl %ebx
8010496d:	5b                   	pop    %ebx
  popl %ebp
8010496e:	5d                   	pop    %ebp
  ret
8010496f:	c3                   	ret    

80104970 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104970:	55                   	push   %ebp
  if(addr >= proc->sz || addr+4 > proc->sz)
80104971:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
{
80104978:	89 e5                	mov    %esp,%ebp
8010497a:	8b 45 08             	mov    0x8(%ebp),%eax
  if(addr >= proc->sz || addr+4 > proc->sz)
8010497d:	8b 12                	mov    (%edx),%edx
8010497f:	39 c2                	cmp    %eax,%edx
80104981:	76 15                	jbe    80104998 <fetchint+0x28>
80104983:	8d 48 04             	lea    0x4(%eax),%ecx
80104986:	39 ca                	cmp    %ecx,%edx
80104988:	72 0e                	jb     80104998 <fetchint+0x28>
    return -1;
  *ip = *(int*)(addr);
8010498a:	8b 10                	mov    (%eax),%edx
8010498c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010498f:	89 10                	mov    %edx,(%eax)
  return 0;
80104991:	31 c0                	xor    %eax,%eax
}
80104993:	5d                   	pop    %ebp
80104994:	c3                   	ret    
80104995:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104998:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010499d:	5d                   	pop    %ebp
8010499e:	c3                   	ret    
8010499f:	90                   	nop

801049a0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801049a0:	55                   	push   %ebp
  char *s, *ep;

  if(addr >= proc->sz)
801049a1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
{
801049a7:	89 e5                	mov    %esp,%ebp
801049a9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if(addr >= proc->sz)
801049ac:	39 08                	cmp    %ecx,(%eax)
801049ae:	76 2c                	jbe    801049dc <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
801049b0:	8b 55 0c             	mov    0xc(%ebp),%edx
801049b3:	89 c8                	mov    %ecx,%eax
801049b5:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
801049b7:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801049be:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
801049c0:	39 d1                	cmp    %edx,%ecx
801049c2:	73 18                	jae    801049dc <fetchstr+0x3c>
    if(*s == 0)
801049c4:	80 39 00             	cmpb   $0x0,(%ecx)
801049c7:	75 0c                	jne    801049d5 <fetchstr+0x35>
801049c9:	eb 1d                	jmp    801049e8 <fetchstr+0x48>
801049cb:	90                   	nop
801049cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801049d0:	80 38 00             	cmpb   $0x0,(%eax)
801049d3:	74 13                	je     801049e8 <fetchstr+0x48>
  for(s = *pp; s < ep; s++)
801049d5:	83 c0 01             	add    $0x1,%eax
801049d8:	39 c2                	cmp    %eax,%edx
801049da:	77 f4                	ja     801049d0 <fetchstr+0x30>
    return -1;
801049dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return s - *pp;
  return -1;
}
801049e1:	5d                   	pop    %ebp
801049e2:	c3                   	ret    
801049e3:	90                   	nop
801049e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return s - *pp;
801049e8:	29 c8                	sub    %ecx,%eax
}
801049ea:	5d                   	pop    %ebp
801049eb:	c3                   	ret    
801049ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801049f0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801049f0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
{
801049f7:	55                   	push   %ebp
801049f8:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801049fa:	8b 42 18             	mov    0x18(%edx),%eax
801049fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a00:	8b 12                	mov    (%edx),%edx
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a02:	8b 40 44             	mov    0x44(%eax),%eax
80104a05:	8d 04 88             	lea    (%eax,%ecx,4),%eax
80104a08:	8d 48 04             	lea    0x4(%eax),%ecx
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a0b:	39 d1                	cmp    %edx,%ecx
80104a0d:	73 19                	jae    80104a28 <argint+0x38>
80104a0f:	8d 48 08             	lea    0x8(%eax),%ecx
80104a12:	39 ca                	cmp    %ecx,%edx
80104a14:	72 12                	jb     80104a28 <argint+0x38>
  *ip = *(int*)(addr);
80104a16:	8b 50 04             	mov    0x4(%eax),%edx
80104a19:	8b 45 0c             	mov    0xc(%ebp),%eax
80104a1c:	89 10                	mov    %edx,(%eax)
  return 0;
80104a1e:	31 c0                	xor    %eax,%eax
}
80104a20:	5d                   	pop    %ebp
80104a21:	c3                   	ret    
80104a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80104a28:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104a2d:	5d                   	pop    %ebp
80104a2e:	c3                   	ret    
80104a2f:	90                   	nop

80104a30 <argptr>:
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a30:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104a36:	55                   	push   %ebp
80104a37:	89 e5                	mov    %esp,%ebp
80104a39:	56                   	push   %esi
80104a3a:	53                   	push   %ebx
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a3b:	8b 48 18             	mov    0x18(%eax),%ecx
80104a3e:	8b 5d 08             	mov    0x8(%ebp),%ebx
{
80104a41:	8b 55 10             	mov    0x10(%ebp),%edx
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a44:	8b 49 44             	mov    0x44(%ecx),%ecx
80104a47:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a4a:	8b 08                	mov    (%eax),%ecx
  int i;

  if(argint(n, &i) < 0)
    return -1;
80104a4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a51:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a54:	39 ce                	cmp    %ecx,%esi
80104a56:	73 1f                	jae    80104a77 <argptr+0x47>
80104a58:	8d 73 08             	lea    0x8(%ebx),%esi
80104a5b:	39 f1                	cmp    %esi,%ecx
80104a5d:	72 18                	jb     80104a77 <argptr+0x47>
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
80104a5f:	85 d2                	test   %edx,%edx
  *ip = *(int*)(addr);
80104a61:	8b 5b 04             	mov    0x4(%ebx),%ebx
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
80104a64:	78 11                	js     80104a77 <argptr+0x47>
80104a66:	39 cb                	cmp    %ecx,%ebx
80104a68:	73 0d                	jae    80104a77 <argptr+0x47>
80104a6a:	01 da                	add    %ebx,%edx
80104a6c:	39 ca                	cmp    %ecx,%edx
80104a6e:	77 07                	ja     80104a77 <argptr+0x47>
    return -1;
  *pp = (char*)i;
80104a70:	8b 45 0c             	mov    0xc(%ebp),%eax
80104a73:	89 18                	mov    %ebx,(%eax)
  return 0;
80104a75:	31 c0                	xor    %eax,%eax
}
80104a77:	5b                   	pop    %ebx
80104a78:	5e                   	pop    %esi
80104a79:	5d                   	pop    %ebp
80104a7a:	c3                   	ret    
80104a7b:	90                   	nop
80104a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104a80 <argstr>:
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a80:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104a86:	55                   	push   %ebp
80104a87:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a89:	8b 50 18             	mov    0x18(%eax),%edx
80104a8c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a8f:	8b 00                	mov    (%eax),%eax
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a91:	8b 52 44             	mov    0x44(%edx),%edx
80104a94:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
80104a97:	8d 4a 04             	lea    0x4(%edx),%ecx
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a9a:	39 c1                	cmp    %eax,%ecx
80104a9c:	73 3e                	jae    80104adc <argstr+0x5c>
80104a9e:	8d 4a 08             	lea    0x8(%edx),%ecx
80104aa1:	39 c8                	cmp    %ecx,%eax
80104aa3:	72 37                	jb     80104adc <argstr+0x5c>
  *ip = *(int*)(addr);
80104aa5:	8b 4a 04             	mov    0x4(%edx),%ecx
  if(addr >= proc->sz)
80104aa8:	39 c1                	cmp    %eax,%ecx
80104aaa:	73 30                	jae    80104adc <argstr+0x5c>
  *pp = (char*)addr;
80104aac:	8b 55 0c             	mov    0xc(%ebp),%edx
80104aaf:	89 c8                	mov    %ecx,%eax
80104ab1:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
80104ab3:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104aba:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104abc:	39 d1                	cmp    %edx,%ecx
80104abe:	73 1c                	jae    80104adc <argstr+0x5c>
    if(*s == 0)
80104ac0:	80 39 00             	cmpb   $0x0,(%ecx)
80104ac3:	75 10                	jne    80104ad5 <argstr+0x55>
80104ac5:	eb 21                	jmp    80104ae8 <argstr+0x68>
80104ac7:	89 f6                	mov    %esi,%esi
80104ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104ad0:	80 38 00             	cmpb   $0x0,(%eax)
80104ad3:	74 13                	je     80104ae8 <argstr+0x68>
  for(s = *pp; s < ep; s++)
80104ad5:	83 c0 01             	add    $0x1,%eax
80104ad8:	39 c2                	cmp    %eax,%edx
80104ada:	77 f4                	ja     80104ad0 <argstr+0x50>
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
80104adc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
80104ae1:	5d                   	pop    %ebp
80104ae2:	c3                   	ret    
80104ae3:	90                   	nop
80104ae4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return s - *pp;
80104ae8:	29 c8                	sub    %ecx,%eax
}
80104aea:	5d                   	pop    %ebp
80104aeb:	c3                   	ret    
80104aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104af0 <syscall>:

int cont = 0;

void
syscall(void)
{
80104af0:	55                   	push   %ebp
80104af1:	89 e5                	mov    %esp,%ebp
80104af3:	53                   	push   %ebx
80104af4:	83 ec 04             	sub    $0x4,%esp
  if(cont==NULL){
80104af7:	a1 20 a6 10 80       	mov    0x8010a620,%eax
80104afc:	85 c0                	test   %eax,%eax
80104afe:	75 27                	jne    80104b27 <syscall+0x37>
80104b00:	b8 40 b6 10 80       	mov    $0x8010b640,%eax
80104b05:	ba a0 b6 10 80       	mov    $0x8010b6a0,%edx
80104b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	  for(int i=0; i<sizeof(syscls)/sizeof(syscls[0]);i++)
	  syscls[i]=0;
80104b10:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104b16:	83 c0 04             	add    $0x4,%eax
	  for(int i=0; i<sizeof(syscls)/sizeof(syscls[0]);i++)
80104b19:	39 c2                	cmp    %eax,%edx
80104b1b:	75 f3                	jne    80104b10 <syscall+0x20>
	  cont++;
80104b1d:	c7 05 20 a6 10 80 01 	movl   $0x1,0x8010a620
80104b24:	00 00 00 
	  }	
  int num;

  num = proc->tf->eax;
80104b27:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104b2e:	8b 42 18             	mov    0x18(%edx),%eax
80104b31:	8b 48 1c             	mov    0x1c(%eax),%ecx
  syscls[num-1]++;
80104b34:	8d 41 ff             	lea    -0x1(%ecx),%eax
80104b37:	83 04 85 40 b6 10 80 	addl   $0x1,-0x7fef49c0(,%eax,4)
80104b3e:	01 
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104b3f:	83 f8 17             	cmp    $0x17,%eax
80104b42:	77 1c                	ja     80104b60 <syscall+0x70>
80104b44:	8b 04 8d c0 7a 10 80 	mov    -0x7fef8540(,%ecx,4),%eax
80104b4b:	85 c0                	test   %eax,%eax
80104b4d:	74 11                	je     80104b60 <syscall+0x70>
    proc->tf->eax = syscalls[num]();
80104b4f:	8b 5a 18             	mov    0x18(%edx),%ebx
80104b52:	ff d0                	call   *%eax
80104b54:	89 43 1c             	mov    %eax,0x1c(%ebx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  }
}
80104b57:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b5a:	c9                   	leave  
80104b5b:	c3                   	ret    
80104b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            proc->pid, proc->name, num);
80104b60:	8d 42 6c             	lea    0x6c(%edx),%eax
    cprintf("%d %s: unknown sys call %d\n",
80104b63:	51                   	push   %ecx
80104b64:	50                   	push   %eax
80104b65:	ff 72 10             	pushl  0x10(%edx)
80104b68:	68 39 7a 10 80       	push   $0x80107a39
80104b6d:	e8 ee ba ff ff       	call   80100660 <cprintf>
    proc->tf->eax = -1;
80104b72:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b78:	83 c4 10             	add    $0x10,%esp
80104b7b:	8b 40 18             	mov    0x18(%eax),%eax
80104b7e:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
80104b85:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b88:	c9                   	leave  
80104b89:	c3                   	ret    
80104b8a:	66 90                	xchg   %ax,%ax
80104b8c:	66 90                	xchg   %ax,%ax
80104b8e:	66 90                	xchg   %ax,%ax

80104b90 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104b90:	55                   	push   %ebp
80104b91:	89 e5                	mov    %esp,%ebp
80104b93:	57                   	push   %edi
80104b94:	56                   	push   %esi
80104b95:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104b96:	8d 5d da             	lea    -0x26(%ebp),%ebx
{
80104b99:	83 ec 44             	sub    $0x44,%esp
80104b9c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
80104b9f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if((dp = nameiparent(path, name)) == 0)
80104ba2:	53                   	push   %ebx
80104ba3:	50                   	push   %eax
{
80104ba4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104ba7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  if((dp = nameiparent(path, name)) == 0)
80104baa:	e8 f1 d2 ff ff       	call   80101ea0 <nameiparent>
80104baf:	83 c4 10             	add    $0x10,%esp
80104bb2:	85 c0                	test   %eax,%eax
80104bb4:	0f 84 f6 00 00 00    	je     80104cb0 <create+0x120>
    return 0;
  ilock(dp);
80104bba:	83 ec 0c             	sub    $0xc,%esp
80104bbd:	89 c6                	mov    %eax,%esi
80104bbf:	50                   	push   %eax
80104bc0:	e8 8b ca ff ff       	call   80101650 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104bc5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104bc8:	83 c4 0c             	add    $0xc,%esp
80104bcb:	50                   	push   %eax
80104bcc:	53                   	push   %ebx
80104bcd:	56                   	push   %esi
80104bce:	e8 8d cf ff ff       	call   80101b60 <dirlookup>
80104bd3:	83 c4 10             	add    $0x10,%esp
80104bd6:	85 c0                	test   %eax,%eax
80104bd8:	89 c7                	mov    %eax,%edi
80104bda:	74 54                	je     80104c30 <create+0xa0>
    iunlockput(dp);
80104bdc:	83 ec 0c             	sub    $0xc,%esp
80104bdf:	56                   	push   %esi
80104be0:	e8 db cc ff ff       	call   801018c0 <iunlockput>
    ilock(ip);
80104be5:	89 3c 24             	mov    %edi,(%esp)
80104be8:	e8 63 ca ff ff       	call   80101650 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104bed:	83 c4 10             	add    $0x10,%esp
80104bf0:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104bf5:	75 19                	jne    80104c10 <create+0x80>
80104bf7:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104bfc:	75 12                	jne    80104c10 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104bfe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c01:	89 f8                	mov    %edi,%eax
80104c03:	5b                   	pop    %ebx
80104c04:	5e                   	pop    %esi
80104c05:	5f                   	pop    %edi
80104c06:	5d                   	pop    %ebp
80104c07:	c3                   	ret    
80104c08:	90                   	nop
80104c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    iunlockput(ip);
80104c10:	83 ec 0c             	sub    $0xc,%esp
80104c13:	57                   	push   %edi
    return 0;
80104c14:	31 ff                	xor    %edi,%edi
    iunlockput(ip);
80104c16:	e8 a5 cc ff ff       	call   801018c0 <iunlockput>
    return 0;
80104c1b:	83 c4 10             	add    $0x10,%esp
}
80104c1e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c21:	89 f8                	mov    %edi,%eax
80104c23:	5b                   	pop    %ebx
80104c24:	5e                   	pop    %esi
80104c25:	5f                   	pop    %edi
80104c26:	5d                   	pop    %ebp
80104c27:	c3                   	ret    
80104c28:	90                   	nop
80104c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((ip = ialloc(dp->dev, type)) == 0)
80104c30:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104c34:	83 ec 08             	sub    $0x8,%esp
80104c37:	50                   	push   %eax
80104c38:	ff 36                	pushl  (%esi)
80104c3a:	e8 a1 c8 ff ff       	call   801014e0 <ialloc>
80104c3f:	83 c4 10             	add    $0x10,%esp
80104c42:	85 c0                	test   %eax,%eax
80104c44:	89 c7                	mov    %eax,%edi
80104c46:	0f 84 cc 00 00 00    	je     80104d18 <create+0x188>
  ilock(ip);
80104c4c:	83 ec 0c             	sub    $0xc,%esp
80104c4f:	50                   	push   %eax
80104c50:	e8 fb c9 ff ff       	call   80101650 <ilock>
  ip->major = major;
80104c55:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104c59:	66 89 47 52          	mov    %ax,0x52(%edi)
  ip->minor = minor;
80104c5d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104c61:	66 89 47 54          	mov    %ax,0x54(%edi)
  ip->nlink = 1;
80104c65:	b8 01 00 00 00       	mov    $0x1,%eax
80104c6a:	66 89 47 56          	mov    %ax,0x56(%edi)
  iupdate(ip);
80104c6e:	89 3c 24             	mov    %edi,(%esp)
80104c71:	e8 2a c9 ff ff       	call   801015a0 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
80104c76:	83 c4 10             	add    $0x10,%esp
80104c79:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104c7e:	74 40                	je     80104cc0 <create+0x130>
  if(dirlink(dp, name, ip->inum) < 0)
80104c80:	83 ec 04             	sub    $0x4,%esp
80104c83:	ff 77 04             	pushl  0x4(%edi)
80104c86:	53                   	push   %ebx
80104c87:	56                   	push   %esi
80104c88:	e8 33 d1 ff ff       	call   80101dc0 <dirlink>
80104c8d:	83 c4 10             	add    $0x10,%esp
80104c90:	85 c0                	test   %eax,%eax
80104c92:	78 77                	js     80104d0b <create+0x17b>
  iunlockput(dp);
80104c94:	83 ec 0c             	sub    $0xc,%esp
80104c97:	56                   	push   %esi
80104c98:	e8 23 cc ff ff       	call   801018c0 <iunlockput>
  return ip;
80104c9d:	83 c4 10             	add    $0x10,%esp
}
80104ca0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ca3:	89 f8                	mov    %edi,%eax
80104ca5:	5b                   	pop    %ebx
80104ca6:	5e                   	pop    %esi
80104ca7:	5f                   	pop    %edi
80104ca8:	5d                   	pop    %ebp
80104ca9:	c3                   	ret    
80104caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return 0;
80104cb0:	31 ff                	xor    %edi,%edi
80104cb2:	e9 47 ff ff ff       	jmp    80104bfe <create+0x6e>
80104cb7:	89 f6                	mov    %esi,%esi
80104cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    dp->nlink++;  // for ".."
80104cc0:	66 83 46 56 01       	addw   $0x1,0x56(%esi)
    iupdate(dp);
80104cc5:	83 ec 0c             	sub    $0xc,%esp
80104cc8:	56                   	push   %esi
80104cc9:	e8 d2 c8 ff ff       	call   801015a0 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104cce:	83 c4 0c             	add    $0xc,%esp
80104cd1:	ff 77 04             	pushl  0x4(%edi)
80104cd4:	68 40 7b 10 80       	push   $0x80107b40
80104cd9:	57                   	push   %edi
80104cda:	e8 e1 d0 ff ff       	call   80101dc0 <dirlink>
80104cdf:	83 c4 10             	add    $0x10,%esp
80104ce2:	85 c0                	test   %eax,%eax
80104ce4:	78 18                	js     80104cfe <create+0x16e>
80104ce6:	83 ec 04             	sub    $0x4,%esp
80104ce9:	ff 76 04             	pushl  0x4(%esi)
80104cec:	68 3f 7b 10 80       	push   $0x80107b3f
80104cf1:	57                   	push   %edi
80104cf2:	e8 c9 d0 ff ff       	call   80101dc0 <dirlink>
80104cf7:	83 c4 10             	add    $0x10,%esp
80104cfa:	85 c0                	test   %eax,%eax
80104cfc:	79 82                	jns    80104c80 <create+0xf0>
      panic("create dots");
80104cfe:	83 ec 0c             	sub    $0xc,%esp
80104d01:	68 33 7b 10 80       	push   $0x80107b33
80104d06:	e8 65 b6 ff ff       	call   80100370 <panic>
    panic("create: dirlink");
80104d0b:	83 ec 0c             	sub    $0xc,%esp
80104d0e:	68 42 7b 10 80       	push   $0x80107b42
80104d13:	e8 58 b6 ff ff       	call   80100370 <panic>
    panic("create: ialloc");
80104d18:	83 ec 0c             	sub    $0xc,%esp
80104d1b:	68 24 7b 10 80       	push   $0x80107b24
80104d20:	e8 4b b6 ff ff       	call   80100370 <panic>
80104d25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d30 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
80104d30:	55                   	push   %ebp
80104d31:	89 e5                	mov    %esp,%ebp
80104d33:	56                   	push   %esi
80104d34:	53                   	push   %ebx
80104d35:	89 c6                	mov    %eax,%esi
  if(argint(n, &fd) < 0)
80104d37:	8d 45 f4             	lea    -0xc(%ebp),%eax
argfd(int n, int *pfd, struct file **pf)
80104d3a:	89 d3                	mov    %edx,%ebx
80104d3c:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104d3f:	50                   	push   %eax
80104d40:	6a 00                	push   $0x0
80104d42:	e8 a9 fc ff ff       	call   801049f0 <argint>
80104d47:	83 c4 10             	add    $0x10,%esp
80104d4a:	85 c0                	test   %eax,%eax
80104d4c:	78 3a                	js     80104d88 <argfd.constprop.0+0x58>
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
80104d4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104d51:	83 f8 0f             	cmp    $0xf,%eax
80104d54:	77 32                	ja     80104d88 <argfd.constprop.0+0x58>
80104d56:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104d5d:	8b 54 82 28          	mov    0x28(%edx,%eax,4),%edx
80104d61:	85 d2                	test   %edx,%edx
80104d63:	74 23                	je     80104d88 <argfd.constprop.0+0x58>
  if(pfd)
80104d65:	85 f6                	test   %esi,%esi
80104d67:	74 02                	je     80104d6b <argfd.constprop.0+0x3b>
    *pfd = fd;
80104d69:	89 06                	mov    %eax,(%esi)
  if(pf)
80104d6b:	85 db                	test   %ebx,%ebx
80104d6d:	74 11                	je     80104d80 <argfd.constprop.0+0x50>
    *pf = f;
80104d6f:	89 13                	mov    %edx,(%ebx)
  return 0;
80104d71:	31 c0                	xor    %eax,%eax
}
80104d73:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d76:	5b                   	pop    %ebx
80104d77:	5e                   	pop    %esi
80104d78:	5d                   	pop    %ebp
80104d79:	c3                   	ret    
80104d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return 0;
80104d80:	31 c0                	xor    %eax,%eax
80104d82:	eb ef                	jmp    80104d73 <argfd.constprop.0+0x43>
80104d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104d88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d8d:	eb e4                	jmp    80104d73 <argfd.constprop.0+0x43>
80104d8f:	90                   	nop

80104d90 <sys_dup>:
{
80104d90:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
80104d91:	31 c0                	xor    %eax,%eax
{
80104d93:	89 e5                	mov    %esp,%ebp
80104d95:	53                   	push   %ebx
  if(argfd(0, 0, &f) < 0)
80104d96:	8d 55 f4             	lea    -0xc(%ebp),%edx
{
80104d99:	83 ec 14             	sub    $0x14,%esp
  if(argfd(0, 0, &f) < 0)
80104d9c:	e8 8f ff ff ff       	call   80104d30 <argfd.constprop.0>
80104da1:	85 c0                	test   %eax,%eax
80104da3:	78 1b                	js     80104dc0 <sys_dup+0x30>
  if((fd=fdalloc(f)) < 0)
80104da5:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104da8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  for(fd = 0; fd < NOFILE; fd++){
80104dae:	31 db                	xor    %ebx,%ebx
    if(proc->ofile[fd] == 0){
80104db0:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80104db4:	85 c9                	test   %ecx,%ecx
80104db6:	74 18                	je     80104dd0 <sys_dup+0x40>
  for(fd = 0; fd < NOFILE; fd++){
80104db8:	83 c3 01             	add    $0x1,%ebx
80104dbb:	83 fb 10             	cmp    $0x10,%ebx
80104dbe:	75 f0                	jne    80104db0 <sys_dup+0x20>
    return -1;
80104dc0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104dc5:	89 d8                	mov    %ebx,%eax
80104dc7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104dca:	c9                   	leave  
80104dcb:	c3                   	ret    
80104dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  filedup(f);
80104dd0:	83 ec 0c             	sub    $0xc,%esp
      proc->ofile[fd] = f;
80104dd3:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)
  filedup(f);
80104dd7:	52                   	push   %edx
80104dd8:	e8 d3 bf ff ff       	call   80100db0 <filedup>
}
80104ddd:	89 d8                	mov    %ebx,%eax
  return fd;
80104ddf:	83 c4 10             	add    $0x10,%esp
}
80104de2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104de5:	c9                   	leave  
80104de6:	c3                   	ret    
80104de7:	89 f6                	mov    %esi,%esi
80104de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104df0 <sys_read>:
{
80104df0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104df1:	31 c0                	xor    %eax,%eax
{
80104df3:	89 e5                	mov    %esp,%ebp
80104df5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104df8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104dfb:	e8 30 ff ff ff       	call   80104d30 <argfd.constprop.0>
80104e00:	85 c0                	test   %eax,%eax
80104e02:	78 4c                	js     80104e50 <sys_read+0x60>
80104e04:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e07:	83 ec 08             	sub    $0x8,%esp
80104e0a:	50                   	push   %eax
80104e0b:	6a 02                	push   $0x2
80104e0d:	e8 de fb ff ff       	call   801049f0 <argint>
80104e12:	83 c4 10             	add    $0x10,%esp
80104e15:	85 c0                	test   %eax,%eax
80104e17:	78 37                	js     80104e50 <sys_read+0x60>
80104e19:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e1c:	83 ec 04             	sub    $0x4,%esp
80104e1f:	ff 75 f0             	pushl  -0x10(%ebp)
80104e22:	50                   	push   %eax
80104e23:	6a 01                	push   $0x1
80104e25:	e8 06 fc ff ff       	call   80104a30 <argptr>
80104e2a:	83 c4 10             	add    $0x10,%esp
80104e2d:	85 c0                	test   %eax,%eax
80104e2f:	78 1f                	js     80104e50 <sys_read+0x60>
  return fileread(f, p, n);
80104e31:	83 ec 04             	sub    $0x4,%esp
80104e34:	ff 75 f0             	pushl  -0x10(%ebp)
80104e37:	ff 75 f4             	pushl  -0xc(%ebp)
80104e3a:	ff 75 ec             	pushl  -0x14(%ebp)
80104e3d:	e8 de c0 ff ff       	call   80100f20 <fileread>
80104e42:	83 c4 10             	add    $0x10,%esp
}
80104e45:	c9                   	leave  
80104e46:	c3                   	ret    
80104e47:	89 f6                	mov    %esi,%esi
80104e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104e50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e55:	c9                   	leave  
80104e56:	c3                   	ret    
80104e57:	89 f6                	mov    %esi,%esi
80104e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e60 <sys_write>:
{
80104e60:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104e61:	31 c0                	xor    %eax,%eax
{
80104e63:	89 e5                	mov    %esp,%ebp
80104e65:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104e68:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104e6b:	e8 c0 fe ff ff       	call   80104d30 <argfd.constprop.0>
80104e70:	85 c0                	test   %eax,%eax
80104e72:	78 4c                	js     80104ec0 <sys_write+0x60>
80104e74:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e77:	83 ec 08             	sub    $0x8,%esp
80104e7a:	50                   	push   %eax
80104e7b:	6a 02                	push   $0x2
80104e7d:	e8 6e fb ff ff       	call   801049f0 <argint>
80104e82:	83 c4 10             	add    $0x10,%esp
80104e85:	85 c0                	test   %eax,%eax
80104e87:	78 37                	js     80104ec0 <sys_write+0x60>
80104e89:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e8c:	83 ec 04             	sub    $0x4,%esp
80104e8f:	ff 75 f0             	pushl  -0x10(%ebp)
80104e92:	50                   	push   %eax
80104e93:	6a 01                	push   $0x1
80104e95:	e8 96 fb ff ff       	call   80104a30 <argptr>
80104e9a:	83 c4 10             	add    $0x10,%esp
80104e9d:	85 c0                	test   %eax,%eax
80104e9f:	78 1f                	js     80104ec0 <sys_write+0x60>
  return filewrite(f, p, n);
80104ea1:	83 ec 04             	sub    $0x4,%esp
80104ea4:	ff 75 f0             	pushl  -0x10(%ebp)
80104ea7:	ff 75 f4             	pushl  -0xc(%ebp)
80104eaa:	ff 75 ec             	pushl  -0x14(%ebp)
80104ead:	e8 fe c0 ff ff       	call   80100fb0 <filewrite>
80104eb2:	83 c4 10             	add    $0x10,%esp
}
80104eb5:	c9                   	leave  
80104eb6:	c3                   	ret    
80104eb7:	89 f6                	mov    %esi,%esi
80104eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104ec0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104ec5:	c9                   	leave  
80104ec6:	c3                   	ret    
80104ec7:	89 f6                	mov    %esi,%esi
80104ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ed0 <sys_close>:
{
80104ed0:	55                   	push   %ebp
80104ed1:	89 e5                	mov    %esp,%ebp
80104ed3:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
80104ed6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104ed9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104edc:	e8 4f fe ff ff       	call   80104d30 <argfd.constprop.0>
80104ee1:	85 c0                	test   %eax,%eax
80104ee3:	78 2b                	js     80104f10 <sys_close+0x40>
  proc->ofile[fd] = 0;
80104ee5:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104ee8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  fileclose(f);
80104eee:	83 ec 0c             	sub    $0xc,%esp
  proc->ofile[fd] = 0;
80104ef1:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104ef8:	00 
  fileclose(f);
80104ef9:	ff 75 f4             	pushl  -0xc(%ebp)
80104efc:	e8 ff be ff ff       	call   80100e00 <fileclose>
  return 0;
80104f01:	83 c4 10             	add    $0x10,%esp
80104f04:	31 c0                	xor    %eax,%eax
}
80104f06:	c9                   	leave  
80104f07:	c3                   	ret    
80104f08:	90                   	nop
80104f09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104f10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104f15:	c9                   	leave  
80104f16:	c3                   	ret    
80104f17:	89 f6                	mov    %esi,%esi
80104f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104f20 <sys_fstat>:
{
80104f20:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104f21:	31 c0                	xor    %eax,%eax
{
80104f23:	89 e5                	mov    %esp,%ebp
80104f25:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104f28:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104f2b:	e8 00 fe ff ff       	call   80104d30 <argfd.constprop.0>
80104f30:	85 c0                	test   %eax,%eax
80104f32:	78 2c                	js     80104f60 <sys_fstat+0x40>
80104f34:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104f37:	83 ec 04             	sub    $0x4,%esp
80104f3a:	6a 14                	push   $0x14
80104f3c:	50                   	push   %eax
80104f3d:	6a 01                	push   $0x1
80104f3f:	e8 ec fa ff ff       	call   80104a30 <argptr>
80104f44:	83 c4 10             	add    $0x10,%esp
80104f47:	85 c0                	test   %eax,%eax
80104f49:	78 15                	js     80104f60 <sys_fstat+0x40>
  return filestat(f, st);
80104f4b:	83 ec 08             	sub    $0x8,%esp
80104f4e:	ff 75 f4             	pushl  -0xc(%ebp)
80104f51:	ff 75 f0             	pushl  -0x10(%ebp)
80104f54:	e8 77 bf ff ff       	call   80100ed0 <filestat>
80104f59:	83 c4 10             	add    $0x10,%esp
}
80104f5c:	c9                   	leave  
80104f5d:	c3                   	ret    
80104f5e:	66 90                	xchg   %ax,%ax
    return -1;
80104f60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104f65:	c9                   	leave  
80104f66:	c3                   	ret    
80104f67:	89 f6                	mov    %esi,%esi
80104f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104f70 <sys_link>:
{
80104f70:	55                   	push   %ebp
80104f71:	89 e5                	mov    %esp,%ebp
80104f73:	57                   	push   %edi
80104f74:	56                   	push   %esi
80104f75:	53                   	push   %ebx
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104f76:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
80104f79:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104f7c:	50                   	push   %eax
80104f7d:	6a 00                	push   $0x0
80104f7f:	e8 fc fa ff ff       	call   80104a80 <argstr>
80104f84:	83 c4 10             	add    $0x10,%esp
80104f87:	85 c0                	test   %eax,%eax
80104f89:	0f 88 fb 00 00 00    	js     8010508a <sys_link+0x11a>
80104f8f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104f92:	83 ec 08             	sub    $0x8,%esp
80104f95:	50                   	push   %eax
80104f96:	6a 01                	push   $0x1
80104f98:	e8 e3 fa ff ff       	call   80104a80 <argstr>
80104f9d:	83 c4 10             	add    $0x10,%esp
80104fa0:	85 c0                	test   %eax,%eax
80104fa2:	0f 88 e2 00 00 00    	js     8010508a <sys_link+0x11a>
  begin_op();
80104fa8:	e8 23 dc ff ff       	call   80102bd0 <begin_op>
  if((ip = namei(old)) == 0){
80104fad:	83 ec 0c             	sub    $0xc,%esp
80104fb0:	ff 75 d4             	pushl  -0x2c(%ebp)
80104fb3:	e8 c8 ce ff ff       	call   80101e80 <namei>
80104fb8:	83 c4 10             	add    $0x10,%esp
80104fbb:	85 c0                	test   %eax,%eax
80104fbd:	89 c3                	mov    %eax,%ebx
80104fbf:	0f 84 f3 00 00 00    	je     801050b8 <sys_link+0x148>
  ilock(ip);
80104fc5:	83 ec 0c             	sub    $0xc,%esp
80104fc8:	50                   	push   %eax
80104fc9:	e8 82 c6 ff ff       	call   80101650 <ilock>
  if(ip->type == T_DIR){
80104fce:	83 c4 10             	add    $0x10,%esp
80104fd1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104fd6:	0f 84 c4 00 00 00    	je     801050a0 <sys_link+0x130>
  ip->nlink++;
80104fdc:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104fe1:	83 ec 0c             	sub    $0xc,%esp
  if((dp = nameiparent(new, name)) == 0)
80104fe4:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80104fe7:	53                   	push   %ebx
80104fe8:	e8 b3 c5 ff ff       	call   801015a0 <iupdate>
  iunlock(ip);
80104fed:	89 1c 24             	mov    %ebx,(%esp)
80104ff0:	e8 3b c7 ff ff       	call   80101730 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80104ff5:	58                   	pop    %eax
80104ff6:	5a                   	pop    %edx
80104ff7:	57                   	push   %edi
80104ff8:	ff 75 d0             	pushl  -0x30(%ebp)
80104ffb:	e8 a0 ce ff ff       	call   80101ea0 <nameiparent>
80105000:	83 c4 10             	add    $0x10,%esp
80105003:	85 c0                	test   %eax,%eax
80105005:	89 c6                	mov    %eax,%esi
80105007:	74 5b                	je     80105064 <sys_link+0xf4>
  ilock(dp);
80105009:	83 ec 0c             	sub    $0xc,%esp
8010500c:	50                   	push   %eax
8010500d:	e8 3e c6 ff ff       	call   80101650 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80105012:	83 c4 10             	add    $0x10,%esp
80105015:	8b 03                	mov    (%ebx),%eax
80105017:	39 06                	cmp    %eax,(%esi)
80105019:	75 3d                	jne    80105058 <sys_link+0xe8>
8010501b:	83 ec 04             	sub    $0x4,%esp
8010501e:	ff 73 04             	pushl  0x4(%ebx)
80105021:	57                   	push   %edi
80105022:	56                   	push   %esi
80105023:	e8 98 cd ff ff       	call   80101dc0 <dirlink>
80105028:	83 c4 10             	add    $0x10,%esp
8010502b:	85 c0                	test   %eax,%eax
8010502d:	78 29                	js     80105058 <sys_link+0xe8>
  iunlockput(dp);
8010502f:	83 ec 0c             	sub    $0xc,%esp
80105032:	56                   	push   %esi
80105033:	e8 88 c8 ff ff       	call   801018c0 <iunlockput>
  iput(ip);
80105038:	89 1c 24             	mov    %ebx,(%esp)
8010503b:	e8 40 c7 ff ff       	call   80101780 <iput>
  end_op();
80105040:	e8 fb db ff ff       	call   80102c40 <end_op>
  return 0;
80105045:	83 c4 10             	add    $0x10,%esp
80105048:	31 c0                	xor    %eax,%eax
}
8010504a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010504d:	5b                   	pop    %ebx
8010504e:	5e                   	pop    %esi
8010504f:	5f                   	pop    %edi
80105050:	5d                   	pop    %ebp
80105051:	c3                   	ret    
80105052:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(dp);
80105058:	83 ec 0c             	sub    $0xc,%esp
8010505b:	56                   	push   %esi
8010505c:	e8 5f c8 ff ff       	call   801018c0 <iunlockput>
    goto bad;
80105061:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
80105064:	83 ec 0c             	sub    $0xc,%esp
80105067:	53                   	push   %ebx
80105068:	e8 e3 c5 ff ff       	call   80101650 <ilock>
  ip->nlink--;
8010506d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105072:	89 1c 24             	mov    %ebx,(%esp)
80105075:	e8 26 c5 ff ff       	call   801015a0 <iupdate>
  iunlockput(ip);
8010507a:	89 1c 24             	mov    %ebx,(%esp)
8010507d:	e8 3e c8 ff ff       	call   801018c0 <iunlockput>
  end_op();
80105082:	e8 b9 db ff ff       	call   80102c40 <end_op>
  return -1;
80105087:	83 c4 10             	add    $0x10,%esp
}
8010508a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
8010508d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105092:	5b                   	pop    %ebx
80105093:	5e                   	pop    %esi
80105094:	5f                   	pop    %edi
80105095:	5d                   	pop    %ebp
80105096:	c3                   	ret    
80105097:	89 f6                	mov    %esi,%esi
80105099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    iunlockput(ip);
801050a0:	83 ec 0c             	sub    $0xc,%esp
801050a3:	53                   	push   %ebx
801050a4:	e8 17 c8 ff ff       	call   801018c0 <iunlockput>
    end_op();
801050a9:	e8 92 db ff ff       	call   80102c40 <end_op>
    return -1;
801050ae:	83 c4 10             	add    $0x10,%esp
801050b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050b6:	eb 92                	jmp    8010504a <sys_link+0xda>
    end_op();
801050b8:	e8 83 db ff ff       	call   80102c40 <end_op>
    return -1;
801050bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050c2:	eb 86                	jmp    8010504a <sys_link+0xda>
801050c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801050ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801050d0 <sys_unlink>:
{
801050d0:	55                   	push   %ebp
801050d1:	89 e5                	mov    %esp,%ebp
801050d3:	57                   	push   %edi
801050d4:	56                   	push   %esi
801050d5:	53                   	push   %ebx
  if(argstr(0, &path) < 0)
801050d6:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
801050d9:	83 ec 54             	sub    $0x54,%esp
  if(argstr(0, &path) < 0)
801050dc:	50                   	push   %eax
801050dd:	6a 00                	push   $0x0
801050df:	e8 9c f9 ff ff       	call   80104a80 <argstr>
801050e4:	83 c4 10             	add    $0x10,%esp
801050e7:	85 c0                	test   %eax,%eax
801050e9:	0f 88 82 01 00 00    	js     80105271 <sys_unlink+0x1a1>
  if((dp = nameiparent(path, name)) == 0){
801050ef:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  begin_op();
801050f2:	e8 d9 da ff ff       	call   80102bd0 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
801050f7:	83 ec 08             	sub    $0x8,%esp
801050fa:	53                   	push   %ebx
801050fb:	ff 75 c0             	pushl  -0x40(%ebp)
801050fe:	e8 9d cd ff ff       	call   80101ea0 <nameiparent>
80105103:	83 c4 10             	add    $0x10,%esp
80105106:	85 c0                	test   %eax,%eax
80105108:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010510b:	0f 84 6a 01 00 00    	je     8010527b <sys_unlink+0x1ab>
  ilock(dp);
80105111:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80105114:	83 ec 0c             	sub    $0xc,%esp
80105117:	56                   	push   %esi
80105118:	e8 33 c5 ff ff       	call   80101650 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
8010511d:	58                   	pop    %eax
8010511e:	5a                   	pop    %edx
8010511f:	68 40 7b 10 80       	push   $0x80107b40
80105124:	53                   	push   %ebx
80105125:	e8 16 ca ff ff       	call   80101b40 <namecmp>
8010512a:	83 c4 10             	add    $0x10,%esp
8010512d:	85 c0                	test   %eax,%eax
8010512f:	0f 84 fc 00 00 00    	je     80105231 <sys_unlink+0x161>
80105135:	83 ec 08             	sub    $0x8,%esp
80105138:	68 3f 7b 10 80       	push   $0x80107b3f
8010513d:	53                   	push   %ebx
8010513e:	e8 fd c9 ff ff       	call   80101b40 <namecmp>
80105143:	83 c4 10             	add    $0x10,%esp
80105146:	85 c0                	test   %eax,%eax
80105148:	0f 84 e3 00 00 00    	je     80105231 <sys_unlink+0x161>
  if((ip = dirlookup(dp, name, &off)) == 0)
8010514e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80105151:	83 ec 04             	sub    $0x4,%esp
80105154:	50                   	push   %eax
80105155:	53                   	push   %ebx
80105156:	56                   	push   %esi
80105157:	e8 04 ca ff ff       	call   80101b60 <dirlookup>
8010515c:	83 c4 10             	add    $0x10,%esp
8010515f:	85 c0                	test   %eax,%eax
80105161:	89 c3                	mov    %eax,%ebx
80105163:	0f 84 c8 00 00 00    	je     80105231 <sys_unlink+0x161>
  ilock(ip);
80105169:	83 ec 0c             	sub    $0xc,%esp
8010516c:	50                   	push   %eax
8010516d:	e8 de c4 ff ff       	call   80101650 <ilock>
  if(ip->nlink < 1)
80105172:	83 c4 10             	add    $0x10,%esp
80105175:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010517a:	0f 8e 24 01 00 00    	jle    801052a4 <sys_unlink+0x1d4>
  if(ip->type == T_DIR && !isdirempty(ip)){
80105180:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105185:	8d 75 d8             	lea    -0x28(%ebp),%esi
80105188:	74 66                	je     801051f0 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
8010518a:	83 ec 04             	sub    $0x4,%esp
8010518d:	6a 10                	push   $0x10
8010518f:	6a 00                	push   $0x0
80105191:	56                   	push   %esi
80105192:	e8 89 f5 ff ff       	call   80104720 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105197:	6a 10                	push   $0x10
80105199:	ff 75 c4             	pushl  -0x3c(%ebp)
8010519c:	56                   	push   %esi
8010519d:	ff 75 b4             	pushl  -0x4c(%ebp)
801051a0:	e8 6b c8 ff ff       	call   80101a10 <writei>
801051a5:	83 c4 20             	add    $0x20,%esp
801051a8:	83 f8 10             	cmp    $0x10,%eax
801051ab:	0f 85 e6 00 00 00    	jne    80105297 <sys_unlink+0x1c7>
  if(ip->type == T_DIR){
801051b1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801051b6:	0f 84 9c 00 00 00    	je     80105258 <sys_unlink+0x188>
  iunlockput(dp);
801051bc:	83 ec 0c             	sub    $0xc,%esp
801051bf:	ff 75 b4             	pushl  -0x4c(%ebp)
801051c2:	e8 f9 c6 ff ff       	call   801018c0 <iunlockput>
  ip->nlink--;
801051c7:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
801051cc:	89 1c 24             	mov    %ebx,(%esp)
801051cf:	e8 cc c3 ff ff       	call   801015a0 <iupdate>
  iunlockput(ip);
801051d4:	89 1c 24             	mov    %ebx,(%esp)
801051d7:	e8 e4 c6 ff ff       	call   801018c0 <iunlockput>
  end_op();
801051dc:	e8 5f da ff ff       	call   80102c40 <end_op>
  return 0;
801051e1:	83 c4 10             	add    $0x10,%esp
801051e4:	31 c0                	xor    %eax,%eax
}
801051e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801051e9:	5b                   	pop    %ebx
801051ea:	5e                   	pop    %esi
801051eb:	5f                   	pop    %edi
801051ec:	5d                   	pop    %ebp
801051ed:	c3                   	ret    
801051ee:	66 90                	xchg   %ax,%ax
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
801051f0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
801051f4:	76 94                	jbe    8010518a <sys_unlink+0xba>
801051f6:	bf 20 00 00 00       	mov    $0x20,%edi
801051fb:	eb 0f                	jmp    8010520c <sys_unlink+0x13c>
801051fd:	8d 76 00             	lea    0x0(%esi),%esi
80105200:	83 c7 10             	add    $0x10,%edi
80105203:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105206:	0f 83 7e ff ff ff    	jae    8010518a <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010520c:	6a 10                	push   $0x10
8010520e:	57                   	push   %edi
8010520f:	56                   	push   %esi
80105210:	53                   	push   %ebx
80105211:	e8 fa c6 ff ff       	call   80101910 <readi>
80105216:	83 c4 10             	add    $0x10,%esp
80105219:	83 f8 10             	cmp    $0x10,%eax
8010521c:	75 6c                	jne    8010528a <sys_unlink+0x1ba>
    if(de.inum != 0)
8010521e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105223:	74 db                	je     80105200 <sys_unlink+0x130>
    iunlockput(ip);
80105225:	83 ec 0c             	sub    $0xc,%esp
80105228:	53                   	push   %ebx
80105229:	e8 92 c6 ff ff       	call   801018c0 <iunlockput>
    goto bad;
8010522e:	83 c4 10             	add    $0x10,%esp
  iunlockput(dp);
80105231:	83 ec 0c             	sub    $0xc,%esp
80105234:	ff 75 b4             	pushl  -0x4c(%ebp)
80105237:	e8 84 c6 ff ff       	call   801018c0 <iunlockput>
  end_op();
8010523c:	e8 ff d9 ff ff       	call   80102c40 <end_op>
  return -1;
80105241:	83 c4 10             	add    $0x10,%esp
}
80105244:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
80105247:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010524c:	5b                   	pop    %ebx
8010524d:	5e                   	pop    %esi
8010524e:	5f                   	pop    %edi
8010524f:	5d                   	pop    %ebp
80105250:	c3                   	ret    
80105251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink--;
80105258:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
8010525b:	83 ec 0c             	sub    $0xc,%esp
    dp->nlink--;
8010525e:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80105263:	50                   	push   %eax
80105264:	e8 37 c3 ff ff       	call   801015a0 <iupdate>
80105269:	83 c4 10             	add    $0x10,%esp
8010526c:	e9 4b ff ff ff       	jmp    801051bc <sys_unlink+0xec>
    return -1;
80105271:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105276:	e9 6b ff ff ff       	jmp    801051e6 <sys_unlink+0x116>
    end_op();
8010527b:	e8 c0 d9 ff ff       	call   80102c40 <end_op>
    return -1;
80105280:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105285:	e9 5c ff ff ff       	jmp    801051e6 <sys_unlink+0x116>
      panic("isdirempty: readi");
8010528a:	83 ec 0c             	sub    $0xc,%esp
8010528d:	68 64 7b 10 80       	push   $0x80107b64
80105292:	e8 d9 b0 ff ff       	call   80100370 <panic>
    panic("unlink: writei");
80105297:	83 ec 0c             	sub    $0xc,%esp
8010529a:	68 76 7b 10 80       	push   $0x80107b76
8010529f:	e8 cc b0 ff ff       	call   80100370 <panic>
    panic("unlink: nlink < 1");
801052a4:	83 ec 0c             	sub    $0xc,%esp
801052a7:	68 52 7b 10 80       	push   $0x80107b52
801052ac:	e8 bf b0 ff ff       	call   80100370 <panic>
801052b1:	eb 0d                	jmp    801052c0 <sys_open>
801052b3:	90                   	nop
801052b4:	90                   	nop
801052b5:	90                   	nop
801052b6:	90                   	nop
801052b7:	90                   	nop
801052b8:	90                   	nop
801052b9:	90                   	nop
801052ba:	90                   	nop
801052bb:	90                   	nop
801052bc:	90                   	nop
801052bd:	90                   	nop
801052be:	90                   	nop
801052bf:	90                   	nop

801052c0 <sys_open>:

int
sys_open(void)
{
801052c0:	55                   	push   %ebp
801052c1:	89 e5                	mov    %esp,%ebp
801052c3:	57                   	push   %edi
801052c4:	56                   	push   %esi
801052c5:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801052c6:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
801052c9:	83 ec 24             	sub    $0x24,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801052cc:	50                   	push   %eax
801052cd:	6a 00                	push   $0x0
801052cf:	e8 ac f7 ff ff       	call   80104a80 <argstr>
801052d4:	83 c4 10             	add    $0x10,%esp
801052d7:	85 c0                	test   %eax,%eax
801052d9:	0f 88 9e 00 00 00    	js     8010537d <sys_open+0xbd>
801052df:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801052e2:	83 ec 08             	sub    $0x8,%esp
801052e5:	50                   	push   %eax
801052e6:	6a 01                	push   $0x1
801052e8:	e8 03 f7 ff ff       	call   801049f0 <argint>
801052ed:	83 c4 10             	add    $0x10,%esp
801052f0:	85 c0                	test   %eax,%eax
801052f2:	0f 88 85 00 00 00    	js     8010537d <sys_open+0xbd>
    return -1;

  begin_op();
801052f8:	e8 d3 d8 ff ff       	call   80102bd0 <begin_op>

  if(omode & O_CREATE){
801052fd:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105301:	0f 85 89 00 00 00    	jne    80105390 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105307:	83 ec 0c             	sub    $0xc,%esp
8010530a:	ff 75 e0             	pushl  -0x20(%ebp)
8010530d:	e8 6e cb ff ff       	call   80101e80 <namei>
80105312:	83 c4 10             	add    $0x10,%esp
80105315:	85 c0                	test   %eax,%eax
80105317:	89 c7                	mov    %eax,%edi
80105319:	0f 84 8e 00 00 00    	je     801053ad <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
8010531f:	83 ec 0c             	sub    $0xc,%esp
80105322:	50                   	push   %eax
80105323:	e8 28 c3 ff ff       	call   80101650 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105328:	83 c4 10             	add    $0x10,%esp
8010532b:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80105330:	0f 84 d2 00 00 00    	je     80105408 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105336:	e8 05 ba ff ff       	call   80100d40 <filealloc>
8010533b:	85 c0                	test   %eax,%eax
8010533d:	89 c6                	mov    %eax,%esi
8010533f:	74 2b                	je     8010536c <sys_open+0xac>
80105341:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80105348:	31 db                	xor    %ebx,%ebx
8010534a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(proc->ofile[fd] == 0){
80105350:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
80105354:	85 c0                	test   %eax,%eax
80105356:	74 68                	je     801053c0 <sys_open+0x100>
  for(fd = 0; fd < NOFILE; fd++){
80105358:	83 c3 01             	add    $0x1,%ebx
8010535b:	83 fb 10             	cmp    $0x10,%ebx
8010535e:	75 f0                	jne    80105350 <sys_open+0x90>
    if(f)
      fileclose(f);
80105360:	83 ec 0c             	sub    $0xc,%esp
80105363:	56                   	push   %esi
80105364:	e8 97 ba ff ff       	call   80100e00 <fileclose>
80105369:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
8010536c:	83 ec 0c             	sub    $0xc,%esp
8010536f:	57                   	push   %edi
80105370:	e8 4b c5 ff ff       	call   801018c0 <iunlockput>
    end_op();
80105375:	e8 c6 d8 ff ff       	call   80102c40 <end_op>
    return -1;
8010537a:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
8010537d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
80105380:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80105385:	89 d8                	mov    %ebx,%eax
80105387:	5b                   	pop    %ebx
80105388:	5e                   	pop    %esi
80105389:	5f                   	pop    %edi
8010538a:	5d                   	pop    %ebp
8010538b:	c3                   	ret    
8010538c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ip = create(path, T_FILE, 0, 0);
80105390:	83 ec 0c             	sub    $0xc,%esp
80105393:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105396:	31 c9                	xor    %ecx,%ecx
80105398:	6a 00                	push   $0x0
8010539a:	ba 02 00 00 00       	mov    $0x2,%edx
8010539f:	e8 ec f7 ff ff       	call   80104b90 <create>
    if(ip == 0){
801053a4:	83 c4 10             	add    $0x10,%esp
801053a7:	85 c0                	test   %eax,%eax
    ip = create(path, T_FILE, 0, 0);
801053a9:	89 c7                	mov    %eax,%edi
    if(ip == 0){
801053ab:	75 89                	jne    80105336 <sys_open+0x76>
      end_op();
801053ad:	e8 8e d8 ff ff       	call   80102c40 <end_op>
      return -1;
801053b2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801053b7:	eb 40                	jmp    801053f9 <sys_open+0x139>
801053b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  iunlock(ip);
801053c0:	83 ec 0c             	sub    $0xc,%esp
      proc->ofile[fd] = f;
801053c3:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
  iunlock(ip);
801053c7:	57                   	push   %edi
801053c8:	e8 63 c3 ff ff       	call   80101730 <iunlock>
  end_op();
801053cd:	e8 6e d8 ff ff       	call   80102c40 <end_op>
  f->type = FD_INODE;
801053d2:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  f->readable = !(omode & O_WRONLY);
801053d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801053db:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
801053de:	89 7e 10             	mov    %edi,0x10(%esi)
  f->off = 0;
801053e1:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  f->readable = !(omode & O_WRONLY);
801053e8:	89 c2                	mov    %eax,%edx
801053ea:	f7 d2                	not    %edx
801053ec:	88 56 08             	mov    %dl,0x8(%esi)
801053ef:	80 66 08 01          	andb   $0x1,0x8(%esi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801053f3:	a8 03                	test   $0x3,%al
801053f5:	0f 95 46 09          	setne  0x9(%esi)
}
801053f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053fc:	89 d8                	mov    %ebx,%eax
801053fe:	5b                   	pop    %ebx
801053ff:	5e                   	pop    %esi
80105400:	5f                   	pop    %edi
80105401:	5d                   	pop    %ebp
80105402:	c3                   	ret    
80105403:	90                   	nop
80105404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->type == T_DIR && omode != O_RDONLY){
80105408:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010540b:	85 d2                	test   %edx,%edx
8010540d:	0f 84 23 ff ff ff    	je     80105336 <sys_open+0x76>
80105413:	e9 54 ff ff ff       	jmp    8010536c <sys_open+0xac>
80105418:	90                   	nop
80105419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105420 <sys_mkdir>:

int
sys_mkdir(void)
{
80105420:	55                   	push   %ebp
80105421:	89 e5                	mov    %esp,%ebp
80105423:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105426:	e8 a5 d7 ff ff       	call   80102bd0 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010542b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010542e:	83 ec 08             	sub    $0x8,%esp
80105431:	50                   	push   %eax
80105432:	6a 00                	push   $0x0
80105434:	e8 47 f6 ff ff       	call   80104a80 <argstr>
80105439:	83 c4 10             	add    $0x10,%esp
8010543c:	85 c0                	test   %eax,%eax
8010543e:	78 30                	js     80105470 <sys_mkdir+0x50>
80105440:	83 ec 0c             	sub    $0xc,%esp
80105443:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105446:	31 c9                	xor    %ecx,%ecx
80105448:	6a 00                	push   $0x0
8010544a:	ba 01 00 00 00       	mov    $0x1,%edx
8010544f:	e8 3c f7 ff ff       	call   80104b90 <create>
80105454:	83 c4 10             	add    $0x10,%esp
80105457:	85 c0                	test   %eax,%eax
80105459:	74 15                	je     80105470 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010545b:	83 ec 0c             	sub    $0xc,%esp
8010545e:	50                   	push   %eax
8010545f:	e8 5c c4 ff ff       	call   801018c0 <iunlockput>
  end_op();
80105464:	e8 d7 d7 ff ff       	call   80102c40 <end_op>
  return 0;
80105469:	83 c4 10             	add    $0x10,%esp
8010546c:	31 c0                	xor    %eax,%eax
}
8010546e:	c9                   	leave  
8010546f:	c3                   	ret    
    end_op();
80105470:	e8 cb d7 ff ff       	call   80102c40 <end_op>
    return -1;
80105475:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010547a:	c9                   	leave  
8010547b:	c3                   	ret    
8010547c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105480 <sys_mknod>:

int
sys_mknod(void)
{
80105480:	55                   	push   %ebp
80105481:	89 e5                	mov    %esp,%ebp
80105483:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105486:	e8 45 d7 ff ff       	call   80102bd0 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010548b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010548e:	83 ec 08             	sub    $0x8,%esp
80105491:	50                   	push   %eax
80105492:	6a 00                	push   $0x0
80105494:	e8 e7 f5 ff ff       	call   80104a80 <argstr>
80105499:	83 c4 10             	add    $0x10,%esp
8010549c:	85 c0                	test   %eax,%eax
8010549e:	78 60                	js     80105500 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
801054a0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801054a3:	83 ec 08             	sub    $0x8,%esp
801054a6:	50                   	push   %eax
801054a7:	6a 01                	push   $0x1
801054a9:	e8 42 f5 ff ff       	call   801049f0 <argint>
  if((argstr(0, &path)) < 0 ||
801054ae:	83 c4 10             	add    $0x10,%esp
801054b1:	85 c0                	test   %eax,%eax
801054b3:	78 4b                	js     80105500 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
801054b5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801054b8:	83 ec 08             	sub    $0x8,%esp
801054bb:	50                   	push   %eax
801054bc:	6a 02                	push   $0x2
801054be:	e8 2d f5 ff ff       	call   801049f0 <argint>
     argint(1, &major) < 0 ||
801054c3:	83 c4 10             	add    $0x10,%esp
801054c6:	85 c0                	test   %eax,%eax
801054c8:	78 36                	js     80105500 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
801054ca:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
     argint(2, &minor) < 0 ||
801054ce:	83 ec 0c             	sub    $0xc,%esp
     (ip = create(path, T_DEV, major, minor)) == 0){
801054d1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
     argint(2, &minor) < 0 ||
801054d5:	ba 03 00 00 00       	mov    $0x3,%edx
801054da:	50                   	push   %eax
801054db:	8b 45 ec             	mov    -0x14(%ebp),%eax
801054de:	e8 ad f6 ff ff       	call   80104b90 <create>
801054e3:	83 c4 10             	add    $0x10,%esp
801054e6:	85 c0                	test   %eax,%eax
801054e8:	74 16                	je     80105500 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
801054ea:	83 ec 0c             	sub    $0xc,%esp
801054ed:	50                   	push   %eax
801054ee:	e8 cd c3 ff ff       	call   801018c0 <iunlockput>
  end_op();
801054f3:	e8 48 d7 ff ff       	call   80102c40 <end_op>
  return 0;
801054f8:	83 c4 10             	add    $0x10,%esp
801054fb:	31 c0                	xor    %eax,%eax
}
801054fd:	c9                   	leave  
801054fe:	c3                   	ret    
801054ff:	90                   	nop
    end_op();
80105500:	e8 3b d7 ff ff       	call   80102c40 <end_op>
    return -1;
80105505:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010550a:	c9                   	leave  
8010550b:	c3                   	ret    
8010550c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105510 <sys_chdir>:

int
sys_chdir(void)
{
80105510:	55                   	push   %ebp
80105511:	89 e5                	mov    %esp,%ebp
80105513:	53                   	push   %ebx
80105514:	83 ec 14             	sub    $0x14,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105517:	e8 b4 d6 ff ff       	call   80102bd0 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
8010551c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010551f:	83 ec 08             	sub    $0x8,%esp
80105522:	50                   	push   %eax
80105523:	6a 00                	push   $0x0
80105525:	e8 56 f5 ff ff       	call   80104a80 <argstr>
8010552a:	83 c4 10             	add    $0x10,%esp
8010552d:	85 c0                	test   %eax,%eax
8010552f:	78 7f                	js     801055b0 <sys_chdir+0xa0>
80105531:	83 ec 0c             	sub    $0xc,%esp
80105534:	ff 75 f4             	pushl  -0xc(%ebp)
80105537:	e8 44 c9 ff ff       	call   80101e80 <namei>
8010553c:	83 c4 10             	add    $0x10,%esp
8010553f:	85 c0                	test   %eax,%eax
80105541:	89 c3                	mov    %eax,%ebx
80105543:	74 6b                	je     801055b0 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
80105545:	83 ec 0c             	sub    $0xc,%esp
80105548:	50                   	push   %eax
80105549:	e8 02 c1 ff ff       	call   80101650 <ilock>
  if(ip->type != T_DIR){
8010554e:	83 c4 10             	add    $0x10,%esp
80105551:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105556:	75 38                	jne    80105590 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105558:	83 ec 0c             	sub    $0xc,%esp
8010555b:	53                   	push   %ebx
8010555c:	e8 cf c1 ff ff       	call   80101730 <iunlock>
  iput(proc->cwd);
80105561:	58                   	pop    %eax
80105562:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105568:	ff 70 68             	pushl  0x68(%eax)
8010556b:	e8 10 c2 ff ff       	call   80101780 <iput>
  end_op();
80105570:	e8 cb d6 ff ff       	call   80102c40 <end_op>
  proc->cwd = ip;
80105575:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return 0;
8010557b:	83 c4 10             	add    $0x10,%esp
  proc->cwd = ip;
8010557e:	89 58 68             	mov    %ebx,0x68(%eax)
  return 0;
80105581:	31 c0                	xor    %eax,%eax
}
80105583:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105586:	c9                   	leave  
80105587:	c3                   	ret    
80105588:	90                   	nop
80105589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    iunlockput(ip);
80105590:	83 ec 0c             	sub    $0xc,%esp
80105593:	53                   	push   %ebx
80105594:	e8 27 c3 ff ff       	call   801018c0 <iunlockput>
    end_op();
80105599:	e8 a2 d6 ff ff       	call   80102c40 <end_op>
    return -1;
8010559e:	83 c4 10             	add    $0x10,%esp
801055a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055a6:	eb db                	jmp    80105583 <sys_chdir+0x73>
801055a8:	90                   	nop
801055a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
801055b0:	e8 8b d6 ff ff       	call   80102c40 <end_op>
    return -1;
801055b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055ba:	eb c7                	jmp    80105583 <sys_chdir+0x73>
801055bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801055c0 <sys_exec>:

int
sys_exec(void)
{
801055c0:	55                   	push   %ebp
801055c1:	89 e5                	mov    %esp,%ebp
801055c3:	57                   	push   %edi
801055c4:	56                   	push   %esi
801055c5:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801055c6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
801055cc:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801055d2:	50                   	push   %eax
801055d3:	6a 00                	push   $0x0
801055d5:	e8 a6 f4 ff ff       	call   80104a80 <argstr>
801055da:	83 c4 10             	add    $0x10,%esp
801055dd:	85 c0                	test   %eax,%eax
801055df:	78 7f                	js     80105660 <sys_exec+0xa0>
801055e1:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801055e7:	83 ec 08             	sub    $0x8,%esp
801055ea:	50                   	push   %eax
801055eb:	6a 01                	push   $0x1
801055ed:	e8 fe f3 ff ff       	call   801049f0 <argint>
801055f2:	83 c4 10             	add    $0x10,%esp
801055f5:	85 c0                	test   %eax,%eax
801055f7:	78 67                	js     80105660 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
801055f9:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801055ff:	83 ec 04             	sub    $0x4,%esp
80105602:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105608:	68 80 00 00 00       	push   $0x80
8010560d:	6a 00                	push   $0x0
8010560f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105615:	50                   	push   %eax
80105616:	31 db                	xor    %ebx,%ebx
80105618:	e8 03 f1 ff ff       	call   80104720 <memset>
8010561d:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105620:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105626:	83 ec 08             	sub    $0x8,%esp
80105629:	57                   	push   %edi
8010562a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010562d:	50                   	push   %eax
8010562e:	e8 3d f3 ff ff       	call   80104970 <fetchint>
80105633:	83 c4 10             	add    $0x10,%esp
80105636:	85 c0                	test   %eax,%eax
80105638:	78 26                	js     80105660 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
8010563a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105640:	85 c0                	test   %eax,%eax
80105642:	74 2c                	je     80105670 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105644:	83 ec 08             	sub    $0x8,%esp
80105647:	56                   	push   %esi
80105648:	50                   	push   %eax
80105649:	e8 52 f3 ff ff       	call   801049a0 <fetchstr>
8010564e:	83 c4 10             	add    $0x10,%esp
80105651:	85 c0                	test   %eax,%eax
80105653:	78 0b                	js     80105660 <sys_exec+0xa0>
  for(i=0;; i++){
80105655:	83 c3 01             	add    $0x1,%ebx
80105658:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
8010565b:	83 fb 20             	cmp    $0x20,%ebx
8010565e:	75 c0                	jne    80105620 <sys_exec+0x60>
      return -1;
  }
  return exec(path, argv);
}
80105660:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
80105663:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105668:	5b                   	pop    %ebx
80105669:	5e                   	pop    %esi
8010566a:	5f                   	pop    %edi
8010566b:	5d                   	pop    %ebp
8010566c:	c3                   	ret    
8010566d:	8d 76 00             	lea    0x0(%esi),%esi
  return exec(path, argv);
80105670:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105676:	83 ec 08             	sub    $0x8,%esp
      argv[i] = 0;
80105679:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105680:	00 00 00 00 
  return exec(path, argv);
80105684:	50                   	push   %eax
80105685:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010568b:	e8 50 b3 ff ff       	call   801009e0 <exec>
80105690:	83 c4 10             	add    $0x10,%esp
}
80105693:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105696:	5b                   	pop    %ebx
80105697:	5e                   	pop    %esi
80105698:	5f                   	pop    %edi
80105699:	5d                   	pop    %ebp
8010569a:	c3                   	ret    
8010569b:	90                   	nop
8010569c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801056a0 <sys_pipe>:

int
sys_pipe(void)
{
801056a0:	55                   	push   %ebp
801056a1:	89 e5                	mov    %esp,%ebp
801056a3:	57                   	push   %edi
801056a4:	56                   	push   %esi
801056a5:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801056a6:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
801056a9:	83 ec 20             	sub    $0x20,%esp
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801056ac:	6a 08                	push   $0x8
801056ae:	50                   	push   %eax
801056af:	6a 00                	push   $0x0
801056b1:	e8 7a f3 ff ff       	call   80104a30 <argptr>
801056b6:	83 c4 10             	add    $0x10,%esp
801056b9:	85 c0                	test   %eax,%eax
801056bb:	78 48                	js     80105705 <sys_pipe+0x65>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
801056bd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801056c0:	83 ec 08             	sub    $0x8,%esp
801056c3:	50                   	push   %eax
801056c4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801056c7:	50                   	push   %eax
801056c8:	e8 93 dc ff ff       	call   80103360 <pipealloc>
801056cd:	83 c4 10             	add    $0x10,%esp
801056d0:	85 c0                	test   %eax,%eax
801056d2:	78 31                	js     80105705 <sys_pipe+0x65>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801056d4:	8b 5d e0             	mov    -0x20(%ebp),%ebx
801056d7:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
  for(fd = 0; fd < NOFILE; fd++){
801056de:	31 c0                	xor    %eax,%eax
    if(proc->ofile[fd] == 0){
801056e0:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
801056e4:	85 d2                	test   %edx,%edx
801056e6:	74 28                	je     80105710 <sys_pipe+0x70>
  for(fd = 0; fd < NOFILE; fd++){
801056e8:	83 c0 01             	add    $0x1,%eax
801056eb:	83 f8 10             	cmp    $0x10,%eax
801056ee:	75 f0                	jne    801056e0 <sys_pipe+0x40>
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
    fileclose(rf);
801056f0:	83 ec 0c             	sub    $0xc,%esp
801056f3:	53                   	push   %ebx
801056f4:	e8 07 b7 ff ff       	call   80100e00 <fileclose>
    fileclose(wf);
801056f9:	58                   	pop    %eax
801056fa:	ff 75 e4             	pushl  -0x1c(%ebp)
801056fd:	e8 fe b6 ff ff       	call   80100e00 <fileclose>
    return -1;
80105702:	83 c4 10             	add    $0x10,%esp
80105705:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010570a:	eb 45                	jmp    80105751 <sys_pipe+0xb1>
8010570c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105710:	8d 34 81             	lea    (%ecx,%eax,4),%esi
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105713:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  for(fd = 0; fd < NOFILE; fd++){
80105716:	31 d2                	xor    %edx,%edx
      proc->ofile[fd] = f;
80105718:	89 5e 28             	mov    %ebx,0x28(%esi)
8010571b:	90                   	nop
8010571c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->ofile[fd] == 0){
80105720:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
80105725:	74 19                	je     80105740 <sys_pipe+0xa0>
  for(fd = 0; fd < NOFILE; fd++){
80105727:	83 c2 01             	add    $0x1,%edx
8010572a:	83 fa 10             	cmp    $0x10,%edx
8010572d:	75 f1                	jne    80105720 <sys_pipe+0x80>
      proc->ofile[fd0] = 0;
8010572f:	c7 46 28 00 00 00 00 	movl   $0x0,0x28(%esi)
80105736:	eb b8                	jmp    801056f0 <sys_pipe+0x50>
80105738:	90                   	nop
80105739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      proc->ofile[fd] = f;
80105740:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
  }
  fd[0] = fd0;
80105744:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80105747:	89 01                	mov    %eax,(%ecx)
  fd[1] = fd1;
80105749:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010574c:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
8010574f:	31 c0                	xor    %eax,%eax
}
80105751:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105754:	5b                   	pop    %ebx
80105755:	5e                   	pop    %esi
80105756:	5f                   	pop    %edi
80105757:	5d                   	pop    %ebp
80105758:	c3                   	ret    
80105759:	66 90                	xchg   %ax,%ax
8010575b:	66 90                	xchg   %ax,%ax
8010575d:	66 90                	xchg   %ax,%ax
8010575f:	90                   	nop

80105760 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80105760:	55                   	push   %ebp
80105761:	89 e5                	mov    %esp,%ebp
80105763:	83 ec 20             	sub    $0x20,%esp
  int numtickets;
  if(argint(0, &numtickets) < 0)
80105766:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105769:	50                   	push   %eax
8010576a:	6a 00                	push   $0x0
8010576c:	e8 7f f2 ff ff       	call   801049f0 <argint>
80105771:	83 c4 10             	add    $0x10,%esp
80105774:	85 c0                	test   %eax,%eax
80105776:	78 18                	js     80105790 <sys_fork+0x30>
    return -1;
  else
    return fork(numtickets);
80105778:	83 ec 0c             	sub    $0xc,%esp
8010577b:	ff 75 f4             	pushl  -0xc(%ebp)
8010577e:	e8 7d e2 ff ff       	call   80103a00 <fork>
80105783:	83 c4 10             	add    $0x10,%esp
}
80105786:	c9                   	leave  
80105787:	c3                   	ret    
80105788:	90                   	nop
80105789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105790:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105795:	c9                   	leave  
80105796:	c3                   	ret    
80105797:	89 f6                	mov    %esi,%esi
80105799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057a0 <sys_exit>:

int
sys_exit(void)
{
801057a0:	55                   	push   %ebp
801057a1:	89 e5                	mov    %esp,%ebp
801057a3:	83 ec 08             	sub    $0x8,%esp
  exit();
801057a6:	e8 95 e5 ff ff       	call   80103d40 <exit>
  return 0;  // not reached
}
801057ab:	31 c0                	xor    %eax,%eax
801057ad:	c9                   	leave  
801057ae:	c3                   	ret    
801057af:	90                   	nop

801057b0 <sys_wait>:

int
sys_wait(void)
{
801057b0:	55                   	push   %ebp
801057b1:	89 e5                	mov    %esp,%ebp
  return wait();
}
801057b3:	5d                   	pop    %ebp
  return wait();
801057b4:	e9 d7 e7 ff ff       	jmp    80103f90 <wait>
801057b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801057c0 <sys_kill>:

int
sys_kill(void)
{
801057c0:	55                   	push   %ebp
801057c1:	89 e5                	mov    %esp,%ebp
801057c3:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
801057c6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057c9:	50                   	push   %eax
801057ca:	6a 00                	push   $0x0
801057cc:	e8 1f f2 ff ff       	call   801049f0 <argint>
801057d1:	83 c4 10             	add    $0x10,%esp
801057d4:	85 c0                	test   %eax,%eax
801057d6:	78 18                	js     801057f0 <sys_kill+0x30>
    return -1;
  return kill(pid);
801057d8:	83 ec 0c             	sub    $0xc,%esp
801057db:	ff 75 f4             	pushl  -0xc(%ebp)
801057de:	e8 0d e9 ff ff       	call   801040f0 <kill>
801057e3:	83 c4 10             	add    $0x10,%esp
}
801057e6:	c9                   	leave  
801057e7:	c3                   	ret    
801057e8:	90                   	nop
801057e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801057f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801057f5:	c9                   	leave  
801057f6:	c3                   	ret    
801057f7:	89 f6                	mov    %esi,%esi
801057f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105800 <sys_getpid>:

int
sys_getpid(void)
{
  return proc->pid;
80105800:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
{
80105806:	55                   	push   %ebp
80105807:	89 e5                	mov    %esp,%ebp
  return proc->pid;
80105809:	8b 40 10             	mov    0x10(%eax),%eax
}
8010580c:	5d                   	pop    %ebp
8010580d:	c3                   	ret    
8010580e:	66 90                	xchg   %ax,%ax

80105810 <sys_sbrk>:

int
sys_sbrk(void)
{
80105810:	55                   	push   %ebp
80105811:	89 e5                	mov    %esp,%ebp
80105813:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105814:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105817:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
8010581a:	50                   	push   %eax
8010581b:	6a 00                	push   $0x0
8010581d:	e8 ce f1 ff ff       	call   801049f0 <argint>
80105822:	83 c4 10             	add    $0x10,%esp
80105825:	85 c0                	test   %eax,%eax
80105827:	78 27                	js     80105850 <sys_sbrk+0x40>
    return -1;
  addr = proc->sz;
80105829:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(growproc(n) < 0)
8010582f:	83 ec 0c             	sub    $0xc,%esp
  addr = proc->sz;
80105832:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105834:	ff 75 f4             	pushl  -0xc(%ebp)
80105837:	e8 54 e1 ff ff       	call   80103990 <growproc>
8010583c:	83 c4 10             	add    $0x10,%esp
8010583f:	85 c0                	test   %eax,%eax
80105841:	78 0d                	js     80105850 <sys_sbrk+0x40>
    return -1;
  return addr;
}
80105843:	89 d8                	mov    %ebx,%eax
80105845:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105848:	c9                   	leave  
80105849:	c3                   	ret    
8010584a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80105850:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105855:	eb ec                	jmp    80105843 <sys_sbrk+0x33>
80105857:	89 f6                	mov    %esi,%esi
80105859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105860 <sys_sleep>:

int
sys_sleep(void)
{
80105860:	55                   	push   %ebp
80105861:	89 e5                	mov    %esp,%ebp
80105863:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105864:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105867:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
8010586a:	50                   	push   %eax
8010586b:	6a 00                	push   $0x0
8010586d:	e8 7e f1 ff ff       	call   801049f0 <argint>
80105872:	83 c4 10             	add    $0x10,%esp
80105875:	85 c0                	test   %eax,%eax
80105877:	0f 88 8a 00 00 00    	js     80105907 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
8010587d:	83 ec 0c             	sub    $0xc,%esp
80105880:	68 a0 4f 11 80       	push   $0x80114fa0
80105885:	e8 66 ec ff ff       	call   801044f0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010588a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010588d:	83 c4 10             	add    $0x10,%esp
  ticks0 = ticks;
80105890:	8b 1d e0 57 11 80    	mov    0x801157e0,%ebx
  while(ticks - ticks0 < n){
80105896:	85 d2                	test   %edx,%edx
80105898:	75 27                	jne    801058c1 <sys_sleep+0x61>
8010589a:	eb 54                	jmp    801058f0 <sys_sleep+0x90>
8010589c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
801058a0:	83 ec 08             	sub    $0x8,%esp
801058a3:	68 a0 4f 11 80       	push   $0x80114fa0
801058a8:	68 e0 57 11 80       	push   $0x801157e0
801058ad:	e8 1e e6 ff ff       	call   80103ed0 <sleep>
  while(ticks - ticks0 < n){
801058b2:	a1 e0 57 11 80       	mov    0x801157e0,%eax
801058b7:	83 c4 10             	add    $0x10,%esp
801058ba:	29 d8                	sub    %ebx,%eax
801058bc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801058bf:	73 2f                	jae    801058f0 <sys_sleep+0x90>
    if(proc->killed){
801058c1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801058c7:	8b 40 24             	mov    0x24(%eax),%eax
801058ca:	85 c0                	test   %eax,%eax
801058cc:	74 d2                	je     801058a0 <sys_sleep+0x40>
      release(&tickslock);
801058ce:	83 ec 0c             	sub    $0xc,%esp
801058d1:	68 a0 4f 11 80       	push   $0x80114fa0
801058d6:	e8 f5 ed ff ff       	call   801046d0 <release>
      return -1;
801058db:	83 c4 10             	add    $0x10,%esp
801058de:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
801058e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801058e6:	c9                   	leave  
801058e7:	c3                   	ret    
801058e8:	90                   	nop
801058e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&tickslock);
801058f0:	83 ec 0c             	sub    $0xc,%esp
801058f3:	68 a0 4f 11 80       	push   $0x80114fa0
801058f8:	e8 d3 ed ff ff       	call   801046d0 <release>
  return 0;
801058fd:	83 c4 10             	add    $0x10,%esp
80105900:	31 c0                	xor    %eax,%eax
}
80105902:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105905:	c9                   	leave  
80105906:	c3                   	ret    
    return -1;
80105907:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010590c:	eb d5                	jmp    801058e3 <sys_sleep+0x83>
8010590e:	66 90                	xchg   %ax,%ax

80105910 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105910:	55                   	push   %ebp
80105911:	89 e5                	mov    %esp,%ebp
80105913:	53                   	push   %ebx
80105914:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105917:	68 a0 4f 11 80       	push   $0x80114fa0
8010591c:	e8 cf eb ff ff       	call   801044f0 <acquire>
  xticks = ticks;
80105921:	8b 1d e0 57 11 80    	mov    0x801157e0,%ebx
  release(&tickslock);
80105927:	c7 04 24 a0 4f 11 80 	movl   $0x80114fa0,(%esp)
8010592e:	e8 9d ed ff ff       	call   801046d0 <release>
  return xticks;
}
80105933:	89 d8                	mov    %ebx,%eax
80105935:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105938:	c9                   	leave  
80105939:	c3                   	ret    
8010593a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105940 <sys_cps>:

int
sys_cps(void)
{
80105940:	55                   	push   %ebp
80105941:	89 e5                	mov    %esp,%ebp
	return cps();
}
80105943:	5d                   	pop    %ebp
	return cps();
80105944:	e9 e7 e8 ff ff       	jmp    80104230 <cps>
80105949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105950 <sys_csc>:

void
sys_csc(void)
{
80105950:	55                   	push   %ebp
80105951:	89 e5                	mov    %esp,%ebp
	return csc();
}
80105953:	5d                   	pop    %ebp
	return csc();
80105954:	e9 a7 e9 ff ff       	jmp    80104300 <csc>
80105959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105960 <sys_chpr>:

int
sys_chpr(void)
{
80105960:	55                   	push   %ebp
80105961:	89 e5                	mov    %esp,%ebp
80105963:	83 ec 20             	sub    $0x20,%esp
  int pid, pr;
  if(argint(0, &pid) < 0)
80105966:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105969:	50                   	push   %eax
8010596a:	6a 00                	push   $0x0
8010596c:	e8 7f f0 ff ff       	call   801049f0 <argint>
80105971:	83 c4 10             	add    $0x10,%esp
80105974:	85 c0                	test   %eax,%eax
80105976:	78 28                	js     801059a0 <sys_chpr+0x40>
    return -1;
  if(argint(1, &pr) < 0)
80105978:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010597b:	83 ec 08             	sub    $0x8,%esp
8010597e:	50                   	push   %eax
8010597f:	6a 01                	push   $0x1
80105981:	e8 6a f0 ff ff       	call   801049f0 <argint>
80105986:	83 c4 10             	add    $0x10,%esp
80105989:	85 c0                	test   %eax,%eax
8010598b:	78 13                	js     801059a0 <sys_chpr+0x40>
    return -1;

  return chpr ( pid, pr );
8010598d:	83 ec 08             	sub    $0x8,%esp
80105990:	ff 75 f4             	pushl  -0xc(%ebp)
80105993:	ff 75 f0             	pushl  -0x10(%ebp)
80105996:	e8 d5 e9 ff ff       	call   80104370 <chpr>
8010599b:	83 c4 10             	add    $0x10,%esp
}
8010599e:	c9                   	leave  
8010599f:	c3                   	ret    
    return -1;
801059a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801059a5:	c9                   	leave  
801059a6:	c3                   	ret    
801059a7:	66 90                	xchg   %ax,%ax
801059a9:	66 90                	xchg   %ax,%ax
801059ab:	66 90                	xchg   %ax,%ax
801059ad:	66 90                	xchg   %ax,%ax
801059af:	90                   	nop

801059b0 <timerinit>:
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first

void
timerinit(void)
{
801059b0:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801059b1:	ba 43 00 00 00       	mov    $0x43,%edx
801059b6:	b8 34 00 00 00       	mov    $0x34,%eax
801059bb:	89 e5                	mov    %esp,%ebp
801059bd:	83 ec 14             	sub    $0x14,%esp
801059c0:	ee                   	out    %al,(%dx)
801059c1:	ba 40 00 00 00       	mov    $0x40,%edx
801059c6:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
801059cb:	ee                   	out    %al,(%dx)
801059cc:	b8 2e 00 00 00       	mov    $0x2e,%eax
801059d1:	ee                   	out    %al,(%dx)
  // Interrupt 100 times/sec.
  outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  outb(IO_TIMER1, TIMER_DIV(100) % 256);
  outb(IO_TIMER1, TIMER_DIV(100) / 256);
  picenable(IRQ_TIMER);
801059d2:	6a 00                	push   $0x0
801059d4:	e8 b7 d8 ff ff       	call   80103290 <picenable>
}
801059d9:	83 c4 10             	add    $0x10,%esp
801059dc:	c9                   	leave  
801059dd:	c3                   	ret    

801059de <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
801059de:	1e                   	push   %ds
  pushl %es
801059df:	06                   	push   %es
  pushl %fs
801059e0:	0f a0                	push   %fs
  pushl %gs
801059e2:	0f a8                	push   %gs
  pushal
801059e4:	60                   	pusha  
  
  # Set up data and per-cpu segments.
  movw $(SEG_KDATA<<3), %ax
801059e5:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
801059e9:	8e d8                	mov    %eax,%ds
  movw %ax, %es
801059eb:	8e c0                	mov    %eax,%es
  movw $(SEG_KCPU<<3), %ax
801059ed:	66 b8 18 00          	mov    $0x18,%ax
  movw %ax, %fs
801059f1:	8e e0                	mov    %eax,%fs
  movw %ax, %gs
801059f3:	8e e8                	mov    %eax,%gs

  # Call trap(tf), where tf=%esp
  pushl %esp
801059f5:	54                   	push   %esp
  call trap
801059f6:	e8 e5 00 00 00       	call   80105ae0 <trap>
  addl $4, %esp
801059fb:	83 c4 04             	add    $0x4,%esp

801059fe <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
801059fe:	61                   	popa   
  popl %gs
801059ff:	0f a9                	pop    %gs
  popl %fs
80105a01:	0f a1                	pop    %fs
  popl %es
80105a03:	07                   	pop    %es
  popl %ds
80105a04:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80105a05:	83 c4 08             	add    $0x8,%esp
  iret
80105a08:	cf                   	iret   
80105a09:	66 90                	xchg   %ax,%ax
80105a0b:	66 90                	xchg   %ax,%ax
80105a0d:	66 90                	xchg   %ax,%ax
80105a0f:	90                   	nop

80105a10 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105a10:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
80105a11:	31 c0                	xor    %eax,%eax
{
80105a13:	89 e5                	mov    %esp,%ebp
80105a15:	83 ec 08             	sub    $0x8,%esp
80105a18:	90                   	nop
80105a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105a20:	8b 14 85 80 a0 10 80 	mov    -0x7fef5f80(,%eax,4),%edx
80105a27:	b9 08 00 00 00       	mov    $0x8,%ecx
80105a2c:	c6 04 c5 e4 4f 11 80 	movb   $0x0,-0x7feeb01c(,%eax,8)
80105a33:	00 
80105a34:	66 89 0c c5 e2 4f 11 	mov    %cx,-0x7feeb01e(,%eax,8)
80105a3b:	80 
80105a3c:	c6 04 c5 e5 4f 11 80 	movb   $0x8e,-0x7feeb01b(,%eax,8)
80105a43:	8e 
80105a44:	66 89 14 c5 e0 4f 11 	mov    %dx,-0x7feeb020(,%eax,8)
80105a4b:	80 
80105a4c:	c1 ea 10             	shr    $0x10,%edx
80105a4f:	66 89 14 c5 e6 4f 11 	mov    %dx,-0x7feeb01a(,%eax,8)
80105a56:	80 
  for(i = 0; i < 256; i++)
80105a57:	83 c0 01             	add    $0x1,%eax
80105a5a:	3d 00 01 00 00       	cmp    $0x100,%eax
80105a5f:	75 bf                	jne    80105a20 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a61:	a1 80 a1 10 80       	mov    0x8010a180,%eax

  initlock(&tickslock, "time");
80105a66:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a69:	ba 08 00 00 00       	mov    $0x8,%edx
  initlock(&tickslock, "time");
80105a6e:	68 83 7a 10 80       	push   $0x80107a83
80105a73:	68 a0 4f 11 80       	push   $0x80114fa0
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a78:	66 89 15 e2 51 11 80 	mov    %dx,0x801151e2
80105a7f:	c6 05 e4 51 11 80 00 	movb   $0x0,0x801151e4
80105a86:	66 a3 e0 51 11 80    	mov    %ax,0x801151e0
80105a8c:	c1 e8 10             	shr    $0x10,%eax
80105a8f:	c6 05 e5 51 11 80 ef 	movb   $0xef,0x801151e5
80105a96:	66 a3 e6 51 11 80    	mov    %ax,0x801151e6
  initlock(&tickslock, "time");
80105a9c:	e8 2f ea ff ff       	call   801044d0 <initlock>
}
80105aa1:	83 c4 10             	add    $0x10,%esp
80105aa4:	c9                   	leave  
80105aa5:	c3                   	ret    
80105aa6:	8d 76 00             	lea    0x0(%esi),%esi
80105aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105ab0 <idtinit>:

void
idtinit(void)
{
80105ab0:	55                   	push   %ebp
  pd[0] = size-1;
80105ab1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105ab6:	89 e5                	mov    %esp,%ebp
80105ab8:	83 ec 10             	sub    $0x10,%esp
80105abb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105abf:	b8 e0 4f 11 80       	mov    $0x80114fe0,%eax
80105ac4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105ac8:	c1 e8 10             	shr    $0x10,%eax
80105acb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80105acf:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105ad2:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105ad5:	c9                   	leave  
80105ad6:	c3                   	ret    
80105ad7:	89 f6                	mov    %esi,%esi
80105ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105ae0 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105ae0:	55                   	push   %ebp
80105ae1:	89 e5                	mov    %esp,%ebp
80105ae3:	57                   	push   %edi
80105ae4:	56                   	push   %esi
80105ae5:	53                   	push   %ebx
80105ae6:	83 ec 0c             	sub    $0xc,%esp
80105ae9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80105aec:	8b 43 30             	mov    0x30(%ebx),%eax
80105aef:	83 f8 40             	cmp    $0x40,%eax
80105af2:	0f 84 f8 00 00 00    	je     80105bf0 <trap+0x110>
    if(proc->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105af8:	83 e8 20             	sub    $0x20,%eax
80105afb:	83 f8 1f             	cmp    $0x1f,%eax
80105afe:	77 68                	ja     80105b68 <trap+0x88>
80105b00:	ff 24 85 28 7c 10 80 	jmp    *-0x7fef83d8(,%eax,4)
80105b07:	89 f6                	mov    %esi,%esi
80105b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
80105b10:	e8 cb cb ff ff       	call   801026e0 <cpunum>
80105b15:	85 c0                	test   %eax,%eax
80105b17:	0f 84 b3 01 00 00    	je     80105cd0 <trap+0x1f0>
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
80105b1d:	e8 5e cc ff ff       	call   80102780 <lapiceoi>
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105b22:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105b28:	85 c0                	test   %eax,%eax
80105b2a:	74 2d                	je     80105b59 <trap+0x79>
80105b2c:	8b 50 24             	mov    0x24(%eax),%edx
80105b2f:	85 d2                	test   %edx,%edx
80105b31:	0f 85 86 00 00 00    	jne    80105bbd <trap+0xdd>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105b37:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105b3b:	0f 84 ef 00 00 00    	je     80105c30 <trap+0x150>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105b41:	8b 40 24             	mov    0x24(%eax),%eax
80105b44:	85 c0                	test   %eax,%eax
80105b46:	74 11                	je     80105b59 <trap+0x79>
80105b48:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105b4c:	83 e0 03             	and    $0x3,%eax
80105b4f:	66 83 f8 03          	cmp    $0x3,%ax
80105b53:	0f 84 c1 00 00 00    	je     80105c1a <trap+0x13a>
    exit();
}
80105b59:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b5c:	5b                   	pop    %ebx
80105b5d:	5e                   	pop    %esi
80105b5e:	5f                   	pop    %edi
80105b5f:	5d                   	pop    %ebp
80105b60:	c3                   	ret    
80105b61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(proc == 0 || (tf->cs&3) == 0){
80105b68:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80105b6f:	85 c9                	test   %ecx,%ecx
80105b71:	0f 84 8d 01 00 00    	je     80105d04 <trap+0x224>
80105b77:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105b7b:	0f 84 83 01 00 00    	je     80105d04 <trap+0x224>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105b81:	0f 20 d7             	mov    %cr2,%edi
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105b84:	8b 73 38             	mov    0x38(%ebx),%esi
80105b87:	e8 54 cb ff ff       	call   801026e0 <cpunum>
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105b8c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105b93:	57                   	push   %edi
80105b94:	56                   	push   %esi
80105b95:	50                   	push   %eax
80105b96:	ff 73 34             	pushl  0x34(%ebx)
80105b99:	ff 73 30             	pushl  0x30(%ebx)
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105b9c:	8d 42 6c             	lea    0x6c(%edx),%eax
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105b9f:	50                   	push   %eax
80105ba0:	ff 72 10             	pushl  0x10(%edx)
80105ba3:	68 e4 7b 10 80       	push   $0x80107be4
80105ba8:	e8 b3 aa ff ff       	call   80100660 <cprintf>
    proc->killed = 1;
80105bad:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105bb3:	83 c4 20             	add    $0x20,%esp
80105bb6:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105bbd:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
80105bc1:	83 e2 03             	and    $0x3,%edx
80105bc4:	66 83 fa 03          	cmp    $0x3,%dx
80105bc8:	0f 85 69 ff ff ff    	jne    80105b37 <trap+0x57>
    exit();
80105bce:	e8 6d e1 ff ff       	call   80103d40 <exit>
80105bd3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105bd9:	85 c0                	test   %eax,%eax
80105bdb:	0f 85 56 ff ff ff    	jne    80105b37 <trap+0x57>
80105be1:	e9 73 ff ff ff       	jmp    80105b59 <trap+0x79>
80105be6:	8d 76 00             	lea    0x0(%esi),%esi
80105be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(proc->killed)
80105bf0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105bf6:	8b 70 24             	mov    0x24(%eax),%esi
80105bf9:	85 f6                	test   %esi,%esi
80105bfb:	0f 85 bf 00 00 00    	jne    80105cc0 <trap+0x1e0>
    proc->tf = tf;
80105c01:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80105c04:	e8 e7 ee ff ff       	call   80104af0 <syscall>
    if(proc->killed)
80105c09:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105c0f:	8b 58 24             	mov    0x24(%eax),%ebx
80105c12:	85 db                	test   %ebx,%ebx
80105c14:	0f 84 3f ff ff ff    	je     80105b59 <trap+0x79>
}
80105c1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c1d:	5b                   	pop    %ebx
80105c1e:	5e                   	pop    %esi
80105c1f:	5f                   	pop    %edi
80105c20:	5d                   	pop    %ebp
      exit();
80105c21:	e9 1a e1 ff ff       	jmp    80103d40 <exit>
80105c26:	8d 76 00             	lea    0x0(%esi),%esi
80105c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105c30:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105c34:	0f 85 07 ff ff ff    	jne    80105b41 <trap+0x61>
    yield();
80105c3a:	e8 51 e2 ff ff       	call   80103e90 <yield>
80105c3f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105c45:	85 c0                	test   %eax,%eax
80105c47:	0f 85 f4 fe ff ff    	jne    80105b41 <trap+0x61>
80105c4d:	e9 07 ff ff ff       	jmp    80105b59 <trap+0x79>
80105c52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    kbdintr();
80105c58:	e8 63 c9 ff ff       	call   801025c0 <kbdintr>
    lapiceoi();
80105c5d:	e8 1e cb ff ff       	call   80102780 <lapiceoi>
    break;
80105c62:	e9 bb fe ff ff       	jmp    80105b22 <trap+0x42>
80105c67:	89 f6                	mov    %esi,%esi
80105c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    uartintr();
80105c70:	e8 2b 02 00 00       	call   80105ea0 <uartintr>
80105c75:	e9 a3 fe ff ff       	jmp    80105b1d <trap+0x3d>
80105c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105c80:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105c84:	8b 7b 38             	mov    0x38(%ebx),%edi
80105c87:	e8 54 ca ff ff       	call   801026e0 <cpunum>
80105c8c:	57                   	push   %edi
80105c8d:	56                   	push   %esi
80105c8e:	50                   	push   %eax
80105c8f:	68 8c 7b 10 80       	push   $0x80107b8c
80105c94:	e8 c7 a9 ff ff       	call   80100660 <cprintf>
    lapiceoi();
80105c99:	e8 e2 ca ff ff       	call   80102780 <lapiceoi>
    break;
80105c9e:	83 c4 10             	add    $0x10,%esp
80105ca1:	e9 7c fe ff ff       	jmp    80105b22 <trap+0x42>
80105ca6:	8d 76 00             	lea    0x0(%esi),%esi
80105ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    ideintr();
80105cb0:	e8 6b c3 ff ff       	call   80102020 <ideintr>
    lapiceoi();
80105cb5:	e8 c6 ca ff ff       	call   80102780 <lapiceoi>
    break;
80105cba:	e9 63 fe ff ff       	jmp    80105b22 <trap+0x42>
80105cbf:	90                   	nop
      exit();
80105cc0:	e8 7b e0 ff ff       	call   80103d40 <exit>
80105cc5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105ccb:	e9 31 ff ff ff       	jmp    80105c01 <trap+0x121>
      acquire(&tickslock);
80105cd0:	83 ec 0c             	sub    $0xc,%esp
80105cd3:	68 a0 4f 11 80       	push   $0x80114fa0
80105cd8:	e8 13 e8 ff ff       	call   801044f0 <acquire>
      wakeup(&ticks);
80105cdd:	c7 04 24 e0 57 11 80 	movl   $0x801157e0,(%esp)
      ticks++;
80105ce4:	83 05 e0 57 11 80 01 	addl   $0x1,0x801157e0
      wakeup(&ticks);
80105ceb:	e8 a0 e3 ff ff       	call   80104090 <wakeup>
      release(&tickslock);
80105cf0:	c7 04 24 a0 4f 11 80 	movl   $0x80114fa0,(%esp)
80105cf7:	e8 d4 e9 ff ff       	call   801046d0 <release>
80105cfc:	83 c4 10             	add    $0x10,%esp
80105cff:	e9 19 fe ff ff       	jmp    80105b1d <trap+0x3d>
80105d04:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105d07:	8b 73 38             	mov    0x38(%ebx),%esi
80105d0a:	e8 d1 c9 ff ff       	call   801026e0 <cpunum>
80105d0f:	83 ec 0c             	sub    $0xc,%esp
80105d12:	57                   	push   %edi
80105d13:	56                   	push   %esi
80105d14:	50                   	push   %eax
80105d15:	ff 73 30             	pushl  0x30(%ebx)
80105d18:	68 b0 7b 10 80       	push   $0x80107bb0
80105d1d:	e8 3e a9 ff ff       	call   80100660 <cprintf>
      panic("trap");
80105d22:	83 c4 14             	add    $0x14,%esp
80105d25:	68 85 7b 10 80       	push   $0x80107b85
80105d2a:	e8 41 a6 ff ff       	call   80100370 <panic>
80105d2f:	90                   	nop

80105d30 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105d30:	a1 24 a6 10 80       	mov    0x8010a624,%eax
{
80105d35:	55                   	push   %ebp
80105d36:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105d38:	85 c0                	test   %eax,%eax
80105d3a:	74 1c                	je     80105d58 <uartgetc+0x28>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105d3c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105d41:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105d42:	a8 01                	test   $0x1,%al
80105d44:	74 12                	je     80105d58 <uartgetc+0x28>
80105d46:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d4b:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105d4c:	0f b6 c0             	movzbl %al,%eax
}
80105d4f:	5d                   	pop    %ebp
80105d50:	c3                   	ret    
80105d51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105d58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105d5d:	5d                   	pop    %ebp
80105d5e:	c3                   	ret    
80105d5f:	90                   	nop

80105d60 <uartputc.part.0>:
uartputc(int c)
80105d60:	55                   	push   %ebp
80105d61:	89 e5                	mov    %esp,%ebp
80105d63:	57                   	push   %edi
80105d64:	56                   	push   %esi
80105d65:	53                   	push   %ebx
80105d66:	89 c7                	mov    %eax,%edi
80105d68:	bb 80 00 00 00       	mov    $0x80,%ebx
80105d6d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105d72:	83 ec 0c             	sub    $0xc,%esp
80105d75:	eb 1b                	jmp    80105d92 <uartputc.part.0+0x32>
80105d77:	89 f6                	mov    %esi,%esi
80105d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    microdelay(10);
80105d80:	83 ec 0c             	sub    $0xc,%esp
80105d83:	6a 0a                	push   $0xa
80105d85:	e8 16 ca ff ff       	call   801027a0 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105d8a:	83 c4 10             	add    $0x10,%esp
80105d8d:	83 eb 01             	sub    $0x1,%ebx
80105d90:	74 07                	je     80105d99 <uartputc.part.0+0x39>
80105d92:	89 f2                	mov    %esi,%edx
80105d94:	ec                   	in     (%dx),%al
80105d95:	a8 20                	test   $0x20,%al
80105d97:	74 e7                	je     80105d80 <uartputc.part.0+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105d99:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d9e:	89 f8                	mov    %edi,%eax
80105da0:	ee                   	out    %al,(%dx)
}
80105da1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105da4:	5b                   	pop    %ebx
80105da5:	5e                   	pop    %esi
80105da6:	5f                   	pop    %edi
80105da7:	5d                   	pop    %ebp
80105da8:	c3                   	ret    
80105da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105db0 <uartinit>:
{
80105db0:	55                   	push   %ebp
80105db1:	31 c9                	xor    %ecx,%ecx
80105db3:	89 c8                	mov    %ecx,%eax
80105db5:	89 e5                	mov    %esp,%ebp
80105db7:	57                   	push   %edi
80105db8:	56                   	push   %esi
80105db9:	53                   	push   %ebx
80105dba:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105dbf:	89 da                	mov    %ebx,%edx
80105dc1:	83 ec 0c             	sub    $0xc,%esp
80105dc4:	ee                   	out    %al,(%dx)
80105dc5:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105dca:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105dcf:	89 fa                	mov    %edi,%edx
80105dd1:	ee                   	out    %al,(%dx)
80105dd2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105dd7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105ddc:	ee                   	out    %al,(%dx)
80105ddd:	be f9 03 00 00       	mov    $0x3f9,%esi
80105de2:	89 c8                	mov    %ecx,%eax
80105de4:	89 f2                	mov    %esi,%edx
80105de6:	ee                   	out    %al,(%dx)
80105de7:	b8 03 00 00 00       	mov    $0x3,%eax
80105dec:	89 fa                	mov    %edi,%edx
80105dee:	ee                   	out    %al,(%dx)
80105def:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105df4:	89 c8                	mov    %ecx,%eax
80105df6:	ee                   	out    %al,(%dx)
80105df7:	b8 01 00 00 00       	mov    $0x1,%eax
80105dfc:	89 f2                	mov    %esi,%edx
80105dfe:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105dff:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105e04:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105e05:	3c ff                	cmp    $0xff,%al
80105e07:	74 5a                	je     80105e63 <uartinit+0xb3>
  uart = 1;
80105e09:	c7 05 24 a6 10 80 01 	movl   $0x1,0x8010a624
80105e10:	00 00 00 
80105e13:	89 da                	mov    %ebx,%edx
80105e15:	ec                   	in     (%dx),%al
80105e16:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105e1b:	ec                   	in     (%dx),%al
  picenable(IRQ_COM1);
80105e1c:	83 ec 0c             	sub    $0xc,%esp
80105e1f:	6a 04                	push   $0x4
80105e21:	e8 6a d4 ff ff       	call   80103290 <picenable>
  ioapicenable(IRQ_COM1, 0);
80105e26:	59                   	pop    %ecx
80105e27:	5b                   	pop    %ebx
80105e28:	6a 00                	push   $0x0
80105e2a:	6a 04                	push   $0x4
80105e2c:	bb a8 7c 10 80       	mov    $0x80107ca8,%ebx
80105e31:	e8 4a c4 ff ff       	call   80102280 <ioapicenable>
80105e36:	83 c4 10             	add    $0x10,%esp
80105e39:	b8 78 00 00 00       	mov    $0x78,%eax
80105e3e:	eb 0a                	jmp    80105e4a <uartinit+0x9a>
  for(p="xv6...\n"; *p; p++)
80105e40:	83 c3 01             	add    $0x1,%ebx
80105e43:	0f be 03             	movsbl (%ebx),%eax
80105e46:	84 c0                	test   %al,%al
80105e48:	74 19                	je     80105e63 <uartinit+0xb3>
  if(!uart)
80105e4a:	8b 15 24 a6 10 80    	mov    0x8010a624,%edx
80105e50:	85 d2                	test   %edx,%edx
80105e52:	74 ec                	je     80105e40 <uartinit+0x90>
  for(p="xv6...\n"; *p; p++)
80105e54:	83 c3 01             	add    $0x1,%ebx
80105e57:	e8 04 ff ff ff       	call   80105d60 <uartputc.part.0>
80105e5c:	0f be 03             	movsbl (%ebx),%eax
80105e5f:	84 c0                	test   %al,%al
80105e61:	75 e7                	jne    80105e4a <uartinit+0x9a>
}
80105e63:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105e66:	5b                   	pop    %ebx
80105e67:	5e                   	pop    %esi
80105e68:	5f                   	pop    %edi
80105e69:	5d                   	pop    %ebp
80105e6a:	c3                   	ret    
80105e6b:	90                   	nop
80105e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105e70 <uartputc>:
  if(!uart)
80105e70:	8b 15 24 a6 10 80    	mov    0x8010a624,%edx
{
80105e76:	55                   	push   %ebp
80105e77:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105e79:	85 d2                	test   %edx,%edx
{
80105e7b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!uart)
80105e7e:	74 10                	je     80105e90 <uartputc+0x20>
}
80105e80:	5d                   	pop    %ebp
80105e81:	e9 da fe ff ff       	jmp    80105d60 <uartputc.part.0>
80105e86:	8d 76 00             	lea    0x0(%esi),%esi
80105e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105e90:	5d                   	pop    %ebp
80105e91:	c3                   	ret    
80105e92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105ea0 <uartintr>:

void
uartintr(void)
{
80105ea0:	55                   	push   %ebp
80105ea1:	89 e5                	mov    %esp,%ebp
80105ea3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105ea6:	68 30 5d 10 80       	push   $0x80105d30
80105eab:	e8 30 a9 ff ff       	call   801007e0 <consoleintr>
}
80105eb0:	83 c4 10             	add    $0x10,%esp
80105eb3:	c9                   	leave  
80105eb4:	c3                   	ret    

80105eb5 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80105eb5:	6a 00                	push   $0x0
  pushl $0
80105eb7:	6a 00                	push   $0x0
  jmp alltraps
80105eb9:	e9 20 fb ff ff       	jmp    801059de <alltraps>

80105ebe <vector1>:
.globl vector1
vector1:
  pushl $0
80105ebe:	6a 00                	push   $0x0
  pushl $1
80105ec0:	6a 01                	push   $0x1
  jmp alltraps
80105ec2:	e9 17 fb ff ff       	jmp    801059de <alltraps>

80105ec7 <vector2>:
.globl vector2
vector2:
  pushl $0
80105ec7:	6a 00                	push   $0x0
  pushl $2
80105ec9:	6a 02                	push   $0x2
  jmp alltraps
80105ecb:	e9 0e fb ff ff       	jmp    801059de <alltraps>

80105ed0 <vector3>:
.globl vector3
vector3:
  pushl $0
80105ed0:	6a 00                	push   $0x0
  pushl $3
80105ed2:	6a 03                	push   $0x3
  jmp alltraps
80105ed4:	e9 05 fb ff ff       	jmp    801059de <alltraps>

80105ed9 <vector4>:
.globl vector4
vector4:
  pushl $0
80105ed9:	6a 00                	push   $0x0
  pushl $4
80105edb:	6a 04                	push   $0x4
  jmp alltraps
80105edd:	e9 fc fa ff ff       	jmp    801059de <alltraps>

80105ee2 <vector5>:
.globl vector5
vector5:
  pushl $0
80105ee2:	6a 00                	push   $0x0
  pushl $5
80105ee4:	6a 05                	push   $0x5
  jmp alltraps
80105ee6:	e9 f3 fa ff ff       	jmp    801059de <alltraps>

80105eeb <vector6>:
.globl vector6
vector6:
  pushl $0
80105eeb:	6a 00                	push   $0x0
  pushl $6
80105eed:	6a 06                	push   $0x6
  jmp alltraps
80105eef:	e9 ea fa ff ff       	jmp    801059de <alltraps>

80105ef4 <vector7>:
.globl vector7
vector7:
  pushl $0
80105ef4:	6a 00                	push   $0x0
  pushl $7
80105ef6:	6a 07                	push   $0x7
  jmp alltraps
80105ef8:	e9 e1 fa ff ff       	jmp    801059de <alltraps>

80105efd <vector8>:
.globl vector8
vector8:
  pushl $8
80105efd:	6a 08                	push   $0x8
  jmp alltraps
80105eff:	e9 da fa ff ff       	jmp    801059de <alltraps>

80105f04 <vector9>:
.globl vector9
vector9:
  pushl $0
80105f04:	6a 00                	push   $0x0
  pushl $9
80105f06:	6a 09                	push   $0x9
  jmp alltraps
80105f08:	e9 d1 fa ff ff       	jmp    801059de <alltraps>

80105f0d <vector10>:
.globl vector10
vector10:
  pushl $10
80105f0d:	6a 0a                	push   $0xa
  jmp alltraps
80105f0f:	e9 ca fa ff ff       	jmp    801059de <alltraps>

80105f14 <vector11>:
.globl vector11
vector11:
  pushl $11
80105f14:	6a 0b                	push   $0xb
  jmp alltraps
80105f16:	e9 c3 fa ff ff       	jmp    801059de <alltraps>

80105f1b <vector12>:
.globl vector12
vector12:
  pushl $12
80105f1b:	6a 0c                	push   $0xc
  jmp alltraps
80105f1d:	e9 bc fa ff ff       	jmp    801059de <alltraps>

80105f22 <vector13>:
.globl vector13
vector13:
  pushl $13
80105f22:	6a 0d                	push   $0xd
  jmp alltraps
80105f24:	e9 b5 fa ff ff       	jmp    801059de <alltraps>

80105f29 <vector14>:
.globl vector14
vector14:
  pushl $14
80105f29:	6a 0e                	push   $0xe
  jmp alltraps
80105f2b:	e9 ae fa ff ff       	jmp    801059de <alltraps>

80105f30 <vector15>:
.globl vector15
vector15:
  pushl $0
80105f30:	6a 00                	push   $0x0
  pushl $15
80105f32:	6a 0f                	push   $0xf
  jmp alltraps
80105f34:	e9 a5 fa ff ff       	jmp    801059de <alltraps>

80105f39 <vector16>:
.globl vector16
vector16:
  pushl $0
80105f39:	6a 00                	push   $0x0
  pushl $16
80105f3b:	6a 10                	push   $0x10
  jmp alltraps
80105f3d:	e9 9c fa ff ff       	jmp    801059de <alltraps>

80105f42 <vector17>:
.globl vector17
vector17:
  pushl $17
80105f42:	6a 11                	push   $0x11
  jmp alltraps
80105f44:	e9 95 fa ff ff       	jmp    801059de <alltraps>

80105f49 <vector18>:
.globl vector18
vector18:
  pushl $0
80105f49:	6a 00                	push   $0x0
  pushl $18
80105f4b:	6a 12                	push   $0x12
  jmp alltraps
80105f4d:	e9 8c fa ff ff       	jmp    801059de <alltraps>

80105f52 <vector19>:
.globl vector19
vector19:
  pushl $0
80105f52:	6a 00                	push   $0x0
  pushl $19
80105f54:	6a 13                	push   $0x13
  jmp alltraps
80105f56:	e9 83 fa ff ff       	jmp    801059de <alltraps>

80105f5b <vector20>:
.globl vector20
vector20:
  pushl $0
80105f5b:	6a 00                	push   $0x0
  pushl $20
80105f5d:	6a 14                	push   $0x14
  jmp alltraps
80105f5f:	e9 7a fa ff ff       	jmp    801059de <alltraps>

80105f64 <vector21>:
.globl vector21
vector21:
  pushl $0
80105f64:	6a 00                	push   $0x0
  pushl $21
80105f66:	6a 15                	push   $0x15
  jmp alltraps
80105f68:	e9 71 fa ff ff       	jmp    801059de <alltraps>

80105f6d <vector22>:
.globl vector22
vector22:
  pushl $0
80105f6d:	6a 00                	push   $0x0
  pushl $22
80105f6f:	6a 16                	push   $0x16
  jmp alltraps
80105f71:	e9 68 fa ff ff       	jmp    801059de <alltraps>

80105f76 <vector23>:
.globl vector23
vector23:
  pushl $0
80105f76:	6a 00                	push   $0x0
  pushl $23
80105f78:	6a 17                	push   $0x17
  jmp alltraps
80105f7a:	e9 5f fa ff ff       	jmp    801059de <alltraps>

80105f7f <vector24>:
.globl vector24
vector24:
  pushl $0
80105f7f:	6a 00                	push   $0x0
  pushl $24
80105f81:	6a 18                	push   $0x18
  jmp alltraps
80105f83:	e9 56 fa ff ff       	jmp    801059de <alltraps>

80105f88 <vector25>:
.globl vector25
vector25:
  pushl $0
80105f88:	6a 00                	push   $0x0
  pushl $25
80105f8a:	6a 19                	push   $0x19
  jmp alltraps
80105f8c:	e9 4d fa ff ff       	jmp    801059de <alltraps>

80105f91 <vector26>:
.globl vector26
vector26:
  pushl $0
80105f91:	6a 00                	push   $0x0
  pushl $26
80105f93:	6a 1a                	push   $0x1a
  jmp alltraps
80105f95:	e9 44 fa ff ff       	jmp    801059de <alltraps>

80105f9a <vector27>:
.globl vector27
vector27:
  pushl $0
80105f9a:	6a 00                	push   $0x0
  pushl $27
80105f9c:	6a 1b                	push   $0x1b
  jmp alltraps
80105f9e:	e9 3b fa ff ff       	jmp    801059de <alltraps>

80105fa3 <vector28>:
.globl vector28
vector28:
  pushl $0
80105fa3:	6a 00                	push   $0x0
  pushl $28
80105fa5:	6a 1c                	push   $0x1c
  jmp alltraps
80105fa7:	e9 32 fa ff ff       	jmp    801059de <alltraps>

80105fac <vector29>:
.globl vector29
vector29:
  pushl $0
80105fac:	6a 00                	push   $0x0
  pushl $29
80105fae:	6a 1d                	push   $0x1d
  jmp alltraps
80105fb0:	e9 29 fa ff ff       	jmp    801059de <alltraps>

80105fb5 <vector30>:
.globl vector30
vector30:
  pushl $0
80105fb5:	6a 00                	push   $0x0
  pushl $30
80105fb7:	6a 1e                	push   $0x1e
  jmp alltraps
80105fb9:	e9 20 fa ff ff       	jmp    801059de <alltraps>

80105fbe <vector31>:
.globl vector31
vector31:
  pushl $0
80105fbe:	6a 00                	push   $0x0
  pushl $31
80105fc0:	6a 1f                	push   $0x1f
  jmp alltraps
80105fc2:	e9 17 fa ff ff       	jmp    801059de <alltraps>

80105fc7 <vector32>:
.globl vector32
vector32:
  pushl $0
80105fc7:	6a 00                	push   $0x0
  pushl $32
80105fc9:	6a 20                	push   $0x20
  jmp alltraps
80105fcb:	e9 0e fa ff ff       	jmp    801059de <alltraps>

80105fd0 <vector33>:
.globl vector33
vector33:
  pushl $0
80105fd0:	6a 00                	push   $0x0
  pushl $33
80105fd2:	6a 21                	push   $0x21
  jmp alltraps
80105fd4:	e9 05 fa ff ff       	jmp    801059de <alltraps>

80105fd9 <vector34>:
.globl vector34
vector34:
  pushl $0
80105fd9:	6a 00                	push   $0x0
  pushl $34
80105fdb:	6a 22                	push   $0x22
  jmp alltraps
80105fdd:	e9 fc f9 ff ff       	jmp    801059de <alltraps>

80105fe2 <vector35>:
.globl vector35
vector35:
  pushl $0
80105fe2:	6a 00                	push   $0x0
  pushl $35
80105fe4:	6a 23                	push   $0x23
  jmp alltraps
80105fe6:	e9 f3 f9 ff ff       	jmp    801059de <alltraps>

80105feb <vector36>:
.globl vector36
vector36:
  pushl $0
80105feb:	6a 00                	push   $0x0
  pushl $36
80105fed:	6a 24                	push   $0x24
  jmp alltraps
80105fef:	e9 ea f9 ff ff       	jmp    801059de <alltraps>

80105ff4 <vector37>:
.globl vector37
vector37:
  pushl $0
80105ff4:	6a 00                	push   $0x0
  pushl $37
80105ff6:	6a 25                	push   $0x25
  jmp alltraps
80105ff8:	e9 e1 f9 ff ff       	jmp    801059de <alltraps>

80105ffd <vector38>:
.globl vector38
vector38:
  pushl $0
80105ffd:	6a 00                	push   $0x0
  pushl $38
80105fff:	6a 26                	push   $0x26
  jmp alltraps
80106001:	e9 d8 f9 ff ff       	jmp    801059de <alltraps>

80106006 <vector39>:
.globl vector39
vector39:
  pushl $0
80106006:	6a 00                	push   $0x0
  pushl $39
80106008:	6a 27                	push   $0x27
  jmp alltraps
8010600a:	e9 cf f9 ff ff       	jmp    801059de <alltraps>

8010600f <vector40>:
.globl vector40
vector40:
  pushl $0
8010600f:	6a 00                	push   $0x0
  pushl $40
80106011:	6a 28                	push   $0x28
  jmp alltraps
80106013:	e9 c6 f9 ff ff       	jmp    801059de <alltraps>

80106018 <vector41>:
.globl vector41
vector41:
  pushl $0
80106018:	6a 00                	push   $0x0
  pushl $41
8010601a:	6a 29                	push   $0x29
  jmp alltraps
8010601c:	e9 bd f9 ff ff       	jmp    801059de <alltraps>

80106021 <vector42>:
.globl vector42
vector42:
  pushl $0
80106021:	6a 00                	push   $0x0
  pushl $42
80106023:	6a 2a                	push   $0x2a
  jmp alltraps
80106025:	e9 b4 f9 ff ff       	jmp    801059de <alltraps>

8010602a <vector43>:
.globl vector43
vector43:
  pushl $0
8010602a:	6a 00                	push   $0x0
  pushl $43
8010602c:	6a 2b                	push   $0x2b
  jmp alltraps
8010602e:	e9 ab f9 ff ff       	jmp    801059de <alltraps>

80106033 <vector44>:
.globl vector44
vector44:
  pushl $0
80106033:	6a 00                	push   $0x0
  pushl $44
80106035:	6a 2c                	push   $0x2c
  jmp alltraps
80106037:	e9 a2 f9 ff ff       	jmp    801059de <alltraps>

8010603c <vector45>:
.globl vector45
vector45:
  pushl $0
8010603c:	6a 00                	push   $0x0
  pushl $45
8010603e:	6a 2d                	push   $0x2d
  jmp alltraps
80106040:	e9 99 f9 ff ff       	jmp    801059de <alltraps>

80106045 <vector46>:
.globl vector46
vector46:
  pushl $0
80106045:	6a 00                	push   $0x0
  pushl $46
80106047:	6a 2e                	push   $0x2e
  jmp alltraps
80106049:	e9 90 f9 ff ff       	jmp    801059de <alltraps>

8010604e <vector47>:
.globl vector47
vector47:
  pushl $0
8010604e:	6a 00                	push   $0x0
  pushl $47
80106050:	6a 2f                	push   $0x2f
  jmp alltraps
80106052:	e9 87 f9 ff ff       	jmp    801059de <alltraps>

80106057 <vector48>:
.globl vector48
vector48:
  pushl $0
80106057:	6a 00                	push   $0x0
  pushl $48
80106059:	6a 30                	push   $0x30
  jmp alltraps
8010605b:	e9 7e f9 ff ff       	jmp    801059de <alltraps>

80106060 <vector49>:
.globl vector49
vector49:
  pushl $0
80106060:	6a 00                	push   $0x0
  pushl $49
80106062:	6a 31                	push   $0x31
  jmp alltraps
80106064:	e9 75 f9 ff ff       	jmp    801059de <alltraps>

80106069 <vector50>:
.globl vector50
vector50:
  pushl $0
80106069:	6a 00                	push   $0x0
  pushl $50
8010606b:	6a 32                	push   $0x32
  jmp alltraps
8010606d:	e9 6c f9 ff ff       	jmp    801059de <alltraps>

80106072 <vector51>:
.globl vector51
vector51:
  pushl $0
80106072:	6a 00                	push   $0x0
  pushl $51
80106074:	6a 33                	push   $0x33
  jmp alltraps
80106076:	e9 63 f9 ff ff       	jmp    801059de <alltraps>

8010607b <vector52>:
.globl vector52
vector52:
  pushl $0
8010607b:	6a 00                	push   $0x0
  pushl $52
8010607d:	6a 34                	push   $0x34
  jmp alltraps
8010607f:	e9 5a f9 ff ff       	jmp    801059de <alltraps>

80106084 <vector53>:
.globl vector53
vector53:
  pushl $0
80106084:	6a 00                	push   $0x0
  pushl $53
80106086:	6a 35                	push   $0x35
  jmp alltraps
80106088:	e9 51 f9 ff ff       	jmp    801059de <alltraps>

8010608d <vector54>:
.globl vector54
vector54:
  pushl $0
8010608d:	6a 00                	push   $0x0
  pushl $54
8010608f:	6a 36                	push   $0x36
  jmp alltraps
80106091:	e9 48 f9 ff ff       	jmp    801059de <alltraps>

80106096 <vector55>:
.globl vector55
vector55:
  pushl $0
80106096:	6a 00                	push   $0x0
  pushl $55
80106098:	6a 37                	push   $0x37
  jmp alltraps
8010609a:	e9 3f f9 ff ff       	jmp    801059de <alltraps>

8010609f <vector56>:
.globl vector56
vector56:
  pushl $0
8010609f:	6a 00                	push   $0x0
  pushl $56
801060a1:	6a 38                	push   $0x38
  jmp alltraps
801060a3:	e9 36 f9 ff ff       	jmp    801059de <alltraps>

801060a8 <vector57>:
.globl vector57
vector57:
  pushl $0
801060a8:	6a 00                	push   $0x0
  pushl $57
801060aa:	6a 39                	push   $0x39
  jmp alltraps
801060ac:	e9 2d f9 ff ff       	jmp    801059de <alltraps>

801060b1 <vector58>:
.globl vector58
vector58:
  pushl $0
801060b1:	6a 00                	push   $0x0
  pushl $58
801060b3:	6a 3a                	push   $0x3a
  jmp alltraps
801060b5:	e9 24 f9 ff ff       	jmp    801059de <alltraps>

801060ba <vector59>:
.globl vector59
vector59:
  pushl $0
801060ba:	6a 00                	push   $0x0
  pushl $59
801060bc:	6a 3b                	push   $0x3b
  jmp alltraps
801060be:	e9 1b f9 ff ff       	jmp    801059de <alltraps>

801060c3 <vector60>:
.globl vector60
vector60:
  pushl $0
801060c3:	6a 00                	push   $0x0
  pushl $60
801060c5:	6a 3c                	push   $0x3c
  jmp alltraps
801060c7:	e9 12 f9 ff ff       	jmp    801059de <alltraps>

801060cc <vector61>:
.globl vector61
vector61:
  pushl $0
801060cc:	6a 00                	push   $0x0
  pushl $61
801060ce:	6a 3d                	push   $0x3d
  jmp alltraps
801060d0:	e9 09 f9 ff ff       	jmp    801059de <alltraps>

801060d5 <vector62>:
.globl vector62
vector62:
  pushl $0
801060d5:	6a 00                	push   $0x0
  pushl $62
801060d7:	6a 3e                	push   $0x3e
  jmp alltraps
801060d9:	e9 00 f9 ff ff       	jmp    801059de <alltraps>

801060de <vector63>:
.globl vector63
vector63:
  pushl $0
801060de:	6a 00                	push   $0x0
  pushl $63
801060e0:	6a 3f                	push   $0x3f
  jmp alltraps
801060e2:	e9 f7 f8 ff ff       	jmp    801059de <alltraps>

801060e7 <vector64>:
.globl vector64
vector64:
  pushl $0
801060e7:	6a 00                	push   $0x0
  pushl $64
801060e9:	6a 40                	push   $0x40
  jmp alltraps
801060eb:	e9 ee f8 ff ff       	jmp    801059de <alltraps>

801060f0 <vector65>:
.globl vector65
vector65:
  pushl $0
801060f0:	6a 00                	push   $0x0
  pushl $65
801060f2:	6a 41                	push   $0x41
  jmp alltraps
801060f4:	e9 e5 f8 ff ff       	jmp    801059de <alltraps>

801060f9 <vector66>:
.globl vector66
vector66:
  pushl $0
801060f9:	6a 00                	push   $0x0
  pushl $66
801060fb:	6a 42                	push   $0x42
  jmp alltraps
801060fd:	e9 dc f8 ff ff       	jmp    801059de <alltraps>

80106102 <vector67>:
.globl vector67
vector67:
  pushl $0
80106102:	6a 00                	push   $0x0
  pushl $67
80106104:	6a 43                	push   $0x43
  jmp alltraps
80106106:	e9 d3 f8 ff ff       	jmp    801059de <alltraps>

8010610b <vector68>:
.globl vector68
vector68:
  pushl $0
8010610b:	6a 00                	push   $0x0
  pushl $68
8010610d:	6a 44                	push   $0x44
  jmp alltraps
8010610f:	e9 ca f8 ff ff       	jmp    801059de <alltraps>

80106114 <vector69>:
.globl vector69
vector69:
  pushl $0
80106114:	6a 00                	push   $0x0
  pushl $69
80106116:	6a 45                	push   $0x45
  jmp alltraps
80106118:	e9 c1 f8 ff ff       	jmp    801059de <alltraps>

8010611d <vector70>:
.globl vector70
vector70:
  pushl $0
8010611d:	6a 00                	push   $0x0
  pushl $70
8010611f:	6a 46                	push   $0x46
  jmp alltraps
80106121:	e9 b8 f8 ff ff       	jmp    801059de <alltraps>

80106126 <vector71>:
.globl vector71
vector71:
  pushl $0
80106126:	6a 00                	push   $0x0
  pushl $71
80106128:	6a 47                	push   $0x47
  jmp alltraps
8010612a:	e9 af f8 ff ff       	jmp    801059de <alltraps>

8010612f <vector72>:
.globl vector72
vector72:
  pushl $0
8010612f:	6a 00                	push   $0x0
  pushl $72
80106131:	6a 48                	push   $0x48
  jmp alltraps
80106133:	e9 a6 f8 ff ff       	jmp    801059de <alltraps>

80106138 <vector73>:
.globl vector73
vector73:
  pushl $0
80106138:	6a 00                	push   $0x0
  pushl $73
8010613a:	6a 49                	push   $0x49
  jmp alltraps
8010613c:	e9 9d f8 ff ff       	jmp    801059de <alltraps>

80106141 <vector74>:
.globl vector74
vector74:
  pushl $0
80106141:	6a 00                	push   $0x0
  pushl $74
80106143:	6a 4a                	push   $0x4a
  jmp alltraps
80106145:	e9 94 f8 ff ff       	jmp    801059de <alltraps>

8010614a <vector75>:
.globl vector75
vector75:
  pushl $0
8010614a:	6a 00                	push   $0x0
  pushl $75
8010614c:	6a 4b                	push   $0x4b
  jmp alltraps
8010614e:	e9 8b f8 ff ff       	jmp    801059de <alltraps>

80106153 <vector76>:
.globl vector76
vector76:
  pushl $0
80106153:	6a 00                	push   $0x0
  pushl $76
80106155:	6a 4c                	push   $0x4c
  jmp alltraps
80106157:	e9 82 f8 ff ff       	jmp    801059de <alltraps>

8010615c <vector77>:
.globl vector77
vector77:
  pushl $0
8010615c:	6a 00                	push   $0x0
  pushl $77
8010615e:	6a 4d                	push   $0x4d
  jmp alltraps
80106160:	e9 79 f8 ff ff       	jmp    801059de <alltraps>

80106165 <vector78>:
.globl vector78
vector78:
  pushl $0
80106165:	6a 00                	push   $0x0
  pushl $78
80106167:	6a 4e                	push   $0x4e
  jmp alltraps
80106169:	e9 70 f8 ff ff       	jmp    801059de <alltraps>

8010616e <vector79>:
.globl vector79
vector79:
  pushl $0
8010616e:	6a 00                	push   $0x0
  pushl $79
80106170:	6a 4f                	push   $0x4f
  jmp alltraps
80106172:	e9 67 f8 ff ff       	jmp    801059de <alltraps>

80106177 <vector80>:
.globl vector80
vector80:
  pushl $0
80106177:	6a 00                	push   $0x0
  pushl $80
80106179:	6a 50                	push   $0x50
  jmp alltraps
8010617b:	e9 5e f8 ff ff       	jmp    801059de <alltraps>

80106180 <vector81>:
.globl vector81
vector81:
  pushl $0
80106180:	6a 00                	push   $0x0
  pushl $81
80106182:	6a 51                	push   $0x51
  jmp alltraps
80106184:	e9 55 f8 ff ff       	jmp    801059de <alltraps>

80106189 <vector82>:
.globl vector82
vector82:
  pushl $0
80106189:	6a 00                	push   $0x0
  pushl $82
8010618b:	6a 52                	push   $0x52
  jmp alltraps
8010618d:	e9 4c f8 ff ff       	jmp    801059de <alltraps>

80106192 <vector83>:
.globl vector83
vector83:
  pushl $0
80106192:	6a 00                	push   $0x0
  pushl $83
80106194:	6a 53                	push   $0x53
  jmp alltraps
80106196:	e9 43 f8 ff ff       	jmp    801059de <alltraps>

8010619b <vector84>:
.globl vector84
vector84:
  pushl $0
8010619b:	6a 00                	push   $0x0
  pushl $84
8010619d:	6a 54                	push   $0x54
  jmp alltraps
8010619f:	e9 3a f8 ff ff       	jmp    801059de <alltraps>

801061a4 <vector85>:
.globl vector85
vector85:
  pushl $0
801061a4:	6a 00                	push   $0x0
  pushl $85
801061a6:	6a 55                	push   $0x55
  jmp alltraps
801061a8:	e9 31 f8 ff ff       	jmp    801059de <alltraps>

801061ad <vector86>:
.globl vector86
vector86:
  pushl $0
801061ad:	6a 00                	push   $0x0
  pushl $86
801061af:	6a 56                	push   $0x56
  jmp alltraps
801061b1:	e9 28 f8 ff ff       	jmp    801059de <alltraps>

801061b6 <vector87>:
.globl vector87
vector87:
  pushl $0
801061b6:	6a 00                	push   $0x0
  pushl $87
801061b8:	6a 57                	push   $0x57
  jmp alltraps
801061ba:	e9 1f f8 ff ff       	jmp    801059de <alltraps>

801061bf <vector88>:
.globl vector88
vector88:
  pushl $0
801061bf:	6a 00                	push   $0x0
  pushl $88
801061c1:	6a 58                	push   $0x58
  jmp alltraps
801061c3:	e9 16 f8 ff ff       	jmp    801059de <alltraps>

801061c8 <vector89>:
.globl vector89
vector89:
  pushl $0
801061c8:	6a 00                	push   $0x0
  pushl $89
801061ca:	6a 59                	push   $0x59
  jmp alltraps
801061cc:	e9 0d f8 ff ff       	jmp    801059de <alltraps>

801061d1 <vector90>:
.globl vector90
vector90:
  pushl $0
801061d1:	6a 00                	push   $0x0
  pushl $90
801061d3:	6a 5a                	push   $0x5a
  jmp alltraps
801061d5:	e9 04 f8 ff ff       	jmp    801059de <alltraps>

801061da <vector91>:
.globl vector91
vector91:
  pushl $0
801061da:	6a 00                	push   $0x0
  pushl $91
801061dc:	6a 5b                	push   $0x5b
  jmp alltraps
801061de:	e9 fb f7 ff ff       	jmp    801059de <alltraps>

801061e3 <vector92>:
.globl vector92
vector92:
  pushl $0
801061e3:	6a 00                	push   $0x0
  pushl $92
801061e5:	6a 5c                	push   $0x5c
  jmp alltraps
801061e7:	e9 f2 f7 ff ff       	jmp    801059de <alltraps>

801061ec <vector93>:
.globl vector93
vector93:
  pushl $0
801061ec:	6a 00                	push   $0x0
  pushl $93
801061ee:	6a 5d                	push   $0x5d
  jmp alltraps
801061f0:	e9 e9 f7 ff ff       	jmp    801059de <alltraps>

801061f5 <vector94>:
.globl vector94
vector94:
  pushl $0
801061f5:	6a 00                	push   $0x0
  pushl $94
801061f7:	6a 5e                	push   $0x5e
  jmp alltraps
801061f9:	e9 e0 f7 ff ff       	jmp    801059de <alltraps>

801061fe <vector95>:
.globl vector95
vector95:
  pushl $0
801061fe:	6a 00                	push   $0x0
  pushl $95
80106200:	6a 5f                	push   $0x5f
  jmp alltraps
80106202:	e9 d7 f7 ff ff       	jmp    801059de <alltraps>

80106207 <vector96>:
.globl vector96
vector96:
  pushl $0
80106207:	6a 00                	push   $0x0
  pushl $96
80106209:	6a 60                	push   $0x60
  jmp alltraps
8010620b:	e9 ce f7 ff ff       	jmp    801059de <alltraps>

80106210 <vector97>:
.globl vector97
vector97:
  pushl $0
80106210:	6a 00                	push   $0x0
  pushl $97
80106212:	6a 61                	push   $0x61
  jmp alltraps
80106214:	e9 c5 f7 ff ff       	jmp    801059de <alltraps>

80106219 <vector98>:
.globl vector98
vector98:
  pushl $0
80106219:	6a 00                	push   $0x0
  pushl $98
8010621b:	6a 62                	push   $0x62
  jmp alltraps
8010621d:	e9 bc f7 ff ff       	jmp    801059de <alltraps>

80106222 <vector99>:
.globl vector99
vector99:
  pushl $0
80106222:	6a 00                	push   $0x0
  pushl $99
80106224:	6a 63                	push   $0x63
  jmp alltraps
80106226:	e9 b3 f7 ff ff       	jmp    801059de <alltraps>

8010622b <vector100>:
.globl vector100
vector100:
  pushl $0
8010622b:	6a 00                	push   $0x0
  pushl $100
8010622d:	6a 64                	push   $0x64
  jmp alltraps
8010622f:	e9 aa f7 ff ff       	jmp    801059de <alltraps>

80106234 <vector101>:
.globl vector101
vector101:
  pushl $0
80106234:	6a 00                	push   $0x0
  pushl $101
80106236:	6a 65                	push   $0x65
  jmp alltraps
80106238:	e9 a1 f7 ff ff       	jmp    801059de <alltraps>

8010623d <vector102>:
.globl vector102
vector102:
  pushl $0
8010623d:	6a 00                	push   $0x0
  pushl $102
8010623f:	6a 66                	push   $0x66
  jmp alltraps
80106241:	e9 98 f7 ff ff       	jmp    801059de <alltraps>

80106246 <vector103>:
.globl vector103
vector103:
  pushl $0
80106246:	6a 00                	push   $0x0
  pushl $103
80106248:	6a 67                	push   $0x67
  jmp alltraps
8010624a:	e9 8f f7 ff ff       	jmp    801059de <alltraps>

8010624f <vector104>:
.globl vector104
vector104:
  pushl $0
8010624f:	6a 00                	push   $0x0
  pushl $104
80106251:	6a 68                	push   $0x68
  jmp alltraps
80106253:	e9 86 f7 ff ff       	jmp    801059de <alltraps>

80106258 <vector105>:
.globl vector105
vector105:
  pushl $0
80106258:	6a 00                	push   $0x0
  pushl $105
8010625a:	6a 69                	push   $0x69
  jmp alltraps
8010625c:	e9 7d f7 ff ff       	jmp    801059de <alltraps>

80106261 <vector106>:
.globl vector106
vector106:
  pushl $0
80106261:	6a 00                	push   $0x0
  pushl $106
80106263:	6a 6a                	push   $0x6a
  jmp alltraps
80106265:	e9 74 f7 ff ff       	jmp    801059de <alltraps>

8010626a <vector107>:
.globl vector107
vector107:
  pushl $0
8010626a:	6a 00                	push   $0x0
  pushl $107
8010626c:	6a 6b                	push   $0x6b
  jmp alltraps
8010626e:	e9 6b f7 ff ff       	jmp    801059de <alltraps>

80106273 <vector108>:
.globl vector108
vector108:
  pushl $0
80106273:	6a 00                	push   $0x0
  pushl $108
80106275:	6a 6c                	push   $0x6c
  jmp alltraps
80106277:	e9 62 f7 ff ff       	jmp    801059de <alltraps>

8010627c <vector109>:
.globl vector109
vector109:
  pushl $0
8010627c:	6a 00                	push   $0x0
  pushl $109
8010627e:	6a 6d                	push   $0x6d
  jmp alltraps
80106280:	e9 59 f7 ff ff       	jmp    801059de <alltraps>

80106285 <vector110>:
.globl vector110
vector110:
  pushl $0
80106285:	6a 00                	push   $0x0
  pushl $110
80106287:	6a 6e                	push   $0x6e
  jmp alltraps
80106289:	e9 50 f7 ff ff       	jmp    801059de <alltraps>

8010628e <vector111>:
.globl vector111
vector111:
  pushl $0
8010628e:	6a 00                	push   $0x0
  pushl $111
80106290:	6a 6f                	push   $0x6f
  jmp alltraps
80106292:	e9 47 f7 ff ff       	jmp    801059de <alltraps>

80106297 <vector112>:
.globl vector112
vector112:
  pushl $0
80106297:	6a 00                	push   $0x0
  pushl $112
80106299:	6a 70                	push   $0x70
  jmp alltraps
8010629b:	e9 3e f7 ff ff       	jmp    801059de <alltraps>

801062a0 <vector113>:
.globl vector113
vector113:
  pushl $0
801062a0:	6a 00                	push   $0x0
  pushl $113
801062a2:	6a 71                	push   $0x71
  jmp alltraps
801062a4:	e9 35 f7 ff ff       	jmp    801059de <alltraps>

801062a9 <vector114>:
.globl vector114
vector114:
  pushl $0
801062a9:	6a 00                	push   $0x0
  pushl $114
801062ab:	6a 72                	push   $0x72
  jmp alltraps
801062ad:	e9 2c f7 ff ff       	jmp    801059de <alltraps>

801062b2 <vector115>:
.globl vector115
vector115:
  pushl $0
801062b2:	6a 00                	push   $0x0
  pushl $115
801062b4:	6a 73                	push   $0x73
  jmp alltraps
801062b6:	e9 23 f7 ff ff       	jmp    801059de <alltraps>

801062bb <vector116>:
.globl vector116
vector116:
  pushl $0
801062bb:	6a 00                	push   $0x0
  pushl $116
801062bd:	6a 74                	push   $0x74
  jmp alltraps
801062bf:	e9 1a f7 ff ff       	jmp    801059de <alltraps>

801062c4 <vector117>:
.globl vector117
vector117:
  pushl $0
801062c4:	6a 00                	push   $0x0
  pushl $117
801062c6:	6a 75                	push   $0x75
  jmp alltraps
801062c8:	e9 11 f7 ff ff       	jmp    801059de <alltraps>

801062cd <vector118>:
.globl vector118
vector118:
  pushl $0
801062cd:	6a 00                	push   $0x0
  pushl $118
801062cf:	6a 76                	push   $0x76
  jmp alltraps
801062d1:	e9 08 f7 ff ff       	jmp    801059de <alltraps>

801062d6 <vector119>:
.globl vector119
vector119:
  pushl $0
801062d6:	6a 00                	push   $0x0
  pushl $119
801062d8:	6a 77                	push   $0x77
  jmp alltraps
801062da:	e9 ff f6 ff ff       	jmp    801059de <alltraps>

801062df <vector120>:
.globl vector120
vector120:
  pushl $0
801062df:	6a 00                	push   $0x0
  pushl $120
801062e1:	6a 78                	push   $0x78
  jmp alltraps
801062e3:	e9 f6 f6 ff ff       	jmp    801059de <alltraps>

801062e8 <vector121>:
.globl vector121
vector121:
  pushl $0
801062e8:	6a 00                	push   $0x0
  pushl $121
801062ea:	6a 79                	push   $0x79
  jmp alltraps
801062ec:	e9 ed f6 ff ff       	jmp    801059de <alltraps>

801062f1 <vector122>:
.globl vector122
vector122:
  pushl $0
801062f1:	6a 00                	push   $0x0
  pushl $122
801062f3:	6a 7a                	push   $0x7a
  jmp alltraps
801062f5:	e9 e4 f6 ff ff       	jmp    801059de <alltraps>

801062fa <vector123>:
.globl vector123
vector123:
  pushl $0
801062fa:	6a 00                	push   $0x0
  pushl $123
801062fc:	6a 7b                	push   $0x7b
  jmp alltraps
801062fe:	e9 db f6 ff ff       	jmp    801059de <alltraps>

80106303 <vector124>:
.globl vector124
vector124:
  pushl $0
80106303:	6a 00                	push   $0x0
  pushl $124
80106305:	6a 7c                	push   $0x7c
  jmp alltraps
80106307:	e9 d2 f6 ff ff       	jmp    801059de <alltraps>

8010630c <vector125>:
.globl vector125
vector125:
  pushl $0
8010630c:	6a 00                	push   $0x0
  pushl $125
8010630e:	6a 7d                	push   $0x7d
  jmp alltraps
80106310:	e9 c9 f6 ff ff       	jmp    801059de <alltraps>

80106315 <vector126>:
.globl vector126
vector126:
  pushl $0
80106315:	6a 00                	push   $0x0
  pushl $126
80106317:	6a 7e                	push   $0x7e
  jmp alltraps
80106319:	e9 c0 f6 ff ff       	jmp    801059de <alltraps>

8010631e <vector127>:
.globl vector127
vector127:
  pushl $0
8010631e:	6a 00                	push   $0x0
  pushl $127
80106320:	6a 7f                	push   $0x7f
  jmp alltraps
80106322:	e9 b7 f6 ff ff       	jmp    801059de <alltraps>

80106327 <vector128>:
.globl vector128
vector128:
  pushl $0
80106327:	6a 00                	push   $0x0
  pushl $128
80106329:	68 80 00 00 00       	push   $0x80
  jmp alltraps
8010632e:	e9 ab f6 ff ff       	jmp    801059de <alltraps>

80106333 <vector129>:
.globl vector129
vector129:
  pushl $0
80106333:	6a 00                	push   $0x0
  pushl $129
80106335:	68 81 00 00 00       	push   $0x81
  jmp alltraps
8010633a:	e9 9f f6 ff ff       	jmp    801059de <alltraps>

8010633f <vector130>:
.globl vector130
vector130:
  pushl $0
8010633f:	6a 00                	push   $0x0
  pushl $130
80106341:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80106346:	e9 93 f6 ff ff       	jmp    801059de <alltraps>

8010634b <vector131>:
.globl vector131
vector131:
  pushl $0
8010634b:	6a 00                	push   $0x0
  pushl $131
8010634d:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80106352:	e9 87 f6 ff ff       	jmp    801059de <alltraps>

80106357 <vector132>:
.globl vector132
vector132:
  pushl $0
80106357:	6a 00                	push   $0x0
  pushl $132
80106359:	68 84 00 00 00       	push   $0x84
  jmp alltraps
8010635e:	e9 7b f6 ff ff       	jmp    801059de <alltraps>

80106363 <vector133>:
.globl vector133
vector133:
  pushl $0
80106363:	6a 00                	push   $0x0
  pushl $133
80106365:	68 85 00 00 00       	push   $0x85
  jmp alltraps
8010636a:	e9 6f f6 ff ff       	jmp    801059de <alltraps>

8010636f <vector134>:
.globl vector134
vector134:
  pushl $0
8010636f:	6a 00                	push   $0x0
  pushl $134
80106371:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80106376:	e9 63 f6 ff ff       	jmp    801059de <alltraps>

8010637b <vector135>:
.globl vector135
vector135:
  pushl $0
8010637b:	6a 00                	push   $0x0
  pushl $135
8010637d:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80106382:	e9 57 f6 ff ff       	jmp    801059de <alltraps>

80106387 <vector136>:
.globl vector136
vector136:
  pushl $0
80106387:	6a 00                	push   $0x0
  pushl $136
80106389:	68 88 00 00 00       	push   $0x88
  jmp alltraps
8010638e:	e9 4b f6 ff ff       	jmp    801059de <alltraps>

80106393 <vector137>:
.globl vector137
vector137:
  pushl $0
80106393:	6a 00                	push   $0x0
  pushl $137
80106395:	68 89 00 00 00       	push   $0x89
  jmp alltraps
8010639a:	e9 3f f6 ff ff       	jmp    801059de <alltraps>

8010639f <vector138>:
.globl vector138
vector138:
  pushl $0
8010639f:	6a 00                	push   $0x0
  pushl $138
801063a1:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
801063a6:	e9 33 f6 ff ff       	jmp    801059de <alltraps>

801063ab <vector139>:
.globl vector139
vector139:
  pushl $0
801063ab:	6a 00                	push   $0x0
  pushl $139
801063ad:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
801063b2:	e9 27 f6 ff ff       	jmp    801059de <alltraps>

801063b7 <vector140>:
.globl vector140
vector140:
  pushl $0
801063b7:	6a 00                	push   $0x0
  pushl $140
801063b9:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
801063be:	e9 1b f6 ff ff       	jmp    801059de <alltraps>

801063c3 <vector141>:
.globl vector141
vector141:
  pushl $0
801063c3:	6a 00                	push   $0x0
  pushl $141
801063c5:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
801063ca:	e9 0f f6 ff ff       	jmp    801059de <alltraps>

801063cf <vector142>:
.globl vector142
vector142:
  pushl $0
801063cf:	6a 00                	push   $0x0
  pushl $142
801063d1:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
801063d6:	e9 03 f6 ff ff       	jmp    801059de <alltraps>

801063db <vector143>:
.globl vector143
vector143:
  pushl $0
801063db:	6a 00                	push   $0x0
  pushl $143
801063dd:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
801063e2:	e9 f7 f5 ff ff       	jmp    801059de <alltraps>

801063e7 <vector144>:
.globl vector144
vector144:
  pushl $0
801063e7:	6a 00                	push   $0x0
  pushl $144
801063e9:	68 90 00 00 00       	push   $0x90
  jmp alltraps
801063ee:	e9 eb f5 ff ff       	jmp    801059de <alltraps>

801063f3 <vector145>:
.globl vector145
vector145:
  pushl $0
801063f3:	6a 00                	push   $0x0
  pushl $145
801063f5:	68 91 00 00 00       	push   $0x91
  jmp alltraps
801063fa:	e9 df f5 ff ff       	jmp    801059de <alltraps>

801063ff <vector146>:
.globl vector146
vector146:
  pushl $0
801063ff:	6a 00                	push   $0x0
  pushl $146
80106401:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106406:	e9 d3 f5 ff ff       	jmp    801059de <alltraps>

8010640b <vector147>:
.globl vector147
vector147:
  pushl $0
8010640b:	6a 00                	push   $0x0
  pushl $147
8010640d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80106412:	e9 c7 f5 ff ff       	jmp    801059de <alltraps>

80106417 <vector148>:
.globl vector148
vector148:
  pushl $0
80106417:	6a 00                	push   $0x0
  pushl $148
80106419:	68 94 00 00 00       	push   $0x94
  jmp alltraps
8010641e:	e9 bb f5 ff ff       	jmp    801059de <alltraps>

80106423 <vector149>:
.globl vector149
vector149:
  pushl $0
80106423:	6a 00                	push   $0x0
  pushl $149
80106425:	68 95 00 00 00       	push   $0x95
  jmp alltraps
8010642a:	e9 af f5 ff ff       	jmp    801059de <alltraps>

8010642f <vector150>:
.globl vector150
vector150:
  pushl $0
8010642f:	6a 00                	push   $0x0
  pushl $150
80106431:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80106436:	e9 a3 f5 ff ff       	jmp    801059de <alltraps>

8010643b <vector151>:
.globl vector151
vector151:
  pushl $0
8010643b:	6a 00                	push   $0x0
  pushl $151
8010643d:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80106442:	e9 97 f5 ff ff       	jmp    801059de <alltraps>

80106447 <vector152>:
.globl vector152
vector152:
  pushl $0
80106447:	6a 00                	push   $0x0
  pushl $152
80106449:	68 98 00 00 00       	push   $0x98
  jmp alltraps
8010644e:	e9 8b f5 ff ff       	jmp    801059de <alltraps>

80106453 <vector153>:
.globl vector153
vector153:
  pushl $0
80106453:	6a 00                	push   $0x0
  pushl $153
80106455:	68 99 00 00 00       	push   $0x99
  jmp alltraps
8010645a:	e9 7f f5 ff ff       	jmp    801059de <alltraps>

8010645f <vector154>:
.globl vector154
vector154:
  pushl $0
8010645f:	6a 00                	push   $0x0
  pushl $154
80106461:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80106466:	e9 73 f5 ff ff       	jmp    801059de <alltraps>

8010646b <vector155>:
.globl vector155
vector155:
  pushl $0
8010646b:	6a 00                	push   $0x0
  pushl $155
8010646d:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80106472:	e9 67 f5 ff ff       	jmp    801059de <alltraps>

80106477 <vector156>:
.globl vector156
vector156:
  pushl $0
80106477:	6a 00                	push   $0x0
  pushl $156
80106479:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
8010647e:	e9 5b f5 ff ff       	jmp    801059de <alltraps>

80106483 <vector157>:
.globl vector157
vector157:
  pushl $0
80106483:	6a 00                	push   $0x0
  pushl $157
80106485:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
8010648a:	e9 4f f5 ff ff       	jmp    801059de <alltraps>

8010648f <vector158>:
.globl vector158
vector158:
  pushl $0
8010648f:	6a 00                	push   $0x0
  pushl $158
80106491:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
80106496:	e9 43 f5 ff ff       	jmp    801059de <alltraps>

8010649b <vector159>:
.globl vector159
vector159:
  pushl $0
8010649b:	6a 00                	push   $0x0
  pushl $159
8010649d:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
801064a2:	e9 37 f5 ff ff       	jmp    801059de <alltraps>

801064a7 <vector160>:
.globl vector160
vector160:
  pushl $0
801064a7:	6a 00                	push   $0x0
  pushl $160
801064a9:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
801064ae:	e9 2b f5 ff ff       	jmp    801059de <alltraps>

801064b3 <vector161>:
.globl vector161
vector161:
  pushl $0
801064b3:	6a 00                	push   $0x0
  pushl $161
801064b5:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
801064ba:	e9 1f f5 ff ff       	jmp    801059de <alltraps>

801064bf <vector162>:
.globl vector162
vector162:
  pushl $0
801064bf:	6a 00                	push   $0x0
  pushl $162
801064c1:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
801064c6:	e9 13 f5 ff ff       	jmp    801059de <alltraps>

801064cb <vector163>:
.globl vector163
vector163:
  pushl $0
801064cb:	6a 00                	push   $0x0
  pushl $163
801064cd:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
801064d2:	e9 07 f5 ff ff       	jmp    801059de <alltraps>

801064d7 <vector164>:
.globl vector164
vector164:
  pushl $0
801064d7:	6a 00                	push   $0x0
  pushl $164
801064d9:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
801064de:	e9 fb f4 ff ff       	jmp    801059de <alltraps>

801064e3 <vector165>:
.globl vector165
vector165:
  pushl $0
801064e3:	6a 00                	push   $0x0
  pushl $165
801064e5:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
801064ea:	e9 ef f4 ff ff       	jmp    801059de <alltraps>

801064ef <vector166>:
.globl vector166
vector166:
  pushl $0
801064ef:	6a 00                	push   $0x0
  pushl $166
801064f1:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
801064f6:	e9 e3 f4 ff ff       	jmp    801059de <alltraps>

801064fb <vector167>:
.globl vector167
vector167:
  pushl $0
801064fb:	6a 00                	push   $0x0
  pushl $167
801064fd:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106502:	e9 d7 f4 ff ff       	jmp    801059de <alltraps>

80106507 <vector168>:
.globl vector168
vector168:
  pushl $0
80106507:	6a 00                	push   $0x0
  pushl $168
80106509:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010650e:	e9 cb f4 ff ff       	jmp    801059de <alltraps>

80106513 <vector169>:
.globl vector169
vector169:
  pushl $0
80106513:	6a 00                	push   $0x0
  pushl $169
80106515:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
8010651a:	e9 bf f4 ff ff       	jmp    801059de <alltraps>

8010651f <vector170>:
.globl vector170
vector170:
  pushl $0
8010651f:	6a 00                	push   $0x0
  pushl $170
80106521:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80106526:	e9 b3 f4 ff ff       	jmp    801059de <alltraps>

8010652b <vector171>:
.globl vector171
vector171:
  pushl $0
8010652b:	6a 00                	push   $0x0
  pushl $171
8010652d:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80106532:	e9 a7 f4 ff ff       	jmp    801059de <alltraps>

80106537 <vector172>:
.globl vector172
vector172:
  pushl $0
80106537:	6a 00                	push   $0x0
  pushl $172
80106539:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
8010653e:	e9 9b f4 ff ff       	jmp    801059de <alltraps>

80106543 <vector173>:
.globl vector173
vector173:
  pushl $0
80106543:	6a 00                	push   $0x0
  pushl $173
80106545:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
8010654a:	e9 8f f4 ff ff       	jmp    801059de <alltraps>

8010654f <vector174>:
.globl vector174
vector174:
  pushl $0
8010654f:	6a 00                	push   $0x0
  pushl $174
80106551:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
80106556:	e9 83 f4 ff ff       	jmp    801059de <alltraps>

8010655b <vector175>:
.globl vector175
vector175:
  pushl $0
8010655b:	6a 00                	push   $0x0
  pushl $175
8010655d:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80106562:	e9 77 f4 ff ff       	jmp    801059de <alltraps>

80106567 <vector176>:
.globl vector176
vector176:
  pushl $0
80106567:	6a 00                	push   $0x0
  pushl $176
80106569:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
8010656e:	e9 6b f4 ff ff       	jmp    801059de <alltraps>

80106573 <vector177>:
.globl vector177
vector177:
  pushl $0
80106573:	6a 00                	push   $0x0
  pushl $177
80106575:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
8010657a:	e9 5f f4 ff ff       	jmp    801059de <alltraps>

8010657f <vector178>:
.globl vector178
vector178:
  pushl $0
8010657f:	6a 00                	push   $0x0
  pushl $178
80106581:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
80106586:	e9 53 f4 ff ff       	jmp    801059de <alltraps>

8010658b <vector179>:
.globl vector179
vector179:
  pushl $0
8010658b:	6a 00                	push   $0x0
  pushl $179
8010658d:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106592:	e9 47 f4 ff ff       	jmp    801059de <alltraps>

80106597 <vector180>:
.globl vector180
vector180:
  pushl $0
80106597:	6a 00                	push   $0x0
  pushl $180
80106599:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
8010659e:	e9 3b f4 ff ff       	jmp    801059de <alltraps>

801065a3 <vector181>:
.globl vector181
vector181:
  pushl $0
801065a3:	6a 00                	push   $0x0
  pushl $181
801065a5:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
801065aa:	e9 2f f4 ff ff       	jmp    801059de <alltraps>

801065af <vector182>:
.globl vector182
vector182:
  pushl $0
801065af:	6a 00                	push   $0x0
  pushl $182
801065b1:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
801065b6:	e9 23 f4 ff ff       	jmp    801059de <alltraps>

801065bb <vector183>:
.globl vector183
vector183:
  pushl $0
801065bb:	6a 00                	push   $0x0
  pushl $183
801065bd:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
801065c2:	e9 17 f4 ff ff       	jmp    801059de <alltraps>

801065c7 <vector184>:
.globl vector184
vector184:
  pushl $0
801065c7:	6a 00                	push   $0x0
  pushl $184
801065c9:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
801065ce:	e9 0b f4 ff ff       	jmp    801059de <alltraps>

801065d3 <vector185>:
.globl vector185
vector185:
  pushl $0
801065d3:	6a 00                	push   $0x0
  pushl $185
801065d5:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
801065da:	e9 ff f3 ff ff       	jmp    801059de <alltraps>

801065df <vector186>:
.globl vector186
vector186:
  pushl $0
801065df:	6a 00                	push   $0x0
  pushl $186
801065e1:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
801065e6:	e9 f3 f3 ff ff       	jmp    801059de <alltraps>

801065eb <vector187>:
.globl vector187
vector187:
  pushl $0
801065eb:	6a 00                	push   $0x0
  pushl $187
801065ed:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
801065f2:	e9 e7 f3 ff ff       	jmp    801059de <alltraps>

801065f7 <vector188>:
.globl vector188
vector188:
  pushl $0
801065f7:	6a 00                	push   $0x0
  pushl $188
801065f9:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
801065fe:	e9 db f3 ff ff       	jmp    801059de <alltraps>

80106603 <vector189>:
.globl vector189
vector189:
  pushl $0
80106603:	6a 00                	push   $0x0
  pushl $189
80106605:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010660a:	e9 cf f3 ff ff       	jmp    801059de <alltraps>

8010660f <vector190>:
.globl vector190
vector190:
  pushl $0
8010660f:	6a 00                	push   $0x0
  pushl $190
80106611:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106616:	e9 c3 f3 ff ff       	jmp    801059de <alltraps>

8010661b <vector191>:
.globl vector191
vector191:
  pushl $0
8010661b:	6a 00                	push   $0x0
  pushl $191
8010661d:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106622:	e9 b7 f3 ff ff       	jmp    801059de <alltraps>

80106627 <vector192>:
.globl vector192
vector192:
  pushl $0
80106627:	6a 00                	push   $0x0
  pushl $192
80106629:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
8010662e:	e9 ab f3 ff ff       	jmp    801059de <alltraps>

80106633 <vector193>:
.globl vector193
vector193:
  pushl $0
80106633:	6a 00                	push   $0x0
  pushl $193
80106635:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
8010663a:	e9 9f f3 ff ff       	jmp    801059de <alltraps>

8010663f <vector194>:
.globl vector194
vector194:
  pushl $0
8010663f:	6a 00                	push   $0x0
  pushl $194
80106641:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80106646:	e9 93 f3 ff ff       	jmp    801059de <alltraps>

8010664b <vector195>:
.globl vector195
vector195:
  pushl $0
8010664b:	6a 00                	push   $0x0
  pushl $195
8010664d:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80106652:	e9 87 f3 ff ff       	jmp    801059de <alltraps>

80106657 <vector196>:
.globl vector196
vector196:
  pushl $0
80106657:	6a 00                	push   $0x0
  pushl $196
80106659:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
8010665e:	e9 7b f3 ff ff       	jmp    801059de <alltraps>

80106663 <vector197>:
.globl vector197
vector197:
  pushl $0
80106663:	6a 00                	push   $0x0
  pushl $197
80106665:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
8010666a:	e9 6f f3 ff ff       	jmp    801059de <alltraps>

8010666f <vector198>:
.globl vector198
vector198:
  pushl $0
8010666f:	6a 00                	push   $0x0
  pushl $198
80106671:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106676:	e9 63 f3 ff ff       	jmp    801059de <alltraps>

8010667b <vector199>:
.globl vector199
vector199:
  pushl $0
8010667b:	6a 00                	push   $0x0
  pushl $199
8010667d:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106682:	e9 57 f3 ff ff       	jmp    801059de <alltraps>

80106687 <vector200>:
.globl vector200
vector200:
  pushl $0
80106687:	6a 00                	push   $0x0
  pushl $200
80106689:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
8010668e:	e9 4b f3 ff ff       	jmp    801059de <alltraps>

80106693 <vector201>:
.globl vector201
vector201:
  pushl $0
80106693:	6a 00                	push   $0x0
  pushl $201
80106695:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
8010669a:	e9 3f f3 ff ff       	jmp    801059de <alltraps>

8010669f <vector202>:
.globl vector202
vector202:
  pushl $0
8010669f:	6a 00                	push   $0x0
  pushl $202
801066a1:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
801066a6:	e9 33 f3 ff ff       	jmp    801059de <alltraps>

801066ab <vector203>:
.globl vector203
vector203:
  pushl $0
801066ab:	6a 00                	push   $0x0
  pushl $203
801066ad:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
801066b2:	e9 27 f3 ff ff       	jmp    801059de <alltraps>

801066b7 <vector204>:
.globl vector204
vector204:
  pushl $0
801066b7:	6a 00                	push   $0x0
  pushl $204
801066b9:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
801066be:	e9 1b f3 ff ff       	jmp    801059de <alltraps>

801066c3 <vector205>:
.globl vector205
vector205:
  pushl $0
801066c3:	6a 00                	push   $0x0
  pushl $205
801066c5:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
801066ca:	e9 0f f3 ff ff       	jmp    801059de <alltraps>

801066cf <vector206>:
.globl vector206
vector206:
  pushl $0
801066cf:	6a 00                	push   $0x0
  pushl $206
801066d1:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
801066d6:	e9 03 f3 ff ff       	jmp    801059de <alltraps>

801066db <vector207>:
.globl vector207
vector207:
  pushl $0
801066db:	6a 00                	push   $0x0
  pushl $207
801066dd:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
801066e2:	e9 f7 f2 ff ff       	jmp    801059de <alltraps>

801066e7 <vector208>:
.globl vector208
vector208:
  pushl $0
801066e7:	6a 00                	push   $0x0
  pushl $208
801066e9:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
801066ee:	e9 eb f2 ff ff       	jmp    801059de <alltraps>

801066f3 <vector209>:
.globl vector209
vector209:
  pushl $0
801066f3:	6a 00                	push   $0x0
  pushl $209
801066f5:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
801066fa:	e9 df f2 ff ff       	jmp    801059de <alltraps>

801066ff <vector210>:
.globl vector210
vector210:
  pushl $0
801066ff:	6a 00                	push   $0x0
  pushl $210
80106701:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106706:	e9 d3 f2 ff ff       	jmp    801059de <alltraps>

8010670b <vector211>:
.globl vector211
vector211:
  pushl $0
8010670b:	6a 00                	push   $0x0
  pushl $211
8010670d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106712:	e9 c7 f2 ff ff       	jmp    801059de <alltraps>

80106717 <vector212>:
.globl vector212
vector212:
  pushl $0
80106717:	6a 00                	push   $0x0
  pushl $212
80106719:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
8010671e:	e9 bb f2 ff ff       	jmp    801059de <alltraps>

80106723 <vector213>:
.globl vector213
vector213:
  pushl $0
80106723:	6a 00                	push   $0x0
  pushl $213
80106725:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
8010672a:	e9 af f2 ff ff       	jmp    801059de <alltraps>

8010672f <vector214>:
.globl vector214
vector214:
  pushl $0
8010672f:	6a 00                	push   $0x0
  pushl $214
80106731:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106736:	e9 a3 f2 ff ff       	jmp    801059de <alltraps>

8010673b <vector215>:
.globl vector215
vector215:
  pushl $0
8010673b:	6a 00                	push   $0x0
  pushl $215
8010673d:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106742:	e9 97 f2 ff ff       	jmp    801059de <alltraps>

80106747 <vector216>:
.globl vector216
vector216:
  pushl $0
80106747:	6a 00                	push   $0x0
  pushl $216
80106749:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
8010674e:	e9 8b f2 ff ff       	jmp    801059de <alltraps>

80106753 <vector217>:
.globl vector217
vector217:
  pushl $0
80106753:	6a 00                	push   $0x0
  pushl $217
80106755:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
8010675a:	e9 7f f2 ff ff       	jmp    801059de <alltraps>

8010675f <vector218>:
.globl vector218
vector218:
  pushl $0
8010675f:	6a 00                	push   $0x0
  pushl $218
80106761:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106766:	e9 73 f2 ff ff       	jmp    801059de <alltraps>

8010676b <vector219>:
.globl vector219
vector219:
  pushl $0
8010676b:	6a 00                	push   $0x0
  pushl $219
8010676d:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106772:	e9 67 f2 ff ff       	jmp    801059de <alltraps>

80106777 <vector220>:
.globl vector220
vector220:
  pushl $0
80106777:	6a 00                	push   $0x0
  pushl $220
80106779:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
8010677e:	e9 5b f2 ff ff       	jmp    801059de <alltraps>

80106783 <vector221>:
.globl vector221
vector221:
  pushl $0
80106783:	6a 00                	push   $0x0
  pushl $221
80106785:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
8010678a:	e9 4f f2 ff ff       	jmp    801059de <alltraps>

8010678f <vector222>:
.globl vector222
vector222:
  pushl $0
8010678f:	6a 00                	push   $0x0
  pushl $222
80106791:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106796:	e9 43 f2 ff ff       	jmp    801059de <alltraps>

8010679b <vector223>:
.globl vector223
vector223:
  pushl $0
8010679b:	6a 00                	push   $0x0
  pushl $223
8010679d:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
801067a2:	e9 37 f2 ff ff       	jmp    801059de <alltraps>

801067a7 <vector224>:
.globl vector224
vector224:
  pushl $0
801067a7:	6a 00                	push   $0x0
  pushl $224
801067a9:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
801067ae:	e9 2b f2 ff ff       	jmp    801059de <alltraps>

801067b3 <vector225>:
.globl vector225
vector225:
  pushl $0
801067b3:	6a 00                	push   $0x0
  pushl $225
801067b5:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
801067ba:	e9 1f f2 ff ff       	jmp    801059de <alltraps>

801067bf <vector226>:
.globl vector226
vector226:
  pushl $0
801067bf:	6a 00                	push   $0x0
  pushl $226
801067c1:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
801067c6:	e9 13 f2 ff ff       	jmp    801059de <alltraps>

801067cb <vector227>:
.globl vector227
vector227:
  pushl $0
801067cb:	6a 00                	push   $0x0
  pushl $227
801067cd:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
801067d2:	e9 07 f2 ff ff       	jmp    801059de <alltraps>

801067d7 <vector228>:
.globl vector228
vector228:
  pushl $0
801067d7:	6a 00                	push   $0x0
  pushl $228
801067d9:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
801067de:	e9 fb f1 ff ff       	jmp    801059de <alltraps>

801067e3 <vector229>:
.globl vector229
vector229:
  pushl $0
801067e3:	6a 00                	push   $0x0
  pushl $229
801067e5:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
801067ea:	e9 ef f1 ff ff       	jmp    801059de <alltraps>

801067ef <vector230>:
.globl vector230
vector230:
  pushl $0
801067ef:	6a 00                	push   $0x0
  pushl $230
801067f1:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
801067f6:	e9 e3 f1 ff ff       	jmp    801059de <alltraps>

801067fb <vector231>:
.globl vector231
vector231:
  pushl $0
801067fb:	6a 00                	push   $0x0
  pushl $231
801067fd:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106802:	e9 d7 f1 ff ff       	jmp    801059de <alltraps>

80106807 <vector232>:
.globl vector232
vector232:
  pushl $0
80106807:	6a 00                	push   $0x0
  pushl $232
80106809:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
8010680e:	e9 cb f1 ff ff       	jmp    801059de <alltraps>

80106813 <vector233>:
.globl vector233
vector233:
  pushl $0
80106813:	6a 00                	push   $0x0
  pushl $233
80106815:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
8010681a:	e9 bf f1 ff ff       	jmp    801059de <alltraps>

8010681f <vector234>:
.globl vector234
vector234:
  pushl $0
8010681f:	6a 00                	push   $0x0
  pushl $234
80106821:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106826:	e9 b3 f1 ff ff       	jmp    801059de <alltraps>

8010682b <vector235>:
.globl vector235
vector235:
  pushl $0
8010682b:	6a 00                	push   $0x0
  pushl $235
8010682d:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106832:	e9 a7 f1 ff ff       	jmp    801059de <alltraps>

80106837 <vector236>:
.globl vector236
vector236:
  pushl $0
80106837:	6a 00                	push   $0x0
  pushl $236
80106839:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
8010683e:	e9 9b f1 ff ff       	jmp    801059de <alltraps>

80106843 <vector237>:
.globl vector237
vector237:
  pushl $0
80106843:	6a 00                	push   $0x0
  pushl $237
80106845:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
8010684a:	e9 8f f1 ff ff       	jmp    801059de <alltraps>

8010684f <vector238>:
.globl vector238
vector238:
  pushl $0
8010684f:	6a 00                	push   $0x0
  pushl $238
80106851:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80106856:	e9 83 f1 ff ff       	jmp    801059de <alltraps>

8010685b <vector239>:
.globl vector239
vector239:
  pushl $0
8010685b:	6a 00                	push   $0x0
  pushl $239
8010685d:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106862:	e9 77 f1 ff ff       	jmp    801059de <alltraps>

80106867 <vector240>:
.globl vector240
vector240:
  pushl $0
80106867:	6a 00                	push   $0x0
  pushl $240
80106869:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
8010686e:	e9 6b f1 ff ff       	jmp    801059de <alltraps>

80106873 <vector241>:
.globl vector241
vector241:
  pushl $0
80106873:	6a 00                	push   $0x0
  pushl $241
80106875:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
8010687a:	e9 5f f1 ff ff       	jmp    801059de <alltraps>

8010687f <vector242>:
.globl vector242
vector242:
  pushl $0
8010687f:	6a 00                	push   $0x0
  pushl $242
80106881:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106886:	e9 53 f1 ff ff       	jmp    801059de <alltraps>

8010688b <vector243>:
.globl vector243
vector243:
  pushl $0
8010688b:	6a 00                	push   $0x0
  pushl $243
8010688d:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106892:	e9 47 f1 ff ff       	jmp    801059de <alltraps>

80106897 <vector244>:
.globl vector244
vector244:
  pushl $0
80106897:	6a 00                	push   $0x0
  pushl $244
80106899:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
8010689e:	e9 3b f1 ff ff       	jmp    801059de <alltraps>

801068a3 <vector245>:
.globl vector245
vector245:
  pushl $0
801068a3:	6a 00                	push   $0x0
  pushl $245
801068a5:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
801068aa:	e9 2f f1 ff ff       	jmp    801059de <alltraps>

801068af <vector246>:
.globl vector246
vector246:
  pushl $0
801068af:	6a 00                	push   $0x0
  pushl $246
801068b1:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
801068b6:	e9 23 f1 ff ff       	jmp    801059de <alltraps>

801068bb <vector247>:
.globl vector247
vector247:
  pushl $0
801068bb:	6a 00                	push   $0x0
  pushl $247
801068bd:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
801068c2:	e9 17 f1 ff ff       	jmp    801059de <alltraps>

801068c7 <vector248>:
.globl vector248
vector248:
  pushl $0
801068c7:	6a 00                	push   $0x0
  pushl $248
801068c9:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
801068ce:	e9 0b f1 ff ff       	jmp    801059de <alltraps>

801068d3 <vector249>:
.globl vector249
vector249:
  pushl $0
801068d3:	6a 00                	push   $0x0
  pushl $249
801068d5:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
801068da:	e9 ff f0 ff ff       	jmp    801059de <alltraps>

801068df <vector250>:
.globl vector250
vector250:
  pushl $0
801068df:	6a 00                	push   $0x0
  pushl $250
801068e1:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
801068e6:	e9 f3 f0 ff ff       	jmp    801059de <alltraps>

801068eb <vector251>:
.globl vector251
vector251:
  pushl $0
801068eb:	6a 00                	push   $0x0
  pushl $251
801068ed:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
801068f2:	e9 e7 f0 ff ff       	jmp    801059de <alltraps>

801068f7 <vector252>:
.globl vector252
vector252:
  pushl $0
801068f7:	6a 00                	push   $0x0
  pushl $252
801068f9:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
801068fe:	e9 db f0 ff ff       	jmp    801059de <alltraps>

80106903 <vector253>:
.globl vector253
vector253:
  pushl $0
80106903:	6a 00                	push   $0x0
  pushl $253
80106905:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
8010690a:	e9 cf f0 ff ff       	jmp    801059de <alltraps>

8010690f <vector254>:
.globl vector254
vector254:
  pushl $0
8010690f:	6a 00                	push   $0x0
  pushl $254
80106911:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106916:	e9 c3 f0 ff ff       	jmp    801059de <alltraps>

8010691b <vector255>:
.globl vector255
vector255:
  pushl $0
8010691b:	6a 00                	push   $0x0
  pushl $255
8010691d:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106922:	e9 b7 f0 ff ff       	jmp    801059de <alltraps>
80106927:	66 90                	xchg   %ax,%ax
80106929:	66 90                	xchg   %ax,%ax
8010692b:	66 90                	xchg   %ax,%ax
8010692d:	66 90                	xchg   %ax,%ax
8010692f:	90                   	nop

80106930 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106930:	55                   	push   %ebp
80106931:	89 e5                	mov    %esp,%ebp
80106933:	57                   	push   %edi
80106934:	56                   	push   %esi
80106935:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106936:	89 d3                	mov    %edx,%ebx
{
80106938:	89 d7                	mov    %edx,%edi
  pde = &pgdir[PDX(va)];
8010693a:	c1 eb 16             	shr    $0x16,%ebx
8010693d:	8d 34 98             	lea    (%eax,%ebx,4),%esi
{
80106940:	83 ec 0c             	sub    $0xc,%esp
  if(*pde & PTE_P){
80106943:	8b 06                	mov    (%esi),%eax
80106945:	a8 01                	test   $0x1,%al
80106947:	74 27                	je     80106970 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106949:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010694e:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106954:	c1 ef 0a             	shr    $0xa,%edi
}
80106957:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return &pgtab[PTX(va)];
8010695a:	89 fa                	mov    %edi,%edx
8010695c:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106962:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
80106965:	5b                   	pop    %ebx
80106966:	5e                   	pop    %esi
80106967:	5f                   	pop    %edi
80106968:	5d                   	pop    %ebp
80106969:	c3                   	ret    
8010696a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106970:	85 c9                	test   %ecx,%ecx
80106972:	74 2c                	je     801069a0 <walkpgdir+0x70>
80106974:	e8 f7 ba ff ff       	call   80102470 <kalloc>
80106979:	85 c0                	test   %eax,%eax
8010697b:	89 c3                	mov    %eax,%ebx
8010697d:	74 21                	je     801069a0 <walkpgdir+0x70>
    memset(pgtab, 0, PGSIZE);
8010697f:	83 ec 04             	sub    $0x4,%esp
80106982:	68 00 10 00 00       	push   $0x1000
80106987:	6a 00                	push   $0x0
80106989:	50                   	push   %eax
8010698a:	e8 91 dd ff ff       	call   80104720 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
8010698f:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106995:	83 c4 10             	add    $0x10,%esp
80106998:	83 c8 07             	or     $0x7,%eax
8010699b:	89 06                	mov    %eax,(%esi)
8010699d:	eb b5                	jmp    80106954 <walkpgdir+0x24>
8010699f:	90                   	nop
}
801069a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
801069a3:	31 c0                	xor    %eax,%eax
}
801069a5:	5b                   	pop    %ebx
801069a6:	5e                   	pop    %esi
801069a7:	5f                   	pop    %edi
801069a8:	5d                   	pop    %ebp
801069a9:	c3                   	ret    
801069aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801069b0 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
801069b0:	55                   	push   %ebp
801069b1:	89 e5                	mov    %esp,%ebp
801069b3:	57                   	push   %edi
801069b4:	56                   	push   %esi
801069b5:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
801069b6:	89 d3                	mov    %edx,%ebx
801069b8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
801069be:	83 ec 1c             	sub    $0x1c,%esp
801069c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
801069c4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
801069c8:	8b 7d 08             	mov    0x8(%ebp),%edi
801069cb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801069d0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
801069d3:	8b 45 0c             	mov    0xc(%ebp),%eax
801069d6:	29 df                	sub    %ebx,%edi
801069d8:	83 c8 01             	or     $0x1,%eax
801069db:	89 45 dc             	mov    %eax,-0x24(%ebp)
801069de:	eb 15                	jmp    801069f5 <mappages+0x45>
    if(*pte & PTE_P)
801069e0:	f6 00 01             	testb  $0x1,(%eax)
801069e3:	75 45                	jne    80106a2a <mappages+0x7a>
    *pte = pa | perm | PTE_P;
801069e5:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
801069e8:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
    *pte = pa | perm | PTE_P;
801069eb:	89 30                	mov    %esi,(%eax)
    if(a == last)
801069ed:	74 31                	je     80106a20 <mappages+0x70>
      break;
    a += PGSIZE;
801069ef:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
801069f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801069f8:	b9 01 00 00 00       	mov    $0x1,%ecx
801069fd:	89 da                	mov    %ebx,%edx
801069ff:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106a02:	e8 29 ff ff ff       	call   80106930 <walkpgdir>
80106a07:	85 c0                	test   %eax,%eax
80106a09:	75 d5                	jne    801069e0 <mappages+0x30>
    pa += PGSIZE;
  }
  return 0;
}
80106a0b:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106a0e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106a13:	5b                   	pop    %ebx
80106a14:	5e                   	pop    %esi
80106a15:	5f                   	pop    %edi
80106a16:	5d                   	pop    %ebp
80106a17:	c3                   	ret    
80106a18:	90                   	nop
80106a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a20:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106a23:	31 c0                	xor    %eax,%eax
}
80106a25:	5b                   	pop    %ebx
80106a26:	5e                   	pop    %esi
80106a27:	5f                   	pop    %edi
80106a28:	5d                   	pop    %ebp
80106a29:	c3                   	ret    
      panic("remap");
80106a2a:	83 ec 0c             	sub    $0xc,%esp
80106a2d:	68 b0 7c 10 80       	push   $0x80107cb0
80106a32:	e8 39 99 ff ff       	call   80100370 <panic>
80106a37:	89 f6                	mov    %esi,%esi
80106a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a40 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a40:	55                   	push   %ebp
80106a41:	89 e5                	mov    %esp,%ebp
80106a43:	57                   	push   %edi
80106a44:	56                   	push   %esi
80106a45:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106a46:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a4c:	89 c7                	mov    %eax,%edi
  a = PGROUNDUP(newsz);
80106a4e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a54:	83 ec 1c             	sub    $0x1c,%esp
80106a57:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106a5a:	39 d3                	cmp    %edx,%ebx
80106a5c:	73 66                	jae    80106ac4 <deallocuvm.part.0+0x84>
80106a5e:	89 d6                	mov    %edx,%esi
80106a60:	eb 3d                	jmp    80106a9f <deallocuvm.part.0+0x5f>
80106a62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106a68:	8b 10                	mov    (%eax),%edx
80106a6a:	f6 c2 01             	test   $0x1,%dl
80106a6d:	74 26                	je     80106a95 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106a6f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106a75:	74 58                	je     80106acf <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106a77:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
80106a7a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106a80:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      kfree(v);
80106a83:	52                   	push   %edx
80106a84:	e8 37 b8 ff ff       	call   801022c0 <kfree>
      *pte = 0;
80106a89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a8c:	83 c4 10             	add    $0x10,%esp
80106a8f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
80106a95:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106a9b:	39 f3                	cmp    %esi,%ebx
80106a9d:	73 25                	jae    80106ac4 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106a9f:	31 c9                	xor    %ecx,%ecx
80106aa1:	89 da                	mov    %ebx,%edx
80106aa3:	89 f8                	mov    %edi,%eax
80106aa5:	e8 86 fe ff ff       	call   80106930 <walkpgdir>
    if(!pte)
80106aaa:	85 c0                	test   %eax,%eax
80106aac:	75 ba                	jne    80106a68 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106aae:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106ab4:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106aba:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106ac0:	39 f3                	cmp    %esi,%ebx
80106ac2:	72 db                	jb     80106a9f <deallocuvm.part.0+0x5f>
    }
  }
  return newsz;
}
80106ac4:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106ac7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106aca:	5b                   	pop    %ebx
80106acb:	5e                   	pop    %esi
80106acc:	5f                   	pop    %edi
80106acd:	5d                   	pop    %ebp
80106ace:	c3                   	ret    
        panic("kfree");
80106acf:	83 ec 0c             	sub    $0xc,%esp
80106ad2:	68 d2 74 10 80       	push   $0x801074d2
80106ad7:	e8 94 98 ff ff       	call   80100370 <panic>
80106adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106ae0 <seginit>:
{
80106ae0:	55                   	push   %ebp
80106ae1:	89 e5                	mov    %esp,%ebp
80106ae3:	53                   	push   %ebx
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106ae4:	31 db                	xor    %ebx,%ebx
{
80106ae6:	83 ec 14             	sub    $0x14,%esp
  c = &cpus[cpunum()];
80106ae9:	e8 f2 bb ff ff       	call   801026e0 <cpunum>
80106aee:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106af4:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106af9:	8d 90 60 28 11 80    	lea    -0x7feed7a0(%eax),%edx
80106aff:	c6 80 dd 28 11 80 9a 	movb   $0x9a,-0x7feed723(%eax)
80106b06:	c6 80 de 28 11 80 cf 	movb   $0xcf,-0x7feed722(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b0d:	c6 80 e5 28 11 80 92 	movb   $0x92,-0x7feed71b(%eax)
80106b14:	c6 80 e6 28 11 80 cf 	movb   $0xcf,-0x7feed71a(%eax)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106b1b:	66 89 4a 78          	mov    %cx,0x78(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b1f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106b24:	66 89 5a 7a          	mov    %bx,0x7a(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b28:	66 89 8a 80 00 00 00 	mov    %cx,0x80(%edx)
80106b2f:	31 db                	xor    %ebx,%ebx
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b31:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b36:	66 89 9a 82 00 00 00 	mov    %bx,0x82(%edx)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b3d:	66 89 8a 90 00 00 00 	mov    %cx,0x90(%edx)
80106b44:	31 db                	xor    %ebx,%ebx
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b46:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b4b:	66 89 9a 92 00 00 00 	mov    %bx,0x92(%edx)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b52:	31 db                	xor    %ebx,%ebx
80106b54:	66 89 8a 98 00 00 00 	mov    %cx,0x98(%edx)
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b5b:	8d 88 14 29 11 80    	lea    -0x7feed6ec(%eax),%ecx
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b61:	66 89 9a 9a 00 00 00 	mov    %bx,0x9a(%edx)
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b68:	31 db                	xor    %ebx,%ebx
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b6a:	c6 80 f5 28 11 80 fa 	movb   $0xfa,-0x7feed70b(%eax)
80106b71:	c6 80 f6 28 11 80 cf 	movb   $0xcf,-0x7feed70a(%eax)
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b78:	66 89 9a 88 00 00 00 	mov    %bx,0x88(%edx)
80106b7f:	66 89 8a 8a 00 00 00 	mov    %cx,0x8a(%edx)
80106b86:	89 cb                	mov    %ecx,%ebx
80106b88:	c1 e9 18             	shr    $0x18,%ecx
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b8b:	c6 80 fd 28 11 80 f2 	movb   $0xf2,-0x7feed703(%eax)
80106b92:	c6 80 fe 28 11 80 cf 	movb   $0xcf,-0x7feed702(%eax)
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b99:	88 8a 8f 00 00 00    	mov    %cl,0x8f(%edx)
80106b9f:	c6 80 ed 28 11 80 92 	movb   $0x92,-0x7feed713(%eax)
  pd[0] = size-1;
80106ba6:	b9 37 00 00 00       	mov    $0x37,%ecx
80106bab:	c6 80 ee 28 11 80 c0 	movb   $0xc0,-0x7feed712(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
80106bb2:	05 d0 28 11 80       	add    $0x801128d0,%eax
80106bb7:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106bbb:	c1 eb 10             	shr    $0x10,%ebx
  pd[1] = (uint)p;
80106bbe:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106bc2:	c1 e8 10             	shr    $0x10,%eax
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106bc5:	c6 42 7c 00          	movb   $0x0,0x7c(%edx)
80106bc9:	c6 42 7f 00          	movb   $0x0,0x7f(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106bcd:	c6 82 84 00 00 00 00 	movb   $0x0,0x84(%edx)
80106bd4:	c6 82 87 00 00 00 00 	movb   $0x0,0x87(%edx)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106bdb:	c6 82 94 00 00 00 00 	movb   $0x0,0x94(%edx)
80106be2:	c6 82 97 00 00 00 00 	movb   $0x0,0x97(%edx)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106be9:	c6 82 9c 00 00 00 00 	movb   $0x0,0x9c(%edx)
80106bf0:	c6 82 9f 00 00 00 00 	movb   $0x0,0x9f(%edx)
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106bf7:	88 9a 8c 00 00 00    	mov    %bl,0x8c(%edx)
80106bfd:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80106c01:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106c04:	0f 01 10             	lgdtl  (%eax)
  asm volatile("movw %0, %%gs" : : "r" (v));
80106c07:	b8 18 00 00 00       	mov    $0x18,%eax
80106c0c:	8e e8                	mov    %eax,%gs
  proc = 0;
80106c0e:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80106c15:	00 00 00 00 
  c = &cpus[cpunum()];
80106c19:	65 89 15 00 00 00 00 	mov    %edx,%gs:0x0
}
80106c20:	83 c4 14             	add    $0x14,%esp
80106c23:	5b                   	pop    %ebx
80106c24:	5d                   	pop    %ebp
80106c25:	c3                   	ret    
80106c26:	8d 76 00             	lea    0x0(%esi),%esi
80106c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c30 <setupkvm>:
{
80106c30:	55                   	push   %ebp
80106c31:	89 e5                	mov    %esp,%ebp
80106c33:	56                   	push   %esi
80106c34:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80106c35:	e8 36 b8 ff ff       	call   80102470 <kalloc>
80106c3a:	85 c0                	test   %eax,%eax
80106c3c:	74 52                	je     80106c90 <setupkvm+0x60>
  memset(pgdir, 0, PGSIZE);
80106c3e:	83 ec 04             	sub    $0x4,%esp
80106c41:	89 c6                	mov    %eax,%esi
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106c43:	bb 80 a4 10 80       	mov    $0x8010a480,%ebx
  memset(pgdir, 0, PGSIZE);
80106c48:	68 00 10 00 00       	push   $0x1000
80106c4d:	6a 00                	push   $0x0
80106c4f:	50                   	push   %eax
80106c50:	e8 cb da ff ff       	call   80104720 <memset>
80106c55:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0)
80106c58:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106c5b:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106c5e:	83 ec 08             	sub    $0x8,%esp
80106c61:	8b 13                	mov    (%ebx),%edx
80106c63:	ff 73 0c             	pushl  0xc(%ebx)
80106c66:	50                   	push   %eax
80106c67:	29 c1                	sub    %eax,%ecx
80106c69:	89 f0                	mov    %esi,%eax
80106c6b:	e8 40 fd ff ff       	call   801069b0 <mappages>
80106c70:	83 c4 10             	add    $0x10,%esp
80106c73:	85 c0                	test   %eax,%eax
80106c75:	78 19                	js     80106c90 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106c77:	83 c3 10             	add    $0x10,%ebx
80106c7a:	81 fb c0 a4 10 80    	cmp    $0x8010a4c0,%ebx
80106c80:	72 d6                	jb     80106c58 <setupkvm+0x28>
}
80106c82:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106c85:	89 f0                	mov    %esi,%eax
80106c87:	5b                   	pop    %ebx
80106c88:	5e                   	pop    %esi
80106c89:	5d                   	pop    %ebp
80106c8a:	c3                   	ret    
80106c8b:	90                   	nop
80106c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106c90:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
80106c93:	31 f6                	xor    %esi,%esi
}
80106c95:	89 f0                	mov    %esi,%eax
80106c97:	5b                   	pop    %ebx
80106c98:	5e                   	pop    %esi
80106c99:	5d                   	pop    %ebp
80106c9a:	c3                   	ret    
80106c9b:	90                   	nop
80106c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106ca0 <kvmalloc>:
{
80106ca0:	55                   	push   %ebp
80106ca1:	89 e5                	mov    %esp,%ebp
80106ca3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106ca6:	e8 85 ff ff ff       	call   80106c30 <setupkvm>
80106cab:	a3 e4 57 11 80       	mov    %eax,0x801157e4
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106cb0:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106cb5:	0f 22 d8             	mov    %eax,%cr3
}
80106cb8:	c9                   	leave  
80106cb9:	c3                   	ret    
80106cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106cc0 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106cc0:	a1 e4 57 11 80       	mov    0x801157e4,%eax
{
80106cc5:	55                   	push   %ebp
80106cc6:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106cc8:	05 00 00 00 80       	add    $0x80000000,%eax
80106ccd:	0f 22 d8             	mov    %eax,%cr3
}
80106cd0:	5d                   	pop    %ebp
80106cd1:	c3                   	ret    
80106cd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ce0 <switchuvm>:
{
80106ce0:	55                   	push   %ebp
80106ce1:	89 e5                	mov    %esp,%ebp
80106ce3:	53                   	push   %ebx
80106ce4:	83 ec 04             	sub    $0x4,%esp
80106ce7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
80106cea:	85 db                	test   %ebx,%ebx
80106cec:	0f 84 93 00 00 00    	je     80106d85 <switchuvm+0xa5>
  if(p->kstack == 0)
80106cf2:	8b 43 08             	mov    0x8(%ebx),%eax
80106cf5:	85 c0                	test   %eax,%eax
80106cf7:	0f 84 a2 00 00 00    	je     80106d9f <switchuvm+0xbf>
  if(p->pgdir == 0)
80106cfd:	8b 43 04             	mov    0x4(%ebx),%eax
80106d00:	85 c0                	test   %eax,%eax
80106d02:	0f 84 8a 00 00 00    	je     80106d92 <switchuvm+0xb2>
  pushcli();
80106d08:	e8 43 d9 ff ff       	call   80104650 <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106d0d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106d13:	b9 67 00 00 00       	mov    $0x67,%ecx
80106d18:	8d 50 08             	lea    0x8(%eax),%edx
80106d1b:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80106d22:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
  cpu->gdt[SEG_TSS].s = 0;
80106d29:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106d30:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
80106d37:	89 d1                	mov    %edx,%ecx
80106d39:	c1 ea 18             	shr    $0x18,%edx
80106d3c:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
80106d42:	c1 e9 10             	shr    $0x10,%ecx
  cpu->ts.ss0 = SEG_KDATA << 3;
80106d45:	ba 10 00 00 00       	mov    $0x10,%edx
80106d4a:	66 89 50 10          	mov    %dx,0x10(%eax)
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106d4e:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
  cpu->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106d54:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106d57:	8d 91 00 10 00 00    	lea    0x1000(%ecx),%edx
  cpu->ts.iomb = (ushort) 0xFFFF;
80106d5d:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106d62:	66 89 48 6e          	mov    %cx,0x6e(%eax)
  cpu->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106d66:	89 50 0c             	mov    %edx,0xc(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106d69:	b8 30 00 00 00       	mov    $0x30,%eax
80106d6e:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106d71:	8b 43 04             	mov    0x4(%ebx),%eax
80106d74:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106d79:	0f 22 d8             	mov    %eax,%cr3
}
80106d7c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106d7f:	c9                   	leave  
  popcli();
80106d80:	e9 fb d8 ff ff       	jmp    80104680 <popcli>
    panic("switchuvm: no process");
80106d85:	83 ec 0c             	sub    $0xc,%esp
80106d88:	68 b6 7c 10 80       	push   $0x80107cb6
80106d8d:	e8 de 95 ff ff       	call   80100370 <panic>
    panic("switchuvm: no pgdir");
80106d92:	83 ec 0c             	sub    $0xc,%esp
80106d95:	68 e1 7c 10 80       	push   $0x80107ce1
80106d9a:	e8 d1 95 ff ff       	call   80100370 <panic>
    panic("switchuvm: no kstack");
80106d9f:	83 ec 0c             	sub    $0xc,%esp
80106da2:	68 cc 7c 10 80       	push   $0x80107ccc
80106da7:	e8 c4 95 ff ff       	call   80100370 <panic>
80106dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106db0 <inituvm>:
{
80106db0:	55                   	push   %ebp
80106db1:	89 e5                	mov    %esp,%ebp
80106db3:	57                   	push   %edi
80106db4:	56                   	push   %esi
80106db5:	53                   	push   %ebx
80106db6:	83 ec 1c             	sub    $0x1c,%esp
80106db9:	8b 75 10             	mov    0x10(%ebp),%esi
80106dbc:	8b 45 08             	mov    0x8(%ebp),%eax
80106dbf:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
80106dc2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
{
80106dc8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
80106dcb:	77 49                	ja     80106e16 <inituvm+0x66>
  mem = kalloc();
80106dcd:	e8 9e b6 ff ff       	call   80102470 <kalloc>
  memset(mem, 0, PGSIZE);
80106dd2:	83 ec 04             	sub    $0x4,%esp
  mem = kalloc();
80106dd5:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106dd7:	68 00 10 00 00       	push   $0x1000
80106ddc:	6a 00                	push   $0x0
80106dde:	50                   	push   %eax
80106ddf:	e8 3c d9 ff ff       	call   80104720 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106de4:	58                   	pop    %eax
80106de5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106deb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106df0:	5a                   	pop    %edx
80106df1:	6a 06                	push   $0x6
80106df3:	50                   	push   %eax
80106df4:	31 d2                	xor    %edx,%edx
80106df6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106df9:	e8 b2 fb ff ff       	call   801069b0 <mappages>
  memmove(mem, init, sz);
80106dfe:	89 75 10             	mov    %esi,0x10(%ebp)
80106e01:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106e04:	83 c4 10             	add    $0x10,%esp
80106e07:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106e0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e0d:	5b                   	pop    %ebx
80106e0e:	5e                   	pop    %esi
80106e0f:	5f                   	pop    %edi
80106e10:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80106e11:	e9 ba d9 ff ff       	jmp    801047d0 <memmove>
    panic("inituvm: more than a page");
80106e16:	83 ec 0c             	sub    $0xc,%esp
80106e19:	68 f5 7c 10 80       	push   $0x80107cf5
80106e1e:	e8 4d 95 ff ff       	call   80100370 <panic>
80106e23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e30 <loaduvm>:
{
80106e30:	55                   	push   %ebp
80106e31:	89 e5                	mov    %esp,%ebp
80106e33:	57                   	push   %edi
80106e34:	56                   	push   %esi
80106e35:	53                   	push   %ebx
80106e36:	83 ec 0c             	sub    $0xc,%esp
  if((uint) addr % PGSIZE != 0)
80106e39:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106e40:	0f 85 91 00 00 00    	jne    80106ed7 <loaduvm+0xa7>
  for(i = 0; i < sz; i += PGSIZE){
80106e46:	8b 75 18             	mov    0x18(%ebp),%esi
80106e49:	31 db                	xor    %ebx,%ebx
80106e4b:	85 f6                	test   %esi,%esi
80106e4d:	75 1a                	jne    80106e69 <loaduvm+0x39>
80106e4f:	eb 6f                	jmp    80106ec0 <loaduvm+0x90>
80106e51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e58:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106e5e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106e64:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106e67:	76 57                	jbe    80106ec0 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106e69:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e6c:	8b 45 08             	mov    0x8(%ebp),%eax
80106e6f:	31 c9                	xor    %ecx,%ecx
80106e71:	01 da                	add    %ebx,%edx
80106e73:	e8 b8 fa ff ff       	call   80106930 <walkpgdir>
80106e78:	85 c0                	test   %eax,%eax
80106e7a:	74 4e                	je     80106eca <loaduvm+0x9a>
    pa = PTE_ADDR(*pte);
80106e7c:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106e7e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    if(sz - i < PGSIZE)
80106e81:	bf 00 10 00 00       	mov    $0x1000,%edi
    pa = PTE_ADDR(*pte);
80106e86:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106e8b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106e91:	0f 46 fe             	cmovbe %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106e94:	01 d9                	add    %ebx,%ecx
80106e96:	05 00 00 00 80       	add    $0x80000000,%eax
80106e9b:	57                   	push   %edi
80106e9c:	51                   	push   %ecx
80106e9d:	50                   	push   %eax
80106e9e:	ff 75 10             	pushl  0x10(%ebp)
80106ea1:	e8 6a aa ff ff       	call   80101910 <readi>
80106ea6:	83 c4 10             	add    $0x10,%esp
80106ea9:	39 c7                	cmp    %eax,%edi
80106eab:	74 ab                	je     80106e58 <loaduvm+0x28>
}
80106ead:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106eb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106eb5:	5b                   	pop    %ebx
80106eb6:	5e                   	pop    %esi
80106eb7:	5f                   	pop    %edi
80106eb8:	5d                   	pop    %ebp
80106eb9:	c3                   	ret    
80106eba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ec0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106ec3:	31 c0                	xor    %eax,%eax
}
80106ec5:	5b                   	pop    %ebx
80106ec6:	5e                   	pop    %esi
80106ec7:	5f                   	pop    %edi
80106ec8:	5d                   	pop    %ebp
80106ec9:	c3                   	ret    
      panic("loaduvm: address should exist");
80106eca:	83 ec 0c             	sub    $0xc,%esp
80106ecd:	68 0f 7d 10 80       	push   $0x80107d0f
80106ed2:	e8 99 94 ff ff       	call   80100370 <panic>
    panic("loaduvm: addr must be page aligned");
80106ed7:	83 ec 0c             	sub    $0xc,%esp
80106eda:	68 b0 7d 10 80       	push   $0x80107db0
80106edf:	e8 8c 94 ff ff       	call   80100370 <panic>
80106ee4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106eea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ef0 <allocuvm>:
{
80106ef0:	55                   	push   %ebp
80106ef1:	89 e5                	mov    %esp,%ebp
80106ef3:	57                   	push   %edi
80106ef4:	56                   	push   %esi
80106ef5:	53                   	push   %ebx
80106ef6:	83 ec 0c             	sub    $0xc,%esp
80106ef9:	8b 7d 10             	mov    0x10(%ebp),%edi
  if(newsz >= KERNBASE)
80106efc:	85 ff                	test   %edi,%edi
80106efe:	78 7b                	js     80106f7b <allocuvm+0x8b>
  if(newsz < oldsz)
80106f00:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106f03:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(newsz < oldsz)
80106f06:	72 75                	jb     80106f7d <allocuvm+0x8d>
  a = PGROUNDUP(oldsz);
80106f08:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106f0e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106f14:	39 df                	cmp    %ebx,%edi
80106f16:	77 43                	ja     80106f5b <allocuvm+0x6b>
80106f18:	eb 6e                	jmp    80106f88 <allocuvm+0x98>
80106f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    memset(mem, 0, PGSIZE);
80106f20:	83 ec 04             	sub    $0x4,%esp
80106f23:	68 00 10 00 00       	push   $0x1000
80106f28:	6a 00                	push   $0x0
80106f2a:	50                   	push   %eax
80106f2b:	e8 f0 d7 ff ff       	call   80104720 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106f30:	58                   	pop    %eax
80106f31:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106f37:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106f3c:	5a                   	pop    %edx
80106f3d:	6a 06                	push   $0x6
80106f3f:	50                   	push   %eax
80106f40:	89 da                	mov    %ebx,%edx
80106f42:	8b 45 08             	mov    0x8(%ebp),%eax
80106f45:	e8 66 fa ff ff       	call   801069b0 <mappages>
80106f4a:	83 c4 10             	add    $0x10,%esp
80106f4d:	85 c0                	test   %eax,%eax
80106f4f:	78 47                	js     80106f98 <allocuvm+0xa8>
  for(; a < newsz; a += PGSIZE){
80106f51:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106f57:	39 df                	cmp    %ebx,%edi
80106f59:	76 2d                	jbe    80106f88 <allocuvm+0x98>
    mem = kalloc();
80106f5b:	e8 10 b5 ff ff       	call   80102470 <kalloc>
    if(mem == 0){
80106f60:	85 c0                	test   %eax,%eax
    mem = kalloc();
80106f62:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106f64:	75 ba                	jne    80106f20 <allocuvm+0x30>
      cprintf("allocuvm out of memory\n");
80106f66:	83 ec 0c             	sub    $0xc,%esp
80106f69:	68 2d 7d 10 80       	push   $0x80107d2d
80106f6e:	e8 ed 96 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106f73:	83 c4 10             	add    $0x10,%esp
80106f76:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106f79:	77 4f                	ja     80106fca <allocuvm+0xda>
      return 0;
80106f7b:	31 c0                	xor    %eax,%eax
}
80106f7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f80:	5b                   	pop    %ebx
80106f81:	5e                   	pop    %esi
80106f82:	5f                   	pop    %edi
80106f83:	5d                   	pop    %ebp
80106f84:	c3                   	ret    
80106f85:	8d 76 00             	lea    0x0(%esi),%esi
80106f88:	8d 65 f4             	lea    -0xc(%ebp),%esp
  for(; a < newsz; a += PGSIZE){
80106f8b:	89 f8                	mov    %edi,%eax
}
80106f8d:	5b                   	pop    %ebx
80106f8e:	5e                   	pop    %esi
80106f8f:	5f                   	pop    %edi
80106f90:	5d                   	pop    %ebp
80106f91:	c3                   	ret    
80106f92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
80106f98:	83 ec 0c             	sub    $0xc,%esp
80106f9b:	68 45 7d 10 80       	push   $0x80107d45
80106fa0:	e8 bb 96 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106fa5:	83 c4 10             	add    $0x10,%esp
80106fa8:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106fab:	76 0d                	jbe    80106fba <allocuvm+0xca>
80106fad:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106fb0:	8b 45 08             	mov    0x8(%ebp),%eax
80106fb3:	89 fa                	mov    %edi,%edx
80106fb5:	e8 86 fa ff ff       	call   80106a40 <deallocuvm.part.0>
      kfree(mem);
80106fba:	83 ec 0c             	sub    $0xc,%esp
80106fbd:	56                   	push   %esi
80106fbe:	e8 fd b2 ff ff       	call   801022c0 <kfree>
      return 0;
80106fc3:	83 c4 10             	add    $0x10,%esp
80106fc6:	31 c0                	xor    %eax,%eax
80106fc8:	eb b3                	jmp    80106f7d <allocuvm+0x8d>
80106fca:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106fcd:	8b 45 08             	mov    0x8(%ebp),%eax
80106fd0:	89 fa                	mov    %edi,%edx
80106fd2:	e8 69 fa ff ff       	call   80106a40 <deallocuvm.part.0>
      return 0;
80106fd7:	31 c0                	xor    %eax,%eax
80106fd9:	eb a2                	jmp    80106f7d <allocuvm+0x8d>
80106fdb:	90                   	nop
80106fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106fe0 <deallocuvm>:
{
80106fe0:	55                   	push   %ebp
80106fe1:	89 e5                	mov    %esp,%ebp
80106fe3:	8b 55 0c             	mov    0xc(%ebp),%edx
80106fe6:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106fe9:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
80106fec:	39 d1                	cmp    %edx,%ecx
80106fee:	73 10                	jae    80107000 <deallocuvm+0x20>
}
80106ff0:	5d                   	pop    %ebp
80106ff1:	e9 4a fa ff ff       	jmp    80106a40 <deallocuvm.part.0>
80106ff6:	8d 76 00             	lea    0x0(%esi),%esi
80106ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107000:	89 d0                	mov    %edx,%eax
80107002:	5d                   	pop    %ebp
80107003:	c3                   	ret    
80107004:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010700a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107010 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80107010:	55                   	push   %ebp
80107011:	89 e5                	mov    %esp,%ebp
80107013:	57                   	push   %edi
80107014:	56                   	push   %esi
80107015:	53                   	push   %ebx
80107016:	83 ec 0c             	sub    $0xc,%esp
80107019:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
8010701c:	85 f6                	test   %esi,%esi
8010701e:	74 59                	je     80107079 <freevm+0x69>
80107020:	31 c9                	xor    %ecx,%ecx
80107022:	ba 00 00 00 80       	mov    $0x80000000,%edx
80107027:	89 f0                	mov    %esi,%eax
80107029:	e8 12 fa ff ff       	call   80106a40 <deallocuvm.part.0>
8010702e:	89 f3                	mov    %esi,%ebx
80107030:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80107036:	eb 0f                	jmp    80107047 <freevm+0x37>
80107038:	90                   	nop
80107039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107040:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80107043:	39 fb                	cmp    %edi,%ebx
80107045:	74 23                	je     8010706a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80107047:	8b 03                	mov    (%ebx),%eax
80107049:	a8 01                	test   $0x1,%al
8010704b:	74 f3                	je     80107040 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
8010704d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
80107052:	83 ec 0c             	sub    $0xc,%esp
80107055:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
80107058:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
8010705d:	50                   	push   %eax
8010705e:	e8 5d b2 ff ff       	call   801022c0 <kfree>
80107063:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
80107066:	39 fb                	cmp    %edi,%ebx
80107068:	75 dd                	jne    80107047 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
8010706a:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010706d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107070:	5b                   	pop    %ebx
80107071:	5e                   	pop    %esi
80107072:	5f                   	pop    %edi
80107073:	5d                   	pop    %ebp
  kfree((char*)pgdir);
80107074:	e9 47 b2 ff ff       	jmp    801022c0 <kfree>
    panic("freevm: no pgdir");
80107079:	83 ec 0c             	sub    $0xc,%esp
8010707c:	68 61 7d 10 80       	push   $0x80107d61
80107081:	e8 ea 92 ff ff       	call   80100370 <panic>
80107086:	8d 76 00             	lea    0x0(%esi),%esi
80107089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107090 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80107090:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107091:	31 c9                	xor    %ecx,%ecx
{
80107093:	89 e5                	mov    %esp,%ebp
80107095:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80107098:	8b 55 0c             	mov    0xc(%ebp),%edx
8010709b:	8b 45 08             	mov    0x8(%ebp),%eax
8010709e:	e8 8d f8 ff ff       	call   80106930 <walkpgdir>
  if(pte == 0)
801070a3:	85 c0                	test   %eax,%eax
801070a5:	74 05                	je     801070ac <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
801070a7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801070aa:	c9                   	leave  
801070ab:	c3                   	ret    
    panic("clearpteu");
801070ac:	83 ec 0c             	sub    $0xc,%esp
801070af:	68 72 7d 10 80       	push   $0x80107d72
801070b4:	e8 b7 92 ff ff       	call   80100370 <panic>
801070b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801070c0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
801070c0:	55                   	push   %ebp
801070c1:	89 e5                	mov    %esp,%ebp
801070c3:	57                   	push   %edi
801070c4:	56                   	push   %esi
801070c5:	53                   	push   %ebx
801070c6:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
801070c9:	e8 62 fb ff ff       	call   80106c30 <setupkvm>
801070ce:	85 c0                	test   %eax,%eax
801070d0:	89 45 e0             	mov    %eax,-0x20(%ebp)
801070d3:	0f 84 a0 00 00 00    	je     80107179 <copyuvm+0xb9>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
801070d9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801070dc:	85 c9                	test   %ecx,%ecx
801070de:	0f 84 95 00 00 00    	je     80107179 <copyuvm+0xb9>
801070e4:	31 f6                	xor    %esi,%esi
801070e6:	eb 4e                	jmp    80107136 <copyuvm+0x76>
801070e8:	90                   	nop
801070e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
801070f0:	83 ec 04             	sub    $0x4,%esp
801070f3:	81 c7 00 00 00 80    	add    $0x80000000,%edi
801070f9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801070fc:	68 00 10 00 00       	push   $0x1000
80107101:	57                   	push   %edi
80107102:	50                   	push   %eax
80107103:	e8 c8 d6 ff ff       	call   801047d0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80107108:	58                   	pop    %eax
80107109:	5a                   	pop    %edx
8010710a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010710d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80107110:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107115:	53                   	push   %ebx
80107116:	81 c2 00 00 00 80    	add    $0x80000000,%edx
8010711c:	52                   	push   %edx
8010711d:	89 f2                	mov    %esi,%edx
8010711f:	e8 8c f8 ff ff       	call   801069b0 <mappages>
80107124:	83 c4 10             	add    $0x10,%esp
80107127:	85 c0                	test   %eax,%eax
80107129:	78 39                	js     80107164 <copyuvm+0xa4>
  for(i = 0; i < sz; i += PGSIZE){
8010712b:	81 c6 00 10 00 00    	add    $0x1000,%esi
80107131:	39 75 0c             	cmp    %esi,0xc(%ebp)
80107134:	76 43                	jbe    80107179 <copyuvm+0xb9>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107136:	8b 45 08             	mov    0x8(%ebp),%eax
80107139:	31 c9                	xor    %ecx,%ecx
8010713b:	89 f2                	mov    %esi,%edx
8010713d:	e8 ee f7 ff ff       	call   80106930 <walkpgdir>
80107142:	85 c0                	test   %eax,%eax
80107144:	74 3e                	je     80107184 <copyuvm+0xc4>
    if(!(*pte & PTE_P))
80107146:	8b 18                	mov    (%eax),%ebx
80107148:	f6 c3 01             	test   $0x1,%bl
8010714b:	74 44                	je     80107191 <copyuvm+0xd1>
    pa = PTE_ADDR(*pte);
8010714d:	89 df                	mov    %ebx,%edi
    flags = PTE_FLAGS(*pte);
8010714f:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
    pa = PTE_ADDR(*pte);
80107155:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    if((mem = kalloc()) == 0)
8010715b:	e8 10 b3 ff ff       	call   80102470 <kalloc>
80107160:	85 c0                	test   %eax,%eax
80107162:	75 8c                	jne    801070f0 <copyuvm+0x30>
      goto bad;
  }
  return d;

bad:
  freevm(d);
80107164:	83 ec 0c             	sub    $0xc,%esp
80107167:	ff 75 e0             	pushl  -0x20(%ebp)
8010716a:	e8 a1 fe ff ff       	call   80107010 <freevm>
  return 0;
8010716f:	83 c4 10             	add    $0x10,%esp
80107172:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
80107179:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010717c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010717f:	5b                   	pop    %ebx
80107180:	5e                   	pop    %esi
80107181:	5f                   	pop    %edi
80107182:	5d                   	pop    %ebp
80107183:	c3                   	ret    
      panic("copyuvm: pte should exist");
80107184:	83 ec 0c             	sub    $0xc,%esp
80107187:	68 7c 7d 10 80       	push   $0x80107d7c
8010718c:	e8 df 91 ff ff       	call   80100370 <panic>
      panic("copyuvm: page not present");
80107191:	83 ec 0c             	sub    $0xc,%esp
80107194:	68 96 7d 10 80       	push   $0x80107d96
80107199:	e8 d2 91 ff ff       	call   80100370 <panic>
8010719e:	66 90                	xchg   %ax,%ax

801071a0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801071a0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801071a1:	31 c9                	xor    %ecx,%ecx
{
801071a3:	89 e5                	mov    %esp,%ebp
801071a5:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
801071a8:	8b 55 0c             	mov    0xc(%ebp),%edx
801071ab:	8b 45 08             	mov    0x8(%ebp),%eax
801071ae:	e8 7d f7 ff ff       	call   80106930 <walkpgdir>
  if((*pte & PTE_P) == 0)
801071b3:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
801071b5:	c9                   	leave  
  if((*pte & PTE_U) == 0)
801071b6:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
801071b8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
801071bd:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
801071c0:	05 00 00 00 80       	add    $0x80000000,%eax
801071c5:	83 fa 05             	cmp    $0x5,%edx
801071c8:	ba 00 00 00 00       	mov    $0x0,%edx
801071cd:	0f 45 c2             	cmovne %edx,%eax
}
801071d0:	c3                   	ret    
801071d1:	eb 0d                	jmp    801071e0 <copyout>
801071d3:	90                   	nop
801071d4:	90                   	nop
801071d5:	90                   	nop
801071d6:	90                   	nop
801071d7:	90                   	nop
801071d8:	90                   	nop
801071d9:	90                   	nop
801071da:	90                   	nop
801071db:	90                   	nop
801071dc:	90                   	nop
801071dd:	90                   	nop
801071de:	90                   	nop
801071df:	90                   	nop

801071e0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
801071e0:	55                   	push   %ebp
801071e1:	89 e5                	mov    %esp,%ebp
801071e3:	57                   	push   %edi
801071e4:	56                   	push   %esi
801071e5:	53                   	push   %ebx
801071e6:	83 ec 1c             	sub    $0x1c,%esp
801071e9:	8b 5d 14             	mov    0x14(%ebp),%ebx
801071ec:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801071ef:	8b 7d 10             	mov    0x10(%ebp),%edi
801071f2:	85 db                	test   %ebx,%ebx
801071f4:	75 40                	jne    80107236 <copyout+0x56>
801071f6:	eb 70                	jmp    80107268 <copyout+0x88>
801071f8:	90                   	nop
801071f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107200:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107203:	89 f1                	mov    %esi,%ecx
80107205:	29 d1                	sub    %edx,%ecx
80107207:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010720d:	39 d9                	cmp    %ebx,%ecx
8010720f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107212:	29 f2                	sub    %esi,%edx
80107214:	83 ec 04             	sub    $0x4,%esp
80107217:	01 d0                	add    %edx,%eax
80107219:	51                   	push   %ecx
8010721a:	57                   	push   %edi
8010721b:	50                   	push   %eax
8010721c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010721f:	e8 ac d5 ff ff       	call   801047d0 <memmove>
    len -= n;
    buf += n;
80107224:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  while(len > 0){
80107227:	83 c4 10             	add    $0x10,%esp
    va = va0 + PGSIZE;
8010722a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    buf += n;
80107230:	01 cf                	add    %ecx,%edi
  while(len > 0){
80107232:	29 cb                	sub    %ecx,%ebx
80107234:	74 32                	je     80107268 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80107236:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107238:	83 ec 08             	sub    $0x8,%esp
    va0 = (uint)PGROUNDDOWN(va);
8010723b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010723e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107244:	56                   	push   %esi
80107245:	ff 75 08             	pushl  0x8(%ebp)
80107248:	e8 53 ff ff ff       	call   801071a0 <uva2ka>
    if(pa0 == 0)
8010724d:	83 c4 10             	add    $0x10,%esp
80107250:	85 c0                	test   %eax,%eax
80107252:	75 ac                	jne    80107200 <copyout+0x20>
  }
  return 0;
}
80107254:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80107257:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010725c:	5b                   	pop    %ebx
8010725d:	5e                   	pop    %esi
8010725e:	5f                   	pop    %edi
8010725f:	5d                   	pop    %ebp
80107260:	c3                   	ret    
80107261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107268:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010726b:	31 c0                	xor    %eax,%eax
}
8010726d:	5b                   	pop    %ebx
8010726e:	5e                   	pop    %esi
8010726f:	5f                   	pop    %edi
80107270:	5d                   	pop    %ebp
80107271:	c3                   	ret    
