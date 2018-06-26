
kernel:     formato del fichero elf32-i386


Desensamblado de la sección .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc 30 b6 10 80       	mov    $0x8010b630,%esp
8010002d:	b8 60 2e 10 80       	mov    $0x80102e60,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb d4 b6 10 80       	mov    $0x8010b6d4,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 40 71 10 80       	push   $0x80107140
80100051:	68 a0 b6 10 80       	push   $0x8010b6a0
80100056:	e8 15 43 00 00       	call   80104370 <initlock>
8010005b:	c7 05 ec fd 10 80 9c 	movl   $0x8010fd9c,0x8010fdec
80100062:	fd 10 80 
80100065:	c7 05 f0 fd 10 80 9c 	movl   $0x8010fd9c,0x8010fdf0
8010006c:	fd 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba 9c fd 10 80       	mov    $0x8010fd9c,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 9c fd 10 80 	movl   $0x8010fd9c,0x50(%ebx)
80100092:	68 47 71 10 80       	push   $0x80107147
80100097:	50                   	push   %eax
80100098:	e8 c3 41 00 00       	call   80104260 <initsleeplock>
8010009d:	a1 f0 fd 10 80       	mov    0x8010fdf0,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d f0 fd 10 80    	mov    %ebx,0x8010fdf0
801000b6:	3d 9c fd 10 80       	cmp    $0x8010fd9c,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 a0 b6 10 80       	push   $0x8010b6a0
801000e4:	e8 87 43 00 00       	call   80104470 <acquire>
801000e9:	8b 1d f0 fd 10 80    	mov    0x8010fdf0,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 9c fd 10 80    	cmp    $0x8010fd9c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 9c fd 10 80    	cmp    $0x8010fd9c,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d ec fd 10 80    	mov    0x8010fdec,%ebx
80100126:	81 fb 9c fd 10 80    	cmp    $0x8010fd9c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 9c fd 10 80    	cmp    $0x8010fd9c,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 a0 b6 10 80       	push   $0x8010b6a0
80100162:	e8 29 44 00 00       	call   80104590 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 2e 41 00 00       	call   801042a0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 6d 1f 00 00       	call   801020f0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 4e 71 10 80       	push   $0x8010714e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 8d 41 00 00       	call   80104340 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 27 1f 00 00       	jmp    801020f0 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 5f 71 10 80       	push   $0x8010715f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 4c 41 00 00       	call   80104340 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 fc 40 00 00       	call   80104300 <releasesleep>
80100204:	c7 04 24 a0 b6 10 80 	movl   $0x8010b6a0,(%esp)
8010020b:	e8 60 42 00 00       	call   80104470 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 f0 fd 10 80       	mov    0x8010fdf0,%eax
80100237:	c7 43 50 9c fd 10 80 	movl   $0x8010fd9c,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 f0 fd 10 80       	mov    0x8010fdf0,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d f0 fd 10 80    	mov    %ebx,0x8010fdf0
8010024f:	c7 45 08 a0 b6 10 80 	movl   $0x8010b6a0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 2f 43 00 00       	jmp    80104590 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 66 71 10 80       	push   $0x80107166
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 cb 14 00 00       	call   80101750 <iunlock>
80100285:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
8010028c:	e8 df 41 00 00       	call   80104470 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
801002a1:	a1 80 00 11 80       	mov    0x80110080,%eax
801002a6:	3b 05 84 00 11 80    	cmp    0x80110084,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 80 a5 10 80       	push   $0x8010a580
801002b8:	68 80 00 11 80       	push   $0x80110080
801002bd:	e8 9e 3a 00 00       	call   80103d60 <sleep>
801002c2:	a1 80 00 11 80       	mov    0x80110080,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 84 00 11 80    	cmp    0x80110084,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
801002d2:	e8 b9 34 00 00       	call   80103790 <myproc>
801002d7:	8b 40 24             	mov    0x24(%eax),%eax
801002da:	85 c0                	test   %eax,%eax
801002dc:	74 d2                	je     801002b0 <consoleread+0x40>
801002de:	83 ec 0c             	sub    $0xc,%esp
801002e1:	68 80 a5 10 80       	push   $0x8010a580
801002e6:	e8 a5 42 00 00       	call   80104590 <release>
801002eb:	89 3c 24             	mov    %edi,(%esp)
801002ee:	e8 7d 13 00 00       	call   80101670 <ilock>
801002f3:	83 c4 10             	add    $0x10,%esp
801002f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801002fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002fe:	5b                   	pop    %ebx
801002ff:	5e                   	pop    %esi
80100300:	5f                   	pop    %edi
80100301:	5d                   	pop    %ebp
80100302:	c3                   	ret    
80100303:	90                   	nop
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 80 00 11 80    	mov    %edx,0x80110080
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 00 00 11 80 	movsbl -0x7fef0000(%edx),%edx
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
80100322:	83 c6 01             	add    $0x1,%esi
80100325:	83 eb 01             	sub    $0x1,%ebx
80100328:	83 fa 0a             	cmp    $0xa,%edx
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 80 a5 10 80       	push   $0x8010a580
80100346:	e8 45 42 00 00       	call   80104590 <release>
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 1d 13 00 00       	call   80101670 <ilock>
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a0                	jmp    801002fb <consoleread+0x8b>
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
80100360:	a3 80 00 11 80       	mov    %eax,0x80110080
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 30             	sub    $0x30,%esp
80100378:	fa                   	cli    
80100379:	c7 05 b4 a5 10 80 00 	movl   $0x0,0x8010a5b4
80100380:	00 00 00 
80100383:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100386:	8d 75 f8             	lea    -0x8(%ebp),%esi
80100389:	e8 62 23 00 00       	call   801026f0 <lapicid>
8010038e:	83 ec 08             	sub    $0x8,%esp
80100391:	50                   	push   %eax
80100392:	68 6d 71 10 80       	push   $0x8010716d
80100397:	e8 c4 02 00 00       	call   80100660 <cprintf>
8010039c:	58                   	pop    %eax
8010039d:	ff 75 08             	pushl  0x8(%ebp)
801003a0:	e8 bb 02 00 00       	call   80100660 <cprintf>
801003a5:	c7 04 24 bf 7b 10 80 	movl   $0x80107bbf,(%esp)
801003ac:	e8 af 02 00 00       	call   80100660 <cprintf>
801003b1:	5a                   	pop    %edx
801003b2:	8d 45 08             	lea    0x8(%ebp),%eax
801003b5:	59                   	pop    %ecx
801003b6:	53                   	push   %ebx
801003b7:	50                   	push   %eax
801003b8:	e8 d3 3f 00 00       	call   80104390 <getcallerpcs>
801003bd:	83 c4 10             	add    $0x10,%esp
801003c0:	83 ec 08             	sub    $0x8,%esp
801003c3:	ff 33                	pushl  (%ebx)
801003c5:	83 c3 04             	add    $0x4,%ebx
801003c8:	68 81 71 10 80       	push   $0x80107181
801003cd:	e8 8e 02 00 00       	call   80100660 <cprintf>
801003d2:	83 c4 10             	add    $0x10,%esp
801003d5:	39 f3                	cmp    %esi,%ebx
801003d7:	75 e7                	jne    801003c0 <panic+0x50>
801003d9:	c7 05 b8 a5 10 80 01 	movl   $0x1,0x8010a5b8
801003e0:	00 00 00 
801003e3:	eb fe                	jmp    801003e3 <panic+0x73>
801003e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801003e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801003f0 <consputc>:
801003f0:	8b 15 b8 a5 10 80    	mov    0x8010a5b8,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 e1 58 00 00       	call   80105d00 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
80100437:	0f b6 c0             	movzbl %al,%eax
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
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
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 28 58 00 00       	call   80105d00 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 1c 58 00 00       	call   80105d00 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 10 58 00 00       	call   80105d00 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>
801004f8:	83 ec 04             	sub    $0x4,%esp
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi
80100514:	e8 77 41 00 00       	call   80104690 <memmove>
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 b2 40 00 00       	call   801045e0 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 85 71 10 80       	push   $0x80107185
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
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
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 b0 71 10 80 	movzbl -0x7fef8e50(%edx),%edx
801005b8:	85 c0                	test   %eax,%eax
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	ff 75 08             	pushl  0x8(%ebp)
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
8010060f:	e8 3c 11 00 00       	call   80101750 <iunlock>
80100614:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
8010061b:	e8 50 3e 00 00       	call   80104470 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 80 a5 10 80       	push   $0x8010a580
80100647:	e8 44 3f 00 00       	call   80104590 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 1b 10 00 00       	call   80101670 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 b4 a5 10 80       	mov    0x8010a5b4,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 80 a5 10 80       	push   $0x8010a580
8010070d:	e8 7e 3e 00 00       	call   80104590 <release>
80100712:	83 c4 10             	add    $0x10,%esp
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100788:	b8 98 71 10 80       	mov    $0x80107198,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 80 a5 10 80       	push   $0x8010a580
801007c8:	e8 a3 3c 00 00       	call   80104470 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 9f 71 10 80       	push   $0x8010719f
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
801007f6:	31 f6                	xor    %esi,%esi
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801007fe:	68 80 a5 10 80       	push   $0x8010a580
80100803:	e8 68 3c 00 00       	call   80104470 <acquire>
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
80100831:	a1 88 00 11 80       	mov    0x80110088,%eax
80100836:	3b 05 84 00 11 80    	cmp    0x80110084,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 88 00 11 80       	mov    %eax,0x80110088
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 80 a5 10 80       	push   $0x8010a580
80100868:	e8 23 3d 00 00       	call   80104590 <release>
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 88 00 11 80       	mov    0x80110088,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 80 00 11 80    	sub    0x80110080,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
801008a5:	83 ff 0d             	cmp    $0xd,%edi
801008a8:	89 15 88 00 11 80    	mov    %edx,0x80110088
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 00 00 11 80    	mov    %cl,-0x7fef0000(%eax)
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 80 00 11 80       	mov    0x80110080,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 88 00 11 80    	cmp    %eax,0x80110088
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
801008e9:	83 ec 0c             	sub    $0xc,%esp
801008ec:	a3 84 00 11 80       	mov    %eax,0x80110084
801008f1:	68 80 00 11 80       	push   $0x80110080
801008f6:	e8 25 36 00 00       	call   80103f20 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100908:	a1 88 00 11 80       	mov    0x80110088,%eax
8010090d:	39 05 84 00 11 80    	cmp    %eax,0x80110084
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100920:	a3 88 00 11 80       	mov    %eax,0x80110088
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
8010092f:	a1 88 00 11 80       	mov    0x80110088,%eax
80100934:	3b 05 84 00 11 80    	cmp    0x80110084,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
80100948:	80 ba 00 00 11 80 0a 	cmpb   $0xa,-0x7fef0000(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
80100977:	e9 94 36 00 00       	jmp    80104010 <procdump>
8010097c:	c6 80 00 00 11 80 0a 	movb   $0xa,-0x7fef0000(%eax)
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 88 00 11 80       	mov    0x80110088,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
801009a6:	68 a8 71 10 80       	push   $0x801071a8
801009ab:	68 80 a5 10 80       	push   $0x8010a580
801009b0:	e8 bb 39 00 00       	call   80104370 <initlock>
801009b5:	58                   	pop    %eax
801009b6:	5a                   	pop    %edx
801009b7:	6a 00                	push   $0x0
801009b9:	6a 01                	push   $0x1
801009bb:	c7 05 4c 0a 11 80 00 	movl   $0x80100600,0x80110a4c
801009c2:	06 10 80 
801009c5:	c7 05 48 0a 11 80 70 	movl   $0x80100270,0x80110a48
801009cc:	02 10 80 
801009cf:	c7 05 b4 a5 10 80 01 	movl   $0x1,0x8010a5b4
801009d6:	00 00 00 
801009d9:	e8 c2 18 00 00       	call   801022a0 <ioapicenable>
801009de:	83 c4 10             	add    $0x10,%esp
801009e1:	c9                   	leave  
801009e2:	c3                   	ret    
801009e3:	66 90                	xchg   %ax,%ax
801009e5:	66 90                	xchg   %ax,%ax
801009e7:	66 90                	xchg   %ax,%ax
801009e9:	66 90                	xchg   %ax,%ax
801009eb:	66 90                	xchg   %ax,%ax
801009ed:	66 90                	xchg   %ax,%ax
801009ef:	90                   	nop

801009f0 <exec>:
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
801009fc:	e8 8f 2d 00 00       	call   80103790 <myproc>
80100a01:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a07:	e8 44 21 00 00       	call   80102b50 <begin_op>
80100a0c:	83 ec 0c             	sub    $0xc,%esp
80100a0f:	ff 75 08             	pushl  0x8(%ebp)
80100a12:	e8 a9 14 00 00       	call   80101ec0 <namei>
80100a17:	83 c4 10             	add    $0x10,%esp
80100a1a:	85 c0                	test   %eax,%eax
80100a1c:	0f 84 9c 01 00 00    	je     80100bbe <exec+0x1ce>
80100a22:	83 ec 0c             	sub    $0xc,%esp
80100a25:	89 c3                	mov    %eax,%ebx
80100a27:	50                   	push   %eax
80100a28:	e8 43 0c 00 00       	call   80101670 <ilock>
80100a2d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a33:	6a 34                	push   $0x34
80100a35:	6a 00                	push   $0x0
80100a37:	50                   	push   %eax
80100a38:	53                   	push   %ebx
80100a39:	e8 12 0f 00 00       	call   80101950 <readi>
80100a3e:	83 c4 20             	add    $0x20,%esp
80100a41:	83 f8 34             	cmp    $0x34,%eax
80100a44:	74 22                	je     80100a68 <exec+0x78>
80100a46:	83 ec 0c             	sub    $0xc,%esp
80100a49:	53                   	push   %ebx
80100a4a:	e8 b1 0e 00 00       	call   80101900 <iunlockput>
80100a4f:	e8 6c 21 00 00       	call   80102bc0 <end_op>
80100a54:	83 c4 10             	add    $0x10,%esp
80100a57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a5f:	5b                   	pop    %ebx
80100a60:	5e                   	pop    %esi
80100a61:	5f                   	pop    %edi
80100a62:	5d                   	pop    %ebp
80100a63:	c3                   	ret    
80100a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100a68:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a6f:	45 4c 46 
80100a72:	75 d2                	jne    80100a46 <exec+0x56>
80100a74:	e8 17 64 00 00       	call   80106e90 <setupkvm>
80100a79:	85 c0                	test   %eax,%eax
80100a7b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a81:	74 c3                	je     80100a46 <exec+0x56>
80100a83:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a8a:	00 
80100a8b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a91:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80100a98:	00 00 00 
80100a9b:	0f 84 c5 00 00 00    	je     80100b66 <exec+0x176>
80100aa1:	31 ff                	xor    %edi,%edi
80100aa3:	eb 18                	jmp    80100abd <exec+0xcd>
80100aa5:	8d 76 00             	lea    0x0(%esi),%esi
80100aa8:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100aaf:	83 c7 01             	add    $0x1,%edi
80100ab2:	83 c6 20             	add    $0x20,%esi
80100ab5:	39 f8                	cmp    %edi,%eax
80100ab7:	0f 8e a9 00 00 00    	jle    80100b66 <exec+0x176>
80100abd:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100ac3:	6a 20                	push   $0x20
80100ac5:	56                   	push   %esi
80100ac6:	50                   	push   %eax
80100ac7:	53                   	push   %ebx
80100ac8:	e8 83 0e 00 00       	call   80101950 <readi>
80100acd:	83 c4 10             	add    $0x10,%esp
80100ad0:	83 f8 20             	cmp    $0x20,%eax
80100ad3:	75 7b                	jne    80100b50 <exec+0x160>
80100ad5:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100adc:	75 ca                	jne    80100aa8 <exec+0xb8>
80100ade:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ae4:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100aea:	72 64                	jb     80100b50 <exec+0x160>
80100aec:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100af2:	72 5c                	jb     80100b50 <exec+0x160>
80100af4:	83 ec 04             	sub    $0x4,%esp
80100af7:	50                   	push   %eax
80100af8:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100afe:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b04:	e8 d7 61 00 00       	call   80106ce0 <allocuvm>
80100b09:	83 c4 10             	add    $0x10,%esp
80100b0c:	85 c0                	test   %eax,%eax
80100b0e:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b14:	74 3a                	je     80100b50 <exec+0x160>
80100b16:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b1c:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b21:	75 2d                	jne    80100b50 <exec+0x160>
80100b23:	83 ec 0c             	sub    $0xc,%esp
80100b26:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b2c:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b32:	53                   	push   %ebx
80100b33:	50                   	push   %eax
80100b34:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b3a:	e8 e1 60 00 00       	call   80106c20 <loaduvm>
80100b3f:	83 c4 20             	add    $0x20,%esp
80100b42:	85 c0                	test   %eax,%eax
80100b44:	0f 89 5e ff ff ff    	jns    80100aa8 <exec+0xb8>
80100b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100b50:	83 ec 0c             	sub    $0xc,%esp
80100b53:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b59:	e8 b2 62 00 00       	call   80106e10 <freevm>
80100b5e:	83 c4 10             	add    $0x10,%esp
80100b61:	e9 e0 fe ff ff       	jmp    80100a46 <exec+0x56>
80100b66:	83 ec 0c             	sub    $0xc,%esp
80100b69:	53                   	push   %ebx
80100b6a:	e8 91 0d 00 00       	call   80101900 <iunlockput>
80100b6f:	e8 4c 20 00 00       	call   80102bc0 <end_op>
80100b74:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100b7a:	83 c4 0c             	add    $0xc,%esp
80100b7d:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b82:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80100b87:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b8d:	52                   	push   %edx
80100b8e:	50                   	push   %eax
80100b8f:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b95:	e8 46 61 00 00       	call   80106ce0 <allocuvm>
80100b9a:	83 c4 10             	add    $0x10,%esp
80100b9d:	85 c0                	test   %eax,%eax
80100b9f:	89 c6                	mov    %eax,%esi
80100ba1:	75 3a                	jne    80100bdd <exec+0x1ed>
80100ba3:	83 ec 0c             	sub    $0xc,%esp
80100ba6:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bac:	e8 5f 62 00 00       	call   80106e10 <freevm>
80100bb1:	83 c4 10             	add    $0x10,%esp
80100bb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb9:	e9 9e fe ff ff       	jmp    80100a5c <exec+0x6c>
80100bbe:	e8 fd 1f 00 00       	call   80102bc0 <end_op>
80100bc3:	83 ec 0c             	sub    $0xc,%esp
80100bc6:	68 c1 71 10 80       	push   $0x801071c1
80100bcb:	e8 90 fa ff ff       	call   80100660 <cprintf>
80100bd0:	83 c4 10             	add    $0x10,%esp
80100bd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bd8:	e9 7f fe ff ff       	jmp    80100a5c <exec+0x6c>
80100bdd:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100be3:	83 ec 08             	sub    $0x8,%esp
80100be6:	31 ff                	xor    %edi,%edi
80100be8:	89 f3                	mov    %esi,%ebx
80100bea:	50                   	push   %eax
80100beb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bf1:	e8 3a 63 00 00       	call   80106f30 <clearpteu>
80100bf6:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bf9:	83 c4 10             	add    $0x10,%esp
80100bfc:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c02:	8b 00                	mov    (%eax),%eax
80100c04:	85 c0                	test   %eax,%eax
80100c06:	74 79                	je     80100c81 <exec+0x291>
80100c08:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c0e:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c14:	eb 13                	jmp    80100c29 <exec+0x239>
80100c16:	8d 76 00             	lea    0x0(%esi),%esi
80100c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100c20:	83 ff 20             	cmp    $0x20,%edi
80100c23:	0f 84 7a ff ff ff    	je     80100ba3 <exec+0x1b3>
80100c29:	83 ec 0c             	sub    $0xc,%esp
80100c2c:	50                   	push   %eax
80100c2d:	e8 ee 3b 00 00       	call   80104820 <strlen>
80100c32:	f7 d0                	not    %eax
80100c34:	01 c3                	add    %eax,%ebx
80100c36:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c39:	5a                   	pop    %edx
80100c3a:	83 e3 fc             	and    $0xfffffffc,%ebx
80100c3d:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c40:	e8 db 3b 00 00       	call   80104820 <strlen>
80100c45:	83 c0 01             	add    $0x1,%eax
80100c48:	50                   	push   %eax
80100c49:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c4c:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c4f:	53                   	push   %ebx
80100c50:	56                   	push   %esi
80100c51:	e8 3a 64 00 00       	call   80107090 <copyout>
80100c56:	83 c4 20             	add    $0x20,%esp
80100c59:	85 c0                	test   %eax,%eax
80100c5b:	0f 88 42 ff ff ff    	js     80100ba3 <exec+0x1b3>
80100c61:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c64:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100c6b:	83 c7 01             	add    $0x1,%edi
80100c6e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c74:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c77:	85 c0                	test   %eax,%eax
80100c79:	75 a5                	jne    80100c20 <exec+0x230>
80100c7b:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100c81:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c88:	89 d9                	mov    %ebx,%ecx
80100c8a:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c91:	00 00 00 00 
80100c95:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c9c:	ff ff ff 
80100c9f:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100ca5:	29 c1                	sub    %eax,%ecx
80100ca7:	83 c0 0c             	add    $0xc,%eax
80100caa:	29 c3                	sub    %eax,%ebx
80100cac:	50                   	push   %eax
80100cad:	52                   	push   %edx
80100cae:	53                   	push   %ebx
80100caf:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100cb5:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100cbb:	e8 d0 63 00 00       	call   80107090 <copyout>
80100cc0:	83 c4 10             	add    $0x10,%esp
80100cc3:	85 c0                	test   %eax,%eax
80100cc5:	0f 88 d8 fe ff ff    	js     80100ba3 <exec+0x1b3>
80100ccb:	8b 45 08             	mov    0x8(%ebp),%eax
80100cce:	0f b6 10             	movzbl (%eax),%edx
80100cd1:	84 d2                	test   %dl,%dl
80100cd3:	74 19                	je     80100cee <exec+0x2fe>
80100cd5:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cd8:	83 c0 01             	add    $0x1,%eax
80100cdb:	80 fa 2f             	cmp    $0x2f,%dl
80100cde:	0f b6 10             	movzbl (%eax),%edx
80100ce1:	0f 44 c8             	cmove  %eax,%ecx
80100ce4:	83 c0 01             	add    $0x1,%eax
80100ce7:	84 d2                	test   %dl,%dl
80100ce9:	75 f0                	jne    80100cdb <exec+0x2eb>
80100ceb:	89 4d 08             	mov    %ecx,0x8(%ebp)
80100cee:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cf4:	50                   	push   %eax
80100cf5:	6a 10                	push   $0x10
80100cf7:	ff 75 08             	pushl  0x8(%ebp)
80100cfa:	89 f8                	mov    %edi,%eax
80100cfc:	83 c0 6c             	add    $0x6c,%eax
80100cff:	50                   	push   %eax
80100d00:	e8 db 3a 00 00       	call   801047e0 <safestrcpy>
80100d05:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
80100d0b:	89 f8                	mov    %edi,%eax
80100d0d:	8b 7f 04             	mov    0x4(%edi),%edi
80100d10:	89 30                	mov    %esi,(%eax)
80100d12:	89 48 04             	mov    %ecx,0x4(%eax)
80100d15:	89 c1                	mov    %eax,%ecx
80100d17:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d1d:	8b 40 18             	mov    0x18(%eax),%eax
80100d20:	89 50 38             	mov    %edx,0x38(%eax)
80100d23:	8b 41 18             	mov    0x18(%ecx),%eax
80100d26:	89 58 44             	mov    %ebx,0x44(%eax)
80100d29:	c7 41 7c 03 00 00 00 	movl   $0x3,0x7c(%ecx)
80100d30:	89 0c 24             	mov    %ecx,(%esp)
80100d33:	e8 58 5d 00 00       	call   80106a90 <switchuvm>
80100d38:	89 3c 24             	mov    %edi,(%esp)
80100d3b:	e8 d0 60 00 00       	call   80106e10 <freevm>
80100d40:	83 c4 10             	add    $0x10,%esp
80100d43:	31 c0                	xor    %eax,%eax
80100d45:	e9 12 fd ff ff       	jmp    80100a5c <exec+0x6c>
80100d4a:	66 90                	xchg   %ax,%ax
80100d4c:	66 90                	xchg   %ax,%ax
80100d4e:	66 90                	xchg   %ax,%ax

80100d50 <fileinit>:
80100d50:	55                   	push   %ebp
80100d51:	89 e5                	mov    %esp,%ebp
80100d53:	83 ec 10             	sub    $0x10,%esp
80100d56:	68 cd 71 10 80       	push   $0x801071cd
80100d5b:	68 a0 00 11 80       	push   $0x801100a0
80100d60:	e8 0b 36 00 00       	call   80104370 <initlock>
80100d65:	83 c4 10             	add    $0x10,%esp
80100d68:	c9                   	leave  
80100d69:	c3                   	ret    
80100d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d70 <filealloc>:
80100d70:	55                   	push   %ebp
80100d71:	89 e5                	mov    %esp,%ebp
80100d73:	53                   	push   %ebx
80100d74:	bb d4 00 11 80       	mov    $0x801100d4,%ebx
80100d79:	83 ec 10             	sub    $0x10,%esp
80100d7c:	68 a0 00 11 80       	push   $0x801100a0
80100d81:	e8 ea 36 00 00       	call   80104470 <acquire>
80100d86:	83 c4 10             	add    $0x10,%esp
80100d89:	eb 10                	jmp    80100d9b <filealloc+0x2b>
80100d8b:	90                   	nop
80100d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d90:	83 c3 18             	add    $0x18,%ebx
80100d93:	81 fb 34 0a 11 80    	cmp    $0x80110a34,%ebx
80100d99:	74 25                	je     80100dc0 <filealloc+0x50>
80100d9b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d9e:	85 c0                	test   %eax,%eax
80100da0:	75 ee                	jne    80100d90 <filealloc+0x20>
80100da2:	83 ec 0c             	sub    $0xc,%esp
80100da5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100dac:	68 a0 00 11 80       	push   $0x801100a0
80100db1:	e8 da 37 00 00       	call   80104590 <release>
80100db6:	89 d8                	mov    %ebx,%eax
80100db8:	83 c4 10             	add    $0x10,%esp
80100dbb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dbe:	c9                   	leave  
80100dbf:	c3                   	ret    
80100dc0:	83 ec 0c             	sub    $0xc,%esp
80100dc3:	68 a0 00 11 80       	push   $0x801100a0
80100dc8:	e8 c3 37 00 00       	call   80104590 <release>
80100dcd:	83 c4 10             	add    $0x10,%esp
80100dd0:	31 c0                	xor    %eax,%eax
80100dd2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dd5:	c9                   	leave  
80100dd6:	c3                   	ret    
80100dd7:	89 f6                	mov    %esi,%esi
80100dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100de0 <filedup>:
80100de0:	55                   	push   %ebp
80100de1:	89 e5                	mov    %esp,%ebp
80100de3:	53                   	push   %ebx
80100de4:	83 ec 10             	sub    $0x10,%esp
80100de7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dea:	68 a0 00 11 80       	push   $0x801100a0
80100def:	e8 7c 36 00 00       	call   80104470 <acquire>
80100df4:	8b 43 04             	mov    0x4(%ebx),%eax
80100df7:	83 c4 10             	add    $0x10,%esp
80100dfa:	85 c0                	test   %eax,%eax
80100dfc:	7e 1a                	jle    80100e18 <filedup+0x38>
80100dfe:	83 c0 01             	add    $0x1,%eax
80100e01:	83 ec 0c             	sub    $0xc,%esp
80100e04:	89 43 04             	mov    %eax,0x4(%ebx)
80100e07:	68 a0 00 11 80       	push   $0x801100a0
80100e0c:	e8 7f 37 00 00       	call   80104590 <release>
80100e11:	89 d8                	mov    %ebx,%eax
80100e13:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e16:	c9                   	leave  
80100e17:	c3                   	ret    
80100e18:	83 ec 0c             	sub    $0xc,%esp
80100e1b:	68 d4 71 10 80       	push   $0x801071d4
80100e20:	e8 4b f5 ff ff       	call   80100370 <panic>
80100e25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e30 <fileclose>:
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	57                   	push   %edi
80100e34:	56                   	push   %esi
80100e35:	53                   	push   %ebx
80100e36:	83 ec 28             	sub    $0x28,%esp
80100e39:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e3c:	68 a0 00 11 80       	push   $0x801100a0
80100e41:	e8 2a 36 00 00       	call   80104470 <acquire>
80100e46:	8b 47 04             	mov    0x4(%edi),%eax
80100e49:	83 c4 10             	add    $0x10,%esp
80100e4c:	85 c0                	test   %eax,%eax
80100e4e:	0f 8e 9b 00 00 00    	jle    80100eef <fileclose+0xbf>
80100e54:	83 e8 01             	sub    $0x1,%eax
80100e57:	85 c0                	test   %eax,%eax
80100e59:	89 47 04             	mov    %eax,0x4(%edi)
80100e5c:	74 1a                	je     80100e78 <fileclose+0x48>
80100e5e:	c7 45 08 a0 00 11 80 	movl   $0x801100a0,0x8(%ebp)
80100e65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e68:	5b                   	pop    %ebx
80100e69:	5e                   	pop    %esi
80100e6a:	5f                   	pop    %edi
80100e6b:	5d                   	pop    %ebp
80100e6c:	e9 1f 37 00 00       	jmp    80104590 <release>
80100e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e78:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e7c:	8b 1f                	mov    (%edi),%ebx
80100e7e:	83 ec 0c             	sub    $0xc,%esp
80100e81:	8b 77 0c             	mov    0xc(%edi),%esi
80100e84:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100e8a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e8d:	8b 47 10             	mov    0x10(%edi),%eax
80100e90:	68 a0 00 11 80       	push   $0x801100a0
80100e95:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100e98:	e8 f3 36 00 00       	call   80104590 <release>
80100e9d:	83 c4 10             	add    $0x10,%esp
80100ea0:	83 fb 01             	cmp    $0x1,%ebx
80100ea3:	74 13                	je     80100eb8 <fileclose+0x88>
80100ea5:	83 fb 02             	cmp    $0x2,%ebx
80100ea8:	74 26                	je     80100ed0 <fileclose+0xa0>
80100eaa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ead:	5b                   	pop    %ebx
80100eae:	5e                   	pop    %esi
80100eaf:	5f                   	pop    %edi
80100eb0:	5d                   	pop    %ebp
80100eb1:	c3                   	ret    
80100eb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100eb8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ebc:	83 ec 08             	sub    $0x8,%esp
80100ebf:	53                   	push   %ebx
80100ec0:	56                   	push   %esi
80100ec1:	e8 2a 24 00 00       	call   801032f0 <pipeclose>
80100ec6:	83 c4 10             	add    $0x10,%esp
80100ec9:	eb df                	jmp    80100eaa <fileclose+0x7a>
80100ecb:	90                   	nop
80100ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ed0:	e8 7b 1c 00 00       	call   80102b50 <begin_op>
80100ed5:	83 ec 0c             	sub    $0xc,%esp
80100ed8:	ff 75 e0             	pushl  -0x20(%ebp)
80100edb:	e8 c0 08 00 00       	call   801017a0 <iput>
80100ee0:	83 c4 10             	add    $0x10,%esp
80100ee3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ee6:	5b                   	pop    %ebx
80100ee7:	5e                   	pop    %esi
80100ee8:	5f                   	pop    %edi
80100ee9:	5d                   	pop    %ebp
80100eea:	e9 d1 1c 00 00       	jmp    80102bc0 <end_op>
80100eef:	83 ec 0c             	sub    $0xc,%esp
80100ef2:	68 dc 71 10 80       	push   $0x801071dc
80100ef7:	e8 74 f4 ff ff       	call   80100370 <panic>
80100efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f00 <filestat>:
80100f00:	55                   	push   %ebp
80100f01:	89 e5                	mov    %esp,%ebp
80100f03:	53                   	push   %ebx
80100f04:	83 ec 04             	sub    $0x4,%esp
80100f07:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f0a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f0d:	75 31                	jne    80100f40 <filestat+0x40>
80100f0f:	83 ec 0c             	sub    $0xc,%esp
80100f12:	ff 73 10             	pushl  0x10(%ebx)
80100f15:	e8 56 07 00 00       	call   80101670 <ilock>
80100f1a:	58                   	pop    %eax
80100f1b:	5a                   	pop    %edx
80100f1c:	ff 75 0c             	pushl  0xc(%ebp)
80100f1f:	ff 73 10             	pushl  0x10(%ebx)
80100f22:	e8 f9 09 00 00       	call   80101920 <stati>
80100f27:	59                   	pop    %ecx
80100f28:	ff 73 10             	pushl  0x10(%ebx)
80100f2b:	e8 20 08 00 00       	call   80101750 <iunlock>
80100f30:	83 c4 10             	add    $0x10,%esp
80100f33:	31 c0                	xor    %eax,%eax
80100f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f38:	c9                   	leave  
80100f39:	c3                   	ret    
80100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f48:	c9                   	leave  
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f50 <fileread>:
80100f50:	55                   	push   %ebp
80100f51:	89 e5                	mov    %esp,%ebp
80100f53:	57                   	push   %edi
80100f54:	56                   	push   %esi
80100f55:	53                   	push   %ebx
80100f56:	83 ec 0c             	sub    $0xc,%esp
80100f59:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f5f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f62:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f66:	74 60                	je     80100fc8 <fileread+0x78>
80100f68:	8b 03                	mov    (%ebx),%eax
80100f6a:	83 f8 01             	cmp    $0x1,%eax
80100f6d:	74 41                	je     80100fb0 <fileread+0x60>
80100f6f:	83 f8 02             	cmp    $0x2,%eax
80100f72:	75 5b                	jne    80100fcf <fileread+0x7f>
80100f74:	83 ec 0c             	sub    $0xc,%esp
80100f77:	ff 73 10             	pushl  0x10(%ebx)
80100f7a:	e8 f1 06 00 00       	call   80101670 <ilock>
80100f7f:	57                   	push   %edi
80100f80:	ff 73 14             	pushl  0x14(%ebx)
80100f83:	56                   	push   %esi
80100f84:	ff 73 10             	pushl  0x10(%ebx)
80100f87:	e8 c4 09 00 00       	call   80101950 <readi>
80100f8c:	83 c4 20             	add    $0x20,%esp
80100f8f:	85 c0                	test   %eax,%eax
80100f91:	89 c6                	mov    %eax,%esi
80100f93:	7e 03                	jle    80100f98 <fileread+0x48>
80100f95:	01 43 14             	add    %eax,0x14(%ebx)
80100f98:	83 ec 0c             	sub    $0xc,%esp
80100f9b:	ff 73 10             	pushl  0x10(%ebx)
80100f9e:	e8 ad 07 00 00       	call   80101750 <iunlock>
80100fa3:	83 c4 10             	add    $0x10,%esp
80100fa6:	89 f0                	mov    %esi,%eax
80100fa8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fab:	5b                   	pop    %ebx
80100fac:	5e                   	pop    %esi
80100fad:	5f                   	pop    %edi
80100fae:	5d                   	pop    %ebp
80100faf:	c3                   	ret    
80100fb0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fb3:	89 45 08             	mov    %eax,0x8(%ebp)
80100fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb9:	5b                   	pop    %ebx
80100fba:	5e                   	pop    %esi
80100fbb:	5f                   	pop    %edi
80100fbc:	5d                   	pop    %ebp
80100fbd:	e9 ce 24 00 00       	jmp    80103490 <piperead>
80100fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fcd:	eb d9                	jmp    80100fa8 <fileread+0x58>
80100fcf:	83 ec 0c             	sub    $0xc,%esp
80100fd2:	68 e6 71 10 80       	push   $0x801071e6
80100fd7:	e8 94 f3 ff ff       	call   80100370 <panic>
80100fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fe0 <filewrite>:
80100fe0:	55                   	push   %ebp
80100fe1:	89 e5                	mov    %esp,%ebp
80100fe3:	57                   	push   %edi
80100fe4:	56                   	push   %esi
80100fe5:	53                   	push   %ebx
80100fe6:	83 ec 1c             	sub    $0x1c,%esp
80100fe9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fec:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fef:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80100ff3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100ff6:	8b 45 10             	mov    0x10(%ebp),%eax
80100ff9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100ffc:	0f 84 aa 00 00 00    	je     801010ac <filewrite+0xcc>
80101002:	8b 06                	mov    (%esi),%eax
80101004:	83 f8 01             	cmp    $0x1,%eax
80101007:	0f 84 c2 00 00 00    	je     801010cf <filewrite+0xef>
8010100d:	83 f8 02             	cmp    $0x2,%eax
80101010:	0f 85 d8 00 00 00    	jne    801010ee <filewrite+0x10e>
80101016:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101019:	31 ff                	xor    %edi,%edi
8010101b:	85 c0                	test   %eax,%eax
8010101d:	7f 34                	jg     80101053 <filewrite+0x73>
8010101f:	e9 9c 00 00 00       	jmp    801010c0 <filewrite+0xe0>
80101024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101028:	01 46 14             	add    %eax,0x14(%esi)
8010102b:	83 ec 0c             	sub    $0xc,%esp
8010102e:	ff 76 10             	pushl  0x10(%esi)
80101031:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101034:	e8 17 07 00 00       	call   80101750 <iunlock>
80101039:	e8 82 1b 00 00       	call   80102bc0 <end_op>
8010103e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101041:	83 c4 10             	add    $0x10,%esp
80101044:	39 d8                	cmp    %ebx,%eax
80101046:	0f 85 95 00 00 00    	jne    801010e1 <filewrite+0x101>
8010104c:	01 c7                	add    %eax,%edi
8010104e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101051:	7e 6d                	jle    801010c0 <filewrite+0xe0>
80101053:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101056:	b8 00 06 00 00       	mov    $0x600,%eax
8010105b:	29 fb                	sub    %edi,%ebx
8010105d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101063:	0f 4f d8             	cmovg  %eax,%ebx
80101066:	e8 e5 1a 00 00       	call   80102b50 <begin_op>
8010106b:	83 ec 0c             	sub    $0xc,%esp
8010106e:	ff 76 10             	pushl  0x10(%esi)
80101071:	e8 fa 05 00 00       	call   80101670 <ilock>
80101076:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101079:	53                   	push   %ebx
8010107a:	ff 76 14             	pushl  0x14(%esi)
8010107d:	01 f8                	add    %edi,%eax
8010107f:	50                   	push   %eax
80101080:	ff 76 10             	pushl  0x10(%esi)
80101083:	e8 c8 09 00 00       	call   80101a50 <writei>
80101088:	83 c4 20             	add    $0x20,%esp
8010108b:	85 c0                	test   %eax,%eax
8010108d:	7f 99                	jg     80101028 <filewrite+0x48>
8010108f:	83 ec 0c             	sub    $0xc,%esp
80101092:	ff 76 10             	pushl  0x10(%esi)
80101095:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101098:	e8 b3 06 00 00       	call   80101750 <iunlock>
8010109d:	e8 1e 1b 00 00       	call   80102bc0 <end_op>
801010a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010a5:	83 c4 10             	add    $0x10,%esp
801010a8:	85 c0                	test   %eax,%eax
801010aa:	74 98                	je     80101044 <filewrite+0x64>
801010ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801010b4:	5b                   	pop    %ebx
801010b5:	5e                   	pop    %esi
801010b6:	5f                   	pop    %edi
801010b7:	5d                   	pop    %ebp
801010b8:	c3                   	ret    
801010b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801010c0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010c3:	75 e7                	jne    801010ac <filewrite+0xcc>
801010c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c8:	89 f8                	mov    %edi,%eax
801010ca:	5b                   	pop    %ebx
801010cb:	5e                   	pop    %esi
801010cc:	5f                   	pop    %edi
801010cd:	5d                   	pop    %ebp
801010ce:	c3                   	ret    
801010cf:	8b 46 0c             	mov    0xc(%esi),%eax
801010d2:	89 45 08             	mov    %eax,0x8(%ebp)
801010d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d8:	5b                   	pop    %ebx
801010d9:	5e                   	pop    %esi
801010da:	5f                   	pop    %edi
801010db:	5d                   	pop    %ebp
801010dc:	e9 af 22 00 00       	jmp    80103390 <pipewrite>
801010e1:	83 ec 0c             	sub    $0xc,%esp
801010e4:	68 ef 71 10 80       	push   $0x801071ef
801010e9:	e8 82 f2 ff ff       	call   80100370 <panic>
801010ee:	83 ec 0c             	sub    $0xc,%esp
801010f1:	68 f5 71 10 80       	push   $0x801071f5
801010f6:	e8 75 f2 ff ff       	call   80100370 <panic>
801010fb:	66 90                	xchg   %ax,%ax
801010fd:	66 90                	xchg   %ax,%ax
801010ff:	90                   	nop

80101100 <balloc>:
80101100:	55                   	push   %ebp
80101101:	89 e5                	mov    %esp,%ebp
80101103:	57                   	push   %edi
80101104:	56                   	push   %esi
80101105:	53                   	push   %ebx
80101106:	83 ec 1c             	sub    $0x1c,%esp
80101109:	8b 0d a0 0a 11 80    	mov    0x80110aa0,%ecx
8010110f:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101112:	85 c9                	test   %ecx,%ecx
80101114:	0f 84 85 00 00 00    	je     8010119f <balloc+0x9f>
8010111a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101121:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101124:	83 ec 08             	sub    $0x8,%esp
80101127:	89 f0                	mov    %esi,%eax
80101129:	c1 f8 0c             	sar    $0xc,%eax
8010112c:	03 05 b8 0a 11 80    	add    0x80110ab8,%eax
80101132:	50                   	push   %eax
80101133:	ff 75 d8             	pushl  -0x28(%ebp)
80101136:	e8 95 ef ff ff       	call   801000d0 <bread>
8010113b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010113e:	a1 a0 0a 11 80       	mov    0x80110aa0,%eax
80101143:	83 c4 10             	add    $0x10,%esp
80101146:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101149:	31 c0                	xor    %eax,%eax
8010114b:	eb 2d                	jmp    8010117a <balloc+0x7a>
8010114d:	8d 76 00             	lea    0x0(%esi),%esi
80101150:	89 c1                	mov    %eax,%ecx
80101152:	ba 01 00 00 00       	mov    $0x1,%edx
80101157:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
8010115a:	83 e1 07             	and    $0x7,%ecx
8010115d:	d3 e2                	shl    %cl,%edx
8010115f:	89 c1                	mov    %eax,%ecx
80101161:	c1 f9 03             	sar    $0x3,%ecx
80101164:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101169:	85 d7                	test   %edx,%edi
8010116b:	74 43                	je     801011b0 <balloc+0xb0>
8010116d:	83 c0 01             	add    $0x1,%eax
80101170:	83 c6 01             	add    $0x1,%esi
80101173:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101178:	74 05                	je     8010117f <balloc+0x7f>
8010117a:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010117d:	72 d1                	jb     80101150 <balloc+0x50>
8010117f:	83 ec 0c             	sub    $0xc,%esp
80101182:	ff 75 e4             	pushl  -0x1c(%ebp)
80101185:	e8 56 f0 ff ff       	call   801001e0 <brelse>
8010118a:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101191:	83 c4 10             	add    $0x10,%esp
80101194:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101197:	39 05 a0 0a 11 80    	cmp    %eax,0x80110aa0
8010119d:	77 82                	ja     80101121 <balloc+0x21>
8010119f:	83 ec 0c             	sub    $0xc,%esp
801011a2:	68 ff 71 10 80       	push   $0x801071ff
801011a7:	e8 c4 f1 ff ff       	call   80100370 <panic>
801011ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801011b0:	09 fa                	or     %edi,%edx
801011b2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801011b5:	83 ec 0c             	sub    $0xc,%esp
801011b8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
801011bc:	57                   	push   %edi
801011bd:	e8 6e 1b 00 00       	call   80102d30 <log_write>
801011c2:	89 3c 24             	mov    %edi,(%esp)
801011c5:	e8 16 f0 ff ff       	call   801001e0 <brelse>
801011ca:	58                   	pop    %eax
801011cb:	5a                   	pop    %edx
801011cc:	56                   	push   %esi
801011cd:	ff 75 d8             	pushl  -0x28(%ebp)
801011d0:	e8 fb ee ff ff       	call   801000d0 <bread>
801011d5:	89 c3                	mov    %eax,%ebx
801011d7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011da:	83 c4 0c             	add    $0xc,%esp
801011dd:	68 00 02 00 00       	push   $0x200
801011e2:	6a 00                	push   $0x0
801011e4:	50                   	push   %eax
801011e5:	e8 f6 33 00 00       	call   801045e0 <memset>
801011ea:	89 1c 24             	mov    %ebx,(%esp)
801011ed:	e8 3e 1b 00 00       	call   80102d30 <log_write>
801011f2:	89 1c 24             	mov    %ebx,(%esp)
801011f5:	e8 e6 ef ff ff       	call   801001e0 <brelse>
801011fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011fd:	89 f0                	mov    %esi,%eax
801011ff:	5b                   	pop    %ebx
80101200:	5e                   	pop    %esi
80101201:	5f                   	pop    %edi
80101202:	5d                   	pop    %ebp
80101203:	c3                   	ret    
80101204:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010120a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101210 <iget>:
80101210:	55                   	push   %ebp
80101211:	89 e5                	mov    %esp,%ebp
80101213:	57                   	push   %edi
80101214:	56                   	push   %esi
80101215:	53                   	push   %ebx
80101216:	89 c7                	mov    %eax,%edi
80101218:	31 f6                	xor    %esi,%esi
8010121a:	bb f4 0a 11 80       	mov    $0x80110af4,%ebx
8010121f:	83 ec 28             	sub    $0x28,%esp
80101222:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101225:	68 c0 0a 11 80       	push   $0x80110ac0
8010122a:	e8 41 32 00 00       	call   80104470 <acquire>
8010122f:	83 c4 10             	add    $0x10,%esp
80101232:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101235:	eb 1b                	jmp    80101252 <iget+0x42>
80101237:	89 f6                	mov    %esi,%esi
80101239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101240:	85 f6                	test   %esi,%esi
80101242:	74 44                	je     80101288 <iget+0x78>
80101244:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010124a:	81 fb 14 27 11 80    	cmp    $0x80112714,%ebx
80101250:	74 4e                	je     801012a0 <iget+0x90>
80101252:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101255:	85 c9                	test   %ecx,%ecx
80101257:	7e e7                	jle    80101240 <iget+0x30>
80101259:	39 3b                	cmp    %edi,(%ebx)
8010125b:	75 e3                	jne    80101240 <iget+0x30>
8010125d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101260:	75 de                	jne    80101240 <iget+0x30>
80101262:	83 ec 0c             	sub    $0xc,%esp
80101265:	83 c1 01             	add    $0x1,%ecx
80101268:	89 de                	mov    %ebx,%esi
8010126a:	68 c0 0a 11 80       	push   $0x80110ac0
8010126f:	89 4b 08             	mov    %ecx,0x8(%ebx)
80101272:	e8 19 33 00 00       	call   80104590 <release>
80101277:	83 c4 10             	add    $0x10,%esp
8010127a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010127d:	89 f0                	mov    %esi,%eax
8010127f:	5b                   	pop    %ebx
80101280:	5e                   	pop    %esi
80101281:	5f                   	pop    %edi
80101282:	5d                   	pop    %ebp
80101283:	c3                   	ret    
80101284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101288:	85 c9                	test   %ecx,%ecx
8010128a:	0f 44 f3             	cmove  %ebx,%esi
8010128d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101293:	81 fb 14 27 11 80    	cmp    $0x80112714,%ebx
80101299:	75 b7                	jne    80101252 <iget+0x42>
8010129b:	90                   	nop
8010129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801012a0:	85 f6                	test   %esi,%esi
801012a2:	74 2d                	je     801012d1 <iget+0xc1>
801012a4:	83 ec 0c             	sub    $0xc,%esp
801012a7:	89 3e                	mov    %edi,(%esi)
801012a9:	89 56 04             	mov    %edx,0x4(%esi)
801012ac:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
801012b3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801012ba:	68 c0 0a 11 80       	push   $0x80110ac0
801012bf:	e8 cc 32 00 00       	call   80104590 <release>
801012c4:	83 c4 10             	add    $0x10,%esp
801012c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ca:	89 f0                	mov    %esi,%eax
801012cc:	5b                   	pop    %ebx
801012cd:	5e                   	pop    %esi
801012ce:	5f                   	pop    %edi
801012cf:	5d                   	pop    %ebp
801012d0:	c3                   	ret    
801012d1:	83 ec 0c             	sub    $0xc,%esp
801012d4:	68 15 72 10 80       	push   $0x80107215
801012d9:	e8 92 f0 ff ff       	call   80100370 <panic>
801012de:	66 90                	xchg   %ax,%ax

801012e0 <bmap>:
801012e0:	55                   	push   %ebp
801012e1:	89 e5                	mov    %esp,%ebp
801012e3:	57                   	push   %edi
801012e4:	56                   	push   %esi
801012e5:	53                   	push   %ebx
801012e6:	89 c6                	mov    %eax,%esi
801012e8:	83 ec 1c             	sub    $0x1c,%esp
801012eb:	83 fa 0b             	cmp    $0xb,%edx
801012ee:	77 18                	ja     80101308 <bmap+0x28>
801012f0:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
801012f3:	8b 43 5c             	mov    0x5c(%ebx),%eax
801012f6:	85 c0                	test   %eax,%eax
801012f8:	74 76                	je     80101370 <bmap+0x90>
801012fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012fd:	5b                   	pop    %ebx
801012fe:	5e                   	pop    %esi
801012ff:	5f                   	pop    %edi
80101300:	5d                   	pop    %ebp
80101301:	c3                   	ret    
80101302:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101308:	8d 5a f4             	lea    -0xc(%edx),%ebx
8010130b:	83 fb 7f             	cmp    $0x7f,%ebx
8010130e:	0f 87 83 00 00 00    	ja     80101397 <bmap+0xb7>
80101314:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010131a:	85 c0                	test   %eax,%eax
8010131c:	74 6a                	je     80101388 <bmap+0xa8>
8010131e:	83 ec 08             	sub    $0x8,%esp
80101321:	50                   	push   %eax
80101322:	ff 36                	pushl  (%esi)
80101324:	e8 a7 ed ff ff       	call   801000d0 <bread>
80101329:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010132d:	83 c4 10             	add    $0x10,%esp
80101330:	89 c7                	mov    %eax,%edi
80101332:	8b 1a                	mov    (%edx),%ebx
80101334:	85 db                	test   %ebx,%ebx
80101336:	75 1d                	jne    80101355 <bmap+0x75>
80101338:	8b 06                	mov    (%esi),%eax
8010133a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010133d:	e8 be fd ff ff       	call   80101100 <balloc>
80101342:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101345:	83 ec 0c             	sub    $0xc,%esp
80101348:	89 c3                	mov    %eax,%ebx
8010134a:	89 02                	mov    %eax,(%edx)
8010134c:	57                   	push   %edi
8010134d:	e8 de 19 00 00       	call   80102d30 <log_write>
80101352:	83 c4 10             	add    $0x10,%esp
80101355:	83 ec 0c             	sub    $0xc,%esp
80101358:	57                   	push   %edi
80101359:	e8 82 ee ff ff       	call   801001e0 <brelse>
8010135e:	83 c4 10             	add    $0x10,%esp
80101361:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101364:	89 d8                	mov    %ebx,%eax
80101366:	5b                   	pop    %ebx
80101367:	5e                   	pop    %esi
80101368:	5f                   	pop    %edi
80101369:	5d                   	pop    %ebp
8010136a:	c3                   	ret    
8010136b:	90                   	nop
8010136c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101370:	8b 06                	mov    (%esi),%eax
80101372:	e8 89 fd ff ff       	call   80101100 <balloc>
80101377:	89 43 5c             	mov    %eax,0x5c(%ebx)
8010137a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010137d:	5b                   	pop    %ebx
8010137e:	5e                   	pop    %esi
8010137f:	5f                   	pop    %edi
80101380:	5d                   	pop    %ebp
80101381:	c3                   	ret    
80101382:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101388:	8b 06                	mov    (%esi),%eax
8010138a:	e8 71 fd ff ff       	call   80101100 <balloc>
8010138f:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101395:	eb 87                	jmp    8010131e <bmap+0x3e>
80101397:	83 ec 0c             	sub    $0xc,%esp
8010139a:	68 25 72 10 80       	push   $0x80107225
8010139f:	e8 cc ef ff ff       	call   80100370 <panic>
801013a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801013aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801013b0 <readsb>:
801013b0:	55                   	push   %ebp
801013b1:	89 e5                	mov    %esp,%ebp
801013b3:	56                   	push   %esi
801013b4:	53                   	push   %ebx
801013b5:	8b 75 0c             	mov    0xc(%ebp),%esi
801013b8:	83 ec 08             	sub    $0x8,%esp
801013bb:	6a 01                	push   $0x1
801013bd:	ff 75 08             	pushl  0x8(%ebp)
801013c0:	e8 0b ed ff ff       	call   801000d0 <bread>
801013c5:	89 c3                	mov    %eax,%ebx
801013c7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ca:	83 c4 0c             	add    $0xc,%esp
801013cd:	6a 1c                	push   $0x1c
801013cf:	50                   	push   %eax
801013d0:	56                   	push   %esi
801013d1:	e8 ba 32 00 00       	call   80104690 <memmove>
801013d6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013d9:	83 c4 10             	add    $0x10,%esp
801013dc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013df:	5b                   	pop    %ebx
801013e0:	5e                   	pop    %esi
801013e1:	5d                   	pop    %ebp
801013e2:	e9 f9 ed ff ff       	jmp    801001e0 <brelse>
801013e7:	89 f6                	mov    %esi,%esi
801013e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013f0 <bfree>:
801013f0:	55                   	push   %ebp
801013f1:	89 e5                	mov    %esp,%ebp
801013f3:	56                   	push   %esi
801013f4:	53                   	push   %ebx
801013f5:	89 d3                	mov    %edx,%ebx
801013f7:	89 c6                	mov    %eax,%esi
801013f9:	83 ec 08             	sub    $0x8,%esp
801013fc:	68 a0 0a 11 80       	push   $0x80110aa0
80101401:	50                   	push   %eax
80101402:	e8 a9 ff ff ff       	call   801013b0 <readsb>
80101407:	58                   	pop    %eax
80101408:	5a                   	pop    %edx
80101409:	89 da                	mov    %ebx,%edx
8010140b:	c1 ea 0c             	shr    $0xc,%edx
8010140e:	03 15 b8 0a 11 80    	add    0x80110ab8,%edx
80101414:	52                   	push   %edx
80101415:	56                   	push   %esi
80101416:	e8 b5 ec ff ff       	call   801000d0 <bread>
8010141b:	89 d9                	mov    %ebx,%ecx
8010141d:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80101423:	ba 01 00 00 00       	mov    $0x1,%edx
80101428:	83 e1 07             	and    $0x7,%ecx
8010142b:	c1 fb 03             	sar    $0x3,%ebx
8010142e:	83 c4 10             	add    $0x10,%esp
80101431:	d3 e2                	shl    %cl,%edx
80101433:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101438:	85 d1                	test   %edx,%ecx
8010143a:	74 27                	je     80101463 <bfree+0x73>
8010143c:	89 c6                	mov    %eax,%esi
8010143e:	f7 d2                	not    %edx
80101440:	89 c8                	mov    %ecx,%eax
80101442:	83 ec 0c             	sub    $0xc,%esp
80101445:	21 d0                	and    %edx,%eax
80101447:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
8010144b:	56                   	push   %esi
8010144c:	e8 df 18 00 00       	call   80102d30 <log_write>
80101451:	89 34 24             	mov    %esi,(%esp)
80101454:	e8 87 ed ff ff       	call   801001e0 <brelse>
80101459:	83 c4 10             	add    $0x10,%esp
8010145c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010145f:	5b                   	pop    %ebx
80101460:	5e                   	pop    %esi
80101461:	5d                   	pop    %ebp
80101462:	c3                   	ret    
80101463:	83 ec 0c             	sub    $0xc,%esp
80101466:	68 38 72 10 80       	push   $0x80107238
8010146b:	e8 00 ef ff ff       	call   80100370 <panic>

80101470 <iinit>:
80101470:	55                   	push   %ebp
80101471:	89 e5                	mov    %esp,%ebp
80101473:	53                   	push   %ebx
80101474:	bb 00 0b 11 80       	mov    $0x80110b00,%ebx
80101479:	83 ec 0c             	sub    $0xc,%esp
8010147c:	68 4b 72 10 80       	push   $0x8010724b
80101481:	68 c0 0a 11 80       	push   $0x80110ac0
80101486:	e8 e5 2e 00 00       	call   80104370 <initlock>
8010148b:	83 c4 10             	add    $0x10,%esp
8010148e:	66 90                	xchg   %ax,%ax
80101490:	83 ec 08             	sub    $0x8,%esp
80101493:	68 52 72 10 80       	push   $0x80107252
80101498:	53                   	push   %ebx
80101499:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010149f:	e8 bc 2d 00 00       	call   80104260 <initsleeplock>
801014a4:	83 c4 10             	add    $0x10,%esp
801014a7:	81 fb 20 27 11 80    	cmp    $0x80112720,%ebx
801014ad:	75 e1                	jne    80101490 <iinit+0x20>
801014af:	83 ec 08             	sub    $0x8,%esp
801014b2:	68 a0 0a 11 80       	push   $0x80110aa0
801014b7:	ff 75 08             	pushl  0x8(%ebp)
801014ba:	e8 f1 fe ff ff       	call   801013b0 <readsb>
801014bf:	ff 35 b8 0a 11 80    	pushl  0x80110ab8
801014c5:	ff 35 b4 0a 11 80    	pushl  0x80110ab4
801014cb:	ff 35 b0 0a 11 80    	pushl  0x80110ab0
801014d1:	ff 35 ac 0a 11 80    	pushl  0x80110aac
801014d7:	ff 35 a8 0a 11 80    	pushl  0x80110aa8
801014dd:	ff 35 a4 0a 11 80    	pushl  0x80110aa4
801014e3:	ff 35 a0 0a 11 80    	pushl  0x80110aa0
801014e9:	68 b8 72 10 80       	push   $0x801072b8
801014ee:	e8 6d f1 ff ff       	call   80100660 <cprintf>
801014f3:	83 c4 30             	add    $0x30,%esp
801014f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014f9:	c9                   	leave  
801014fa:	c3                   	ret    
801014fb:	90                   	nop
801014fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101500 <ialloc>:
80101500:	55                   	push   %ebp
80101501:	89 e5                	mov    %esp,%ebp
80101503:	57                   	push   %edi
80101504:	56                   	push   %esi
80101505:	53                   	push   %ebx
80101506:	83 ec 1c             	sub    $0x1c,%esp
80101509:	83 3d a8 0a 11 80 01 	cmpl   $0x1,0x80110aa8
80101510:	8b 45 0c             	mov    0xc(%ebp),%eax
80101513:	8b 75 08             	mov    0x8(%ebp),%esi
80101516:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101519:	0f 86 91 00 00 00    	jbe    801015b0 <ialloc+0xb0>
8010151f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101524:	eb 21                	jmp    80101547 <ialloc+0x47>
80101526:	8d 76 00             	lea    0x0(%esi),%esi
80101529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101530:	83 ec 0c             	sub    $0xc,%esp
80101533:	83 c3 01             	add    $0x1,%ebx
80101536:	57                   	push   %edi
80101537:	e8 a4 ec ff ff       	call   801001e0 <brelse>
8010153c:	83 c4 10             	add    $0x10,%esp
8010153f:	39 1d a8 0a 11 80    	cmp    %ebx,0x80110aa8
80101545:	76 69                	jbe    801015b0 <ialloc+0xb0>
80101547:	89 d8                	mov    %ebx,%eax
80101549:	83 ec 08             	sub    $0x8,%esp
8010154c:	c1 e8 03             	shr    $0x3,%eax
8010154f:	03 05 b4 0a 11 80    	add    0x80110ab4,%eax
80101555:	50                   	push   %eax
80101556:	56                   	push   %esi
80101557:	e8 74 eb ff ff       	call   801000d0 <bread>
8010155c:	89 c7                	mov    %eax,%edi
8010155e:	89 d8                	mov    %ebx,%eax
80101560:	83 c4 10             	add    $0x10,%esp
80101563:	83 e0 07             	and    $0x7,%eax
80101566:	c1 e0 06             	shl    $0x6,%eax
80101569:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
8010156d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101571:	75 bd                	jne    80101530 <ialloc+0x30>
80101573:	83 ec 04             	sub    $0x4,%esp
80101576:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101579:	6a 40                	push   $0x40
8010157b:	6a 00                	push   $0x0
8010157d:	51                   	push   %ecx
8010157e:	e8 5d 30 00 00       	call   801045e0 <memset>
80101583:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101587:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010158a:	66 89 01             	mov    %ax,(%ecx)
8010158d:	89 3c 24             	mov    %edi,(%esp)
80101590:	e8 9b 17 00 00       	call   80102d30 <log_write>
80101595:	89 3c 24             	mov    %edi,(%esp)
80101598:	e8 43 ec ff ff       	call   801001e0 <brelse>
8010159d:	83 c4 10             	add    $0x10,%esp
801015a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801015a3:	89 da                	mov    %ebx,%edx
801015a5:	89 f0                	mov    %esi,%eax
801015a7:	5b                   	pop    %ebx
801015a8:	5e                   	pop    %esi
801015a9:	5f                   	pop    %edi
801015aa:	5d                   	pop    %ebp
801015ab:	e9 60 fc ff ff       	jmp    80101210 <iget>
801015b0:	83 ec 0c             	sub    $0xc,%esp
801015b3:	68 58 72 10 80       	push   $0x80107258
801015b8:	e8 b3 ed ff ff       	call   80100370 <panic>
801015bd:	8d 76 00             	lea    0x0(%esi),%esi

801015c0 <iupdate>:
801015c0:	55                   	push   %ebp
801015c1:	89 e5                	mov    %esp,%ebp
801015c3:	56                   	push   %esi
801015c4:	53                   	push   %ebx
801015c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015c8:	83 ec 08             	sub    $0x8,%esp
801015cb:	8b 43 04             	mov    0x4(%ebx),%eax
801015ce:	83 c3 5c             	add    $0x5c,%ebx
801015d1:	c1 e8 03             	shr    $0x3,%eax
801015d4:	03 05 b4 0a 11 80    	add    0x80110ab4,%eax
801015da:	50                   	push   %eax
801015db:	ff 73 a4             	pushl  -0x5c(%ebx)
801015de:	e8 ed ea ff ff       	call   801000d0 <bread>
801015e3:	89 c6                	mov    %eax,%esi
801015e5:	8b 43 a8             	mov    -0x58(%ebx),%eax
801015e8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
801015ec:	83 c4 0c             	add    $0xc,%esp
801015ef:	83 e0 07             	and    $0x7,%eax
801015f2:	c1 e0 06             	shl    $0x6,%eax
801015f5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801015f9:	66 89 10             	mov    %dx,(%eax)
801015fc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
80101600:	83 c0 0c             	add    $0xc,%eax
80101603:	66 89 50 f6          	mov    %dx,-0xa(%eax)
80101607:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010160b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
8010160f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101613:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101617:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010161a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010161d:	6a 34                	push   $0x34
8010161f:	53                   	push   %ebx
80101620:	50                   	push   %eax
80101621:	e8 6a 30 00 00       	call   80104690 <memmove>
80101626:	89 34 24             	mov    %esi,(%esp)
80101629:	e8 02 17 00 00       	call   80102d30 <log_write>
8010162e:	89 75 08             	mov    %esi,0x8(%ebp)
80101631:	83 c4 10             	add    $0x10,%esp
80101634:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101637:	5b                   	pop    %ebx
80101638:	5e                   	pop    %esi
80101639:	5d                   	pop    %ebp
8010163a:	e9 a1 eb ff ff       	jmp    801001e0 <brelse>
8010163f:	90                   	nop

80101640 <idup>:
80101640:	55                   	push   %ebp
80101641:	89 e5                	mov    %esp,%ebp
80101643:	53                   	push   %ebx
80101644:	83 ec 10             	sub    $0x10,%esp
80101647:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010164a:	68 c0 0a 11 80       	push   $0x80110ac0
8010164f:	e8 1c 2e 00 00       	call   80104470 <acquire>
80101654:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101658:	c7 04 24 c0 0a 11 80 	movl   $0x80110ac0,(%esp)
8010165f:	e8 2c 2f 00 00       	call   80104590 <release>
80101664:	89 d8                	mov    %ebx,%eax
80101666:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101669:	c9                   	leave  
8010166a:	c3                   	ret    
8010166b:	90                   	nop
8010166c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101670 <ilock>:
80101670:	55                   	push   %ebp
80101671:	89 e5                	mov    %esp,%ebp
80101673:	56                   	push   %esi
80101674:	53                   	push   %ebx
80101675:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101678:	85 db                	test   %ebx,%ebx
8010167a:	0f 84 b7 00 00 00    	je     80101737 <ilock+0xc7>
80101680:	8b 53 08             	mov    0x8(%ebx),%edx
80101683:	85 d2                	test   %edx,%edx
80101685:	0f 8e ac 00 00 00    	jle    80101737 <ilock+0xc7>
8010168b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010168e:	83 ec 0c             	sub    $0xc,%esp
80101691:	50                   	push   %eax
80101692:	e8 09 2c 00 00       	call   801042a0 <acquiresleep>
80101697:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010169a:	83 c4 10             	add    $0x10,%esp
8010169d:	85 c0                	test   %eax,%eax
8010169f:	74 0f                	je     801016b0 <ilock+0x40>
801016a1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016a4:	5b                   	pop    %ebx
801016a5:	5e                   	pop    %esi
801016a6:	5d                   	pop    %ebp
801016a7:	c3                   	ret    
801016a8:	90                   	nop
801016a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801016b0:	8b 43 04             	mov    0x4(%ebx),%eax
801016b3:	83 ec 08             	sub    $0x8,%esp
801016b6:	c1 e8 03             	shr    $0x3,%eax
801016b9:	03 05 b4 0a 11 80    	add    0x80110ab4,%eax
801016bf:	50                   	push   %eax
801016c0:	ff 33                	pushl  (%ebx)
801016c2:	e8 09 ea ff ff       	call   801000d0 <bread>
801016c7:	89 c6                	mov    %eax,%esi
801016c9:	8b 43 04             	mov    0x4(%ebx),%eax
801016cc:	83 c4 0c             	add    $0xc,%esp
801016cf:	83 e0 07             	and    $0x7,%eax
801016d2:	c1 e0 06             	shl    $0x6,%eax
801016d5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801016d9:	0f b7 10             	movzwl (%eax),%edx
801016dc:	83 c0 0c             	add    $0xc,%eax
801016df:	66 89 53 50          	mov    %dx,0x50(%ebx)
801016e3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016e7:	66 89 53 52          	mov    %dx,0x52(%ebx)
801016eb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016ef:	66 89 53 54          	mov    %dx,0x54(%ebx)
801016f3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016f7:	66 89 53 56          	mov    %dx,0x56(%ebx)
801016fb:	8b 50 fc             	mov    -0x4(%eax),%edx
801016fe:	89 53 58             	mov    %edx,0x58(%ebx)
80101701:	6a 34                	push   $0x34
80101703:	50                   	push   %eax
80101704:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101707:	50                   	push   %eax
80101708:	e8 83 2f 00 00       	call   80104690 <memmove>
8010170d:	89 34 24             	mov    %esi,(%esp)
80101710:	e8 cb ea ff ff       	call   801001e0 <brelse>
80101715:	83 c4 10             	add    $0x10,%esp
80101718:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010171d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101724:	0f 85 77 ff ff ff    	jne    801016a1 <ilock+0x31>
8010172a:	83 ec 0c             	sub    $0xc,%esp
8010172d:	68 70 72 10 80       	push   $0x80107270
80101732:	e8 39 ec ff ff       	call   80100370 <panic>
80101737:	83 ec 0c             	sub    $0xc,%esp
8010173a:	68 6a 72 10 80       	push   $0x8010726a
8010173f:	e8 2c ec ff ff       	call   80100370 <panic>
80101744:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010174a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101750 <iunlock>:
80101750:	55                   	push   %ebp
80101751:	89 e5                	mov    %esp,%ebp
80101753:	56                   	push   %esi
80101754:	53                   	push   %ebx
80101755:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101758:	85 db                	test   %ebx,%ebx
8010175a:	74 28                	je     80101784 <iunlock+0x34>
8010175c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010175f:	83 ec 0c             	sub    $0xc,%esp
80101762:	56                   	push   %esi
80101763:	e8 d8 2b 00 00       	call   80104340 <holdingsleep>
80101768:	83 c4 10             	add    $0x10,%esp
8010176b:	85 c0                	test   %eax,%eax
8010176d:	74 15                	je     80101784 <iunlock+0x34>
8010176f:	8b 43 08             	mov    0x8(%ebx),%eax
80101772:	85 c0                	test   %eax,%eax
80101774:	7e 0e                	jle    80101784 <iunlock+0x34>
80101776:	89 75 08             	mov    %esi,0x8(%ebp)
80101779:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010177c:	5b                   	pop    %ebx
8010177d:	5e                   	pop    %esi
8010177e:	5d                   	pop    %ebp
8010177f:	e9 7c 2b 00 00       	jmp    80104300 <releasesleep>
80101784:	83 ec 0c             	sub    $0xc,%esp
80101787:	68 7f 72 10 80       	push   $0x8010727f
8010178c:	e8 df eb ff ff       	call   80100370 <panic>
80101791:	eb 0d                	jmp    801017a0 <iput>
80101793:	90                   	nop
80101794:	90                   	nop
80101795:	90                   	nop
80101796:	90                   	nop
80101797:	90                   	nop
80101798:	90                   	nop
80101799:	90                   	nop
8010179a:	90                   	nop
8010179b:	90                   	nop
8010179c:	90                   	nop
8010179d:	90                   	nop
8010179e:	90                   	nop
8010179f:	90                   	nop

801017a0 <iput>:
801017a0:	55                   	push   %ebp
801017a1:	89 e5                	mov    %esp,%ebp
801017a3:	57                   	push   %edi
801017a4:	56                   	push   %esi
801017a5:	53                   	push   %ebx
801017a6:	83 ec 28             	sub    $0x28,%esp
801017a9:	8b 75 08             	mov    0x8(%ebp),%esi
801017ac:	8d 7e 0c             	lea    0xc(%esi),%edi
801017af:	57                   	push   %edi
801017b0:	e8 eb 2a 00 00       	call   801042a0 <acquiresleep>
801017b5:	8b 56 4c             	mov    0x4c(%esi),%edx
801017b8:	83 c4 10             	add    $0x10,%esp
801017bb:	85 d2                	test   %edx,%edx
801017bd:	74 07                	je     801017c6 <iput+0x26>
801017bf:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017c4:	74 32                	je     801017f8 <iput+0x58>
801017c6:	83 ec 0c             	sub    $0xc,%esp
801017c9:	57                   	push   %edi
801017ca:	e8 31 2b 00 00       	call   80104300 <releasesleep>
801017cf:	c7 04 24 c0 0a 11 80 	movl   $0x80110ac0,(%esp)
801017d6:	e8 95 2c 00 00       	call   80104470 <acquire>
801017db:	83 6e 08 01          	subl   $0x1,0x8(%esi)
801017df:	83 c4 10             	add    $0x10,%esp
801017e2:	c7 45 08 c0 0a 11 80 	movl   $0x80110ac0,0x8(%ebp)
801017e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017ec:	5b                   	pop    %ebx
801017ed:	5e                   	pop    %esi
801017ee:	5f                   	pop    %edi
801017ef:	5d                   	pop    %ebp
801017f0:	e9 9b 2d 00 00       	jmp    80104590 <release>
801017f5:	8d 76 00             	lea    0x0(%esi),%esi
801017f8:	83 ec 0c             	sub    $0xc,%esp
801017fb:	68 c0 0a 11 80       	push   $0x80110ac0
80101800:	e8 6b 2c 00 00       	call   80104470 <acquire>
80101805:	8b 5e 08             	mov    0x8(%esi),%ebx
80101808:	c7 04 24 c0 0a 11 80 	movl   $0x80110ac0,(%esp)
8010180f:	e8 7c 2d 00 00       	call   80104590 <release>
80101814:	83 c4 10             	add    $0x10,%esp
80101817:	83 fb 01             	cmp    $0x1,%ebx
8010181a:	75 aa                	jne    801017c6 <iput+0x26>
8010181c:	8d 8e 8c 00 00 00    	lea    0x8c(%esi),%ecx
80101822:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101825:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101828:	89 cf                	mov    %ecx,%edi
8010182a:	eb 0b                	jmp    80101837 <iput+0x97>
8010182c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101830:	83 c3 04             	add    $0x4,%ebx
80101833:	39 fb                	cmp    %edi,%ebx
80101835:	74 19                	je     80101850 <iput+0xb0>
80101837:	8b 13                	mov    (%ebx),%edx
80101839:	85 d2                	test   %edx,%edx
8010183b:	74 f3                	je     80101830 <iput+0x90>
8010183d:	8b 06                	mov    (%esi),%eax
8010183f:	e8 ac fb ff ff       	call   801013f0 <bfree>
80101844:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010184a:	eb e4                	jmp    80101830 <iput+0x90>
8010184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101850:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101856:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101859:	85 c0                	test   %eax,%eax
8010185b:	75 33                	jne    80101890 <iput+0xf0>
8010185d:	83 ec 0c             	sub    $0xc,%esp
80101860:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
80101867:	56                   	push   %esi
80101868:	e8 53 fd ff ff       	call   801015c0 <iupdate>
8010186d:	31 c0                	xor    %eax,%eax
8010186f:	66 89 46 50          	mov    %ax,0x50(%esi)
80101873:	89 34 24             	mov    %esi,(%esp)
80101876:	e8 45 fd ff ff       	call   801015c0 <iupdate>
8010187b:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101882:	83 c4 10             	add    $0x10,%esp
80101885:	e9 3c ff ff ff       	jmp    801017c6 <iput+0x26>
8010188a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101890:	83 ec 08             	sub    $0x8,%esp
80101893:	50                   	push   %eax
80101894:	ff 36                	pushl  (%esi)
80101896:	e8 35 e8 ff ff       	call   801000d0 <bread>
8010189b:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018a1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801018a7:	8d 58 5c             	lea    0x5c(%eax),%ebx
801018aa:	83 c4 10             	add    $0x10,%esp
801018ad:	89 cf                	mov    %ecx,%edi
801018af:	eb 0e                	jmp    801018bf <iput+0x11f>
801018b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018b8:	83 c3 04             	add    $0x4,%ebx
801018bb:	39 fb                	cmp    %edi,%ebx
801018bd:	74 0f                	je     801018ce <iput+0x12e>
801018bf:	8b 13                	mov    (%ebx),%edx
801018c1:	85 d2                	test   %edx,%edx
801018c3:	74 f3                	je     801018b8 <iput+0x118>
801018c5:	8b 06                	mov    (%esi),%eax
801018c7:	e8 24 fb ff ff       	call   801013f0 <bfree>
801018cc:	eb ea                	jmp    801018b8 <iput+0x118>
801018ce:	83 ec 0c             	sub    $0xc,%esp
801018d1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018d4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018d7:	e8 04 e9 ff ff       	call   801001e0 <brelse>
801018dc:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018e2:	8b 06                	mov    (%esi),%eax
801018e4:	e8 07 fb ff ff       	call   801013f0 <bfree>
801018e9:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018f0:	00 00 00 
801018f3:	83 c4 10             	add    $0x10,%esp
801018f6:	e9 62 ff ff ff       	jmp    8010185d <iput+0xbd>
801018fb:	90                   	nop
801018fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101900 <iunlockput>:
80101900:	55                   	push   %ebp
80101901:	89 e5                	mov    %esp,%ebp
80101903:	53                   	push   %ebx
80101904:	83 ec 10             	sub    $0x10,%esp
80101907:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010190a:	53                   	push   %ebx
8010190b:	e8 40 fe ff ff       	call   80101750 <iunlock>
80101910:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101913:	83 c4 10             	add    $0x10,%esp
80101916:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101919:	c9                   	leave  
8010191a:	e9 81 fe ff ff       	jmp    801017a0 <iput>
8010191f:	90                   	nop

80101920 <stati>:
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	8b 55 08             	mov    0x8(%ebp),%edx
80101926:	8b 45 0c             	mov    0xc(%ebp),%eax
80101929:	8b 0a                	mov    (%edx),%ecx
8010192b:	89 48 04             	mov    %ecx,0x4(%eax)
8010192e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101931:	89 48 08             	mov    %ecx,0x8(%eax)
80101934:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101938:	66 89 08             	mov    %cx,(%eax)
8010193b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010193f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101943:	8b 52 58             	mov    0x58(%edx),%edx
80101946:	89 50 10             	mov    %edx,0x10(%eax)
80101949:	5d                   	pop    %ebp
8010194a:	c3                   	ret    
8010194b:	90                   	nop
8010194c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101950 <readi>:
80101950:	55                   	push   %ebp
80101951:	89 e5                	mov    %esp,%ebp
80101953:	57                   	push   %edi
80101954:	56                   	push   %esi
80101955:	53                   	push   %ebx
80101956:	83 ec 1c             	sub    $0x1c,%esp
80101959:	8b 45 08             	mov    0x8(%ebp),%eax
8010195c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010195f:	8b 75 10             	mov    0x10(%ebp),%esi
80101962:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101967:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010196a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010196d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101970:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101973:	0f 84 a7 00 00 00    	je     80101a20 <readi+0xd0>
80101979:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010197c:	8b 40 58             	mov    0x58(%eax),%eax
8010197f:	39 f0                	cmp    %esi,%eax
80101981:	0f 82 c1 00 00 00    	jb     80101a48 <readi+0xf8>
80101987:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010198a:	89 fa                	mov    %edi,%edx
8010198c:	01 f2                	add    %esi,%edx
8010198e:	0f 82 b4 00 00 00    	jb     80101a48 <readi+0xf8>
80101994:	89 c1                	mov    %eax,%ecx
80101996:	29 f1                	sub    %esi,%ecx
80101998:	39 d0                	cmp    %edx,%eax
8010199a:	0f 43 cf             	cmovae %edi,%ecx
8010199d:	31 ff                	xor    %edi,%edi
8010199f:	85 c9                	test   %ecx,%ecx
801019a1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801019a4:	74 6d                	je     80101a13 <readi+0xc3>
801019a6:	8d 76 00             	lea    0x0(%esi),%esi
801019a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801019b0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019b3:	89 f2                	mov    %esi,%edx
801019b5:	c1 ea 09             	shr    $0x9,%edx
801019b8:	89 d8                	mov    %ebx,%eax
801019ba:	e8 21 f9 ff ff       	call   801012e0 <bmap>
801019bf:	83 ec 08             	sub    $0x8,%esp
801019c2:	50                   	push   %eax
801019c3:	ff 33                	pushl  (%ebx)
801019c5:	bb 00 02 00 00       	mov    $0x200,%ebx
801019ca:	e8 01 e7 ff ff       	call   801000d0 <bread>
801019cf:	89 c2                	mov    %eax,%edx
801019d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019d4:	89 f1                	mov    %esi,%ecx
801019d6:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801019dc:	83 c4 0c             	add    $0xc,%esp
801019df:	89 55 dc             	mov    %edx,-0x24(%ebp)
801019e2:	29 cb                	sub    %ecx,%ebx
801019e4:	29 f8                	sub    %edi,%eax
801019e6:	39 c3                	cmp    %eax,%ebx
801019e8:	0f 47 d8             	cmova  %eax,%ebx
801019eb:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
801019ef:	53                   	push   %ebx
801019f0:	01 df                	add    %ebx,%edi
801019f2:	01 de                	add    %ebx,%esi
801019f4:	50                   	push   %eax
801019f5:	ff 75 e0             	pushl  -0x20(%ebp)
801019f8:	e8 93 2c 00 00       	call   80104690 <memmove>
801019fd:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a00:	89 14 24             	mov    %edx,(%esp)
80101a03:	e8 d8 e7 ff ff       	call   801001e0 <brelse>
80101a08:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a0b:	83 c4 10             	add    $0x10,%esp
80101a0e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a11:	77 9d                	ja     801019b0 <readi+0x60>
80101a13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101a16:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a19:	5b                   	pop    %ebx
80101a1a:	5e                   	pop    %esi
80101a1b:	5f                   	pop    %edi
80101a1c:	5d                   	pop    %ebp
80101a1d:	c3                   	ret    
80101a1e:	66 90                	xchg   %ax,%ax
80101a20:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a24:	66 83 f8 09          	cmp    $0x9,%ax
80101a28:	77 1e                	ja     80101a48 <readi+0xf8>
80101a2a:	8b 04 c5 40 0a 11 80 	mov    -0x7feef5c0(,%eax,8),%eax
80101a31:	85 c0                	test   %eax,%eax
80101a33:	74 13                	je     80101a48 <readi+0xf8>
80101a35:	89 7d 10             	mov    %edi,0x10(%ebp)
80101a38:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a3b:	5b                   	pop    %ebx
80101a3c:	5e                   	pop    %esi
80101a3d:	5f                   	pop    %edi
80101a3e:	5d                   	pop    %ebp
80101a3f:	ff e0                	jmp    *%eax
80101a41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a4d:	eb c7                	jmp    80101a16 <readi+0xc6>
80101a4f:	90                   	nop

80101a50 <writei>:
80101a50:	55                   	push   %ebp
80101a51:	89 e5                	mov    %esp,%ebp
80101a53:	57                   	push   %edi
80101a54:	56                   	push   %esi
80101a55:	53                   	push   %ebx
80101a56:	83 ec 1c             	sub    $0x1c,%esp
80101a59:	8b 45 08             	mov    0x8(%ebp),%eax
80101a5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a5f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101a62:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a67:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a6a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a6d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a70:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a73:	0f 84 b7 00 00 00    	je     80101b30 <writei+0xe0>
80101a79:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a7c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a7f:	0f 82 eb 00 00 00    	jb     80101b70 <writei+0x120>
80101a85:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101a88:	89 f8                	mov    %edi,%eax
80101a8a:	01 f0                	add    %esi,%eax
80101a8c:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a91:	0f 87 d9 00 00 00    	ja     80101b70 <writei+0x120>
80101a97:	39 c6                	cmp    %eax,%esi
80101a99:	0f 87 d1 00 00 00    	ja     80101b70 <writei+0x120>
80101a9f:	85 ff                	test   %edi,%edi
80101aa1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101aa8:	74 78                	je     80101b22 <writei+0xd2>
80101aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101ab0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ab3:	89 f2                	mov    %esi,%edx
80101ab5:	bb 00 02 00 00       	mov    $0x200,%ebx
80101aba:	c1 ea 09             	shr    $0x9,%edx
80101abd:	89 f8                	mov    %edi,%eax
80101abf:	e8 1c f8 ff ff       	call   801012e0 <bmap>
80101ac4:	83 ec 08             	sub    $0x8,%esp
80101ac7:	50                   	push   %eax
80101ac8:	ff 37                	pushl  (%edi)
80101aca:	e8 01 e6 ff ff       	call   801000d0 <bread>
80101acf:	89 c7                	mov    %eax,%edi
80101ad1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101ad4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101ad7:	89 f1                	mov    %esi,%ecx
80101ad9:	83 c4 0c             	add    $0xc,%esp
80101adc:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101ae2:	29 cb                	sub    %ecx,%ebx
80101ae4:	39 c3                	cmp    %eax,%ebx
80101ae6:	0f 47 d8             	cmova  %eax,%ebx
80101ae9:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101aed:	53                   	push   %ebx
80101aee:	ff 75 dc             	pushl  -0x24(%ebp)
80101af1:	01 de                	add    %ebx,%esi
80101af3:	50                   	push   %eax
80101af4:	e8 97 2b 00 00       	call   80104690 <memmove>
80101af9:	89 3c 24             	mov    %edi,(%esp)
80101afc:	e8 2f 12 00 00       	call   80102d30 <log_write>
80101b01:	89 3c 24             	mov    %edi,(%esp)
80101b04:	e8 d7 e6 ff ff       	call   801001e0 <brelse>
80101b09:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b0c:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b0f:	83 c4 10             	add    $0x10,%esp
80101b12:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b15:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101b18:	77 96                	ja     80101ab0 <writei+0x60>
80101b1a:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b1d:	3b 70 58             	cmp    0x58(%eax),%esi
80101b20:	77 36                	ja     80101b58 <writei+0x108>
80101b22:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b25:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b28:	5b                   	pop    %ebx
80101b29:	5e                   	pop    %esi
80101b2a:	5f                   	pop    %edi
80101b2b:	5d                   	pop    %ebp
80101b2c:	c3                   	ret    
80101b2d:	8d 76 00             	lea    0x0(%esi),%esi
80101b30:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b34:	66 83 f8 09          	cmp    $0x9,%ax
80101b38:	77 36                	ja     80101b70 <writei+0x120>
80101b3a:	8b 04 c5 44 0a 11 80 	mov    -0x7feef5bc(,%eax,8),%eax
80101b41:	85 c0                	test   %eax,%eax
80101b43:	74 2b                	je     80101b70 <writei+0x120>
80101b45:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b4b:	5b                   	pop    %ebx
80101b4c:	5e                   	pop    %esi
80101b4d:	5f                   	pop    %edi
80101b4e:	5d                   	pop    %ebp
80101b4f:	ff e0                	jmp    *%eax
80101b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b58:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b5b:	83 ec 0c             	sub    $0xc,%esp
80101b5e:	89 70 58             	mov    %esi,0x58(%eax)
80101b61:	50                   	push   %eax
80101b62:	e8 59 fa ff ff       	call   801015c0 <iupdate>
80101b67:	83 c4 10             	add    $0x10,%esp
80101b6a:	eb b6                	jmp    80101b22 <writei+0xd2>
80101b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b75:	eb ae                	jmp    80101b25 <writei+0xd5>
80101b77:	89 f6                	mov    %esi,%esi
80101b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b80 <namecmp>:
80101b80:	55                   	push   %ebp
80101b81:	89 e5                	mov    %esp,%ebp
80101b83:	83 ec 0c             	sub    $0xc,%esp
80101b86:	6a 0e                	push   $0xe
80101b88:	ff 75 0c             	pushl  0xc(%ebp)
80101b8b:	ff 75 08             	pushl  0x8(%ebp)
80101b8e:	e8 7d 2b 00 00       	call   80104710 <strncmp>
80101b93:	c9                   	leave  
80101b94:	c3                   	ret    
80101b95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <dirlookup>:
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	57                   	push   %edi
80101ba4:	56                   	push   %esi
80101ba5:	53                   	push   %ebx
80101ba6:	83 ec 1c             	sub    $0x1c,%esp
80101ba9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101bac:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bb1:	0f 85 80 00 00 00    	jne    80101c37 <dirlookup+0x97>
80101bb7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bba:	31 ff                	xor    %edi,%edi
80101bbc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bbf:	85 d2                	test   %edx,%edx
80101bc1:	75 0d                	jne    80101bd0 <dirlookup+0x30>
80101bc3:	eb 5b                	jmp    80101c20 <dirlookup+0x80>
80101bc5:	8d 76 00             	lea    0x0(%esi),%esi
80101bc8:	83 c7 10             	add    $0x10,%edi
80101bcb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bce:	76 50                	jbe    80101c20 <dirlookup+0x80>
80101bd0:	6a 10                	push   $0x10
80101bd2:	57                   	push   %edi
80101bd3:	56                   	push   %esi
80101bd4:	53                   	push   %ebx
80101bd5:	e8 76 fd ff ff       	call   80101950 <readi>
80101bda:	83 c4 10             	add    $0x10,%esp
80101bdd:	83 f8 10             	cmp    $0x10,%eax
80101be0:	75 48                	jne    80101c2a <dirlookup+0x8a>
80101be2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101be7:	74 df                	je     80101bc8 <dirlookup+0x28>
80101be9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bec:	83 ec 04             	sub    $0x4,%esp
80101bef:	6a 0e                	push   $0xe
80101bf1:	50                   	push   %eax
80101bf2:	ff 75 0c             	pushl  0xc(%ebp)
80101bf5:	e8 16 2b 00 00       	call   80104710 <strncmp>
80101bfa:	83 c4 10             	add    $0x10,%esp
80101bfd:	85 c0                	test   %eax,%eax
80101bff:	75 c7                	jne    80101bc8 <dirlookup+0x28>
80101c01:	8b 45 10             	mov    0x10(%ebp),%eax
80101c04:	85 c0                	test   %eax,%eax
80101c06:	74 05                	je     80101c0d <dirlookup+0x6d>
80101c08:	8b 45 10             	mov    0x10(%ebp),%eax
80101c0b:	89 38                	mov    %edi,(%eax)
80101c0d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c11:	8b 03                	mov    (%ebx),%eax
80101c13:	e8 f8 f5 ff ff       	call   80101210 <iget>
80101c18:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c1b:	5b                   	pop    %ebx
80101c1c:	5e                   	pop    %esi
80101c1d:	5f                   	pop    %edi
80101c1e:	5d                   	pop    %ebp
80101c1f:	c3                   	ret    
80101c20:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c23:	31 c0                	xor    %eax,%eax
80101c25:	5b                   	pop    %ebx
80101c26:	5e                   	pop    %esi
80101c27:	5f                   	pop    %edi
80101c28:	5d                   	pop    %ebp
80101c29:	c3                   	ret    
80101c2a:	83 ec 0c             	sub    $0xc,%esp
80101c2d:	68 99 72 10 80       	push   $0x80107299
80101c32:	e8 39 e7 ff ff       	call   80100370 <panic>
80101c37:	83 ec 0c             	sub    $0xc,%esp
80101c3a:	68 87 72 10 80       	push   $0x80107287
80101c3f:	e8 2c e7 ff ff       	call   80100370 <panic>
80101c44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c50 <namex>:
80101c50:	55                   	push   %ebp
80101c51:	89 e5                	mov    %esp,%ebp
80101c53:	57                   	push   %edi
80101c54:	56                   	push   %esi
80101c55:	53                   	push   %ebx
80101c56:	89 cf                	mov    %ecx,%edi
80101c58:	89 c3                	mov    %eax,%ebx
80101c5a:	83 ec 1c             	sub    $0x1c,%esp
80101c5d:	80 38 2f             	cmpb   $0x2f,(%eax)
80101c60:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101c63:	0f 84 53 01 00 00    	je     80101dbc <namex+0x16c>
80101c69:	e8 22 1b 00 00       	call   80103790 <myproc>
80101c6e:	83 ec 0c             	sub    $0xc,%esp
80101c71:	8b 70 68             	mov    0x68(%eax),%esi
80101c74:	68 c0 0a 11 80       	push   $0x80110ac0
80101c79:	e8 f2 27 00 00       	call   80104470 <acquire>
80101c7e:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101c82:	c7 04 24 c0 0a 11 80 	movl   $0x80110ac0,(%esp)
80101c89:	e8 02 29 00 00       	call   80104590 <release>
80101c8e:	83 c4 10             	add    $0x10,%esp
80101c91:	eb 08                	jmp    80101c9b <namex+0x4b>
80101c93:	90                   	nop
80101c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c98:	83 c3 01             	add    $0x1,%ebx
80101c9b:	0f b6 03             	movzbl (%ebx),%eax
80101c9e:	3c 2f                	cmp    $0x2f,%al
80101ca0:	74 f6                	je     80101c98 <namex+0x48>
80101ca2:	84 c0                	test   %al,%al
80101ca4:	0f 84 e3 00 00 00    	je     80101d8d <namex+0x13d>
80101caa:	0f b6 03             	movzbl (%ebx),%eax
80101cad:	89 da                	mov    %ebx,%edx
80101caf:	84 c0                	test   %al,%al
80101cb1:	0f 84 ac 00 00 00    	je     80101d63 <namex+0x113>
80101cb7:	3c 2f                	cmp    $0x2f,%al
80101cb9:	75 09                	jne    80101cc4 <namex+0x74>
80101cbb:	e9 a3 00 00 00       	jmp    80101d63 <namex+0x113>
80101cc0:	84 c0                	test   %al,%al
80101cc2:	74 0a                	je     80101cce <namex+0x7e>
80101cc4:	83 c2 01             	add    $0x1,%edx
80101cc7:	0f b6 02             	movzbl (%edx),%eax
80101cca:	3c 2f                	cmp    $0x2f,%al
80101ccc:	75 f2                	jne    80101cc0 <namex+0x70>
80101cce:	89 d1                	mov    %edx,%ecx
80101cd0:	29 d9                	sub    %ebx,%ecx
80101cd2:	83 f9 0d             	cmp    $0xd,%ecx
80101cd5:	0f 8e 8d 00 00 00    	jle    80101d68 <namex+0x118>
80101cdb:	83 ec 04             	sub    $0x4,%esp
80101cde:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101ce1:	6a 0e                	push   $0xe
80101ce3:	53                   	push   %ebx
80101ce4:	57                   	push   %edi
80101ce5:	e8 a6 29 00 00       	call   80104690 <memmove>
80101cea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101ced:	83 c4 10             	add    $0x10,%esp
80101cf0:	89 d3                	mov    %edx,%ebx
80101cf2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101cf5:	75 11                	jne    80101d08 <namex+0xb8>
80101cf7:	89 f6                	mov    %esi,%esi
80101cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101d00:	83 c3 01             	add    $0x1,%ebx
80101d03:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d06:	74 f8                	je     80101d00 <namex+0xb0>
80101d08:	83 ec 0c             	sub    $0xc,%esp
80101d0b:	56                   	push   %esi
80101d0c:	e8 5f f9 ff ff       	call   80101670 <ilock>
80101d11:	83 c4 10             	add    $0x10,%esp
80101d14:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d19:	0f 85 7f 00 00 00    	jne    80101d9e <namex+0x14e>
80101d1f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d22:	85 d2                	test   %edx,%edx
80101d24:	74 09                	je     80101d2f <namex+0xdf>
80101d26:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d29:	0f 84 a3 00 00 00    	je     80101dd2 <namex+0x182>
80101d2f:	83 ec 04             	sub    $0x4,%esp
80101d32:	6a 00                	push   $0x0
80101d34:	57                   	push   %edi
80101d35:	56                   	push   %esi
80101d36:	e8 65 fe ff ff       	call   80101ba0 <dirlookup>
80101d3b:	83 c4 10             	add    $0x10,%esp
80101d3e:	85 c0                	test   %eax,%eax
80101d40:	74 5c                	je     80101d9e <namex+0x14e>
80101d42:	83 ec 0c             	sub    $0xc,%esp
80101d45:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d48:	56                   	push   %esi
80101d49:	e8 02 fa ff ff       	call   80101750 <iunlock>
80101d4e:	89 34 24             	mov    %esi,(%esp)
80101d51:	e8 4a fa ff ff       	call   801017a0 <iput>
80101d56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d59:	83 c4 10             	add    $0x10,%esp
80101d5c:	89 c6                	mov    %eax,%esi
80101d5e:	e9 38 ff ff ff       	jmp    80101c9b <namex+0x4b>
80101d63:	31 c9                	xor    %ecx,%ecx
80101d65:	8d 76 00             	lea    0x0(%esi),%esi
80101d68:	83 ec 04             	sub    $0x4,%esp
80101d6b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d6e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d71:	51                   	push   %ecx
80101d72:	53                   	push   %ebx
80101d73:	57                   	push   %edi
80101d74:	e8 17 29 00 00       	call   80104690 <memmove>
80101d79:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d7c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d7f:	83 c4 10             	add    $0x10,%esp
80101d82:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d86:	89 d3                	mov    %edx,%ebx
80101d88:	e9 65 ff ff ff       	jmp    80101cf2 <namex+0xa2>
80101d8d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d90:	85 c0                	test   %eax,%eax
80101d92:	75 54                	jne    80101de8 <namex+0x198>
80101d94:	89 f0                	mov    %esi,%eax
80101d96:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d99:	5b                   	pop    %ebx
80101d9a:	5e                   	pop    %esi
80101d9b:	5f                   	pop    %edi
80101d9c:	5d                   	pop    %ebp
80101d9d:	c3                   	ret    
80101d9e:	83 ec 0c             	sub    $0xc,%esp
80101da1:	56                   	push   %esi
80101da2:	e8 a9 f9 ff ff       	call   80101750 <iunlock>
80101da7:	89 34 24             	mov    %esi,(%esp)
80101daa:	e8 f1 f9 ff ff       	call   801017a0 <iput>
80101daf:	83 c4 10             	add    $0x10,%esp
80101db2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101db5:	31 c0                	xor    %eax,%eax
80101db7:	5b                   	pop    %ebx
80101db8:	5e                   	pop    %esi
80101db9:	5f                   	pop    %edi
80101dba:	5d                   	pop    %ebp
80101dbb:	c3                   	ret    
80101dbc:	ba 01 00 00 00       	mov    $0x1,%edx
80101dc1:	b8 01 00 00 00       	mov    $0x1,%eax
80101dc6:	e8 45 f4 ff ff       	call   80101210 <iget>
80101dcb:	89 c6                	mov    %eax,%esi
80101dcd:	e9 c9 fe ff ff       	jmp    80101c9b <namex+0x4b>
80101dd2:	83 ec 0c             	sub    $0xc,%esp
80101dd5:	56                   	push   %esi
80101dd6:	e8 75 f9 ff ff       	call   80101750 <iunlock>
80101ddb:	83 c4 10             	add    $0x10,%esp
80101dde:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101de1:	89 f0                	mov    %esi,%eax
80101de3:	5b                   	pop    %ebx
80101de4:	5e                   	pop    %esi
80101de5:	5f                   	pop    %edi
80101de6:	5d                   	pop    %ebp
80101de7:	c3                   	ret    
80101de8:	83 ec 0c             	sub    $0xc,%esp
80101deb:	56                   	push   %esi
80101dec:	e8 af f9 ff ff       	call   801017a0 <iput>
80101df1:	83 c4 10             	add    $0x10,%esp
80101df4:	31 c0                	xor    %eax,%eax
80101df6:	eb 9e                	jmp    80101d96 <namex+0x146>
80101df8:	90                   	nop
80101df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101e00 <dirlink>:
80101e00:	55                   	push   %ebp
80101e01:	89 e5                	mov    %esp,%ebp
80101e03:	57                   	push   %edi
80101e04:	56                   	push   %esi
80101e05:	53                   	push   %ebx
80101e06:	83 ec 20             	sub    $0x20,%esp
80101e09:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101e0c:	6a 00                	push   $0x0
80101e0e:	ff 75 0c             	pushl  0xc(%ebp)
80101e11:	53                   	push   %ebx
80101e12:	e8 89 fd ff ff       	call   80101ba0 <dirlookup>
80101e17:	83 c4 10             	add    $0x10,%esp
80101e1a:	85 c0                	test   %eax,%eax
80101e1c:	75 67                	jne    80101e85 <dirlink+0x85>
80101e1e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e21:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e24:	85 ff                	test   %edi,%edi
80101e26:	74 29                	je     80101e51 <dirlink+0x51>
80101e28:	31 ff                	xor    %edi,%edi
80101e2a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e2d:	eb 09                	jmp    80101e38 <dirlink+0x38>
80101e2f:	90                   	nop
80101e30:	83 c7 10             	add    $0x10,%edi
80101e33:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e36:	76 19                	jbe    80101e51 <dirlink+0x51>
80101e38:	6a 10                	push   $0x10
80101e3a:	57                   	push   %edi
80101e3b:	56                   	push   %esi
80101e3c:	53                   	push   %ebx
80101e3d:	e8 0e fb ff ff       	call   80101950 <readi>
80101e42:	83 c4 10             	add    $0x10,%esp
80101e45:	83 f8 10             	cmp    $0x10,%eax
80101e48:	75 4e                	jne    80101e98 <dirlink+0x98>
80101e4a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e4f:	75 df                	jne    80101e30 <dirlink+0x30>
80101e51:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e54:	83 ec 04             	sub    $0x4,%esp
80101e57:	6a 0e                	push   $0xe
80101e59:	ff 75 0c             	pushl  0xc(%ebp)
80101e5c:	50                   	push   %eax
80101e5d:	e8 1e 29 00 00       	call   80104780 <strncpy>
80101e62:	8b 45 10             	mov    0x10(%ebp),%eax
80101e65:	6a 10                	push   $0x10
80101e67:	57                   	push   %edi
80101e68:	56                   	push   %esi
80101e69:	53                   	push   %ebx
80101e6a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101e6e:	e8 dd fb ff ff       	call   80101a50 <writei>
80101e73:	83 c4 20             	add    $0x20,%esp
80101e76:	83 f8 10             	cmp    $0x10,%eax
80101e79:	75 2a                	jne    80101ea5 <dirlink+0xa5>
80101e7b:	31 c0                	xor    %eax,%eax
80101e7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e80:	5b                   	pop    %ebx
80101e81:	5e                   	pop    %esi
80101e82:	5f                   	pop    %edi
80101e83:	5d                   	pop    %ebp
80101e84:	c3                   	ret    
80101e85:	83 ec 0c             	sub    $0xc,%esp
80101e88:	50                   	push   %eax
80101e89:	e8 12 f9 ff ff       	call   801017a0 <iput>
80101e8e:	83 c4 10             	add    $0x10,%esp
80101e91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e96:	eb e5                	jmp    80101e7d <dirlink+0x7d>
80101e98:	83 ec 0c             	sub    $0xc,%esp
80101e9b:	68 a8 72 10 80       	push   $0x801072a8
80101ea0:	e8 cb e4 ff ff       	call   80100370 <panic>
80101ea5:	83 ec 0c             	sub    $0xc,%esp
80101ea8:	68 aa 79 10 80       	push   $0x801079aa
80101ead:	e8 be e4 ff ff       	call   80100370 <panic>
80101eb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ec0 <namei>:
80101ec0:	55                   	push   %ebp
80101ec1:	31 d2                	xor    %edx,%edx
80101ec3:	89 e5                	mov    %esp,%ebp
80101ec5:	83 ec 18             	sub    $0x18,%esp
80101ec8:	8b 45 08             	mov    0x8(%ebp),%eax
80101ecb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ece:	e8 7d fd ff ff       	call   80101c50 <namex>
80101ed3:	c9                   	leave  
80101ed4:	c3                   	ret    
80101ed5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ee0 <nameiparent>:
80101ee0:	55                   	push   %ebp
80101ee1:	ba 01 00 00 00       	mov    $0x1,%edx
80101ee6:	89 e5                	mov    %esp,%ebp
80101ee8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101eeb:	8b 45 08             	mov    0x8(%ebp),%eax
80101eee:	5d                   	pop    %ebp
80101eef:	e9 5c fd ff ff       	jmp    80101c50 <namex>
80101ef4:	66 90                	xchg   %ax,%ax
80101ef6:	66 90                	xchg   %ax,%ax
80101ef8:	66 90                	xchg   %ax,%ax
80101efa:	66 90                	xchg   %ax,%ax
80101efc:	66 90                	xchg   %ax,%ax
80101efe:	66 90                	xchg   %ax,%ax

80101f00 <idestart>:
80101f00:	55                   	push   %ebp
80101f01:	85 c0                	test   %eax,%eax
80101f03:	89 e5                	mov    %esp,%ebp
80101f05:	56                   	push   %esi
80101f06:	53                   	push   %ebx
80101f07:	0f 84 ad 00 00 00    	je     80101fba <idestart+0xba>
80101f0d:	8b 58 08             	mov    0x8(%eax),%ebx
80101f10:	89 c1                	mov    %eax,%ecx
80101f12:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f18:	0f 87 8f 00 00 00    	ja     80101fad <idestart+0xad>
80101f1e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f23:	90                   	nop
80101f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f28:	ec                   	in     (%dx),%al
80101f29:	83 e0 c0             	and    $0xffffffc0,%eax
80101f2c:	3c 40                	cmp    $0x40,%al
80101f2e:	75 f8                	jne    80101f28 <idestart+0x28>
80101f30:	31 f6                	xor    %esi,%esi
80101f32:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f37:	89 f0                	mov    %esi,%eax
80101f39:	ee                   	out    %al,(%dx)
80101f3a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f3f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f44:	ee                   	out    %al,(%dx)
80101f45:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f4a:	89 d8                	mov    %ebx,%eax
80101f4c:	ee                   	out    %al,(%dx)
80101f4d:	89 d8                	mov    %ebx,%eax
80101f4f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f54:	c1 f8 08             	sar    $0x8,%eax
80101f57:	ee                   	out    %al,(%dx)
80101f58:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f5d:	89 f0                	mov    %esi,%eax
80101f5f:	ee                   	out    %al,(%dx)
80101f60:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f64:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f69:	83 e0 01             	and    $0x1,%eax
80101f6c:	c1 e0 04             	shl    $0x4,%eax
80101f6f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f72:	ee                   	out    %al,(%dx)
80101f73:	f6 01 04             	testb  $0x4,(%ecx)
80101f76:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f7b:	75 13                	jne    80101f90 <idestart+0x90>
80101f7d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f82:	ee                   	out    %al,(%dx)
80101f83:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f86:	5b                   	pop    %ebx
80101f87:	5e                   	pop    %esi
80101f88:	5d                   	pop    %ebp
80101f89:	c3                   	ret    
80101f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f90:	b8 30 00 00 00       	mov    $0x30,%eax
80101f95:	ee                   	out    %al,(%dx)
80101f96:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101f9b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f9e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101fa3:	fc                   	cld    
80101fa4:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101fa6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fa9:	5b                   	pop    %ebx
80101faa:	5e                   	pop    %esi
80101fab:	5d                   	pop    %ebp
80101fac:	c3                   	ret    
80101fad:	83 ec 0c             	sub    $0xc,%esp
80101fb0:	68 14 73 10 80       	push   $0x80107314
80101fb5:	e8 b6 e3 ff ff       	call   80100370 <panic>
80101fba:	83 ec 0c             	sub    $0xc,%esp
80101fbd:	68 0b 73 10 80       	push   $0x8010730b
80101fc2:	e8 a9 e3 ff ff       	call   80100370 <panic>
80101fc7:	89 f6                	mov    %esi,%esi
80101fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fd0 <ideinit>:
80101fd0:	55                   	push   %ebp
80101fd1:	89 e5                	mov    %esp,%ebp
80101fd3:	83 ec 10             	sub    $0x10,%esp
80101fd6:	68 26 73 10 80       	push   $0x80107326
80101fdb:	68 e0 a5 10 80       	push   $0x8010a5e0
80101fe0:	e8 8b 23 00 00       	call   80104370 <initlock>
80101fe5:	58                   	pop    %eax
80101fe6:	a1 c0 29 11 80       	mov    0x801129c0,%eax
80101feb:	5a                   	pop    %edx
80101fec:	83 e8 01             	sub    $0x1,%eax
80101fef:	50                   	push   %eax
80101ff0:	6a 0e                	push   $0xe
80101ff2:	e8 a9 02 00 00       	call   801022a0 <ioapicenable>
80101ff7:	83 c4 10             	add    $0x10,%esp
80101ffa:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fff:	90                   	nop
80102000:	ec                   	in     (%dx),%al
80102001:	83 e0 c0             	and    $0xffffffc0,%eax
80102004:	3c 40                	cmp    $0x40,%al
80102006:	75 f8                	jne    80102000 <ideinit+0x30>
80102008:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010200d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102012:	ee                   	out    %al,(%dx)
80102013:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102018:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010201d:	eb 06                	jmp    80102025 <ideinit+0x55>
8010201f:	90                   	nop
80102020:	83 e9 01             	sub    $0x1,%ecx
80102023:	74 0f                	je     80102034 <ideinit+0x64>
80102025:	ec                   	in     (%dx),%al
80102026:	84 c0                	test   %al,%al
80102028:	74 f6                	je     80102020 <ideinit+0x50>
8010202a:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80102031:	00 00 00 
80102034:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102039:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010203e:	ee                   	out    %al,(%dx)
8010203f:	c9                   	leave  
80102040:	c3                   	ret    
80102041:	eb 0d                	jmp    80102050 <ideintr>
80102043:	90                   	nop
80102044:	90                   	nop
80102045:	90                   	nop
80102046:	90                   	nop
80102047:	90                   	nop
80102048:	90                   	nop
80102049:	90                   	nop
8010204a:	90                   	nop
8010204b:	90                   	nop
8010204c:	90                   	nop
8010204d:	90                   	nop
8010204e:	90                   	nop
8010204f:	90                   	nop

80102050 <ideintr>:
80102050:	55                   	push   %ebp
80102051:	89 e5                	mov    %esp,%ebp
80102053:	57                   	push   %edi
80102054:	56                   	push   %esi
80102055:	53                   	push   %ebx
80102056:	83 ec 18             	sub    $0x18,%esp
80102059:	68 e0 a5 10 80       	push   $0x8010a5e0
8010205e:	e8 0d 24 00 00       	call   80104470 <acquire>
80102063:	8b 1d c4 a5 10 80    	mov    0x8010a5c4,%ebx
80102069:	83 c4 10             	add    $0x10,%esp
8010206c:	85 db                	test   %ebx,%ebx
8010206e:	74 34                	je     801020a4 <ideintr+0x54>
80102070:	8b 43 58             	mov    0x58(%ebx),%eax
80102073:	a3 c4 a5 10 80       	mov    %eax,0x8010a5c4
80102078:	8b 33                	mov    (%ebx),%esi
8010207a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102080:	74 3e                	je     801020c0 <ideintr+0x70>
80102082:	83 e6 fb             	and    $0xfffffffb,%esi
80102085:	83 ec 0c             	sub    $0xc,%esp
80102088:	83 ce 02             	or     $0x2,%esi
8010208b:	89 33                	mov    %esi,(%ebx)
8010208d:	53                   	push   %ebx
8010208e:	e8 8d 1e 00 00       	call   80103f20 <wakeup>
80102093:	a1 c4 a5 10 80       	mov    0x8010a5c4,%eax
80102098:	83 c4 10             	add    $0x10,%esp
8010209b:	85 c0                	test   %eax,%eax
8010209d:	74 05                	je     801020a4 <ideintr+0x54>
8010209f:	e8 5c fe ff ff       	call   80101f00 <idestart>
801020a4:	83 ec 0c             	sub    $0xc,%esp
801020a7:	68 e0 a5 10 80       	push   $0x8010a5e0
801020ac:	e8 df 24 00 00       	call   80104590 <release>
801020b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020b4:	5b                   	pop    %ebx
801020b5:	5e                   	pop    %esi
801020b6:	5f                   	pop    %edi
801020b7:	5d                   	pop    %ebp
801020b8:	c3                   	ret    
801020b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801020c0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020c5:	8d 76 00             	lea    0x0(%esi),%esi
801020c8:	ec                   	in     (%dx),%al
801020c9:	89 c1                	mov    %eax,%ecx
801020cb:	83 e1 c0             	and    $0xffffffc0,%ecx
801020ce:	80 f9 40             	cmp    $0x40,%cl
801020d1:	75 f5                	jne    801020c8 <ideintr+0x78>
801020d3:	a8 21                	test   $0x21,%al
801020d5:	75 ab                	jne    80102082 <ideintr+0x32>
801020d7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
801020da:	b9 80 00 00 00       	mov    $0x80,%ecx
801020df:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020e4:	fc                   	cld    
801020e5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020e7:	8b 33                	mov    (%ebx),%esi
801020e9:	eb 97                	jmp    80102082 <ideintr+0x32>
801020eb:	90                   	nop
801020ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020f0 <iderw>:
801020f0:	55                   	push   %ebp
801020f1:	89 e5                	mov    %esp,%ebp
801020f3:	53                   	push   %ebx
801020f4:	83 ec 10             	sub    $0x10,%esp
801020f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801020fa:	8d 43 0c             	lea    0xc(%ebx),%eax
801020fd:	50                   	push   %eax
801020fe:	e8 3d 22 00 00       	call   80104340 <holdingsleep>
80102103:	83 c4 10             	add    $0x10,%esp
80102106:	85 c0                	test   %eax,%eax
80102108:	0f 84 ad 00 00 00    	je     801021bb <iderw+0xcb>
8010210e:	8b 03                	mov    (%ebx),%eax
80102110:	83 e0 06             	and    $0x6,%eax
80102113:	83 f8 02             	cmp    $0x2,%eax
80102116:	0f 84 b9 00 00 00    	je     801021d5 <iderw+0xe5>
8010211c:	8b 53 04             	mov    0x4(%ebx),%edx
8010211f:	85 d2                	test   %edx,%edx
80102121:	74 0d                	je     80102130 <iderw+0x40>
80102123:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
80102128:	85 c0                	test   %eax,%eax
8010212a:	0f 84 98 00 00 00    	je     801021c8 <iderw+0xd8>
80102130:	83 ec 0c             	sub    $0xc,%esp
80102133:	68 e0 a5 10 80       	push   $0x8010a5e0
80102138:	e8 33 23 00 00       	call   80104470 <acquire>
8010213d:	8b 15 c4 a5 10 80    	mov    0x8010a5c4,%edx
80102143:	83 c4 10             	add    $0x10,%esp
80102146:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
8010214d:	85 d2                	test   %edx,%edx
8010214f:	75 09                	jne    8010215a <iderw+0x6a>
80102151:	eb 58                	jmp    801021ab <iderw+0xbb>
80102153:	90                   	nop
80102154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102158:	89 c2                	mov    %eax,%edx
8010215a:	8b 42 58             	mov    0x58(%edx),%eax
8010215d:	85 c0                	test   %eax,%eax
8010215f:	75 f7                	jne    80102158 <iderw+0x68>
80102161:	83 c2 58             	add    $0x58,%edx
80102164:	89 1a                	mov    %ebx,(%edx)
80102166:	3b 1d c4 a5 10 80    	cmp    0x8010a5c4,%ebx
8010216c:	74 44                	je     801021b2 <iderw+0xc2>
8010216e:	8b 03                	mov    (%ebx),%eax
80102170:	83 e0 06             	and    $0x6,%eax
80102173:	83 f8 02             	cmp    $0x2,%eax
80102176:	74 23                	je     8010219b <iderw+0xab>
80102178:	90                   	nop
80102179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102180:	83 ec 08             	sub    $0x8,%esp
80102183:	68 e0 a5 10 80       	push   $0x8010a5e0
80102188:	53                   	push   %ebx
80102189:	e8 d2 1b 00 00       	call   80103d60 <sleep>
8010218e:	8b 03                	mov    (%ebx),%eax
80102190:	83 c4 10             	add    $0x10,%esp
80102193:	83 e0 06             	and    $0x6,%eax
80102196:	83 f8 02             	cmp    $0x2,%eax
80102199:	75 e5                	jne    80102180 <iderw+0x90>
8010219b:	c7 45 08 e0 a5 10 80 	movl   $0x8010a5e0,0x8(%ebp)
801021a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021a5:	c9                   	leave  
801021a6:	e9 e5 23 00 00       	jmp    80104590 <release>
801021ab:	ba c4 a5 10 80       	mov    $0x8010a5c4,%edx
801021b0:	eb b2                	jmp    80102164 <iderw+0x74>
801021b2:	89 d8                	mov    %ebx,%eax
801021b4:	e8 47 fd ff ff       	call   80101f00 <idestart>
801021b9:	eb b3                	jmp    8010216e <iderw+0x7e>
801021bb:	83 ec 0c             	sub    $0xc,%esp
801021be:	68 2a 73 10 80       	push   $0x8010732a
801021c3:	e8 a8 e1 ff ff       	call   80100370 <panic>
801021c8:	83 ec 0c             	sub    $0xc,%esp
801021cb:	68 55 73 10 80       	push   $0x80107355
801021d0:	e8 9b e1 ff ff       	call   80100370 <panic>
801021d5:	83 ec 0c             	sub    $0xc,%esp
801021d8:	68 40 73 10 80       	push   $0x80107340
801021dd:	e8 8e e1 ff ff       	call   80100370 <panic>
801021e2:	66 90                	xchg   %ax,%ax
801021e4:	66 90                	xchg   %ax,%ax
801021e6:	66 90                	xchg   %ax,%ax
801021e8:	66 90                	xchg   %ax,%ax
801021ea:	66 90                	xchg   %ax,%ax
801021ec:	66 90                	xchg   %ax,%ax
801021ee:	66 90                	xchg   %ax,%ax

801021f0 <ioapicinit>:
801021f0:	55                   	push   %ebp
801021f1:	c7 05 14 27 11 80 00 	movl   $0xfec00000,0x80112714
801021f8:	00 c0 fe 
801021fb:	89 e5                	mov    %esp,%ebp
801021fd:	56                   	push   %esi
801021fe:	53                   	push   %ebx
801021ff:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102206:	00 00 00 
80102209:	8b 15 14 27 11 80    	mov    0x80112714,%edx
8010220f:	8b 72 10             	mov    0x10(%edx),%esi
80102212:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102218:	8b 0d 14 27 11 80    	mov    0x80112714,%ecx
8010221e:	0f b6 15 40 28 11 80 	movzbl 0x80112840,%edx
80102225:	89 f0                	mov    %esi,%eax
80102227:	c1 e8 10             	shr    $0x10,%eax
8010222a:	0f b6 f0             	movzbl %al,%esi
8010222d:	8b 41 10             	mov    0x10(%ecx),%eax
80102230:	c1 e8 18             	shr    $0x18,%eax
80102233:	39 d0                	cmp    %edx,%eax
80102235:	74 16                	je     8010224d <ioapicinit+0x5d>
80102237:	83 ec 0c             	sub    $0xc,%esp
8010223a:	68 74 73 10 80       	push   $0x80107374
8010223f:	e8 1c e4 ff ff       	call   80100660 <cprintf>
80102244:	8b 0d 14 27 11 80    	mov    0x80112714,%ecx
8010224a:	83 c4 10             	add    $0x10,%esp
8010224d:	83 c6 21             	add    $0x21,%esi
80102250:	ba 10 00 00 00       	mov    $0x10,%edx
80102255:	b8 20 00 00 00       	mov    $0x20,%eax
8010225a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102260:	89 11                	mov    %edx,(%ecx)
80102262:	8b 0d 14 27 11 80    	mov    0x80112714,%ecx
80102268:	89 c3                	mov    %eax,%ebx
8010226a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102270:	83 c0 01             	add    $0x1,%eax
80102273:	89 59 10             	mov    %ebx,0x10(%ecx)
80102276:	8d 5a 01             	lea    0x1(%edx),%ebx
80102279:	83 c2 02             	add    $0x2,%edx
8010227c:	39 f0                	cmp    %esi,%eax
8010227e:	89 19                	mov    %ebx,(%ecx)
80102280:	8b 0d 14 27 11 80    	mov    0x80112714,%ecx
80102286:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010228d:	75 d1                	jne    80102260 <ioapicinit+0x70>
8010228f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102292:	5b                   	pop    %ebx
80102293:	5e                   	pop    %esi
80102294:	5d                   	pop    %ebp
80102295:	c3                   	ret    
80102296:	8d 76 00             	lea    0x0(%esi),%esi
80102299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022a0 <ioapicenable>:
801022a0:	55                   	push   %ebp
801022a1:	8b 0d 14 27 11 80    	mov    0x80112714,%ecx
801022a7:	89 e5                	mov    %esp,%ebp
801022a9:	8b 45 08             	mov    0x8(%ebp),%eax
801022ac:	8d 50 20             	lea    0x20(%eax),%edx
801022af:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022b3:	89 01                	mov    %eax,(%ecx)
801022b5:	8b 0d 14 27 11 80    	mov    0x80112714,%ecx
801022bb:	83 c0 01             	add    $0x1,%eax
801022be:	89 51 10             	mov    %edx,0x10(%ecx)
801022c1:	8b 55 0c             	mov    0xc(%ebp),%edx
801022c4:	89 01                	mov    %eax,(%ecx)
801022c6:	a1 14 27 11 80       	mov    0x80112714,%eax
801022cb:	c1 e2 18             	shl    $0x18,%edx
801022ce:	89 50 10             	mov    %edx,0x10(%eax)
801022d1:	5d                   	pop    %ebp
801022d2:	c3                   	ret    
801022d3:	66 90                	xchg   %ax,%ax
801022d5:	66 90                	xchg   %ax,%ax
801022d7:	66 90                	xchg   %ax,%ax
801022d9:	66 90                	xchg   %ax,%ax
801022db:	66 90                	xchg   %ax,%ax
801022dd:	66 90                	xchg   %ax,%ax
801022df:	90                   	nop

801022e0 <kfree>:
801022e0:	55                   	push   %ebp
801022e1:	89 e5                	mov    %esp,%ebp
801022e3:	53                   	push   %ebx
801022e4:	83 ec 04             	sub    $0x4,%esp
801022e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801022ea:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022f0:	75 70                	jne    80102362 <kfree+0x82>
801022f2:	81 fb 68 52 11 80    	cmp    $0x80115268,%ebx
801022f8:	72 68                	jb     80102362 <kfree+0x82>
801022fa:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102300:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102305:	77 5b                	ja     80102362 <kfree+0x82>
80102307:	83 ec 04             	sub    $0x4,%esp
8010230a:	68 00 10 00 00       	push   $0x1000
8010230f:	6a 01                	push   $0x1
80102311:	53                   	push   %ebx
80102312:	e8 c9 22 00 00       	call   801045e0 <memset>
80102317:	8b 15 54 27 11 80    	mov    0x80112754,%edx
8010231d:	83 c4 10             	add    $0x10,%esp
80102320:	85 d2                	test   %edx,%edx
80102322:	75 2c                	jne    80102350 <kfree+0x70>
80102324:	a1 58 27 11 80       	mov    0x80112758,%eax
80102329:	89 03                	mov    %eax,(%ebx)
8010232b:	a1 54 27 11 80       	mov    0x80112754,%eax
80102330:	89 1d 58 27 11 80    	mov    %ebx,0x80112758
80102336:	85 c0                	test   %eax,%eax
80102338:	75 06                	jne    80102340 <kfree+0x60>
8010233a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010233d:	c9                   	leave  
8010233e:	c3                   	ret    
8010233f:	90                   	nop
80102340:	c7 45 08 20 27 11 80 	movl   $0x80112720,0x8(%ebp)
80102347:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010234a:	c9                   	leave  
8010234b:	e9 40 22 00 00       	jmp    80104590 <release>
80102350:	83 ec 0c             	sub    $0xc,%esp
80102353:	68 20 27 11 80       	push   $0x80112720
80102358:	e8 13 21 00 00       	call   80104470 <acquire>
8010235d:	83 c4 10             	add    $0x10,%esp
80102360:	eb c2                	jmp    80102324 <kfree+0x44>
80102362:	83 ec 0c             	sub    $0xc,%esp
80102365:	68 a6 73 10 80       	push   $0x801073a6
8010236a:	e8 01 e0 ff ff       	call   80100370 <panic>
8010236f:	90                   	nop

80102370 <freerange>:
80102370:	55                   	push   %ebp
80102371:	89 e5                	mov    %esp,%ebp
80102373:	56                   	push   %esi
80102374:	53                   	push   %ebx
80102375:	8b 45 08             	mov    0x8(%ebp),%eax
80102378:	8b 75 0c             	mov    0xc(%ebp),%esi
8010237b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102381:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102387:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010238d:	39 de                	cmp    %ebx,%esi
8010238f:	72 23                	jb     801023b4 <freerange+0x44>
80102391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102398:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010239e:	83 ec 0c             	sub    $0xc,%esp
801023a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023a7:	50                   	push   %eax
801023a8:	e8 33 ff ff ff       	call   801022e0 <kfree>
801023ad:	83 c4 10             	add    $0x10,%esp
801023b0:	39 f3                	cmp    %esi,%ebx
801023b2:	76 e4                	jbe    80102398 <freerange+0x28>
801023b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023b7:	5b                   	pop    %ebx
801023b8:	5e                   	pop    %esi
801023b9:	5d                   	pop    %ebp
801023ba:	c3                   	ret    
801023bb:	90                   	nop
801023bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023c0 <kinit1>:
801023c0:	55                   	push   %ebp
801023c1:	89 e5                	mov    %esp,%ebp
801023c3:	56                   	push   %esi
801023c4:	53                   	push   %ebx
801023c5:	8b 75 0c             	mov    0xc(%ebp),%esi
801023c8:	83 ec 08             	sub    $0x8,%esp
801023cb:	68 ac 73 10 80       	push   $0x801073ac
801023d0:	68 20 27 11 80       	push   $0x80112720
801023d5:	e8 96 1f 00 00       	call   80104370 <initlock>
801023da:	8b 45 08             	mov    0x8(%ebp),%eax
801023dd:	83 c4 10             	add    $0x10,%esp
801023e0:	c7 05 54 27 11 80 00 	movl   $0x0,0x80112754
801023e7:	00 00 00 
801023ea:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023f0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023f6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023fc:	39 de                	cmp    %ebx,%esi
801023fe:	72 1c                	jb     8010241c <kinit1+0x5c>
80102400:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102406:	83 ec 0c             	sub    $0xc,%esp
80102409:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010240f:	50                   	push   %eax
80102410:	e8 cb fe ff ff       	call   801022e0 <kfree>
80102415:	83 c4 10             	add    $0x10,%esp
80102418:	39 de                	cmp    %ebx,%esi
8010241a:	73 e4                	jae    80102400 <kinit1+0x40>
8010241c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010241f:	5b                   	pop    %ebx
80102420:	5e                   	pop    %esi
80102421:	5d                   	pop    %ebp
80102422:	c3                   	ret    
80102423:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102430 <kinit2>:
80102430:	55                   	push   %ebp
80102431:	89 e5                	mov    %esp,%ebp
80102433:	56                   	push   %esi
80102434:	53                   	push   %ebx
80102435:	8b 45 08             	mov    0x8(%ebp),%eax
80102438:	8b 75 0c             	mov    0xc(%ebp),%esi
8010243b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102441:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102447:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010244d:	39 de                	cmp    %ebx,%esi
8010244f:	72 23                	jb     80102474 <kinit2+0x44>
80102451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102458:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010245e:	83 ec 0c             	sub    $0xc,%esp
80102461:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102467:	50                   	push   %eax
80102468:	e8 73 fe ff ff       	call   801022e0 <kfree>
8010246d:	83 c4 10             	add    $0x10,%esp
80102470:	39 de                	cmp    %ebx,%esi
80102472:	73 e4                	jae    80102458 <kinit2+0x28>
80102474:	c7 05 54 27 11 80 01 	movl   $0x1,0x80112754
8010247b:	00 00 00 
8010247e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102481:	5b                   	pop    %ebx
80102482:	5e                   	pop    %esi
80102483:	5d                   	pop    %ebp
80102484:	c3                   	ret    
80102485:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102490 <kalloc>:
80102490:	55                   	push   %ebp
80102491:	89 e5                	mov    %esp,%ebp
80102493:	53                   	push   %ebx
80102494:	83 ec 04             	sub    $0x4,%esp
80102497:	a1 54 27 11 80       	mov    0x80112754,%eax
8010249c:	85 c0                	test   %eax,%eax
8010249e:	75 30                	jne    801024d0 <kalloc+0x40>
801024a0:	8b 1d 58 27 11 80    	mov    0x80112758,%ebx
801024a6:	85 db                	test   %ebx,%ebx
801024a8:	74 1c                	je     801024c6 <kalloc+0x36>
801024aa:	8b 13                	mov    (%ebx),%edx
801024ac:	89 15 58 27 11 80    	mov    %edx,0x80112758
801024b2:	85 c0                	test   %eax,%eax
801024b4:	74 10                	je     801024c6 <kalloc+0x36>
801024b6:	83 ec 0c             	sub    $0xc,%esp
801024b9:	68 20 27 11 80       	push   $0x80112720
801024be:	e8 cd 20 00 00       	call   80104590 <release>
801024c3:	83 c4 10             	add    $0x10,%esp
801024c6:	89 d8                	mov    %ebx,%eax
801024c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024cb:	c9                   	leave  
801024cc:	c3                   	ret    
801024cd:	8d 76 00             	lea    0x0(%esi),%esi
801024d0:	83 ec 0c             	sub    $0xc,%esp
801024d3:	68 20 27 11 80       	push   $0x80112720
801024d8:	e8 93 1f 00 00       	call   80104470 <acquire>
801024dd:	8b 1d 58 27 11 80    	mov    0x80112758,%ebx
801024e3:	83 c4 10             	add    $0x10,%esp
801024e6:	a1 54 27 11 80       	mov    0x80112754,%eax
801024eb:	85 db                	test   %ebx,%ebx
801024ed:	75 bb                	jne    801024aa <kalloc+0x1a>
801024ef:	eb c1                	jmp    801024b2 <kalloc+0x22>
801024f1:	66 90                	xchg   %ax,%ax
801024f3:	66 90                	xchg   %ax,%ax
801024f5:	66 90                	xchg   %ax,%ax
801024f7:	66 90                	xchg   %ax,%ax
801024f9:	66 90                	xchg   %ax,%ax
801024fb:	66 90                	xchg   %ax,%ax
801024fd:	66 90                	xchg   %ax,%ax
801024ff:	90                   	nop

80102500 <kbdgetc>:
80102500:	55                   	push   %ebp
80102501:	ba 64 00 00 00       	mov    $0x64,%edx
80102506:	89 e5                	mov    %esp,%ebp
80102508:	ec                   	in     (%dx),%al
80102509:	a8 01                	test   $0x1,%al
8010250b:	0f 84 af 00 00 00    	je     801025c0 <kbdgetc+0xc0>
80102511:	ba 60 00 00 00       	mov    $0x60,%edx
80102516:	ec                   	in     (%dx),%al
80102517:	0f b6 d0             	movzbl %al,%edx
8010251a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102520:	74 7e                	je     801025a0 <kbdgetc+0xa0>
80102522:	84 c0                	test   %al,%al
80102524:	8b 0d 14 a6 10 80    	mov    0x8010a614,%ecx
8010252a:	79 24                	jns    80102550 <kbdgetc+0x50>
8010252c:	f6 c1 40             	test   $0x40,%cl
8010252f:	75 05                	jne    80102536 <kbdgetc+0x36>
80102531:	89 c2                	mov    %eax,%edx
80102533:	83 e2 7f             	and    $0x7f,%edx
80102536:	0f b6 82 e0 74 10 80 	movzbl -0x7fef8b20(%edx),%eax
8010253d:	83 c8 40             	or     $0x40,%eax
80102540:	0f b6 c0             	movzbl %al,%eax
80102543:	f7 d0                	not    %eax
80102545:	21 c8                	and    %ecx,%eax
80102547:	a3 14 a6 10 80       	mov    %eax,0x8010a614
8010254c:	31 c0                	xor    %eax,%eax
8010254e:	5d                   	pop    %ebp
8010254f:	c3                   	ret    
80102550:	f6 c1 40             	test   $0x40,%cl
80102553:	74 09                	je     8010255e <kbdgetc+0x5e>
80102555:	83 c8 80             	or     $0xffffff80,%eax
80102558:	83 e1 bf             	and    $0xffffffbf,%ecx
8010255b:	0f b6 d0             	movzbl %al,%edx
8010255e:	0f b6 82 e0 74 10 80 	movzbl -0x7fef8b20(%edx),%eax
80102565:	09 c1                	or     %eax,%ecx
80102567:	0f b6 82 e0 73 10 80 	movzbl -0x7fef8c20(%edx),%eax
8010256e:	31 c1                	xor    %eax,%ecx
80102570:	89 c8                	mov    %ecx,%eax
80102572:	89 0d 14 a6 10 80    	mov    %ecx,0x8010a614
80102578:	83 e0 03             	and    $0x3,%eax
8010257b:	83 e1 08             	and    $0x8,%ecx
8010257e:	8b 04 85 c0 73 10 80 	mov    -0x7fef8c40(,%eax,4),%eax
80102585:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
80102589:	74 c3                	je     8010254e <kbdgetc+0x4e>
8010258b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010258e:	83 fa 19             	cmp    $0x19,%edx
80102591:	77 1d                	ja     801025b0 <kbdgetc+0xb0>
80102593:	83 e8 20             	sub    $0x20,%eax
80102596:	5d                   	pop    %ebp
80102597:	c3                   	ret    
80102598:	90                   	nop
80102599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801025a0:	31 c0                	xor    %eax,%eax
801025a2:	83 0d 14 a6 10 80 40 	orl    $0x40,0x8010a614
801025a9:	5d                   	pop    %ebp
801025aa:	c3                   	ret    
801025ab:	90                   	nop
801025ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025b0:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025b3:	8d 50 20             	lea    0x20(%eax),%edx
801025b6:	5d                   	pop    %ebp
801025b7:	83 f9 19             	cmp    $0x19,%ecx
801025ba:	0f 46 c2             	cmovbe %edx,%eax
801025bd:	c3                   	ret    
801025be:	66 90                	xchg   %ax,%ax
801025c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025c5:	5d                   	pop    %ebp
801025c6:	c3                   	ret    
801025c7:	89 f6                	mov    %esi,%esi
801025c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025d0 <kbdintr>:
801025d0:	55                   	push   %ebp
801025d1:	89 e5                	mov    %esp,%ebp
801025d3:	83 ec 14             	sub    $0x14,%esp
801025d6:	68 00 25 10 80       	push   $0x80102500
801025db:	e8 10 e2 ff ff       	call   801007f0 <consoleintr>
801025e0:	83 c4 10             	add    $0x10,%esp
801025e3:	c9                   	leave  
801025e4:	c3                   	ret    
801025e5:	66 90                	xchg   %ax,%ax
801025e7:	66 90                	xchg   %ax,%ax
801025e9:	66 90                	xchg   %ax,%ax
801025eb:	66 90                	xchg   %ax,%ax
801025ed:	66 90                	xchg   %ax,%ax
801025ef:	90                   	nop

801025f0 <lapicinit>:
801025f0:	a1 5c 27 11 80       	mov    0x8011275c,%eax
801025f5:	55                   	push   %ebp
801025f6:	89 e5                	mov    %esp,%ebp
801025f8:	85 c0                	test   %eax,%eax
801025fa:	0f 84 c8 00 00 00    	je     801026c8 <lapicinit+0xd8>
80102600:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102607:	01 00 00 
8010260a:	8b 50 20             	mov    0x20(%eax),%edx
8010260d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102614:	00 00 00 
80102617:	8b 50 20             	mov    0x20(%eax),%edx
8010261a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102621:	00 02 00 
80102624:	8b 50 20             	mov    0x20(%eax),%edx
80102627:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010262e:	96 98 00 
80102631:	8b 50 20             	mov    0x20(%eax),%edx
80102634:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010263b:	00 01 00 
8010263e:	8b 50 20             	mov    0x20(%eax),%edx
80102641:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102648:	00 01 00 
8010264b:	8b 50 20             	mov    0x20(%eax),%edx
8010264e:	8b 50 30             	mov    0x30(%eax),%edx
80102651:	c1 ea 10             	shr    $0x10,%edx
80102654:	80 fa 03             	cmp    $0x3,%dl
80102657:	77 77                	ja     801026d0 <lapicinit+0xe0>
80102659:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102660:	00 00 00 
80102663:	8b 50 20             	mov    0x20(%eax),%edx
80102666:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010266d:	00 00 00 
80102670:	8b 50 20             	mov    0x20(%eax),%edx
80102673:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010267a:	00 00 00 
8010267d:	8b 50 20             	mov    0x20(%eax),%edx
80102680:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102687:	00 00 00 
8010268a:	8b 50 20             	mov    0x20(%eax),%edx
8010268d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102694:	00 00 00 
80102697:	8b 50 20             	mov    0x20(%eax),%edx
8010269a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026a1:	85 08 00 
801026a4:	8b 50 20             	mov    0x20(%eax),%edx
801026a7:	89 f6                	mov    %esi,%esi
801026a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801026b0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026b6:	80 e6 10             	and    $0x10,%dh
801026b9:	75 f5                	jne    801026b0 <lapicinit+0xc0>
801026bb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026c2:	00 00 00 
801026c5:	8b 40 20             	mov    0x20(%eax),%eax
801026c8:	5d                   	pop    %ebp
801026c9:	c3                   	ret    
801026ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801026d0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026d7:	00 01 00 
801026da:	8b 50 20             	mov    0x20(%eax),%edx
801026dd:	e9 77 ff ff ff       	jmp    80102659 <lapicinit+0x69>
801026e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026f0 <lapicid>:
801026f0:	a1 5c 27 11 80       	mov    0x8011275c,%eax
801026f5:	55                   	push   %ebp
801026f6:	89 e5                	mov    %esp,%ebp
801026f8:	85 c0                	test   %eax,%eax
801026fa:	74 0c                	je     80102708 <lapicid+0x18>
801026fc:	8b 40 20             	mov    0x20(%eax),%eax
801026ff:	5d                   	pop    %ebp
80102700:	c1 e8 18             	shr    $0x18,%eax
80102703:	c3                   	ret    
80102704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102708:	31 c0                	xor    %eax,%eax
8010270a:	5d                   	pop    %ebp
8010270b:	c3                   	ret    
8010270c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102710 <lapiceoi>:
80102710:	a1 5c 27 11 80       	mov    0x8011275c,%eax
80102715:	55                   	push   %ebp
80102716:	89 e5                	mov    %esp,%ebp
80102718:	85 c0                	test   %eax,%eax
8010271a:	74 0d                	je     80102729 <lapiceoi+0x19>
8010271c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102723:	00 00 00 
80102726:	8b 40 20             	mov    0x20(%eax),%eax
80102729:	5d                   	pop    %ebp
8010272a:	c3                   	ret    
8010272b:	90                   	nop
8010272c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102730 <microdelay>:
80102730:	55                   	push   %ebp
80102731:	89 e5                	mov    %esp,%ebp
80102733:	5d                   	pop    %ebp
80102734:	c3                   	ret    
80102735:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102740 <lapicstartap>:
80102740:	55                   	push   %ebp
80102741:	ba 70 00 00 00       	mov    $0x70,%edx
80102746:	b8 0f 00 00 00       	mov    $0xf,%eax
8010274b:	89 e5                	mov    %esp,%ebp
8010274d:	53                   	push   %ebx
8010274e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102751:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102754:	ee                   	out    %al,(%dx)
80102755:	ba 71 00 00 00       	mov    $0x71,%edx
8010275a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010275f:	ee                   	out    %al,(%dx)
80102760:	31 c0                	xor    %eax,%eax
80102762:	c1 e3 18             	shl    $0x18,%ebx
80102765:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010276b:	89 c8                	mov    %ecx,%eax
8010276d:	c1 e9 0c             	shr    $0xc,%ecx
80102770:	c1 e8 04             	shr    $0x4,%eax
80102773:	89 da                	mov    %ebx,%edx
80102775:	80 cd 06             	or     $0x6,%ch
80102778:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010277e:	a1 5c 27 11 80       	mov    0x8011275c,%eax
80102783:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102789:	8b 58 20             	mov    0x20(%eax),%ebx
8010278c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102793:	c5 00 00 
80102796:	8b 58 20             	mov    0x20(%eax),%ebx
80102799:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027a0:	85 00 00 
801027a3:	8b 58 20             	mov    0x20(%eax),%ebx
801027a6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027ac:	8b 58 20             	mov    0x20(%eax),%ebx
801027af:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027b5:	8b 58 20             	mov    0x20(%eax),%ebx
801027b8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027be:	8b 50 20             	mov    0x20(%eax),%edx
801027c1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027c7:	8b 40 20             	mov    0x20(%eax),%eax
801027ca:	5b                   	pop    %ebx
801027cb:	5d                   	pop    %ebp
801027cc:	c3                   	ret    
801027cd:	8d 76 00             	lea    0x0(%esi),%esi

801027d0 <cmostime>:
801027d0:	55                   	push   %ebp
801027d1:	ba 70 00 00 00       	mov    $0x70,%edx
801027d6:	b8 0b 00 00 00       	mov    $0xb,%eax
801027db:	89 e5                	mov    %esp,%ebp
801027dd:	57                   	push   %edi
801027de:	56                   	push   %esi
801027df:	53                   	push   %ebx
801027e0:	83 ec 4c             	sub    $0x4c,%esp
801027e3:	ee                   	out    %al,(%dx)
801027e4:	ba 71 00 00 00       	mov    $0x71,%edx
801027e9:	ec                   	in     (%dx),%al
801027ea:	83 e0 04             	and    $0x4,%eax
801027ed:	8d 75 d0             	lea    -0x30(%ebp),%esi
801027f0:	31 db                	xor    %ebx,%ebx
801027f2:	88 45 b7             	mov    %al,-0x49(%ebp)
801027f5:	bf 70 00 00 00       	mov    $0x70,%edi
801027fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102800:	89 d8                	mov    %ebx,%eax
80102802:	89 fa                	mov    %edi,%edx
80102804:	ee                   	out    %al,(%dx)
80102805:	b9 71 00 00 00       	mov    $0x71,%ecx
8010280a:	89 ca                	mov    %ecx,%edx
8010280c:	ec                   	in     (%dx),%al
8010280d:	0f b6 c0             	movzbl %al,%eax
80102810:	89 fa                	mov    %edi,%edx
80102812:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102815:	b8 02 00 00 00       	mov    $0x2,%eax
8010281a:	ee                   	out    %al,(%dx)
8010281b:	89 ca                	mov    %ecx,%edx
8010281d:	ec                   	in     (%dx),%al
8010281e:	0f b6 c0             	movzbl %al,%eax
80102821:	89 fa                	mov    %edi,%edx
80102823:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102826:	b8 04 00 00 00       	mov    $0x4,%eax
8010282b:	ee                   	out    %al,(%dx)
8010282c:	89 ca                	mov    %ecx,%edx
8010282e:	ec                   	in     (%dx),%al
8010282f:	0f b6 c0             	movzbl %al,%eax
80102832:	89 fa                	mov    %edi,%edx
80102834:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102837:	b8 07 00 00 00       	mov    $0x7,%eax
8010283c:	ee                   	out    %al,(%dx)
8010283d:	89 ca                	mov    %ecx,%edx
8010283f:	ec                   	in     (%dx),%al
80102840:	0f b6 c0             	movzbl %al,%eax
80102843:	89 fa                	mov    %edi,%edx
80102845:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102848:	b8 08 00 00 00       	mov    $0x8,%eax
8010284d:	ee                   	out    %al,(%dx)
8010284e:	89 ca                	mov    %ecx,%edx
80102850:	ec                   	in     (%dx),%al
80102851:	0f b6 c0             	movzbl %al,%eax
80102854:	89 fa                	mov    %edi,%edx
80102856:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102859:	b8 09 00 00 00       	mov    $0x9,%eax
8010285e:	ee                   	out    %al,(%dx)
8010285f:	89 ca                	mov    %ecx,%edx
80102861:	ec                   	in     (%dx),%al
80102862:	0f b6 c0             	movzbl %al,%eax
80102865:	89 fa                	mov    %edi,%edx
80102867:	89 45 cc             	mov    %eax,-0x34(%ebp)
8010286a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010286f:	ee                   	out    %al,(%dx)
80102870:	89 ca                	mov    %ecx,%edx
80102872:	ec                   	in     (%dx),%al
80102873:	84 c0                	test   %al,%al
80102875:	78 89                	js     80102800 <cmostime+0x30>
80102877:	89 d8                	mov    %ebx,%eax
80102879:	89 fa                	mov    %edi,%edx
8010287b:	ee                   	out    %al,(%dx)
8010287c:	89 ca                	mov    %ecx,%edx
8010287e:	ec                   	in     (%dx),%al
8010287f:	0f b6 c0             	movzbl %al,%eax
80102882:	89 fa                	mov    %edi,%edx
80102884:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102887:	b8 02 00 00 00       	mov    $0x2,%eax
8010288c:	ee                   	out    %al,(%dx)
8010288d:	89 ca                	mov    %ecx,%edx
8010288f:	ec                   	in     (%dx),%al
80102890:	0f b6 c0             	movzbl %al,%eax
80102893:	89 fa                	mov    %edi,%edx
80102895:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102898:	b8 04 00 00 00       	mov    $0x4,%eax
8010289d:	ee                   	out    %al,(%dx)
8010289e:	89 ca                	mov    %ecx,%edx
801028a0:	ec                   	in     (%dx),%al
801028a1:	0f b6 c0             	movzbl %al,%eax
801028a4:	89 fa                	mov    %edi,%edx
801028a6:	89 45 d8             	mov    %eax,-0x28(%ebp)
801028a9:	b8 07 00 00 00       	mov    $0x7,%eax
801028ae:	ee                   	out    %al,(%dx)
801028af:	89 ca                	mov    %ecx,%edx
801028b1:	ec                   	in     (%dx),%al
801028b2:	0f b6 c0             	movzbl %al,%eax
801028b5:	89 fa                	mov    %edi,%edx
801028b7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028ba:	b8 08 00 00 00       	mov    $0x8,%eax
801028bf:	ee                   	out    %al,(%dx)
801028c0:	89 ca                	mov    %ecx,%edx
801028c2:	ec                   	in     (%dx),%al
801028c3:	0f b6 c0             	movzbl %al,%eax
801028c6:	89 fa                	mov    %edi,%edx
801028c8:	89 45 e0             	mov    %eax,-0x20(%ebp)
801028cb:	b8 09 00 00 00       	mov    $0x9,%eax
801028d0:	ee                   	out    %al,(%dx)
801028d1:	89 ca                	mov    %ecx,%edx
801028d3:	ec                   	in     (%dx),%al
801028d4:	0f b6 c0             	movzbl %al,%eax
801028d7:	83 ec 04             	sub    $0x4,%esp
801028da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801028dd:	8d 45 b8             	lea    -0x48(%ebp),%eax
801028e0:	6a 18                	push   $0x18
801028e2:	56                   	push   %esi
801028e3:	50                   	push   %eax
801028e4:	e8 47 1d 00 00       	call   80104630 <memcmp>
801028e9:	83 c4 10             	add    $0x10,%esp
801028ec:	85 c0                	test   %eax,%eax
801028ee:	0f 85 0c ff ff ff    	jne    80102800 <cmostime+0x30>
801028f4:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801028f8:	75 78                	jne    80102972 <cmostime+0x1a2>
801028fa:	8b 45 b8             	mov    -0x48(%ebp),%eax
801028fd:	89 c2                	mov    %eax,%edx
801028ff:	83 e0 0f             	and    $0xf,%eax
80102902:	c1 ea 04             	shr    $0x4,%edx
80102905:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102908:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010290b:	89 45 b8             	mov    %eax,-0x48(%ebp)
8010290e:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102911:	89 c2                	mov    %eax,%edx
80102913:	83 e0 0f             	and    $0xf,%eax
80102916:	c1 ea 04             	shr    $0x4,%edx
80102919:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010291c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010291f:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102922:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102925:	89 c2                	mov    %eax,%edx
80102927:	83 e0 0f             	and    $0xf,%eax
8010292a:	c1 ea 04             	shr    $0x4,%edx
8010292d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102930:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102933:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102936:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102939:	89 c2                	mov    %eax,%edx
8010293b:	83 e0 0f             	and    $0xf,%eax
8010293e:	c1 ea 04             	shr    $0x4,%edx
80102941:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102944:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102947:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010294a:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010294d:	89 c2                	mov    %eax,%edx
8010294f:	83 e0 0f             	and    $0xf,%eax
80102952:	c1 ea 04             	shr    $0x4,%edx
80102955:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102958:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010295b:	89 45 c8             	mov    %eax,-0x38(%ebp)
8010295e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102961:	89 c2                	mov    %eax,%edx
80102963:	83 e0 0f             	and    $0xf,%eax
80102966:	c1 ea 04             	shr    $0x4,%edx
80102969:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010296c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010296f:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102972:	8b 75 08             	mov    0x8(%ebp),%esi
80102975:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102978:	89 06                	mov    %eax,(%esi)
8010297a:	8b 45 bc             	mov    -0x44(%ebp),%eax
8010297d:	89 46 04             	mov    %eax,0x4(%esi)
80102980:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102983:	89 46 08             	mov    %eax,0x8(%esi)
80102986:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102989:	89 46 0c             	mov    %eax,0xc(%esi)
8010298c:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010298f:	89 46 10             	mov    %eax,0x10(%esi)
80102992:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102995:	89 46 14             	mov    %eax,0x14(%esi)
80102998:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
8010299f:	8d 65 f4             	lea    -0xc(%ebp),%esp
801029a2:	5b                   	pop    %ebx
801029a3:	5e                   	pop    %esi
801029a4:	5f                   	pop    %edi
801029a5:	5d                   	pop    %ebp
801029a6:	c3                   	ret    
801029a7:	66 90                	xchg   %ax,%ax
801029a9:	66 90                	xchg   %ax,%ax
801029ab:	66 90                	xchg   %ax,%ax
801029ad:	66 90                	xchg   %ax,%ax
801029af:	90                   	nop

801029b0 <install_trans>:
801029b0:	8b 0d a8 27 11 80    	mov    0x801127a8,%ecx
801029b6:	85 c9                	test   %ecx,%ecx
801029b8:	0f 8e 85 00 00 00    	jle    80102a43 <install_trans+0x93>
801029be:	55                   	push   %ebp
801029bf:	89 e5                	mov    %esp,%ebp
801029c1:	57                   	push   %edi
801029c2:	56                   	push   %esi
801029c3:	53                   	push   %ebx
801029c4:	31 db                	xor    %ebx,%ebx
801029c6:	83 ec 0c             	sub    $0xc,%esp
801029c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801029d0:	a1 94 27 11 80       	mov    0x80112794,%eax
801029d5:	83 ec 08             	sub    $0x8,%esp
801029d8:	01 d8                	add    %ebx,%eax
801029da:	83 c0 01             	add    $0x1,%eax
801029dd:	50                   	push   %eax
801029de:	ff 35 a4 27 11 80    	pushl  0x801127a4
801029e4:	e8 e7 d6 ff ff       	call   801000d0 <bread>
801029e9:	89 c7                	mov    %eax,%edi
801029eb:	58                   	pop    %eax
801029ec:	5a                   	pop    %edx
801029ed:	ff 34 9d ac 27 11 80 	pushl  -0x7feed854(,%ebx,4)
801029f4:	ff 35 a4 27 11 80    	pushl  0x801127a4
801029fa:	83 c3 01             	add    $0x1,%ebx
801029fd:	e8 ce d6 ff ff       	call   801000d0 <bread>
80102a02:	89 c6                	mov    %eax,%esi
80102a04:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a07:	83 c4 0c             	add    $0xc,%esp
80102a0a:	68 00 02 00 00       	push   $0x200
80102a0f:	50                   	push   %eax
80102a10:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a13:	50                   	push   %eax
80102a14:	e8 77 1c 00 00       	call   80104690 <memmove>
80102a19:	89 34 24             	mov    %esi,(%esp)
80102a1c:	e8 7f d7 ff ff       	call   801001a0 <bwrite>
80102a21:	89 3c 24             	mov    %edi,(%esp)
80102a24:	e8 b7 d7 ff ff       	call   801001e0 <brelse>
80102a29:	89 34 24             	mov    %esi,(%esp)
80102a2c:	e8 af d7 ff ff       	call   801001e0 <brelse>
80102a31:	83 c4 10             	add    $0x10,%esp
80102a34:	39 1d a8 27 11 80    	cmp    %ebx,0x801127a8
80102a3a:	7f 94                	jg     801029d0 <install_trans+0x20>
80102a3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a3f:	5b                   	pop    %ebx
80102a40:	5e                   	pop    %esi
80102a41:	5f                   	pop    %edi
80102a42:	5d                   	pop    %ebp
80102a43:	f3 c3                	repz ret 
80102a45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a50 <write_head>:
80102a50:	55                   	push   %ebp
80102a51:	89 e5                	mov    %esp,%ebp
80102a53:	53                   	push   %ebx
80102a54:	83 ec 0c             	sub    $0xc,%esp
80102a57:	ff 35 94 27 11 80    	pushl  0x80112794
80102a5d:	ff 35 a4 27 11 80    	pushl  0x801127a4
80102a63:	e8 68 d6 ff ff       	call   801000d0 <bread>
80102a68:	8b 0d a8 27 11 80    	mov    0x801127a8,%ecx
80102a6e:	83 c4 10             	add    $0x10,%esp
80102a71:	89 c3                	mov    %eax,%ebx
80102a73:	85 c9                	test   %ecx,%ecx
80102a75:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102a78:	7e 1f                	jle    80102a99 <write_head+0x49>
80102a7a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102a81:	31 d2                	xor    %edx,%edx
80102a83:	90                   	nop
80102a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a88:	8b 8a ac 27 11 80    	mov    -0x7feed854(%edx),%ecx
80102a8e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102a92:	83 c2 04             	add    $0x4,%edx
80102a95:	39 c2                	cmp    %eax,%edx
80102a97:	75 ef                	jne    80102a88 <write_head+0x38>
80102a99:	83 ec 0c             	sub    $0xc,%esp
80102a9c:	53                   	push   %ebx
80102a9d:	e8 fe d6 ff ff       	call   801001a0 <bwrite>
80102aa2:	89 1c 24             	mov    %ebx,(%esp)
80102aa5:	e8 36 d7 ff ff       	call   801001e0 <brelse>
80102aaa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102aad:	c9                   	leave  
80102aae:	c3                   	ret    
80102aaf:	90                   	nop

80102ab0 <initlog>:
80102ab0:	55                   	push   %ebp
80102ab1:	89 e5                	mov    %esp,%ebp
80102ab3:	53                   	push   %ebx
80102ab4:	83 ec 2c             	sub    $0x2c,%esp
80102ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102aba:	68 e0 75 10 80       	push   $0x801075e0
80102abf:	68 60 27 11 80       	push   $0x80112760
80102ac4:	e8 a7 18 00 00       	call   80104370 <initlock>
80102ac9:	58                   	pop    %eax
80102aca:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102acd:	5a                   	pop    %edx
80102ace:	50                   	push   %eax
80102acf:	53                   	push   %ebx
80102ad0:	e8 db e8 ff ff       	call   801013b0 <readsb>
80102ad5:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102ad8:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102adb:	59                   	pop    %ecx
80102adc:	89 1d a4 27 11 80    	mov    %ebx,0x801127a4
80102ae2:	89 15 98 27 11 80    	mov    %edx,0x80112798
80102ae8:	a3 94 27 11 80       	mov    %eax,0x80112794
80102aed:	5a                   	pop    %edx
80102aee:	50                   	push   %eax
80102aef:	53                   	push   %ebx
80102af0:	e8 db d5 ff ff       	call   801000d0 <bread>
80102af5:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102af8:	83 c4 10             	add    $0x10,%esp
80102afb:	85 c9                	test   %ecx,%ecx
80102afd:	89 0d a8 27 11 80    	mov    %ecx,0x801127a8
80102b03:	7e 1c                	jle    80102b21 <initlog+0x71>
80102b05:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b0c:	31 d2                	xor    %edx,%edx
80102b0e:	66 90                	xchg   %ax,%ax
80102b10:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b14:	83 c2 04             	add    $0x4,%edx
80102b17:	89 8a a8 27 11 80    	mov    %ecx,-0x7feed858(%edx)
80102b1d:	39 da                	cmp    %ebx,%edx
80102b1f:	75 ef                	jne    80102b10 <initlog+0x60>
80102b21:	83 ec 0c             	sub    $0xc,%esp
80102b24:	50                   	push   %eax
80102b25:	e8 b6 d6 ff ff       	call   801001e0 <brelse>
80102b2a:	e8 81 fe ff ff       	call   801029b0 <install_trans>
80102b2f:	c7 05 a8 27 11 80 00 	movl   $0x0,0x801127a8
80102b36:	00 00 00 
80102b39:	e8 12 ff ff ff       	call   80102a50 <write_head>
80102b3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b41:	c9                   	leave  
80102b42:	c3                   	ret    
80102b43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b50 <begin_op>:
80102b50:	55                   	push   %ebp
80102b51:	89 e5                	mov    %esp,%ebp
80102b53:	83 ec 14             	sub    $0x14,%esp
80102b56:	68 60 27 11 80       	push   $0x80112760
80102b5b:	e8 10 19 00 00       	call   80104470 <acquire>
80102b60:	83 c4 10             	add    $0x10,%esp
80102b63:	eb 18                	jmp    80102b7d <begin_op+0x2d>
80102b65:	8d 76 00             	lea    0x0(%esi),%esi
80102b68:	83 ec 08             	sub    $0x8,%esp
80102b6b:	68 60 27 11 80       	push   $0x80112760
80102b70:	68 60 27 11 80       	push   $0x80112760
80102b75:	e8 e6 11 00 00       	call   80103d60 <sleep>
80102b7a:	83 c4 10             	add    $0x10,%esp
80102b7d:	a1 a0 27 11 80       	mov    0x801127a0,%eax
80102b82:	85 c0                	test   %eax,%eax
80102b84:	75 e2                	jne    80102b68 <begin_op+0x18>
80102b86:	a1 9c 27 11 80       	mov    0x8011279c,%eax
80102b8b:	8b 15 a8 27 11 80    	mov    0x801127a8,%edx
80102b91:	83 c0 01             	add    $0x1,%eax
80102b94:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102b97:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102b9a:	83 fa 1e             	cmp    $0x1e,%edx
80102b9d:	7f c9                	jg     80102b68 <begin_op+0x18>
80102b9f:	83 ec 0c             	sub    $0xc,%esp
80102ba2:	a3 9c 27 11 80       	mov    %eax,0x8011279c
80102ba7:	68 60 27 11 80       	push   $0x80112760
80102bac:	e8 df 19 00 00       	call   80104590 <release>
80102bb1:	83 c4 10             	add    $0x10,%esp
80102bb4:	c9                   	leave  
80102bb5:	c3                   	ret    
80102bb6:	8d 76 00             	lea    0x0(%esi),%esi
80102bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bc0 <end_op>:
80102bc0:	55                   	push   %ebp
80102bc1:	89 e5                	mov    %esp,%ebp
80102bc3:	57                   	push   %edi
80102bc4:	56                   	push   %esi
80102bc5:	53                   	push   %ebx
80102bc6:	83 ec 18             	sub    $0x18,%esp
80102bc9:	68 60 27 11 80       	push   $0x80112760
80102bce:	e8 9d 18 00 00       	call   80104470 <acquire>
80102bd3:	a1 9c 27 11 80       	mov    0x8011279c,%eax
80102bd8:	8b 1d a0 27 11 80    	mov    0x801127a0,%ebx
80102bde:	83 c4 10             	add    $0x10,%esp
80102be1:	83 e8 01             	sub    $0x1,%eax
80102be4:	85 db                	test   %ebx,%ebx
80102be6:	a3 9c 27 11 80       	mov    %eax,0x8011279c
80102beb:	0f 85 23 01 00 00    	jne    80102d14 <end_op+0x154>
80102bf1:	85 c0                	test   %eax,%eax
80102bf3:	0f 85 f7 00 00 00    	jne    80102cf0 <end_op+0x130>
80102bf9:	83 ec 0c             	sub    $0xc,%esp
80102bfc:	c7 05 a0 27 11 80 01 	movl   $0x1,0x801127a0
80102c03:	00 00 00 
80102c06:	31 db                	xor    %ebx,%ebx
80102c08:	68 60 27 11 80       	push   $0x80112760
80102c0d:	e8 7e 19 00 00       	call   80104590 <release>
80102c12:	8b 0d a8 27 11 80    	mov    0x801127a8,%ecx
80102c18:	83 c4 10             	add    $0x10,%esp
80102c1b:	85 c9                	test   %ecx,%ecx
80102c1d:	0f 8e 8a 00 00 00    	jle    80102cad <end_op+0xed>
80102c23:	90                   	nop
80102c24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c28:	a1 94 27 11 80       	mov    0x80112794,%eax
80102c2d:	83 ec 08             	sub    $0x8,%esp
80102c30:	01 d8                	add    %ebx,%eax
80102c32:	83 c0 01             	add    $0x1,%eax
80102c35:	50                   	push   %eax
80102c36:	ff 35 a4 27 11 80    	pushl  0x801127a4
80102c3c:	e8 8f d4 ff ff       	call   801000d0 <bread>
80102c41:	89 c6                	mov    %eax,%esi
80102c43:	58                   	pop    %eax
80102c44:	5a                   	pop    %edx
80102c45:	ff 34 9d ac 27 11 80 	pushl  -0x7feed854(,%ebx,4)
80102c4c:	ff 35 a4 27 11 80    	pushl  0x801127a4
80102c52:	83 c3 01             	add    $0x1,%ebx
80102c55:	e8 76 d4 ff ff       	call   801000d0 <bread>
80102c5a:	89 c7                	mov    %eax,%edi
80102c5c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c5f:	83 c4 0c             	add    $0xc,%esp
80102c62:	68 00 02 00 00       	push   $0x200
80102c67:	50                   	push   %eax
80102c68:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c6b:	50                   	push   %eax
80102c6c:	e8 1f 1a 00 00       	call   80104690 <memmove>
80102c71:	89 34 24             	mov    %esi,(%esp)
80102c74:	e8 27 d5 ff ff       	call   801001a0 <bwrite>
80102c79:	89 3c 24             	mov    %edi,(%esp)
80102c7c:	e8 5f d5 ff ff       	call   801001e0 <brelse>
80102c81:	89 34 24             	mov    %esi,(%esp)
80102c84:	e8 57 d5 ff ff       	call   801001e0 <brelse>
80102c89:	83 c4 10             	add    $0x10,%esp
80102c8c:	3b 1d a8 27 11 80    	cmp    0x801127a8,%ebx
80102c92:	7c 94                	jl     80102c28 <end_op+0x68>
80102c94:	e8 b7 fd ff ff       	call   80102a50 <write_head>
80102c99:	e8 12 fd ff ff       	call   801029b0 <install_trans>
80102c9e:	c7 05 a8 27 11 80 00 	movl   $0x0,0x801127a8
80102ca5:	00 00 00 
80102ca8:	e8 a3 fd ff ff       	call   80102a50 <write_head>
80102cad:	83 ec 0c             	sub    $0xc,%esp
80102cb0:	68 60 27 11 80       	push   $0x80112760
80102cb5:	e8 b6 17 00 00       	call   80104470 <acquire>
80102cba:	c7 04 24 60 27 11 80 	movl   $0x80112760,(%esp)
80102cc1:	c7 05 a0 27 11 80 00 	movl   $0x0,0x801127a0
80102cc8:	00 00 00 
80102ccb:	e8 50 12 00 00       	call   80103f20 <wakeup>
80102cd0:	c7 04 24 60 27 11 80 	movl   $0x80112760,(%esp)
80102cd7:	e8 b4 18 00 00       	call   80104590 <release>
80102cdc:	83 c4 10             	add    $0x10,%esp
80102cdf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ce2:	5b                   	pop    %ebx
80102ce3:	5e                   	pop    %esi
80102ce4:	5f                   	pop    %edi
80102ce5:	5d                   	pop    %ebp
80102ce6:	c3                   	ret    
80102ce7:	89 f6                	mov    %esi,%esi
80102ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102cf0:	83 ec 0c             	sub    $0xc,%esp
80102cf3:	68 60 27 11 80       	push   $0x80112760
80102cf8:	e8 23 12 00 00       	call   80103f20 <wakeup>
80102cfd:	c7 04 24 60 27 11 80 	movl   $0x80112760,(%esp)
80102d04:	e8 87 18 00 00       	call   80104590 <release>
80102d09:	83 c4 10             	add    $0x10,%esp
80102d0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d0f:	5b                   	pop    %ebx
80102d10:	5e                   	pop    %esi
80102d11:	5f                   	pop    %edi
80102d12:	5d                   	pop    %ebp
80102d13:	c3                   	ret    
80102d14:	83 ec 0c             	sub    $0xc,%esp
80102d17:	68 e4 75 10 80       	push   $0x801075e4
80102d1c:	e8 4f d6 ff ff       	call   80100370 <panic>
80102d21:	eb 0d                	jmp    80102d30 <log_write>
80102d23:	90                   	nop
80102d24:	90                   	nop
80102d25:	90                   	nop
80102d26:	90                   	nop
80102d27:	90                   	nop
80102d28:	90                   	nop
80102d29:	90                   	nop
80102d2a:	90                   	nop
80102d2b:	90                   	nop
80102d2c:	90                   	nop
80102d2d:	90                   	nop
80102d2e:	90                   	nop
80102d2f:	90                   	nop

80102d30 <log_write>:
80102d30:	55                   	push   %ebp
80102d31:	89 e5                	mov    %esp,%ebp
80102d33:	53                   	push   %ebx
80102d34:	83 ec 04             	sub    $0x4,%esp
80102d37:	8b 15 a8 27 11 80    	mov    0x801127a8,%edx
80102d3d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d40:	83 fa 1d             	cmp    $0x1d,%edx
80102d43:	0f 8f 97 00 00 00    	jg     80102de0 <log_write+0xb0>
80102d49:	a1 98 27 11 80       	mov    0x80112798,%eax
80102d4e:	83 e8 01             	sub    $0x1,%eax
80102d51:	39 c2                	cmp    %eax,%edx
80102d53:	0f 8d 87 00 00 00    	jge    80102de0 <log_write+0xb0>
80102d59:	a1 9c 27 11 80       	mov    0x8011279c,%eax
80102d5e:	85 c0                	test   %eax,%eax
80102d60:	0f 8e 87 00 00 00    	jle    80102ded <log_write+0xbd>
80102d66:	83 ec 0c             	sub    $0xc,%esp
80102d69:	68 60 27 11 80       	push   $0x80112760
80102d6e:	e8 fd 16 00 00       	call   80104470 <acquire>
80102d73:	8b 15 a8 27 11 80    	mov    0x801127a8,%edx
80102d79:	83 c4 10             	add    $0x10,%esp
80102d7c:	83 fa 00             	cmp    $0x0,%edx
80102d7f:	7e 50                	jle    80102dd1 <log_write+0xa1>
80102d81:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102d84:	31 c0                	xor    %eax,%eax
80102d86:	3b 0d ac 27 11 80    	cmp    0x801127ac,%ecx
80102d8c:	75 0b                	jne    80102d99 <log_write+0x69>
80102d8e:	eb 38                	jmp    80102dc8 <log_write+0x98>
80102d90:	39 0c 85 ac 27 11 80 	cmp    %ecx,-0x7feed854(,%eax,4)
80102d97:	74 2f                	je     80102dc8 <log_write+0x98>
80102d99:	83 c0 01             	add    $0x1,%eax
80102d9c:	39 d0                	cmp    %edx,%eax
80102d9e:	75 f0                	jne    80102d90 <log_write+0x60>
80102da0:	89 0c 95 ac 27 11 80 	mov    %ecx,-0x7feed854(,%edx,4)
80102da7:	83 c2 01             	add    $0x1,%edx
80102daa:	89 15 a8 27 11 80    	mov    %edx,0x801127a8
80102db0:	83 0b 04             	orl    $0x4,(%ebx)
80102db3:	c7 45 08 60 27 11 80 	movl   $0x80112760,0x8(%ebp)
80102dba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102dbd:	c9                   	leave  
80102dbe:	e9 cd 17 00 00       	jmp    80104590 <release>
80102dc3:	90                   	nop
80102dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102dc8:	89 0c 85 ac 27 11 80 	mov    %ecx,-0x7feed854(,%eax,4)
80102dcf:	eb df                	jmp    80102db0 <log_write+0x80>
80102dd1:	8b 43 08             	mov    0x8(%ebx),%eax
80102dd4:	a3 ac 27 11 80       	mov    %eax,0x801127ac
80102dd9:	75 d5                	jne    80102db0 <log_write+0x80>
80102ddb:	eb ca                	jmp    80102da7 <log_write+0x77>
80102ddd:	8d 76 00             	lea    0x0(%esi),%esi
80102de0:	83 ec 0c             	sub    $0xc,%esp
80102de3:	68 f3 75 10 80       	push   $0x801075f3
80102de8:	e8 83 d5 ff ff       	call   80100370 <panic>
80102ded:	83 ec 0c             	sub    $0xc,%esp
80102df0:	68 09 76 10 80       	push   $0x80107609
80102df5:	e8 76 d5 ff ff       	call   80100370 <panic>
80102dfa:	66 90                	xchg   %ax,%ax
80102dfc:	66 90                	xchg   %ax,%ax
80102dfe:	66 90                	xchg   %ax,%ax

80102e00 <mpmain>:
80102e00:	55                   	push   %ebp
80102e01:	89 e5                	mov    %esp,%ebp
80102e03:	53                   	push   %ebx
80102e04:	83 ec 04             	sub    $0x4,%esp
80102e07:	e8 64 09 00 00       	call   80103770 <cpuid>
80102e0c:	89 c3                	mov    %eax,%ebx
80102e0e:	e8 5d 09 00 00       	call   80103770 <cpuid>
80102e13:	83 ec 04             	sub    $0x4,%esp
80102e16:	53                   	push   %ebx
80102e17:	50                   	push   %eax
80102e18:	68 24 76 10 80       	push   $0x80107624
80102e1d:	e8 3e d8 ff ff       	call   80100660 <cprintf>
80102e22:	e8 29 2b 00 00       	call   80105950 <idtinit>
80102e27:	e8 d4 08 00 00       	call   80103700 <mycpu>
80102e2c:	89 c2                	mov    %eax,%edx
80102e2e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e33:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102e3a:	e8 11 0c 00 00       	call   80103a50 <scheduler>
80102e3f:	90                   	nop

80102e40 <mpenter>:
80102e40:	55                   	push   %ebp
80102e41:	89 e5                	mov    %esp,%ebp
80102e43:	83 ec 08             	sub    $0x8,%esp
80102e46:	e8 25 3c 00 00       	call   80106a70 <switchkvm>
80102e4b:	e8 20 3b 00 00       	call   80106970 <seginit>
80102e50:	e8 9b f7 ff ff       	call   801025f0 <lapicinit>
80102e55:	e8 a6 ff ff ff       	call   80102e00 <mpmain>
80102e5a:	66 90                	xchg   %ax,%ax
80102e5c:	66 90                	xchg   %ax,%ax
80102e5e:	66 90                	xchg   %ax,%ax

80102e60 <main>:
80102e60:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102e64:	83 e4 f0             	and    $0xfffffff0,%esp
80102e67:	ff 71 fc             	pushl  -0x4(%ecx)
80102e6a:	55                   	push   %ebp
80102e6b:	89 e5                	mov    %esp,%ebp
80102e6d:	53                   	push   %ebx
80102e6e:	51                   	push   %ecx
80102e6f:	bb 60 28 11 80       	mov    $0x80112860,%ebx
80102e74:	83 ec 08             	sub    $0x8,%esp
80102e77:	68 00 00 40 80       	push   $0x80400000
80102e7c:	68 68 52 11 80       	push   $0x80115268
80102e81:	e8 3a f5 ff ff       	call   801023c0 <kinit1>
80102e86:	e8 85 40 00 00       	call   80106f10 <kvmalloc>
80102e8b:	e8 70 01 00 00       	call   80103000 <mpinit>
80102e90:	e8 5b f7 ff ff       	call   801025f0 <lapicinit>
80102e95:	e8 d6 3a 00 00       	call   80106970 <seginit>
80102e9a:	e8 31 03 00 00       	call   801031d0 <picinit>
80102e9f:	e8 4c f3 ff ff       	call   801021f0 <ioapicinit>
80102ea4:	e8 f7 da ff ff       	call   801009a0 <consoleinit>
80102ea9:	e8 92 2d 00 00       	call   80105c40 <uartinit>
80102eae:	e8 2d 08 00 00       	call   801036e0 <pinit>
80102eb3:	e8 f8 29 00 00       	call   801058b0 <tvinit>
80102eb8:	e8 83 d1 ff ff       	call   80100040 <binit>
80102ebd:	e8 8e de ff ff       	call   80100d50 <fileinit>
80102ec2:	e8 09 f1 ff ff       	call   80101fd0 <ideinit>
80102ec7:	83 c4 0c             	add    $0xc,%esp
80102eca:	68 8a 00 00 00       	push   $0x8a
80102ecf:	68 ec a4 10 80       	push   $0x8010a4ec
80102ed4:	68 00 70 00 80       	push   $0x80007000
80102ed9:	e8 b2 17 00 00       	call   80104690 <memmove>
80102ede:	69 05 c0 29 11 80 b0 	imul   $0xb0,0x801129c0,%eax
80102ee5:	00 00 00 
80102ee8:	83 c4 10             	add    $0x10,%esp
80102eeb:	05 60 28 11 80       	add    $0x80112860,%eax
80102ef0:	39 d8                	cmp    %ebx,%eax
80102ef2:	76 6f                	jbe    80102f63 <main+0x103>
80102ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102ef8:	e8 03 08 00 00       	call   80103700 <mycpu>
80102efd:	39 d8                	cmp    %ebx,%eax
80102eff:	74 49                	je     80102f4a <main+0xea>
80102f01:	e8 8a f5 ff ff       	call   80102490 <kalloc>
80102f06:	05 00 10 00 00       	add    $0x1000,%eax
80102f0b:	c7 05 f8 6f 00 80 40 	movl   $0x80102e40,0x80006ff8
80102f12:	2e 10 80 
80102f15:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f1c:	90 10 00 
80102f1f:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102f24:	0f b6 03             	movzbl (%ebx),%eax
80102f27:	83 ec 08             	sub    $0x8,%esp
80102f2a:	68 00 70 00 00       	push   $0x7000
80102f2f:	50                   	push   %eax
80102f30:	e8 0b f8 ff ff       	call   80102740 <lapicstartap>
80102f35:	83 c4 10             	add    $0x10,%esp
80102f38:	90                   	nop
80102f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f40:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f46:	85 c0                	test   %eax,%eax
80102f48:	74 f6                	je     80102f40 <main+0xe0>
80102f4a:	69 05 c0 29 11 80 b0 	imul   $0xb0,0x801129c0,%eax
80102f51:	00 00 00 
80102f54:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f5a:	05 60 28 11 80       	add    $0x80112860,%eax
80102f5f:	39 c3                	cmp    %eax,%ebx
80102f61:	72 95                	jb     80102ef8 <main+0x98>
80102f63:	83 ec 08             	sub    $0x8,%esp
80102f66:	68 00 00 00 8e       	push   $0x8e000000
80102f6b:	68 00 00 40 80       	push   $0x80400000
80102f70:	e8 bb f4 ff ff       	call   80102430 <kinit2>
80102f75:	e8 46 08 00 00       	call   801037c0 <userinit>
80102f7a:	e8 81 fe ff ff       	call   80102e00 <mpmain>
80102f7f:	90                   	nop

80102f80 <mpsearch1>:
80102f80:	55                   	push   %ebp
80102f81:	89 e5                	mov    %esp,%ebp
80102f83:	57                   	push   %edi
80102f84:	56                   	push   %esi
80102f85:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80102f8b:	53                   	push   %ebx
80102f8c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
80102f8f:	83 ec 0c             	sub    $0xc,%esp
80102f92:	39 de                	cmp    %ebx,%esi
80102f94:	73 48                	jae    80102fde <mpsearch1+0x5e>
80102f96:	8d 76 00             	lea    0x0(%esi),%esi
80102f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102fa0:	83 ec 04             	sub    $0x4,%esp
80102fa3:	8d 7e 10             	lea    0x10(%esi),%edi
80102fa6:	6a 04                	push   $0x4
80102fa8:	68 38 76 10 80       	push   $0x80107638
80102fad:	56                   	push   %esi
80102fae:	e8 7d 16 00 00       	call   80104630 <memcmp>
80102fb3:	83 c4 10             	add    $0x10,%esp
80102fb6:	85 c0                	test   %eax,%eax
80102fb8:	75 1e                	jne    80102fd8 <mpsearch1+0x58>
80102fba:	8d 7e 10             	lea    0x10(%esi),%edi
80102fbd:	89 f2                	mov    %esi,%edx
80102fbf:	31 c9                	xor    %ecx,%ecx
80102fc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102fc8:	0f b6 02             	movzbl (%edx),%eax
80102fcb:	83 c2 01             	add    $0x1,%edx
80102fce:	01 c1                	add    %eax,%ecx
80102fd0:	39 fa                	cmp    %edi,%edx
80102fd2:	75 f4                	jne    80102fc8 <mpsearch1+0x48>
80102fd4:	84 c9                	test   %cl,%cl
80102fd6:	74 10                	je     80102fe8 <mpsearch1+0x68>
80102fd8:	39 fb                	cmp    %edi,%ebx
80102fda:	89 fe                	mov    %edi,%esi
80102fdc:	77 c2                	ja     80102fa0 <mpsearch1+0x20>
80102fde:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102fe1:	31 c0                	xor    %eax,%eax
80102fe3:	5b                   	pop    %ebx
80102fe4:	5e                   	pop    %esi
80102fe5:	5f                   	pop    %edi
80102fe6:	5d                   	pop    %ebp
80102fe7:	c3                   	ret    
80102fe8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102feb:	89 f0                	mov    %esi,%eax
80102fed:	5b                   	pop    %ebx
80102fee:	5e                   	pop    %esi
80102fef:	5f                   	pop    %edi
80102ff0:	5d                   	pop    %ebp
80102ff1:	c3                   	ret    
80102ff2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103000 <mpinit>:
80103000:	55                   	push   %ebp
80103001:	89 e5                	mov    %esp,%ebp
80103003:	57                   	push   %edi
80103004:	56                   	push   %esi
80103005:	53                   	push   %ebx
80103006:	83 ec 1c             	sub    $0x1c,%esp
80103009:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103010:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103017:	c1 e0 08             	shl    $0x8,%eax
8010301a:	09 d0                	or     %edx,%eax
8010301c:	c1 e0 04             	shl    $0x4,%eax
8010301f:	85 c0                	test   %eax,%eax
80103021:	75 1b                	jne    8010303e <mpinit+0x3e>
80103023:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010302a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103031:	c1 e0 08             	shl    $0x8,%eax
80103034:	09 d0                	or     %edx,%eax
80103036:	c1 e0 0a             	shl    $0xa,%eax
80103039:	2d 00 04 00 00       	sub    $0x400,%eax
8010303e:	ba 00 04 00 00       	mov    $0x400,%edx
80103043:	e8 38 ff ff ff       	call   80102f80 <mpsearch1>
80103048:	85 c0                	test   %eax,%eax
8010304a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010304d:	0f 84 38 01 00 00    	je     8010318b <mpinit+0x18b>
80103053:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103056:	8b 58 04             	mov    0x4(%eax),%ebx
80103059:	85 db                	test   %ebx,%ebx
8010305b:	0f 84 44 01 00 00    	je     801031a5 <mpinit+0x1a5>
80103061:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
80103067:	83 ec 04             	sub    $0x4,%esp
8010306a:	6a 04                	push   $0x4
8010306c:	68 3d 76 10 80       	push   $0x8010763d
80103071:	56                   	push   %esi
80103072:	e8 b9 15 00 00       	call   80104630 <memcmp>
80103077:	83 c4 10             	add    $0x10,%esp
8010307a:	85 c0                	test   %eax,%eax
8010307c:	0f 85 23 01 00 00    	jne    801031a5 <mpinit+0x1a5>
80103082:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103089:	3c 01                	cmp    $0x1,%al
8010308b:	74 08                	je     80103095 <mpinit+0x95>
8010308d:	3c 04                	cmp    $0x4,%al
8010308f:	0f 85 10 01 00 00    	jne    801031a5 <mpinit+0x1a5>
80103095:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
8010309c:	85 ff                	test   %edi,%edi
8010309e:	74 21                	je     801030c1 <mpinit+0xc1>
801030a0:	31 d2                	xor    %edx,%edx
801030a2:	31 c0                	xor    %eax,%eax
801030a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801030a8:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
801030af:	80 
801030b0:	83 c0 01             	add    $0x1,%eax
801030b3:	01 ca                	add    %ecx,%edx
801030b5:	39 c7                	cmp    %eax,%edi
801030b7:	75 ef                	jne    801030a8 <mpinit+0xa8>
801030b9:	84 d2                	test   %dl,%dl
801030bb:	0f 85 e4 00 00 00    	jne    801031a5 <mpinit+0x1a5>
801030c1:	85 f6                	test   %esi,%esi
801030c3:	0f 84 dc 00 00 00    	je     801031a5 <mpinit+0x1a5>
801030c9:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801030cf:	a3 5c 27 11 80       	mov    %eax,0x8011275c
801030d4:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801030db:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
801030e1:	bb 01 00 00 00       	mov    $0x1,%ebx
801030e6:	01 d6                	add    %edx,%esi
801030e8:	90                   	nop
801030e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030f0:	39 c6                	cmp    %eax,%esi
801030f2:	76 23                	jbe    80103117 <mpinit+0x117>
801030f4:	0f b6 10             	movzbl (%eax),%edx
801030f7:	80 fa 04             	cmp    $0x4,%dl
801030fa:	0f 87 c0 00 00 00    	ja     801031c0 <mpinit+0x1c0>
80103100:	ff 24 95 7c 76 10 80 	jmp    *-0x7fef8984(,%edx,4)
80103107:	89 f6                	mov    %esi,%esi
80103109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103110:	83 c0 08             	add    $0x8,%eax
80103113:	39 c6                	cmp    %eax,%esi
80103115:	77 dd                	ja     801030f4 <mpinit+0xf4>
80103117:	85 db                	test   %ebx,%ebx
80103119:	0f 84 93 00 00 00    	je     801031b2 <mpinit+0x1b2>
8010311f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103122:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103126:	74 15                	je     8010313d <mpinit+0x13d>
80103128:	ba 22 00 00 00       	mov    $0x22,%edx
8010312d:	b8 70 00 00 00       	mov    $0x70,%eax
80103132:	ee                   	out    %al,(%dx)
80103133:	ba 23 00 00 00       	mov    $0x23,%edx
80103138:	ec                   	in     (%dx),%al
80103139:	83 c8 01             	or     $0x1,%eax
8010313c:	ee                   	out    %al,(%dx)
8010313d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103140:	5b                   	pop    %ebx
80103141:	5e                   	pop    %esi
80103142:	5f                   	pop    %edi
80103143:	5d                   	pop    %ebp
80103144:	c3                   	ret    
80103145:	8d 76 00             	lea    0x0(%esi),%esi
80103148:	8b 0d c0 29 11 80    	mov    0x801129c0,%ecx
8010314e:	83 f9 01             	cmp    $0x1,%ecx
80103151:	7e 1d                	jle    80103170 <mpinit+0x170>
80103153:	83 c0 14             	add    $0x14,%eax
80103156:	eb 98                	jmp    801030f0 <mpinit+0xf0>
80103158:	90                   	nop
80103159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103160:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103164:	83 c0 08             	add    $0x8,%eax
80103167:	88 15 40 28 11 80    	mov    %dl,0x80112840
8010316d:	eb 81                	jmp    801030f0 <mpinit+0xf0>
8010316f:	90                   	nop
80103170:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103174:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
8010317a:	83 c1 01             	add    $0x1,%ecx
8010317d:	89 0d c0 29 11 80    	mov    %ecx,0x801129c0
80103183:	88 97 60 28 11 80    	mov    %dl,-0x7feed7a0(%edi)
80103189:	eb c8                	jmp    80103153 <mpinit+0x153>
8010318b:	ba 00 00 01 00       	mov    $0x10000,%edx
80103190:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103195:	e8 e6 fd ff ff       	call   80102f80 <mpsearch1>
8010319a:	85 c0                	test   %eax,%eax
8010319c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010319f:	0f 85 ae fe ff ff    	jne    80103053 <mpinit+0x53>
801031a5:	83 ec 0c             	sub    $0xc,%esp
801031a8:	68 42 76 10 80       	push   $0x80107642
801031ad:	e8 be d1 ff ff       	call   80100370 <panic>
801031b2:	83 ec 0c             	sub    $0xc,%esp
801031b5:	68 5c 76 10 80       	push   $0x8010765c
801031ba:	e8 b1 d1 ff ff       	call   80100370 <panic>
801031bf:	90                   	nop
801031c0:	31 db                	xor    %ebx,%ebx
801031c2:	e9 30 ff ff ff       	jmp    801030f7 <mpinit+0xf7>
801031c7:	66 90                	xchg   %ax,%ax
801031c9:	66 90                	xchg   %ax,%ax
801031cb:	66 90                	xchg   %ax,%ax
801031cd:	66 90                	xchg   %ax,%ax
801031cf:	90                   	nop

801031d0 <picinit>:
801031d0:	55                   	push   %ebp
801031d1:	ba 21 00 00 00       	mov    $0x21,%edx
801031d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801031db:	89 e5                	mov    %esp,%ebp
801031dd:	ee                   	out    %al,(%dx)
801031de:	ba a1 00 00 00       	mov    $0xa1,%edx
801031e3:	ee                   	out    %al,(%dx)
801031e4:	5d                   	pop    %ebp
801031e5:	c3                   	ret    
801031e6:	66 90                	xchg   %ax,%ax
801031e8:	66 90                	xchg   %ax,%ax
801031ea:	66 90                	xchg   %ax,%ax
801031ec:	66 90                	xchg   %ax,%ax
801031ee:	66 90                	xchg   %ax,%ax

801031f0 <pipealloc>:
801031f0:	55                   	push   %ebp
801031f1:	89 e5                	mov    %esp,%ebp
801031f3:	57                   	push   %edi
801031f4:	56                   	push   %esi
801031f5:	53                   	push   %ebx
801031f6:	83 ec 0c             	sub    $0xc,%esp
801031f9:	8b 75 08             	mov    0x8(%ebp),%esi
801031fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801031ff:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103205:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010320b:	e8 60 db ff ff       	call   80100d70 <filealloc>
80103210:	85 c0                	test   %eax,%eax
80103212:	89 06                	mov    %eax,(%esi)
80103214:	0f 84 a8 00 00 00    	je     801032c2 <pipealloc+0xd2>
8010321a:	e8 51 db ff ff       	call   80100d70 <filealloc>
8010321f:	85 c0                	test   %eax,%eax
80103221:	89 03                	mov    %eax,(%ebx)
80103223:	0f 84 87 00 00 00    	je     801032b0 <pipealloc+0xc0>
80103229:	e8 62 f2 ff ff       	call   80102490 <kalloc>
8010322e:	85 c0                	test   %eax,%eax
80103230:	89 c7                	mov    %eax,%edi
80103232:	0f 84 b0 00 00 00    	je     801032e8 <pipealloc+0xf8>
80103238:	83 ec 08             	sub    $0x8,%esp
8010323b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103242:	00 00 00 
80103245:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010324c:	00 00 00 
8010324f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103256:	00 00 00 
80103259:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103260:	00 00 00 
80103263:	68 90 76 10 80       	push   $0x80107690
80103268:	50                   	push   %eax
80103269:	e8 02 11 00 00       	call   80104370 <initlock>
8010326e:	8b 06                	mov    (%esi),%eax
80103270:	83 c4 10             	add    $0x10,%esp
80103273:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103279:	8b 06                	mov    (%esi),%eax
8010327b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
8010327f:	8b 06                	mov    (%esi),%eax
80103281:	c6 40 09 00          	movb   $0x0,0x9(%eax)
80103285:	8b 06                	mov    (%esi),%eax
80103287:	89 78 0c             	mov    %edi,0xc(%eax)
8010328a:	8b 03                	mov    (%ebx),%eax
8010328c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103292:	8b 03                	mov    (%ebx),%eax
80103294:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80103298:	8b 03                	mov    (%ebx),%eax
8010329a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
8010329e:	8b 03                	mov    (%ebx),%eax
801032a0:	89 78 0c             	mov    %edi,0xc(%eax)
801032a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801032a6:	31 c0                	xor    %eax,%eax
801032a8:	5b                   	pop    %ebx
801032a9:	5e                   	pop    %esi
801032aa:	5f                   	pop    %edi
801032ab:	5d                   	pop    %ebp
801032ac:	c3                   	ret    
801032ad:	8d 76 00             	lea    0x0(%esi),%esi
801032b0:	8b 06                	mov    (%esi),%eax
801032b2:	85 c0                	test   %eax,%eax
801032b4:	74 1e                	je     801032d4 <pipealloc+0xe4>
801032b6:	83 ec 0c             	sub    $0xc,%esp
801032b9:	50                   	push   %eax
801032ba:	e8 71 db ff ff       	call   80100e30 <fileclose>
801032bf:	83 c4 10             	add    $0x10,%esp
801032c2:	8b 03                	mov    (%ebx),%eax
801032c4:	85 c0                	test   %eax,%eax
801032c6:	74 0c                	je     801032d4 <pipealloc+0xe4>
801032c8:	83 ec 0c             	sub    $0xc,%esp
801032cb:	50                   	push   %eax
801032cc:	e8 5f db ff ff       	call   80100e30 <fileclose>
801032d1:	83 c4 10             	add    $0x10,%esp
801032d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801032d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032dc:	5b                   	pop    %ebx
801032dd:	5e                   	pop    %esi
801032de:	5f                   	pop    %edi
801032df:	5d                   	pop    %ebp
801032e0:	c3                   	ret    
801032e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801032e8:	8b 06                	mov    (%esi),%eax
801032ea:	85 c0                	test   %eax,%eax
801032ec:	75 c8                	jne    801032b6 <pipealloc+0xc6>
801032ee:	eb d2                	jmp    801032c2 <pipealloc+0xd2>

801032f0 <pipeclose>:
801032f0:	55                   	push   %ebp
801032f1:	89 e5                	mov    %esp,%ebp
801032f3:	56                   	push   %esi
801032f4:	53                   	push   %ebx
801032f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032f8:	8b 75 0c             	mov    0xc(%ebp),%esi
801032fb:	83 ec 0c             	sub    $0xc,%esp
801032fe:	53                   	push   %ebx
801032ff:	e8 6c 11 00 00       	call   80104470 <acquire>
80103304:	83 c4 10             	add    $0x10,%esp
80103307:	85 f6                	test   %esi,%esi
80103309:	74 45                	je     80103350 <pipeclose+0x60>
8010330b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103311:	83 ec 0c             	sub    $0xc,%esp
80103314:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010331b:	00 00 00 
8010331e:	50                   	push   %eax
8010331f:	e8 fc 0b 00 00       	call   80103f20 <wakeup>
80103324:	83 c4 10             	add    $0x10,%esp
80103327:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010332d:	85 d2                	test   %edx,%edx
8010332f:	75 0a                	jne    8010333b <pipeclose+0x4b>
80103331:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103337:	85 c0                	test   %eax,%eax
80103339:	74 35                	je     80103370 <pipeclose+0x80>
8010333b:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010333e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103341:	5b                   	pop    %ebx
80103342:	5e                   	pop    %esi
80103343:	5d                   	pop    %ebp
80103344:	e9 47 12 00 00       	jmp    80104590 <release>
80103349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103350:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103356:	83 ec 0c             	sub    $0xc,%esp
80103359:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103360:	00 00 00 
80103363:	50                   	push   %eax
80103364:	e8 b7 0b 00 00       	call   80103f20 <wakeup>
80103369:	83 c4 10             	add    $0x10,%esp
8010336c:	eb b9                	jmp    80103327 <pipeclose+0x37>
8010336e:	66 90                	xchg   %ax,%ax
80103370:	83 ec 0c             	sub    $0xc,%esp
80103373:	53                   	push   %ebx
80103374:	e8 17 12 00 00       	call   80104590 <release>
80103379:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010337c:	83 c4 10             	add    $0x10,%esp
8010337f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103382:	5b                   	pop    %ebx
80103383:	5e                   	pop    %esi
80103384:	5d                   	pop    %ebp
80103385:	e9 56 ef ff ff       	jmp    801022e0 <kfree>
8010338a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103390 <pipewrite>:
80103390:	55                   	push   %ebp
80103391:	89 e5                	mov    %esp,%ebp
80103393:	57                   	push   %edi
80103394:	56                   	push   %esi
80103395:	53                   	push   %ebx
80103396:	83 ec 28             	sub    $0x28,%esp
80103399:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010339c:	53                   	push   %ebx
8010339d:	e8 ce 10 00 00       	call   80104470 <acquire>
801033a2:	8b 45 10             	mov    0x10(%ebp),%eax
801033a5:	83 c4 10             	add    $0x10,%esp
801033a8:	85 c0                	test   %eax,%eax
801033aa:	0f 8e b9 00 00 00    	jle    80103469 <pipewrite+0xd9>
801033b0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033b3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801033b9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801033bf:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801033c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801033c8:	03 4d 10             	add    0x10(%ebp),%ecx
801033cb:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801033ce:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801033d4:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801033da:	39 d0                	cmp    %edx,%eax
801033dc:	74 38                	je     80103416 <pipewrite+0x86>
801033de:	eb 59                	jmp    80103439 <pipewrite+0xa9>
801033e0:	e8 ab 03 00 00       	call   80103790 <myproc>
801033e5:	8b 48 24             	mov    0x24(%eax),%ecx
801033e8:	85 c9                	test   %ecx,%ecx
801033ea:	75 34                	jne    80103420 <pipewrite+0x90>
801033ec:	83 ec 0c             	sub    $0xc,%esp
801033ef:	57                   	push   %edi
801033f0:	e8 2b 0b 00 00       	call   80103f20 <wakeup>
801033f5:	58                   	pop    %eax
801033f6:	5a                   	pop    %edx
801033f7:	53                   	push   %ebx
801033f8:	56                   	push   %esi
801033f9:	e8 62 09 00 00       	call   80103d60 <sleep>
801033fe:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103404:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010340a:	83 c4 10             	add    $0x10,%esp
8010340d:	05 00 02 00 00       	add    $0x200,%eax
80103412:	39 c2                	cmp    %eax,%edx
80103414:	75 2a                	jne    80103440 <pipewrite+0xb0>
80103416:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010341c:	85 c0                	test   %eax,%eax
8010341e:	75 c0                	jne    801033e0 <pipewrite+0x50>
80103420:	83 ec 0c             	sub    $0xc,%esp
80103423:	53                   	push   %ebx
80103424:	e8 67 11 00 00       	call   80104590 <release>
80103429:	83 c4 10             	add    $0x10,%esp
8010342c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103431:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103434:	5b                   	pop    %ebx
80103435:	5e                   	pop    %esi
80103436:	5f                   	pop    %edi
80103437:	5d                   	pop    %ebp
80103438:	c3                   	ret    
80103439:	89 c2                	mov    %eax,%edx
8010343b:	90                   	nop
8010343c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103440:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103443:	8d 42 01             	lea    0x1(%edx),%eax
80103446:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010344a:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103450:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103456:	0f b6 09             	movzbl (%ecx),%ecx
80103459:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
8010345d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103460:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
80103463:	0f 85 65 ff ff ff    	jne    801033ce <pipewrite+0x3e>
80103469:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010346f:	83 ec 0c             	sub    $0xc,%esp
80103472:	50                   	push   %eax
80103473:	e8 a8 0a 00 00       	call   80103f20 <wakeup>
80103478:	89 1c 24             	mov    %ebx,(%esp)
8010347b:	e8 10 11 00 00       	call   80104590 <release>
80103480:	83 c4 10             	add    $0x10,%esp
80103483:	8b 45 10             	mov    0x10(%ebp),%eax
80103486:	eb a9                	jmp    80103431 <pipewrite+0xa1>
80103488:	90                   	nop
80103489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103490 <piperead>:
80103490:	55                   	push   %ebp
80103491:	89 e5                	mov    %esp,%ebp
80103493:	57                   	push   %edi
80103494:	56                   	push   %esi
80103495:	53                   	push   %ebx
80103496:	83 ec 18             	sub    $0x18,%esp
80103499:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010349c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010349f:	53                   	push   %ebx
801034a0:	e8 cb 0f 00 00       	call   80104470 <acquire>
801034a5:	83 c4 10             	add    $0x10,%esp
801034a8:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801034ae:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
801034b4:	75 6a                	jne    80103520 <piperead+0x90>
801034b6:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
801034bc:	85 f6                	test   %esi,%esi
801034be:	0f 84 cc 00 00 00    	je     80103590 <piperead+0x100>
801034c4:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801034ca:	eb 2d                	jmp    801034f9 <piperead+0x69>
801034cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034d0:	83 ec 08             	sub    $0x8,%esp
801034d3:	53                   	push   %ebx
801034d4:	56                   	push   %esi
801034d5:	e8 86 08 00 00       	call   80103d60 <sleep>
801034da:	83 c4 10             	add    $0x10,%esp
801034dd:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801034e3:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
801034e9:	75 35                	jne    80103520 <piperead+0x90>
801034eb:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
801034f1:	85 d2                	test   %edx,%edx
801034f3:	0f 84 97 00 00 00    	je     80103590 <piperead+0x100>
801034f9:	e8 92 02 00 00       	call   80103790 <myproc>
801034fe:	8b 48 24             	mov    0x24(%eax),%ecx
80103501:	85 c9                	test   %ecx,%ecx
80103503:	74 cb                	je     801034d0 <piperead+0x40>
80103505:	83 ec 0c             	sub    $0xc,%esp
80103508:	53                   	push   %ebx
80103509:	e8 82 10 00 00       	call   80104590 <release>
8010350e:	83 c4 10             	add    $0x10,%esp
80103511:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103514:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103519:	5b                   	pop    %ebx
8010351a:	5e                   	pop    %esi
8010351b:	5f                   	pop    %edi
8010351c:	5d                   	pop    %ebp
8010351d:	c3                   	ret    
8010351e:	66 90                	xchg   %ax,%ax
80103520:	8b 45 10             	mov    0x10(%ebp),%eax
80103523:	85 c0                	test   %eax,%eax
80103525:	7e 69                	jle    80103590 <piperead+0x100>
80103527:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010352d:	31 c9                	xor    %ecx,%ecx
8010352f:	eb 15                	jmp    80103546 <piperead+0xb6>
80103531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103538:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010353e:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80103544:	74 5a                	je     801035a0 <piperead+0x110>
80103546:	8d 70 01             	lea    0x1(%eax),%esi
80103549:	25 ff 01 00 00       	and    $0x1ff,%eax
8010354e:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103554:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103559:	88 04 0f             	mov    %al,(%edi,%ecx,1)
8010355c:	83 c1 01             	add    $0x1,%ecx
8010355f:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103562:	75 d4                	jne    80103538 <piperead+0xa8>
80103564:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
8010356a:	83 ec 0c             	sub    $0xc,%esp
8010356d:	50                   	push   %eax
8010356e:	e8 ad 09 00 00       	call   80103f20 <wakeup>
80103573:	89 1c 24             	mov    %ebx,(%esp)
80103576:	e8 15 10 00 00       	call   80104590 <release>
8010357b:	8b 45 10             	mov    0x10(%ebp),%eax
8010357e:	83 c4 10             	add    $0x10,%esp
80103581:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103584:	5b                   	pop    %ebx
80103585:	5e                   	pop    %esi
80103586:	5f                   	pop    %edi
80103587:	5d                   	pop    %ebp
80103588:	c3                   	ret    
80103589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103590:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103597:	eb cb                	jmp    80103564 <piperead+0xd4>
80103599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801035a0:	89 4d 10             	mov    %ecx,0x10(%ebp)
801035a3:	eb bf                	jmp    80103564 <piperead+0xd4>
801035a5:	66 90                	xchg   %ax,%ax
801035a7:	66 90                	xchg   %ax,%ax
801035a9:	66 90                	xchg   %ax,%ax
801035ab:	66 90                	xchg   %ax,%ax
801035ad:	66 90                	xchg   %ax,%ax
801035af:	90                   	nop

801035b0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035b0:	55                   	push   %ebp
801035b1:	89 e5                	mov    %esp,%ebp
801035b3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035b4:	bb 14 2a 11 80       	mov    $0x80112a14,%ebx
{
801035b9:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
801035bc:	68 e0 29 11 80       	push   $0x801129e0
801035c1:	e8 aa 0e 00 00       	call   80104470 <acquire>
801035c6:	83 c4 10             	add    $0x10,%esp
801035c9:	eb 14                	jmp    801035df <allocproc+0x2f>
801035cb:	90                   	nop
801035cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035d0:	83 eb 80             	sub    $0xffffff80,%ebx
801035d3:	81 fb 14 4a 11 80    	cmp    $0x80114a14,%ebx
801035d9:	0f 83 81 00 00 00    	jae    80103660 <allocproc+0xb0>
    if(p->state == UNUSED)
801035df:	8b 43 0c             	mov    0xc(%ebx),%eax
801035e2:	85 c0                	test   %eax,%eax
801035e4:	75 ea                	jne    801035d0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801035e6:	a1 04 a0 10 80       	mov    0x8010a004,%eax
  p->priority = 10;          //Default priority
  release(&ptable.lock);
801035eb:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
801035ee:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->priority = 10;          //Default priority
801035f5:	c7 43 7c 0a 00 00 00 	movl   $0xa,0x7c(%ebx)
  p->pid = nextpid++;
801035fc:	8d 50 01             	lea    0x1(%eax),%edx
801035ff:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
80103602:	68 e0 29 11 80       	push   $0x801129e0
  p->pid = nextpid++;
80103607:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  release(&ptable.lock);
8010360d:	e8 7e 0f 00 00       	call   80104590 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103612:	e8 79 ee ff ff       	call   80102490 <kalloc>
80103617:	83 c4 10             	add    $0x10,%esp
8010361a:	85 c0                	test   %eax,%eax
8010361c:	89 43 08             	mov    %eax,0x8(%ebx)
8010361f:	74 58                	je     80103679 <allocproc+0xc9>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103621:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103627:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
8010362a:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
8010362f:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
80103632:	c7 40 14 9f 58 10 80 	movl   $0x8010589f,0x14(%eax)
  p->context = (struct context*)sp;
80103639:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010363c:	6a 14                	push   $0x14
8010363e:	6a 00                	push   $0x0
80103640:	50                   	push   %eax
80103641:	e8 9a 0f 00 00       	call   801045e0 <memset>
  p->context->eip = (uint)forkret;
80103646:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
80103649:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
8010364c:	c7 40 10 90 36 10 80 	movl   $0x80103690,0x10(%eax)
}
80103653:	89 d8                	mov    %ebx,%eax
80103655:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103658:	c9                   	leave  
80103659:	c3                   	ret    
8010365a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
80103660:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80103663:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
80103665:	68 e0 29 11 80       	push   $0x801129e0
8010366a:	e8 21 0f 00 00       	call   80104590 <release>
}
8010366f:	89 d8                	mov    %ebx,%eax
  return 0;
80103671:	83 c4 10             	add    $0x10,%esp
}
80103674:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103677:	c9                   	leave  
80103678:	c3                   	ret    
    p->state = UNUSED;
80103679:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103680:	31 db                	xor    %ebx,%ebx
80103682:	eb cf                	jmp    80103653 <allocproc+0xa3>
80103684:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010368a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103690 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103690:	55                   	push   %ebp
80103691:	89 e5                	mov    %esp,%ebp
80103693:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103696:	68 e0 29 11 80       	push   $0x801129e0
8010369b:	e8 f0 0e 00 00       	call   80104590 <release>

  if (first) {
801036a0:	a1 00 a0 10 80       	mov    0x8010a000,%eax
801036a5:	83 c4 10             	add    $0x10,%esp
801036a8:	85 c0                	test   %eax,%eax
801036aa:	75 04                	jne    801036b0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
801036ac:	c9                   	leave  
801036ad:	c3                   	ret    
801036ae:	66 90                	xchg   %ax,%ax
    iinit(ROOTDEV);
801036b0:	83 ec 0c             	sub    $0xc,%esp
    first = 0;
801036b3:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
801036ba:	00 00 00 
    iinit(ROOTDEV);
801036bd:	6a 01                	push   $0x1
801036bf:	e8 ac dd ff ff       	call   80101470 <iinit>
    initlog(ROOTDEV);
801036c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801036cb:	e8 e0 f3 ff ff       	call   80102ab0 <initlog>
801036d0:	83 c4 10             	add    $0x10,%esp
}
801036d3:	c9                   	leave  
801036d4:	c3                   	ret    
801036d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801036e0 <pinit>:
{
801036e0:	55                   	push   %ebp
801036e1:	89 e5                	mov    %esp,%ebp
801036e3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801036e6:	68 95 76 10 80       	push   $0x80107695
801036eb:	68 e0 29 11 80       	push   $0x801129e0
801036f0:	e8 7b 0c 00 00       	call   80104370 <initlock>
}
801036f5:	83 c4 10             	add    $0x10,%esp
801036f8:	c9                   	leave  
801036f9:	c3                   	ret    
801036fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103700 <mycpu>:
{
80103700:	55                   	push   %ebp
80103701:	89 e5                	mov    %esp,%ebp
80103703:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103706:	9c                   	pushf  
80103707:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103708:	f6 c4 02             	test   $0x2,%ah
8010370b:	75 4a                	jne    80103757 <mycpu+0x57>
  apicid = lapicid();
8010370d:	e8 de ef ff ff       	call   801026f0 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103712:	8b 15 c0 29 11 80    	mov    0x801129c0,%edx
80103718:	85 d2                	test   %edx,%edx
8010371a:	7e 1b                	jle    80103737 <mycpu+0x37>
    if (cpus[i].apicid == apicid)
8010371c:	0f b6 0d 60 28 11 80 	movzbl 0x80112860,%ecx
80103723:	39 c8                	cmp    %ecx,%eax
80103725:	74 21                	je     80103748 <mycpu+0x48>
  for (i = 0; i < ncpu; ++i) {
80103727:	83 fa 01             	cmp    $0x1,%edx
8010372a:	74 0b                	je     80103737 <mycpu+0x37>
    if (cpus[i].apicid == apicid)
8010372c:	0f b6 15 10 29 11 80 	movzbl 0x80112910,%edx
80103733:	39 d0                	cmp    %edx,%eax
80103735:	74 19                	je     80103750 <mycpu+0x50>
  panic("unknown apicid\n");
80103737:	83 ec 0c             	sub    $0xc,%esp
8010373a:	68 9c 76 10 80       	push   $0x8010769c
8010373f:	e8 2c cc ff ff       	call   80100370 <panic>
80103744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (cpus[i].apicid == apicid)
80103748:	b8 60 28 11 80       	mov    $0x80112860,%eax
}
8010374d:	c9                   	leave  
8010374e:	c3                   	ret    
8010374f:	90                   	nop
    if (cpus[i].apicid == apicid)
80103750:	b8 10 29 11 80       	mov    $0x80112910,%eax
}
80103755:	c9                   	leave  
80103756:	c3                   	ret    
    panic("mycpu called with interrupts enabled\n");
80103757:	83 ec 0c             	sub    $0xc,%esp
8010375a:	68 fc 77 10 80       	push   $0x801077fc
8010375f:	e8 0c cc ff ff       	call   80100370 <panic>
80103764:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010376a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103770 <cpuid>:
cpuid() {
80103770:	55                   	push   %ebp
80103771:	89 e5                	mov    %esp,%ebp
80103773:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103776:	e8 85 ff ff ff       	call   80103700 <mycpu>
8010377b:	2d 60 28 11 80       	sub    $0x80112860,%eax
}
80103780:	c9                   	leave  
  return mycpu()-cpus;
80103781:	c1 f8 04             	sar    $0x4,%eax
80103784:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010378a:	c3                   	ret    
8010378b:	90                   	nop
8010378c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103790 <myproc>:
myproc(void) {
80103790:	55                   	push   %ebp
80103791:	89 e5                	mov    %esp,%ebp
80103793:	53                   	push   %ebx
80103794:	83 ec 04             	sub    $0x4,%esp
  pushcli();
80103797:	e8 94 0c 00 00       	call   80104430 <pushcli>
  c = mycpu();
8010379c:	e8 5f ff ff ff       	call   80103700 <mycpu>
  p = c->proc;
801037a1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801037a7:	e8 74 0d 00 00       	call   80104520 <popcli>
}
801037ac:	83 c4 04             	add    $0x4,%esp
801037af:	89 d8                	mov    %ebx,%eax
801037b1:	5b                   	pop    %ebx
801037b2:	5d                   	pop    %ebp
801037b3:	c3                   	ret    
801037b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037c0 <userinit>:
{
801037c0:	55                   	push   %ebp
801037c1:	89 e5                	mov    %esp,%ebp
801037c3:	53                   	push   %ebx
801037c4:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
801037c7:	e8 e4 fd ff ff       	call   801035b0 <allocproc>
801037cc:	89 c3                	mov    %eax,%ebx
  initproc = p;
801037ce:	a3 18 a6 10 80       	mov    %eax,0x8010a618
  if((p->pgdir = setupkvm()) == 0)
801037d3:	e8 b8 36 00 00       	call   80106e90 <setupkvm>
801037d8:	85 c0                	test   %eax,%eax
801037da:	89 43 04             	mov    %eax,0x4(%ebx)
801037dd:	0f 84 bd 00 00 00    	je     801038a0 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801037e3:	83 ec 04             	sub    $0x4,%esp
801037e6:	68 2c 00 00 00       	push   $0x2c
801037eb:	68 c0 a4 10 80       	push   $0x8010a4c0
801037f0:	50                   	push   %eax
801037f1:	e8 aa 33 00 00       	call   80106ba0 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
801037f6:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
801037f9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801037ff:	6a 4c                	push   $0x4c
80103801:	6a 00                	push   $0x0
80103803:	ff 73 18             	pushl  0x18(%ebx)
80103806:	e8 d5 0d 00 00       	call   801045e0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010380b:	8b 43 18             	mov    0x18(%ebx),%eax
8010380e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103813:	b9 23 00 00 00       	mov    $0x23,%ecx
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103818:	83 c4 0c             	add    $0xc,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010381b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010381f:	8b 43 18             	mov    0x18(%ebx),%eax
80103822:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103826:	8b 43 18             	mov    0x18(%ebx),%eax
80103829:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010382d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103831:	8b 43 18             	mov    0x18(%ebx),%eax
80103834:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103838:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010383c:	8b 43 18             	mov    0x18(%ebx),%eax
8010383f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103846:	8b 43 18             	mov    0x18(%ebx),%eax
80103849:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103850:	8b 43 18             	mov    0x18(%ebx),%eax
80103853:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
8010385a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010385d:	6a 10                	push   $0x10
8010385f:	68 c5 76 10 80       	push   $0x801076c5
80103864:	50                   	push   %eax
80103865:	e8 76 0f 00 00       	call   801047e0 <safestrcpy>
  p->cwd = namei("/");
8010386a:	c7 04 24 ce 76 10 80 	movl   $0x801076ce,(%esp)
80103871:	e8 4a e6 ff ff       	call   80101ec0 <namei>
80103876:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
80103879:	c7 04 24 e0 29 11 80 	movl   $0x801129e0,(%esp)
80103880:	e8 eb 0b 00 00       	call   80104470 <acquire>
  p->state = RUNNABLE;
80103885:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
8010388c:	c7 04 24 e0 29 11 80 	movl   $0x801129e0,(%esp)
80103893:	e8 f8 0c 00 00       	call   80104590 <release>
}
80103898:	83 c4 10             	add    $0x10,%esp
8010389b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010389e:	c9                   	leave  
8010389f:	c3                   	ret    
    panic("userinit: out of memory?");
801038a0:	83 ec 0c             	sub    $0xc,%esp
801038a3:	68 ac 76 10 80       	push   $0x801076ac
801038a8:	e8 c3 ca ff ff       	call   80100370 <panic>
801038ad:	8d 76 00             	lea    0x0(%esi),%esi

801038b0 <growproc>:
{
801038b0:	55                   	push   %ebp
801038b1:	89 e5                	mov    %esp,%ebp
801038b3:	56                   	push   %esi
801038b4:	53                   	push   %ebx
801038b5:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
801038b8:	e8 73 0b 00 00       	call   80104430 <pushcli>
  c = mycpu();
801038bd:	e8 3e fe ff ff       	call   80103700 <mycpu>
  p = c->proc;
801038c2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038c8:	e8 53 0c 00 00       	call   80104520 <popcli>
  if(n > 0){
801038cd:	83 fe 00             	cmp    $0x0,%esi
  sz = curproc->sz;
801038d0:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
801038d2:	7e 34                	jle    80103908 <growproc+0x58>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038d4:	83 ec 04             	sub    $0x4,%esp
801038d7:	01 c6                	add    %eax,%esi
801038d9:	56                   	push   %esi
801038da:	50                   	push   %eax
801038db:	ff 73 04             	pushl  0x4(%ebx)
801038de:	e8 fd 33 00 00       	call   80106ce0 <allocuvm>
801038e3:	83 c4 10             	add    $0x10,%esp
801038e6:	85 c0                	test   %eax,%eax
801038e8:	74 36                	je     80103920 <growproc+0x70>
  switchuvm(curproc);
801038ea:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
801038ed:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801038ef:	53                   	push   %ebx
801038f0:	e8 9b 31 00 00       	call   80106a90 <switchuvm>
  return 0;
801038f5:	83 c4 10             	add    $0x10,%esp
801038f8:	31 c0                	xor    %eax,%eax
}
801038fa:	8d 65 f8             	lea    -0x8(%ebp),%esp
801038fd:	5b                   	pop    %ebx
801038fe:	5e                   	pop    %esi
801038ff:	5d                   	pop    %ebp
80103900:	c3                   	ret    
80103901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  } else if(n < 0){
80103908:	74 e0                	je     801038ea <growproc+0x3a>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
8010390a:	83 ec 04             	sub    $0x4,%esp
8010390d:	01 c6                	add    %eax,%esi
8010390f:	56                   	push   %esi
80103910:	50                   	push   %eax
80103911:	ff 73 04             	pushl  0x4(%ebx)
80103914:	e8 c7 34 00 00       	call   80106de0 <deallocuvm>
80103919:	83 c4 10             	add    $0x10,%esp
8010391c:	85 c0                	test   %eax,%eax
8010391e:	75 ca                	jne    801038ea <growproc+0x3a>
      return -1;
80103920:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103925:	eb d3                	jmp    801038fa <growproc+0x4a>
80103927:	89 f6                	mov    %esi,%esi
80103929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103930 <fork>:
{
80103930:	55                   	push   %ebp
80103931:	89 e5                	mov    %esp,%ebp
80103933:	57                   	push   %edi
80103934:	56                   	push   %esi
80103935:	53                   	push   %ebx
80103936:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103939:	e8 f2 0a 00 00       	call   80104430 <pushcli>
  c = mycpu();
8010393e:	e8 bd fd ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103943:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103949:	e8 d2 0b 00 00       	call   80104520 <popcli>
  if((np = allocproc()) == 0){
8010394e:	e8 5d fc ff ff       	call   801035b0 <allocproc>
80103953:	85 c0                	test   %eax,%eax
80103955:	89 c7                	mov    %eax,%edi
80103957:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010395a:	0f 84 b5 00 00 00    	je     80103a15 <fork+0xe5>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103960:	83 ec 08             	sub    $0x8,%esp
80103963:	ff 33                	pushl  (%ebx)
80103965:	ff 73 04             	pushl  0x4(%ebx)
80103968:	e8 f3 35 00 00       	call   80106f60 <copyuvm>
8010396d:	83 c4 10             	add    $0x10,%esp
80103970:	85 c0                	test   %eax,%eax
80103972:	89 47 04             	mov    %eax,0x4(%edi)
80103975:	0f 84 a1 00 00 00    	je     80103a1c <fork+0xec>
  np->sz = curproc->sz;
8010397b:	8b 03                	mov    (%ebx),%eax
8010397d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103980:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
80103982:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
80103985:	89 c8                	mov    %ecx,%eax
80103987:	8b 79 18             	mov    0x18(%ecx),%edi
8010398a:	8b 73 18             	mov    0x18(%ebx),%esi
8010398d:	b9 13 00 00 00       	mov    $0x13,%ecx
80103992:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
80103994:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103996:	8b 40 18             	mov    0x18(%eax),%eax
80103999:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
    if(curproc->ofile[i])
801039a0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
801039a4:	85 c0                	test   %eax,%eax
801039a6:	74 13                	je     801039bb <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
801039a8:	83 ec 0c             	sub    $0xc,%esp
801039ab:	50                   	push   %eax
801039ac:	e8 2f d4 ff ff       	call   80100de0 <filedup>
801039b1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801039b4:	83 c4 10             	add    $0x10,%esp
801039b7:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
801039bb:	83 c6 01             	add    $0x1,%esi
801039be:	83 fe 10             	cmp    $0x10,%esi
801039c1:	75 dd                	jne    801039a0 <fork+0x70>
  np->cwd = idup(curproc->cwd);
801039c3:	83 ec 0c             	sub    $0xc,%esp
801039c6:	ff 73 68             	pushl  0x68(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039c9:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(curproc->cwd);
801039cc:	e8 6f dc ff ff       	call   80101640 <idup>
801039d1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039d4:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
801039d7:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039da:	8d 47 6c             	lea    0x6c(%edi),%eax
801039dd:	6a 10                	push   $0x10
801039df:	53                   	push   %ebx
801039e0:	50                   	push   %eax
801039e1:	e8 fa 0d 00 00       	call   801047e0 <safestrcpy>
  pid = np->pid;
801039e6:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
801039e9:	c7 04 24 e0 29 11 80 	movl   $0x801129e0,(%esp)
801039f0:	e8 7b 0a 00 00       	call   80104470 <acquire>
  np->state = RUNNABLE;
801039f5:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
801039fc:	c7 04 24 e0 29 11 80 	movl   $0x801129e0,(%esp)
80103a03:	e8 88 0b 00 00       	call   80104590 <release>
  return pid;
80103a08:	83 c4 10             	add    $0x10,%esp
}
80103a0b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a0e:	89 d8                	mov    %ebx,%eax
80103a10:	5b                   	pop    %ebx
80103a11:	5e                   	pop    %esi
80103a12:	5f                   	pop    %edi
80103a13:	5d                   	pop    %ebp
80103a14:	c3                   	ret    
    return -1;
80103a15:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103a1a:	eb ef                	jmp    80103a0b <fork+0xdb>
    kfree(np->kstack);
80103a1c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103a1f:	83 ec 0c             	sub    $0xc,%esp
    return -1;
80103a22:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    kfree(np->kstack);
80103a27:	ff 77 08             	pushl  0x8(%edi)
80103a2a:	e8 b1 e8 ff ff       	call   801022e0 <kfree>
    np->kstack = 0;
80103a2f:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
    np->state = UNUSED;
80103a36:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    return -1;
80103a3d:	83 c4 10             	add    $0x10,%esp
80103a40:	eb c9                	jmp    80103a0b <fork+0xdb>
80103a42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a50 <scheduler>:
{
80103a50:	55                   	push   %ebp
80103a51:	89 e5                	mov    %esp,%ebp
80103a53:	57                   	push   %edi
80103a54:	56                   	push   %esi
80103a55:	53                   	push   %ebx
80103a56:	83 ec 0c             	sub    $0xc,%esp
  struct cpu *c = mycpu();
80103a59:	e8 a2 fc ff ff       	call   80103700 <mycpu>
80103a5e:	8d 70 04             	lea    0x4(%eax),%esi
80103a61:	89 c3                	mov    %eax,%ebx
  c->proc = 0;
80103a63:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103a6a:	00 00 00 
}

static inline void
sti(void)
{
  asm volatile("sti");
80103a6d:	fb                   	sti    
    acquire(&ptable.lock);
80103a6e:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a71:	bf 14 2a 11 80       	mov    $0x80112a14,%edi
    acquire(&ptable.lock);
80103a76:	68 e0 29 11 80       	push   $0x801129e0
80103a7b:	e8 f0 09 00 00       	call   80104470 <acquire>
80103a80:	83 c4 10             	add    $0x10,%esp
80103a83:	eb 0e                	jmp    80103a93 <scheduler+0x43>
80103a85:	8d 76 00             	lea    0x0(%esi),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a88:	83 ef 80             	sub    $0xffffff80,%edi
80103a8b:	81 ff 14 4a 11 80    	cmp    $0x80114a14,%edi
80103a91:	73 6e                	jae    80103b01 <scheduler+0xb1>
      if(p->state != RUNNABLE)
80103a93:	83 7f 0c 03          	cmpl   $0x3,0xc(%edi)
80103a97:	75 ef                	jne    80103a88 <scheduler+0x38>
80103a99:	b8 14 2a 11 80       	mov    $0x80112a14,%eax
80103a9e:	eb 0a                	jmp    80103aaa <scheduler+0x5a>
      for( p1 = ptable.proc; p1 < &ptable.proc[NPROC]; p1++){
80103aa0:	83 e8 80             	sub    $0xffffff80,%eax
80103aa3:	3d 14 4a 11 80       	cmp    $0x80114a14,%eax
80103aa8:	73 19                	jae    80103ac3 <scheduler+0x73>
	if(p1->state != RUNNABLE)
80103aaa:	83 78 0c 03          	cmpl   $0x3,0xc(%eax)
80103aae:	75 f0                	jne    80103aa0 <scheduler+0x50>
	if( highP->priority > p1->priority ) // larger value, lower priority
80103ab0:	8b 50 7c             	mov    0x7c(%eax),%edx
80103ab3:	39 57 7c             	cmp    %edx,0x7c(%edi)
80103ab6:	0f 4f f8             	cmovg  %eax,%edi
      for( p1 = ptable.proc; p1 < &ptable.proc[NPROC]; p1++){
80103ab9:	83 e8 80             	sub    $0xffffff80,%eax
80103abc:	3d 14 4a 11 80       	cmp    $0x80114a14,%eax
80103ac1:	72 e7                	jb     80103aaa <scheduler+0x5a>
      switchuvm(p);
80103ac3:	83 ec 0c             	sub    $0xc,%esp
      c->proc = p;
80103ac6:	89 bb ac 00 00 00    	mov    %edi,0xac(%ebx)
      switchuvm(p);
80103acc:	57                   	push   %edi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103acd:	83 ef 80             	sub    $0xffffff80,%edi
      switchuvm(p);
80103ad0:	e8 bb 2f 00 00       	call   80106a90 <switchuvm>
      p->state = RUNNING;
80103ad5:	c7 47 8c 04 00 00 00 	movl   $0x4,-0x74(%edi)
      swtch(&(c->scheduler), p->context);
80103adc:	58                   	pop    %eax
80103add:	5a                   	pop    %edx
80103ade:	ff 77 9c             	pushl  -0x64(%edi)
80103ae1:	56                   	push   %esi
80103ae2:	e8 54 0d 00 00       	call   8010483b <swtch>
      switchkvm();
80103ae7:	e8 84 2f 00 00       	call   80106a70 <switchkvm>
      c->proc = 0;
80103aec:	83 c4 10             	add    $0x10,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103aef:	81 ff 14 4a 11 80    	cmp    $0x80114a14,%edi
      c->proc = 0;
80103af5:	c7 83 ac 00 00 00 00 	movl   $0x0,0xac(%ebx)
80103afc:	00 00 00 
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103aff:	72 92                	jb     80103a93 <scheduler+0x43>
    release(&ptable.lock);
80103b01:	83 ec 0c             	sub    $0xc,%esp
80103b04:	68 e0 29 11 80       	push   $0x801129e0
80103b09:	e8 82 0a 00 00       	call   80104590 <release>
  for(;;){
80103b0e:	83 c4 10             	add    $0x10,%esp
80103b11:	e9 57 ff ff ff       	jmp    80103a6d <scheduler+0x1d>
80103b16:	8d 76 00             	lea    0x0(%esi),%esi
80103b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b20 <sched>:
{
80103b20:	55                   	push   %ebp
80103b21:	89 e5                	mov    %esp,%ebp
80103b23:	56                   	push   %esi
80103b24:	53                   	push   %ebx
  pushcli();
80103b25:	e8 06 09 00 00       	call   80104430 <pushcli>
  c = mycpu();
80103b2a:	e8 d1 fb ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103b2f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103b35:	e8 e6 09 00 00       	call   80104520 <popcli>
  if(!holding(&ptable.lock))
80103b3a:	83 ec 0c             	sub    $0xc,%esp
80103b3d:	68 e0 29 11 80       	push   $0x801129e0
80103b42:	e8 a9 08 00 00       	call   801043f0 <holding>
80103b47:	83 c4 10             	add    $0x10,%esp
80103b4a:	85 c0                	test   %eax,%eax
80103b4c:	74 4f                	je     80103b9d <sched+0x7d>
  if(mycpu()->ncli != 1)
80103b4e:	e8 ad fb ff ff       	call   80103700 <mycpu>
80103b53:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103b5a:	75 68                	jne    80103bc4 <sched+0xa4>
  if(p->state == RUNNING)
80103b5c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103b60:	74 55                	je     80103bb7 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103b62:	9c                   	pushf  
80103b63:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103b64:	f6 c4 02             	test   $0x2,%ah
80103b67:	75 41                	jne    80103baa <sched+0x8a>
  intena = mycpu()->intena;
80103b69:	e8 92 fb ff ff       	call   80103700 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103b6e:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103b71:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103b77:	e8 84 fb ff ff       	call   80103700 <mycpu>
80103b7c:	83 ec 08             	sub    $0x8,%esp
80103b7f:	ff 70 04             	pushl  0x4(%eax)
80103b82:	53                   	push   %ebx
80103b83:	e8 b3 0c 00 00       	call   8010483b <swtch>
  mycpu()->intena = intena;
80103b88:	e8 73 fb ff ff       	call   80103700 <mycpu>
}
80103b8d:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103b90:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103b96:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103b99:	5b                   	pop    %ebx
80103b9a:	5e                   	pop    %esi
80103b9b:	5d                   	pop    %ebp
80103b9c:	c3                   	ret    
    panic("sched ptable.lock");
80103b9d:	83 ec 0c             	sub    $0xc,%esp
80103ba0:	68 d0 76 10 80       	push   $0x801076d0
80103ba5:	e8 c6 c7 ff ff       	call   80100370 <panic>
    panic("sched interruptible");
80103baa:	83 ec 0c             	sub    $0xc,%esp
80103bad:	68 fc 76 10 80       	push   $0x801076fc
80103bb2:	e8 b9 c7 ff ff       	call   80100370 <panic>
    panic("sched running");
80103bb7:	83 ec 0c             	sub    $0xc,%esp
80103bba:	68 ee 76 10 80       	push   $0x801076ee
80103bbf:	e8 ac c7 ff ff       	call   80100370 <panic>
    panic("sched locks");
80103bc4:	83 ec 0c             	sub    $0xc,%esp
80103bc7:	68 e2 76 10 80       	push   $0x801076e2
80103bcc:	e8 9f c7 ff ff       	call   80100370 <panic>
80103bd1:	eb 0d                	jmp    80103be0 <exit>
80103bd3:	90                   	nop
80103bd4:	90                   	nop
80103bd5:	90                   	nop
80103bd6:	90                   	nop
80103bd7:	90                   	nop
80103bd8:	90                   	nop
80103bd9:	90                   	nop
80103bda:	90                   	nop
80103bdb:	90                   	nop
80103bdc:	90                   	nop
80103bdd:	90                   	nop
80103bde:	90                   	nop
80103bdf:	90                   	nop

80103be0 <exit>:
{
80103be0:	55                   	push   %ebp
80103be1:	89 e5                	mov    %esp,%ebp
80103be3:	57                   	push   %edi
80103be4:	56                   	push   %esi
80103be5:	53                   	push   %ebx
80103be6:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
80103be9:	e8 42 08 00 00       	call   80104430 <pushcli>
  c = mycpu();
80103bee:	e8 0d fb ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103bf3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103bf9:	e8 22 09 00 00       	call   80104520 <popcli>
  if(curproc == initproc)
80103bfe:	39 35 18 a6 10 80    	cmp    %esi,0x8010a618
80103c04:	8d 5e 28             	lea    0x28(%esi),%ebx
80103c07:	8d 7e 68             	lea    0x68(%esi),%edi
80103c0a:	0f 84 e7 00 00 00    	je     80103cf7 <exit+0x117>
    if(curproc->ofile[fd]){
80103c10:	8b 03                	mov    (%ebx),%eax
80103c12:	85 c0                	test   %eax,%eax
80103c14:	74 12                	je     80103c28 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103c16:	83 ec 0c             	sub    $0xc,%esp
80103c19:	50                   	push   %eax
80103c1a:	e8 11 d2 ff ff       	call   80100e30 <fileclose>
      curproc->ofile[fd] = 0;
80103c1f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103c25:	83 c4 10             	add    $0x10,%esp
80103c28:	83 c3 04             	add    $0x4,%ebx
  for(fd = 0; fd < NOFILE; fd++){
80103c2b:	39 fb                	cmp    %edi,%ebx
80103c2d:	75 e1                	jne    80103c10 <exit+0x30>
  begin_op();
80103c2f:	e8 1c ef ff ff       	call   80102b50 <begin_op>
  iput(curproc->cwd);
80103c34:	83 ec 0c             	sub    $0xc,%esp
80103c37:	ff 76 68             	pushl  0x68(%esi)
80103c3a:	e8 61 db ff ff       	call   801017a0 <iput>
  end_op();
80103c3f:	e8 7c ef ff ff       	call   80102bc0 <end_op>
  curproc->cwd = 0;
80103c44:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
80103c4b:	c7 04 24 e0 29 11 80 	movl   $0x801129e0,(%esp)
80103c52:	e8 19 08 00 00       	call   80104470 <acquire>
  wakeup1(curproc->parent);
80103c57:	8b 56 14             	mov    0x14(%esi),%edx
80103c5a:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c5d:	b8 14 2a 11 80       	mov    $0x80112a14,%eax
80103c62:	eb 0e                	jmp    80103c72 <exit+0x92>
80103c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c68:	83 e8 80             	sub    $0xffffff80,%eax
80103c6b:	3d 14 4a 11 80       	cmp    $0x80114a14,%eax
80103c70:	73 1c                	jae    80103c8e <exit+0xae>
    if(p->state == SLEEPING && p->chan == chan)
80103c72:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c76:	75 f0                	jne    80103c68 <exit+0x88>
80103c78:	3b 50 20             	cmp    0x20(%eax),%edx
80103c7b:	75 eb                	jne    80103c68 <exit+0x88>
      p->state = RUNNABLE;
80103c7d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c84:	83 e8 80             	sub    $0xffffff80,%eax
80103c87:	3d 14 4a 11 80       	cmp    $0x80114a14,%eax
80103c8c:	72 e4                	jb     80103c72 <exit+0x92>
      p->parent = initproc;
80103c8e:	8b 0d 18 a6 10 80    	mov    0x8010a618,%ecx
80103c94:	ba 14 2a 11 80       	mov    $0x80112a14,%edx
80103c99:	eb 10                	jmp    80103cab <exit+0xcb>
80103c9b:	90                   	nop
80103c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ca0:	83 ea 80             	sub    $0xffffff80,%edx
80103ca3:	81 fa 14 4a 11 80    	cmp    $0x80114a14,%edx
80103ca9:	73 33                	jae    80103cde <exit+0xfe>
    if(p->parent == curproc){
80103cab:	39 72 14             	cmp    %esi,0x14(%edx)
80103cae:	75 f0                	jne    80103ca0 <exit+0xc0>
      if(p->state == ZOMBIE)
80103cb0:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
      p->parent = initproc;
80103cb4:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103cb7:	75 e7                	jne    80103ca0 <exit+0xc0>
80103cb9:	b8 14 2a 11 80       	mov    $0x80112a14,%eax
80103cbe:	eb 0a                	jmp    80103cca <exit+0xea>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103cc0:	83 e8 80             	sub    $0xffffff80,%eax
80103cc3:	3d 14 4a 11 80       	cmp    $0x80114a14,%eax
80103cc8:	73 d6                	jae    80103ca0 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103cca:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103cce:	75 f0                	jne    80103cc0 <exit+0xe0>
80103cd0:	3b 48 20             	cmp    0x20(%eax),%ecx
80103cd3:	75 eb                	jne    80103cc0 <exit+0xe0>
      p->state = RUNNABLE;
80103cd5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103cdc:	eb e2                	jmp    80103cc0 <exit+0xe0>
  curproc->state = ZOMBIE;
80103cde:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103ce5:	e8 36 fe ff ff       	call   80103b20 <sched>
  panic("zombie exit");
80103cea:	83 ec 0c             	sub    $0xc,%esp
80103ced:	68 1d 77 10 80       	push   $0x8010771d
80103cf2:	e8 79 c6 ff ff       	call   80100370 <panic>
    panic("init exiting");
80103cf7:	83 ec 0c             	sub    $0xc,%esp
80103cfa:	68 10 77 10 80       	push   $0x80107710
80103cff:	e8 6c c6 ff ff       	call   80100370 <panic>
80103d04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103d0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103d10 <yield>:
{
80103d10:	55                   	push   %ebp
80103d11:	89 e5                	mov    %esp,%ebp
80103d13:	53                   	push   %ebx
80103d14:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103d17:	68 e0 29 11 80       	push   $0x801129e0
80103d1c:	e8 4f 07 00 00       	call   80104470 <acquire>
  pushcli();
80103d21:	e8 0a 07 00 00       	call   80104430 <pushcli>
  c = mycpu();
80103d26:	e8 d5 f9 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103d2b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d31:	e8 ea 07 00 00       	call   80104520 <popcli>
  myproc()->state = RUNNABLE;
80103d36:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103d3d:	e8 de fd ff ff       	call   80103b20 <sched>
  release(&ptable.lock);
80103d42:	c7 04 24 e0 29 11 80 	movl   $0x801129e0,(%esp)
80103d49:	e8 42 08 00 00       	call   80104590 <release>
}
80103d4e:	83 c4 10             	add    $0x10,%esp
80103d51:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d54:	c9                   	leave  
80103d55:	c3                   	ret    
80103d56:	8d 76 00             	lea    0x0(%esi),%esi
80103d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103d60 <sleep>:
{
80103d60:	55                   	push   %ebp
80103d61:	89 e5                	mov    %esp,%ebp
80103d63:	57                   	push   %edi
80103d64:	56                   	push   %esi
80103d65:	53                   	push   %ebx
80103d66:	83 ec 0c             	sub    $0xc,%esp
80103d69:	8b 7d 08             	mov    0x8(%ebp),%edi
80103d6c:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
80103d6f:	e8 bc 06 00 00       	call   80104430 <pushcli>
  c = mycpu();
80103d74:	e8 87 f9 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103d79:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d7f:	e8 9c 07 00 00       	call   80104520 <popcli>
  if(p == 0)
80103d84:	85 db                	test   %ebx,%ebx
80103d86:	0f 84 87 00 00 00    	je     80103e13 <sleep+0xb3>
  if(lk == 0)
80103d8c:	85 f6                	test   %esi,%esi
80103d8e:	74 76                	je     80103e06 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103d90:	81 fe e0 29 11 80    	cmp    $0x801129e0,%esi
80103d96:	74 50                	je     80103de8 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103d98:	83 ec 0c             	sub    $0xc,%esp
80103d9b:	68 e0 29 11 80       	push   $0x801129e0
80103da0:	e8 cb 06 00 00       	call   80104470 <acquire>
    release(lk);
80103da5:	89 34 24             	mov    %esi,(%esp)
80103da8:	e8 e3 07 00 00       	call   80104590 <release>
  p->chan = chan;
80103dad:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103db0:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103db7:	e8 64 fd ff ff       	call   80103b20 <sched>
  p->chan = 0;
80103dbc:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
80103dc3:	c7 04 24 e0 29 11 80 	movl   $0x801129e0,(%esp)
80103dca:	e8 c1 07 00 00       	call   80104590 <release>
    acquire(lk);
80103dcf:	89 75 08             	mov    %esi,0x8(%ebp)
80103dd2:	83 c4 10             	add    $0x10,%esp
}
80103dd5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103dd8:	5b                   	pop    %ebx
80103dd9:	5e                   	pop    %esi
80103dda:	5f                   	pop    %edi
80103ddb:	5d                   	pop    %ebp
    acquire(lk);
80103ddc:	e9 8f 06 00 00       	jmp    80104470 <acquire>
80103de1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
80103de8:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103deb:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103df2:	e8 29 fd ff ff       	call   80103b20 <sched>
  p->chan = 0;
80103df7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
80103dfe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103e01:	5b                   	pop    %ebx
80103e02:	5e                   	pop    %esi
80103e03:	5f                   	pop    %edi
80103e04:	5d                   	pop    %ebp
80103e05:	c3                   	ret    
    panic("sleep without lk");
80103e06:	83 ec 0c             	sub    $0xc,%esp
80103e09:	68 2f 77 10 80       	push   $0x8010772f
80103e0e:	e8 5d c5 ff ff       	call   80100370 <panic>
    panic("sleep");
80103e13:	83 ec 0c             	sub    $0xc,%esp
80103e16:	68 29 77 10 80       	push   $0x80107729
80103e1b:	e8 50 c5 ff ff       	call   80100370 <panic>

80103e20 <wait>:
{
80103e20:	55                   	push   %ebp
80103e21:	89 e5                	mov    %esp,%ebp
80103e23:	56                   	push   %esi
80103e24:	53                   	push   %ebx
  pushcli();
80103e25:	e8 06 06 00 00       	call   80104430 <pushcli>
  c = mycpu();
80103e2a:	e8 d1 f8 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103e2f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103e35:	e8 e6 06 00 00       	call   80104520 <popcli>
  acquire(&ptable.lock);
80103e3a:	83 ec 0c             	sub    $0xc,%esp
80103e3d:	68 e0 29 11 80       	push   $0x801129e0
80103e42:	e8 29 06 00 00       	call   80104470 <acquire>
80103e47:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
80103e4a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e4c:	bb 14 2a 11 80       	mov    $0x80112a14,%ebx
80103e51:	eb 10                	jmp    80103e63 <wait+0x43>
80103e53:	90                   	nop
80103e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e58:	83 eb 80             	sub    $0xffffff80,%ebx
80103e5b:	81 fb 14 4a 11 80    	cmp    $0x80114a14,%ebx
80103e61:	73 1d                	jae    80103e80 <wait+0x60>
      if(p->parent != curproc)
80103e63:	39 73 14             	cmp    %esi,0x14(%ebx)
80103e66:	75 f0                	jne    80103e58 <wait+0x38>
      if(p->state == ZOMBIE){
80103e68:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103e6c:	74 30                	je     80103e9e <wait+0x7e>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e6e:	83 eb 80             	sub    $0xffffff80,%ebx
      havekids = 1;
80103e71:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e76:	81 fb 14 4a 11 80    	cmp    $0x80114a14,%ebx
80103e7c:	72 e5                	jb     80103e63 <wait+0x43>
80103e7e:	66 90                	xchg   %ax,%ax
    if(!havekids || curproc->killed){
80103e80:	85 c0                	test   %eax,%eax
80103e82:	74 70                	je     80103ef4 <wait+0xd4>
80103e84:	8b 46 24             	mov    0x24(%esi),%eax
80103e87:	85 c0                	test   %eax,%eax
80103e89:	75 69                	jne    80103ef4 <wait+0xd4>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103e8b:	83 ec 08             	sub    $0x8,%esp
80103e8e:	68 e0 29 11 80       	push   $0x801129e0
80103e93:	56                   	push   %esi
80103e94:	e8 c7 fe ff ff       	call   80103d60 <sleep>
    havekids = 0;
80103e99:	83 c4 10             	add    $0x10,%esp
80103e9c:	eb ac                	jmp    80103e4a <wait+0x2a>
        kfree(p->kstack);
80103e9e:	83 ec 0c             	sub    $0xc,%esp
80103ea1:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
80103ea4:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103ea7:	e8 34 e4 ff ff       	call   801022e0 <kfree>
        freevm(p->pgdir);
80103eac:	5a                   	pop    %edx
80103ead:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
80103eb0:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103eb7:	e8 54 2f 00 00       	call   80106e10 <freevm>
        p->pid = 0;
80103ebc:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103ec3:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103eca:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103ece:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103ed5:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103edc:	c7 04 24 e0 29 11 80 	movl   $0x801129e0,(%esp)
80103ee3:	e8 a8 06 00 00       	call   80104590 <release>
        return pid;
80103ee8:	83 c4 10             	add    $0x10,%esp
}
80103eeb:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103eee:	89 f0                	mov    %esi,%eax
80103ef0:	5b                   	pop    %ebx
80103ef1:	5e                   	pop    %esi
80103ef2:	5d                   	pop    %ebp
80103ef3:	c3                   	ret    
      release(&ptable.lock);
80103ef4:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80103ef7:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
80103efc:	68 e0 29 11 80       	push   $0x801129e0
80103f01:	e8 8a 06 00 00       	call   80104590 <release>
      return -1;
80103f06:	83 c4 10             	add    $0x10,%esp
}
80103f09:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f0c:	89 f0                	mov    %esi,%eax
80103f0e:	5b                   	pop    %ebx
80103f0f:	5e                   	pop    %esi
80103f10:	5d                   	pop    %ebp
80103f11:	c3                   	ret    
80103f12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f20 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103f20:	55                   	push   %ebp
80103f21:	89 e5                	mov    %esp,%ebp
80103f23:	53                   	push   %ebx
80103f24:	83 ec 10             	sub    $0x10,%esp
80103f27:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103f2a:	68 e0 29 11 80       	push   $0x801129e0
80103f2f:	e8 3c 05 00 00       	call   80104470 <acquire>
80103f34:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f37:	b8 14 2a 11 80       	mov    $0x80112a14,%eax
80103f3c:	eb 0c                	jmp    80103f4a <wakeup+0x2a>
80103f3e:	66 90                	xchg   %ax,%ax
80103f40:	83 e8 80             	sub    $0xffffff80,%eax
80103f43:	3d 14 4a 11 80       	cmp    $0x80114a14,%eax
80103f48:	73 1c                	jae    80103f66 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
80103f4a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f4e:	75 f0                	jne    80103f40 <wakeup+0x20>
80103f50:	3b 58 20             	cmp    0x20(%eax),%ebx
80103f53:	75 eb                	jne    80103f40 <wakeup+0x20>
      p->state = RUNNABLE;
80103f55:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f5c:	83 e8 80             	sub    $0xffffff80,%eax
80103f5f:	3d 14 4a 11 80       	cmp    $0x80114a14,%eax
80103f64:	72 e4                	jb     80103f4a <wakeup+0x2a>
  wakeup1(chan);
  release(&ptable.lock);
80103f66:	c7 45 08 e0 29 11 80 	movl   $0x801129e0,0x8(%ebp)
}
80103f6d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f70:	c9                   	leave  
  release(&ptable.lock);
80103f71:	e9 1a 06 00 00       	jmp    80104590 <release>
80103f76:	8d 76 00             	lea    0x0(%esi),%esi
80103f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f80 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103f80:	55                   	push   %ebp
80103f81:	89 e5                	mov    %esp,%ebp
80103f83:	53                   	push   %ebx
80103f84:	83 ec 10             	sub    $0x10,%esp
80103f87:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103f8a:	68 e0 29 11 80       	push   $0x801129e0
80103f8f:	e8 dc 04 00 00       	call   80104470 <acquire>
80103f94:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f97:	b8 14 2a 11 80       	mov    $0x80112a14,%eax
80103f9c:	eb 0c                	jmp    80103faa <kill+0x2a>
80103f9e:	66 90                	xchg   %ax,%ax
80103fa0:	83 e8 80             	sub    $0xffffff80,%eax
80103fa3:	3d 14 4a 11 80       	cmp    $0x80114a14,%eax
80103fa8:	73 3e                	jae    80103fe8 <kill+0x68>
    if(p->pid == pid){
80103faa:	39 58 10             	cmp    %ebx,0x10(%eax)
80103fad:	75 f1                	jne    80103fa0 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103faf:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
80103fb3:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
80103fba:	74 1c                	je     80103fd8 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
80103fbc:	83 ec 0c             	sub    $0xc,%esp
80103fbf:	68 e0 29 11 80       	push   $0x801129e0
80103fc4:	e8 c7 05 00 00       	call   80104590 <release>
      return 0;
80103fc9:	83 c4 10             	add    $0x10,%esp
80103fcc:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80103fce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fd1:	c9                   	leave  
80103fd2:	c3                   	ret    
80103fd3:	90                   	nop
80103fd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        p->state = RUNNABLE;
80103fd8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103fdf:	eb db                	jmp    80103fbc <kill+0x3c>
80103fe1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80103fe8:	83 ec 0c             	sub    $0xc,%esp
80103feb:	68 e0 29 11 80       	push   $0x801129e0
80103ff0:	e8 9b 05 00 00       	call   80104590 <release>
  return -1;
80103ff5:	83 c4 10             	add    $0x10,%esp
80103ff8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103ffd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104000:	c9                   	leave  
80104001:	c3                   	ret    
80104002:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104010 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104010:	55                   	push   %ebp
80104011:	89 e5                	mov    %esp,%ebp
80104013:	57                   	push   %edi
80104014:	56                   	push   %esi
80104015:	53                   	push   %ebx
80104016:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104019:	bb 14 2a 11 80       	mov    $0x80112a14,%ebx
{
8010401e:	83 ec 3c             	sub    $0x3c,%esp
80104021:	eb 24                	jmp    80104047 <procdump+0x37>
80104023:	90                   	nop
80104024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104028:	83 ec 0c             	sub    $0xc,%esp
8010402b:	68 bf 7b 10 80       	push   $0x80107bbf
80104030:	e8 2b c6 ff ff       	call   80100660 <cprintf>
80104035:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104038:	83 eb 80             	sub    $0xffffff80,%ebx
8010403b:	81 fb 14 4a 11 80    	cmp    $0x80114a14,%ebx
80104041:	0f 83 81 00 00 00    	jae    801040c8 <procdump+0xb8>
    if(p->state == UNUSED)
80104047:	8b 43 0c             	mov    0xc(%ebx),%eax
8010404a:	85 c0                	test   %eax,%eax
8010404c:	74 ea                	je     80104038 <procdump+0x28>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010404e:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
80104051:	ba 40 77 10 80       	mov    $0x80107740,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104056:	77 11                	ja     80104069 <procdump+0x59>
80104058:	8b 14 85 48 78 10 80 	mov    -0x7fef87b8(,%eax,4),%edx
      state = "???";
8010405f:	b8 40 77 10 80       	mov    $0x80107740,%eax
80104064:	85 d2                	test   %edx,%edx
80104066:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80104069:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010406c:	50                   	push   %eax
8010406d:	52                   	push   %edx
8010406e:	ff 73 10             	pushl  0x10(%ebx)
80104071:	68 44 77 10 80       	push   $0x80107744
80104076:	e8 e5 c5 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
8010407b:	83 c4 10             	add    $0x10,%esp
8010407e:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80104082:	75 a4                	jne    80104028 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104084:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104087:	83 ec 08             	sub    $0x8,%esp
8010408a:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010408d:	50                   	push   %eax
8010408e:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104091:	8b 40 0c             	mov    0xc(%eax),%eax
80104094:	83 c0 08             	add    $0x8,%eax
80104097:	50                   	push   %eax
80104098:	e8 f3 02 00 00       	call   80104390 <getcallerpcs>
8010409d:	83 c4 10             	add    $0x10,%esp
      for(i=0; i<10 && pc[i] != 0; i++)
801040a0:	8b 17                	mov    (%edi),%edx
801040a2:	85 d2                	test   %edx,%edx
801040a4:	74 82                	je     80104028 <procdump+0x18>
        cprintf(" %p", pc[i]);
801040a6:	83 ec 08             	sub    $0x8,%esp
801040a9:	83 c7 04             	add    $0x4,%edi
801040ac:	52                   	push   %edx
801040ad:	68 81 71 10 80       	push   $0x80107181
801040b2:	e8 a9 c5 ff ff       	call   80100660 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
801040b7:	83 c4 10             	add    $0x10,%esp
801040ba:	39 fe                	cmp    %edi,%esi
801040bc:	75 e2                	jne    801040a0 <procdump+0x90>
801040be:	e9 65 ff ff ff       	jmp    80104028 <procdump+0x18>
801040c3:	90                   	nop
801040c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
}
801040c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801040cb:	5b                   	pop    %ebx
801040cc:	5e                   	pop    %esi
801040cd:	5f                   	pop    %edi
801040ce:	5d                   	pop    %ebp
801040cf:	c3                   	ret    

801040d0 <cpsys>:

//Current process status
int
cpsys()
{
801040d0:	55                   	push   %ebp
801040d1:	89 e5                	mov    %esp,%ebp
801040d3:	53                   	push   %ebx
801040d4:	83 ec 10             	sub    $0x10,%esp
  asm volatile("sti");
801040d7:	fb                   	sti    

  //Enable interrupts on this procesor
  sti();

  //Loop over process table looking for a process with pid.
  acquire(&ptable.lock);
801040d8:	68 e0 29 11 80       	push   $0x801129e0
801040dd:	bb 80 2a 11 80       	mov    $0x80112a80,%ebx
801040e2:	e8 89 03 00 00       	call   80104470 <acquire>
  cprintf("name \t pid \t state \t \t priority  \n");
801040e7:	c7 04 24 24 78 10 80 	movl   $0x80107824,(%esp)
801040ee:	e8 6d c5 ff ff       	call   80100660 <cprintf>
801040f3:	83 c4 10             	add    $0x10,%esp
801040f6:	eb 25                	jmp    8010411d <cpsys+0x4d>
801040f8:	90                   	nop
801040f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if( p->state == SLEEPING )
	cprintf("%s \t %d \t SLEEPING \t %d\n ", p->name, p->pid, p->priority);
      else if ( p->state == RUNNING )
80104100:	83 f8 04             	cmp    $0x4,%eax
80104103:	74 3b                	je     80104140 <cpsys+0x70>
	cprintf("%s \t %d \t RUNNING \t %d\n ", p->name, p->pid, p->priority);
      else if ( p->state == RUNNABLE )
80104105:	83 f8 03             	cmp    $0x3,%eax
80104108:	74 56                	je     80104160 <cpsys+0x90>
8010410a:	8d 83 80 00 00 00    	lea    0x80(%ebx),%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104110:	83 c3 14             	add    $0x14,%ebx
80104113:	81 fb 14 4a 11 80    	cmp    $0x80114a14,%ebx
80104119:	73 65                	jae    80104180 <cpsys+0xb0>
8010411b:	89 c3                	mov    %eax,%ebx
      if( p->state == SLEEPING )
8010411d:	8b 43 a0             	mov    -0x60(%ebx),%eax
80104120:	83 f8 02             	cmp    $0x2,%eax
80104123:	75 db                	jne    80104100 <cpsys+0x30>
	cprintf("%s \t %d \t SLEEPING \t %d\n ", p->name, p->pid, p->priority);
80104125:	ff 73 10             	pushl  0x10(%ebx)
80104128:	ff 73 a4             	pushl  -0x5c(%ebx)
8010412b:	53                   	push   %ebx
8010412c:	68 4d 77 10 80       	push   $0x8010774d
80104131:	e8 2a c5 ff ff       	call   80100660 <cprintf>
80104136:	83 c4 10             	add    $0x10,%esp
80104139:	eb cf                	jmp    8010410a <cpsys+0x3a>
8010413b:	90                   	nop
8010413c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	cprintf("%s \t %d \t RUNNING \t %d\n ", p->name, p->pid, p->priority);
80104140:	ff 73 10             	pushl  0x10(%ebx)
80104143:	ff 73 a4             	pushl  -0x5c(%ebx)
80104146:	53                   	push   %ebx
80104147:	68 67 77 10 80       	push   $0x80107767
8010414c:	e8 0f c5 ff ff       	call   80100660 <cprintf>
80104151:	83 c4 10             	add    $0x10,%esp
80104154:	eb b4                	jmp    8010410a <cpsys+0x3a>
80104156:	8d 76 00             	lea    0x0(%esi),%esi
80104159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	cprintf("%s \t %d \t RUNNABLE \t %d\n ", p->name, p->pid, p->priority);
80104160:	ff 73 10             	pushl  0x10(%ebx)
80104163:	ff 73 a4             	pushl  -0x5c(%ebx)
80104166:	53                   	push   %ebx
80104167:	68 80 77 10 80       	push   $0x80107780
8010416c:	e8 ef c4 ff ff       	call   80100660 <cprintf>
80104171:	83 c4 10             	add    $0x10,%esp
80104174:	eb 94                	jmp    8010410a <cpsys+0x3a>
80104176:	8d 76 00             	lea    0x0(%esi),%esi
80104179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }

  release(&ptable.lock);
80104180:	83 ec 0c             	sub    $0xc,%esp
80104183:	68 e0 29 11 80       	push   $0x801129e0
80104188:	e8 03 04 00 00       	call   80104590 <release>

  return 22;
}
8010418d:	b8 16 00 00 00       	mov    $0x16,%eax
80104192:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104195:	c9                   	leave  
80104196:	c3                   	ret    
80104197:	89 f6                	mov    %esi,%esi
80104199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041a0 <csc>:

//counter of system calls 
void
csc()
{
801041a0:	55                   	push   %ebp
801041a1:	89 e5                	mov    %esp,%ebp
801041a3:	56                   	push   %esi
801041a4:	53                   	push   %ebx
	int aux = 0;
	cprintf(" #proc\tsyscall\ttimes\n");
801041a5:	31 f6                	xor    %esi,%esi
801041a7:	bb 01 00 00 00       	mov    $0x1,%ebx
801041ac:	83 ec 0c             	sub    $0xc,%esp
801041af:	68 9a 77 10 80       	push   $0x8010779a
801041b4:	e8 a7 c4 ff ff       	call   80100660 <cprintf>
801041b9:	83 c4 10             	add    $0x10,%esp
801041bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for(int i=0; i<sizeof(syscls)/sizeof(syscls[0]); i++){
			if(syscls[i]>0){
801041c0:	8b 04 9d 3c b6 10 80 	mov    -0x7fef49c4(,%ebx,4),%eax
801041c7:	85 c0                	test   %eax,%eax
801041c9:	7e 1d                	jle    801041e8 <csc+0x48>
			  cprintf("   %d\t%s:\t  %d\n", i+1, syscls_names[i], syscls[i]);
801041cb:	50                   	push   %eax
801041cc:	ff 34 9d 1c a0 10 80 	pushl  -0x7fef5fe4(,%ebx,4)
801041d3:	53                   	push   %ebx
801041d4:	68 b0 77 10 80       	push   $0x801077b0
801041d9:	e8 82 c4 ff ff       	call   80100660 <cprintf>
			aux += syscls[i];}
801041de:	03 34 9d 3c b6 10 80 	add    -0x7fef49c4(,%ebx,4),%esi
801041e5:	83 c4 10             	add    $0x10,%esp
801041e8:	83 c3 01             	add    $0x1,%ebx
	for(int i=0; i<sizeof(syscls)/sizeof(syscls[0]); i++){
801041eb:	83 fb 19             	cmp    $0x19,%ebx
801041ee:	75 d0                	jne    801041c0 <csc+0x20>
		}
    cprintf("\t[Total]  [%d]\n", aux);
801041f0:	83 ec 08             	sub    $0x8,%esp
801041f3:	56                   	push   %esi
801041f4:	68 c0 77 10 80       	push   $0x801077c0
801041f9:	e8 62 c4 ff ff       	call   80100660 <cprintf>
}
801041fe:	83 c4 10             	add    $0x10,%esp
80104201:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104204:	5b                   	pop    %ebx
80104205:	5e                   	pop    %esi
80104206:	5d                   	pop    %ebp
80104207:	c3                   	ret    
80104208:	90                   	nop
80104209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104210 <chpr>:

//change priority
int
chpr( int pid, int priority)
{
80104210:	55                   	push   %ebp
80104211:	89 e5                	mov    %esp,%ebp
80104213:	53                   	push   %ebx
80104214:	83 ec 10             	sub    $0x10,%esp
80104217:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010421a:	68 e0 29 11 80       	push   $0x801129e0
8010421f:	e8 4c 02 00 00       	call   80104470 <acquire>
80104224:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104227:	ba 14 2a 11 80       	mov    $0x80112a14,%edx
8010422c:	eb 0d                	jmp    8010423b <chpr+0x2b>
8010422e:	66 90                	xchg   %ax,%ax
80104230:	83 ea 80             	sub    $0xffffff80,%edx
80104233:	81 fa 14 4a 11 80    	cmp    $0x80114a14,%edx
80104239:	73 0b                	jae    80104246 <chpr+0x36>
    if(p->pid == pid){
8010423b:	39 5a 10             	cmp    %ebx,0x10(%edx)
8010423e:	75 f0                	jne    80104230 <chpr+0x20>
        p->priority = priority;
80104240:	8b 45 0c             	mov    0xc(%ebp),%eax
80104243:	89 42 7c             	mov    %eax,0x7c(%edx)
        break;
    }
  }
  release(&ptable.lock);
80104246:	83 ec 0c             	sub    $0xc,%esp
80104249:	68 e0 29 11 80       	push   $0x801129e0
8010424e:	e8 3d 03 00 00       	call   80104590 <release>

  return pid;
}
80104253:	89 d8                	mov    %ebx,%eax
80104255:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104258:	c9                   	leave  
80104259:	c3                   	ret    
8010425a:	66 90                	xchg   %ax,%ax
8010425c:	66 90                	xchg   %ax,%ax
8010425e:	66 90                	xchg   %ax,%ax

80104260 <initsleeplock>:
80104260:	55                   	push   %ebp
80104261:	89 e5                	mov    %esp,%ebp
80104263:	53                   	push   %ebx
80104264:	83 ec 0c             	sub    $0xc,%esp
80104267:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010426a:	68 60 78 10 80       	push   $0x80107860
8010426f:	8d 43 04             	lea    0x4(%ebx),%eax
80104272:	50                   	push   %eax
80104273:	e8 f8 00 00 00       	call   80104370 <initlock>
80104278:	8b 45 0c             	mov    0xc(%ebp),%eax
8010427b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104281:	83 c4 10             	add    $0x10,%esp
80104284:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010428b:	89 43 38             	mov    %eax,0x38(%ebx)
8010428e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104291:	c9                   	leave  
80104292:	c3                   	ret    
80104293:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801042a0 <acquiresleep>:
801042a0:	55                   	push   %ebp
801042a1:	89 e5                	mov    %esp,%ebp
801042a3:	56                   	push   %esi
801042a4:	53                   	push   %ebx
801042a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042a8:	83 ec 0c             	sub    $0xc,%esp
801042ab:	8d 73 04             	lea    0x4(%ebx),%esi
801042ae:	56                   	push   %esi
801042af:	e8 bc 01 00 00       	call   80104470 <acquire>
801042b4:	8b 13                	mov    (%ebx),%edx
801042b6:	83 c4 10             	add    $0x10,%esp
801042b9:	85 d2                	test   %edx,%edx
801042bb:	74 16                	je     801042d3 <acquiresleep+0x33>
801042bd:	8d 76 00             	lea    0x0(%esi),%esi
801042c0:	83 ec 08             	sub    $0x8,%esp
801042c3:	56                   	push   %esi
801042c4:	53                   	push   %ebx
801042c5:	e8 96 fa ff ff       	call   80103d60 <sleep>
801042ca:	8b 03                	mov    (%ebx),%eax
801042cc:	83 c4 10             	add    $0x10,%esp
801042cf:	85 c0                	test   %eax,%eax
801042d1:	75 ed                	jne    801042c0 <acquiresleep+0x20>
801042d3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
801042d9:	e8 b2 f4 ff ff       	call   80103790 <myproc>
801042de:	8b 40 10             	mov    0x10(%eax),%eax
801042e1:	89 43 3c             	mov    %eax,0x3c(%ebx)
801042e4:	89 75 08             	mov    %esi,0x8(%ebp)
801042e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801042ea:	5b                   	pop    %ebx
801042eb:	5e                   	pop    %esi
801042ec:	5d                   	pop    %ebp
801042ed:	e9 9e 02 00 00       	jmp    80104590 <release>
801042f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104300 <releasesleep>:
80104300:	55                   	push   %ebp
80104301:	89 e5                	mov    %esp,%ebp
80104303:	56                   	push   %esi
80104304:	53                   	push   %ebx
80104305:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104308:	83 ec 0c             	sub    $0xc,%esp
8010430b:	8d 73 04             	lea    0x4(%ebx),%esi
8010430e:	56                   	push   %esi
8010430f:	e8 5c 01 00 00       	call   80104470 <acquire>
80104314:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010431a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80104321:	89 1c 24             	mov    %ebx,(%esp)
80104324:	e8 f7 fb ff ff       	call   80103f20 <wakeup>
80104329:	89 75 08             	mov    %esi,0x8(%ebp)
8010432c:	83 c4 10             	add    $0x10,%esp
8010432f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104332:	5b                   	pop    %ebx
80104333:	5e                   	pop    %esi
80104334:	5d                   	pop    %ebp
80104335:	e9 56 02 00 00       	jmp    80104590 <release>
8010433a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104340 <holdingsleep>:
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	56                   	push   %esi
80104344:	53                   	push   %ebx
80104345:	8b 75 08             	mov    0x8(%ebp),%esi
80104348:	83 ec 0c             	sub    $0xc,%esp
8010434b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010434e:	53                   	push   %ebx
8010434f:	e8 1c 01 00 00       	call   80104470 <acquire>
80104354:	8b 36                	mov    (%esi),%esi
80104356:	89 1c 24             	mov    %ebx,(%esp)
80104359:	e8 32 02 00 00       	call   80104590 <release>
8010435e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104361:	89 f0                	mov    %esi,%eax
80104363:	5b                   	pop    %ebx
80104364:	5e                   	pop    %esi
80104365:	5d                   	pop    %ebp
80104366:	c3                   	ret    
80104367:	66 90                	xchg   %ax,%ax
80104369:	66 90                	xchg   %ax,%ax
8010436b:	66 90                	xchg   %ax,%ax
8010436d:	66 90                	xchg   %ax,%ax
8010436f:	90                   	nop

80104370 <initlock>:
80104370:	55                   	push   %ebp
80104371:	89 e5                	mov    %esp,%ebp
80104373:	8b 45 08             	mov    0x8(%ebp),%eax
80104376:	8b 55 0c             	mov    0xc(%ebp),%edx
80104379:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010437f:	89 50 04             	mov    %edx,0x4(%eax)
80104382:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104389:	5d                   	pop    %ebp
8010438a:	c3                   	ret    
8010438b:	90                   	nop
8010438c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104390 <getcallerpcs>:
80104390:	55                   	push   %ebp
80104391:	89 e5                	mov    %esp,%ebp
80104393:	53                   	push   %ebx
80104394:	8b 45 08             	mov    0x8(%ebp),%eax
80104397:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010439a:	8d 50 f8             	lea    -0x8(%eax),%edx
8010439d:	31 c0                	xor    %eax,%eax
8010439f:	90                   	nop
801043a0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801043a6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801043ac:	77 1a                	ja     801043c8 <getcallerpcs+0x38>
801043ae:	8b 5a 04             	mov    0x4(%edx),%ebx
801043b1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
801043b4:	83 c0 01             	add    $0x1,%eax
801043b7:	8b 12                	mov    (%edx),%edx
801043b9:	83 f8 0a             	cmp    $0xa,%eax
801043bc:	75 e2                	jne    801043a0 <getcallerpcs+0x10>
801043be:	5b                   	pop    %ebx
801043bf:	5d                   	pop    %ebp
801043c0:	c3                   	ret    
801043c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801043c8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801043cf:	83 c0 01             	add    $0x1,%eax
801043d2:	83 f8 0a             	cmp    $0xa,%eax
801043d5:	74 e7                	je     801043be <getcallerpcs+0x2e>
801043d7:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801043de:	83 c0 01             	add    $0x1,%eax
801043e1:	83 f8 0a             	cmp    $0xa,%eax
801043e4:	75 e2                	jne    801043c8 <getcallerpcs+0x38>
801043e6:	eb d6                	jmp    801043be <getcallerpcs+0x2e>
801043e8:	90                   	nop
801043e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801043f0 <holding>:
801043f0:	55                   	push   %ebp
801043f1:	89 e5                	mov    %esp,%ebp
801043f3:	53                   	push   %ebx
801043f4:	83 ec 04             	sub    $0x4,%esp
801043f7:	8b 55 08             	mov    0x8(%ebp),%edx
801043fa:	8b 02                	mov    (%edx),%eax
801043fc:	85 c0                	test   %eax,%eax
801043fe:	75 10                	jne    80104410 <holding+0x20>
80104400:	83 c4 04             	add    $0x4,%esp
80104403:	31 c0                	xor    %eax,%eax
80104405:	5b                   	pop    %ebx
80104406:	5d                   	pop    %ebp
80104407:	c3                   	ret    
80104408:	90                   	nop
80104409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104410:	8b 5a 08             	mov    0x8(%edx),%ebx
80104413:	e8 e8 f2 ff ff       	call   80103700 <mycpu>
80104418:	39 c3                	cmp    %eax,%ebx
8010441a:	0f 94 c0             	sete   %al
8010441d:	83 c4 04             	add    $0x4,%esp
80104420:	0f b6 c0             	movzbl %al,%eax
80104423:	5b                   	pop    %ebx
80104424:	5d                   	pop    %ebp
80104425:	c3                   	ret    
80104426:	8d 76 00             	lea    0x0(%esi),%esi
80104429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104430 <pushcli>:
80104430:	55                   	push   %ebp
80104431:	89 e5                	mov    %esp,%ebp
80104433:	53                   	push   %ebx
80104434:	83 ec 04             	sub    $0x4,%esp
80104437:	9c                   	pushf  
80104438:	5b                   	pop    %ebx
80104439:	fa                   	cli    
8010443a:	e8 c1 f2 ff ff       	call   80103700 <mycpu>
8010443f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104445:	85 c0                	test   %eax,%eax
80104447:	75 11                	jne    8010445a <pushcli+0x2a>
80104449:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010444f:	e8 ac f2 ff ff       	call   80103700 <mycpu>
80104454:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
8010445a:	e8 a1 f2 ff ff       	call   80103700 <mycpu>
8010445f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
80104466:	83 c4 04             	add    $0x4,%esp
80104469:	5b                   	pop    %ebx
8010446a:	5d                   	pop    %ebp
8010446b:	c3                   	ret    
8010446c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104470 <acquire>:
80104470:	55                   	push   %ebp
80104471:	89 e5                	mov    %esp,%ebp
80104473:	56                   	push   %esi
80104474:	53                   	push   %ebx
80104475:	e8 b6 ff ff ff       	call   80104430 <pushcli>
8010447a:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010447d:	8b 03                	mov    (%ebx),%eax
8010447f:	85 c0                	test   %eax,%eax
80104481:	75 7d                	jne    80104500 <acquire+0x90>
80104483:	ba 01 00 00 00       	mov    $0x1,%edx
80104488:	eb 09                	jmp    80104493 <acquire+0x23>
8010448a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104490:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104493:	89 d0                	mov    %edx,%eax
80104495:	f0 87 03             	lock xchg %eax,(%ebx)
80104498:	85 c0                	test   %eax,%eax
8010449a:	75 f4                	jne    80104490 <acquire+0x20>
8010449c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801044a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801044a4:	e8 57 f2 ff ff       	call   80103700 <mycpu>
801044a9:	89 ea                	mov    %ebp,%edx
801044ab:	8d 4b 0c             	lea    0xc(%ebx),%ecx
801044ae:	89 43 08             	mov    %eax,0x8(%ebx)
801044b1:	31 c0                	xor    %eax,%eax
801044b3:	90                   	nop
801044b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044b8:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801044be:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801044c4:	77 1a                	ja     801044e0 <acquire+0x70>
801044c6:	8b 5a 04             	mov    0x4(%edx),%ebx
801044c9:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
801044cc:	83 c0 01             	add    $0x1,%eax
801044cf:	8b 12                	mov    (%edx),%edx
801044d1:	83 f8 0a             	cmp    $0xa,%eax
801044d4:	75 e2                	jne    801044b8 <acquire+0x48>
801044d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801044d9:	5b                   	pop    %ebx
801044da:	5e                   	pop    %esi
801044db:	5d                   	pop    %ebp
801044dc:	c3                   	ret    
801044dd:	8d 76 00             	lea    0x0(%esi),%esi
801044e0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801044e7:	83 c0 01             	add    $0x1,%eax
801044ea:	83 f8 0a             	cmp    $0xa,%eax
801044ed:	74 e7                	je     801044d6 <acquire+0x66>
801044ef:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801044f6:	83 c0 01             	add    $0x1,%eax
801044f9:	83 f8 0a             	cmp    $0xa,%eax
801044fc:	75 e2                	jne    801044e0 <acquire+0x70>
801044fe:	eb d6                	jmp    801044d6 <acquire+0x66>
80104500:	8b 73 08             	mov    0x8(%ebx),%esi
80104503:	e8 f8 f1 ff ff       	call   80103700 <mycpu>
80104508:	39 c6                	cmp    %eax,%esi
8010450a:	0f 85 73 ff ff ff    	jne    80104483 <acquire+0x13>
80104510:	83 ec 0c             	sub    $0xc,%esp
80104513:	68 6b 78 10 80       	push   $0x8010786b
80104518:	e8 53 be ff ff       	call   80100370 <panic>
8010451d:	8d 76 00             	lea    0x0(%esi),%esi

80104520 <popcli>:
80104520:	55                   	push   %ebp
80104521:	89 e5                	mov    %esp,%ebp
80104523:	83 ec 08             	sub    $0x8,%esp
80104526:	9c                   	pushf  
80104527:	58                   	pop    %eax
80104528:	f6 c4 02             	test   $0x2,%ah
8010452b:	75 52                	jne    8010457f <popcli+0x5f>
8010452d:	e8 ce f1 ff ff       	call   80103700 <mycpu>
80104532:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80104538:	8d 51 ff             	lea    -0x1(%ecx),%edx
8010453b:	85 d2                	test   %edx,%edx
8010453d:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80104543:	78 2d                	js     80104572 <popcli+0x52>
80104545:	e8 b6 f1 ff ff       	call   80103700 <mycpu>
8010454a:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104550:	85 d2                	test   %edx,%edx
80104552:	74 0c                	je     80104560 <popcli+0x40>
80104554:	c9                   	leave  
80104555:	c3                   	ret    
80104556:	8d 76 00             	lea    0x0(%esi),%esi
80104559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104560:	e8 9b f1 ff ff       	call   80103700 <mycpu>
80104565:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010456b:	85 c0                	test   %eax,%eax
8010456d:	74 e5                	je     80104554 <popcli+0x34>
8010456f:	fb                   	sti    
80104570:	c9                   	leave  
80104571:	c3                   	ret    
80104572:	83 ec 0c             	sub    $0xc,%esp
80104575:	68 8a 78 10 80       	push   $0x8010788a
8010457a:	e8 f1 bd ff ff       	call   80100370 <panic>
8010457f:	83 ec 0c             	sub    $0xc,%esp
80104582:	68 73 78 10 80       	push   $0x80107873
80104587:	e8 e4 bd ff ff       	call   80100370 <panic>
8010458c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104590 <release>:
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	56                   	push   %esi
80104594:	53                   	push   %ebx
80104595:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104598:	8b 03                	mov    (%ebx),%eax
8010459a:	85 c0                	test   %eax,%eax
8010459c:	75 12                	jne    801045b0 <release+0x20>
8010459e:	83 ec 0c             	sub    $0xc,%esp
801045a1:	68 91 78 10 80       	push   $0x80107891
801045a6:	e8 c5 bd ff ff       	call   80100370 <panic>
801045ab:	90                   	nop
801045ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045b0:	8b 73 08             	mov    0x8(%ebx),%esi
801045b3:	e8 48 f1 ff ff       	call   80103700 <mycpu>
801045b8:	39 c6                	cmp    %eax,%esi
801045ba:	75 e2                	jne    8010459e <release+0xe>
801045bc:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801045c3:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
801045ca:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801045cf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801045d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
801045d8:	5b                   	pop    %ebx
801045d9:	5e                   	pop    %esi
801045da:	5d                   	pop    %ebp
801045db:	e9 40 ff ff ff       	jmp    80104520 <popcli>

801045e0 <memset>:
801045e0:	55                   	push   %ebp
801045e1:	89 e5                	mov    %esp,%ebp
801045e3:	57                   	push   %edi
801045e4:	53                   	push   %ebx
801045e5:	8b 55 08             	mov    0x8(%ebp),%edx
801045e8:	8b 4d 10             	mov    0x10(%ebp),%ecx
801045eb:	f6 c2 03             	test   $0x3,%dl
801045ee:	75 05                	jne    801045f5 <memset+0x15>
801045f0:	f6 c1 03             	test   $0x3,%cl
801045f3:	74 13                	je     80104608 <memset+0x28>
801045f5:	89 d7                	mov    %edx,%edi
801045f7:	8b 45 0c             	mov    0xc(%ebp),%eax
801045fa:	fc                   	cld    
801045fb:	f3 aa                	rep stos %al,%es:(%edi)
801045fd:	5b                   	pop    %ebx
801045fe:	89 d0                	mov    %edx,%eax
80104600:	5f                   	pop    %edi
80104601:	5d                   	pop    %ebp
80104602:	c3                   	ret    
80104603:	90                   	nop
80104604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104608:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
8010460c:	c1 e9 02             	shr    $0x2,%ecx
8010460f:	89 fb                	mov    %edi,%ebx
80104611:	89 f8                	mov    %edi,%eax
80104613:	c1 e3 18             	shl    $0x18,%ebx
80104616:	c1 e0 10             	shl    $0x10,%eax
80104619:	09 d8                	or     %ebx,%eax
8010461b:	09 f8                	or     %edi,%eax
8010461d:	c1 e7 08             	shl    $0x8,%edi
80104620:	09 f8                	or     %edi,%eax
80104622:	89 d7                	mov    %edx,%edi
80104624:	fc                   	cld    
80104625:	f3 ab                	rep stos %eax,%es:(%edi)
80104627:	5b                   	pop    %ebx
80104628:	89 d0                	mov    %edx,%eax
8010462a:	5f                   	pop    %edi
8010462b:	5d                   	pop    %ebp
8010462c:	c3                   	ret    
8010462d:	8d 76 00             	lea    0x0(%esi),%esi

80104630 <memcmp>:
80104630:	55                   	push   %ebp
80104631:	89 e5                	mov    %esp,%ebp
80104633:	57                   	push   %edi
80104634:	56                   	push   %esi
80104635:	8b 45 10             	mov    0x10(%ebp),%eax
80104638:	53                   	push   %ebx
80104639:	8b 75 0c             	mov    0xc(%ebp),%esi
8010463c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010463f:	85 c0                	test   %eax,%eax
80104641:	74 29                	je     8010466c <memcmp+0x3c>
80104643:	0f b6 13             	movzbl (%ebx),%edx
80104646:	0f b6 0e             	movzbl (%esi),%ecx
80104649:	38 d1                	cmp    %dl,%cl
8010464b:	75 2b                	jne    80104678 <memcmp+0x48>
8010464d:	8d 78 ff             	lea    -0x1(%eax),%edi
80104650:	31 c0                	xor    %eax,%eax
80104652:	eb 14                	jmp    80104668 <memcmp+0x38>
80104654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104658:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010465d:	83 c0 01             	add    $0x1,%eax
80104660:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80104664:	38 ca                	cmp    %cl,%dl
80104666:	75 10                	jne    80104678 <memcmp+0x48>
80104668:	39 f8                	cmp    %edi,%eax
8010466a:	75 ec                	jne    80104658 <memcmp+0x28>
8010466c:	5b                   	pop    %ebx
8010466d:	31 c0                	xor    %eax,%eax
8010466f:	5e                   	pop    %esi
80104670:	5f                   	pop    %edi
80104671:	5d                   	pop    %ebp
80104672:	c3                   	ret    
80104673:	90                   	nop
80104674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104678:	0f b6 c2             	movzbl %dl,%eax
8010467b:	5b                   	pop    %ebx
8010467c:	29 c8                	sub    %ecx,%eax
8010467e:	5e                   	pop    %esi
8010467f:	5f                   	pop    %edi
80104680:	5d                   	pop    %ebp
80104681:	c3                   	ret    
80104682:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104690 <memmove>:
80104690:	55                   	push   %ebp
80104691:	89 e5                	mov    %esp,%ebp
80104693:	56                   	push   %esi
80104694:	53                   	push   %ebx
80104695:	8b 45 08             	mov    0x8(%ebp),%eax
80104698:	8b 75 0c             	mov    0xc(%ebp),%esi
8010469b:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010469e:	39 c6                	cmp    %eax,%esi
801046a0:	73 2e                	jae    801046d0 <memmove+0x40>
801046a2:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
801046a5:	39 c8                	cmp    %ecx,%eax
801046a7:	73 27                	jae    801046d0 <memmove+0x40>
801046a9:	85 db                	test   %ebx,%ebx
801046ab:	8d 53 ff             	lea    -0x1(%ebx),%edx
801046ae:	74 17                	je     801046c7 <memmove+0x37>
801046b0:	29 d9                	sub    %ebx,%ecx
801046b2:	89 cb                	mov    %ecx,%ebx
801046b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046b8:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801046bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801046bf:	83 ea 01             	sub    $0x1,%edx
801046c2:	83 fa ff             	cmp    $0xffffffff,%edx
801046c5:	75 f1                	jne    801046b8 <memmove+0x28>
801046c7:	5b                   	pop    %ebx
801046c8:	5e                   	pop    %esi
801046c9:	5d                   	pop    %ebp
801046ca:	c3                   	ret    
801046cb:	90                   	nop
801046cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046d0:	31 d2                	xor    %edx,%edx
801046d2:	85 db                	test   %ebx,%ebx
801046d4:	74 f1                	je     801046c7 <memmove+0x37>
801046d6:	8d 76 00             	lea    0x0(%esi),%esi
801046d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801046e0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
801046e4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801046e7:	83 c2 01             	add    $0x1,%edx
801046ea:	39 d3                	cmp    %edx,%ebx
801046ec:	75 f2                	jne    801046e0 <memmove+0x50>
801046ee:	5b                   	pop    %ebx
801046ef:	5e                   	pop    %esi
801046f0:	5d                   	pop    %ebp
801046f1:	c3                   	ret    
801046f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104700 <memcpy>:
80104700:	55                   	push   %ebp
80104701:	89 e5                	mov    %esp,%ebp
80104703:	5d                   	pop    %ebp
80104704:	eb 8a                	jmp    80104690 <memmove>
80104706:	8d 76 00             	lea    0x0(%esi),%esi
80104709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104710 <strncmp>:
80104710:	55                   	push   %ebp
80104711:	89 e5                	mov    %esp,%ebp
80104713:	57                   	push   %edi
80104714:	56                   	push   %esi
80104715:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104718:	53                   	push   %ebx
80104719:	8b 7d 08             	mov    0x8(%ebp),%edi
8010471c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010471f:	85 c9                	test   %ecx,%ecx
80104721:	74 37                	je     8010475a <strncmp+0x4a>
80104723:	0f b6 17             	movzbl (%edi),%edx
80104726:	0f b6 1e             	movzbl (%esi),%ebx
80104729:	84 d2                	test   %dl,%dl
8010472b:	74 3f                	je     8010476c <strncmp+0x5c>
8010472d:	38 d3                	cmp    %dl,%bl
8010472f:	75 3b                	jne    8010476c <strncmp+0x5c>
80104731:	8d 47 01             	lea    0x1(%edi),%eax
80104734:	01 cf                	add    %ecx,%edi
80104736:	eb 1b                	jmp    80104753 <strncmp+0x43>
80104738:	90                   	nop
80104739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104740:	0f b6 10             	movzbl (%eax),%edx
80104743:	84 d2                	test   %dl,%dl
80104745:	74 21                	je     80104768 <strncmp+0x58>
80104747:	0f b6 19             	movzbl (%ecx),%ebx
8010474a:	83 c0 01             	add    $0x1,%eax
8010474d:	89 ce                	mov    %ecx,%esi
8010474f:	38 da                	cmp    %bl,%dl
80104751:	75 19                	jne    8010476c <strncmp+0x5c>
80104753:	39 c7                	cmp    %eax,%edi
80104755:	8d 4e 01             	lea    0x1(%esi),%ecx
80104758:	75 e6                	jne    80104740 <strncmp+0x30>
8010475a:	5b                   	pop    %ebx
8010475b:	31 c0                	xor    %eax,%eax
8010475d:	5e                   	pop    %esi
8010475e:	5f                   	pop    %edi
8010475f:	5d                   	pop    %ebp
80104760:	c3                   	ret    
80104761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104768:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
8010476c:	0f b6 c2             	movzbl %dl,%eax
8010476f:	29 d8                	sub    %ebx,%eax
80104771:	5b                   	pop    %ebx
80104772:	5e                   	pop    %esi
80104773:	5f                   	pop    %edi
80104774:	5d                   	pop    %ebp
80104775:	c3                   	ret    
80104776:	8d 76 00             	lea    0x0(%esi),%esi
80104779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104780 <strncpy>:
80104780:	55                   	push   %ebp
80104781:	89 e5                	mov    %esp,%ebp
80104783:	56                   	push   %esi
80104784:	53                   	push   %ebx
80104785:	8b 45 08             	mov    0x8(%ebp),%eax
80104788:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010478b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010478e:	89 c2                	mov    %eax,%edx
80104790:	eb 19                	jmp    801047ab <strncpy+0x2b>
80104792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104798:	83 c3 01             	add    $0x1,%ebx
8010479b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010479f:	83 c2 01             	add    $0x1,%edx
801047a2:	84 c9                	test   %cl,%cl
801047a4:	88 4a ff             	mov    %cl,-0x1(%edx)
801047a7:	74 09                	je     801047b2 <strncpy+0x32>
801047a9:	89 f1                	mov    %esi,%ecx
801047ab:	85 c9                	test   %ecx,%ecx
801047ad:	8d 71 ff             	lea    -0x1(%ecx),%esi
801047b0:	7f e6                	jg     80104798 <strncpy+0x18>
801047b2:	31 c9                	xor    %ecx,%ecx
801047b4:	85 f6                	test   %esi,%esi
801047b6:	7e 17                	jle    801047cf <strncpy+0x4f>
801047b8:	90                   	nop
801047b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047c0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
801047c4:	89 f3                	mov    %esi,%ebx
801047c6:	83 c1 01             	add    $0x1,%ecx
801047c9:	29 cb                	sub    %ecx,%ebx
801047cb:	85 db                	test   %ebx,%ebx
801047cd:	7f f1                	jg     801047c0 <strncpy+0x40>
801047cf:	5b                   	pop    %ebx
801047d0:	5e                   	pop    %esi
801047d1:	5d                   	pop    %ebp
801047d2:	c3                   	ret    
801047d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801047d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047e0 <safestrcpy>:
801047e0:	55                   	push   %ebp
801047e1:	89 e5                	mov    %esp,%ebp
801047e3:	56                   	push   %esi
801047e4:	53                   	push   %ebx
801047e5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801047e8:	8b 45 08             	mov    0x8(%ebp),%eax
801047eb:	8b 55 0c             	mov    0xc(%ebp),%edx
801047ee:	85 c9                	test   %ecx,%ecx
801047f0:	7e 26                	jle    80104818 <safestrcpy+0x38>
801047f2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
801047f6:	89 c1                	mov    %eax,%ecx
801047f8:	eb 17                	jmp    80104811 <safestrcpy+0x31>
801047fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104800:	83 c2 01             	add    $0x1,%edx
80104803:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104807:	83 c1 01             	add    $0x1,%ecx
8010480a:	84 db                	test   %bl,%bl
8010480c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010480f:	74 04                	je     80104815 <safestrcpy+0x35>
80104811:	39 f2                	cmp    %esi,%edx
80104813:	75 eb                	jne    80104800 <safestrcpy+0x20>
80104815:	c6 01 00             	movb   $0x0,(%ecx)
80104818:	5b                   	pop    %ebx
80104819:	5e                   	pop    %esi
8010481a:	5d                   	pop    %ebp
8010481b:	c3                   	ret    
8010481c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104820 <strlen>:
80104820:	55                   	push   %ebp
80104821:	31 c0                	xor    %eax,%eax
80104823:	89 e5                	mov    %esp,%ebp
80104825:	8b 55 08             	mov    0x8(%ebp),%edx
80104828:	80 3a 00             	cmpb   $0x0,(%edx)
8010482b:	74 0c                	je     80104839 <strlen+0x19>
8010482d:	8d 76 00             	lea    0x0(%esi),%esi
80104830:	83 c0 01             	add    $0x1,%eax
80104833:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104837:	75 f7                	jne    80104830 <strlen+0x10>
80104839:	5d                   	pop    %ebp
8010483a:	c3                   	ret    

8010483b <swtch>:
8010483b:	8b 44 24 04          	mov    0x4(%esp),%eax
8010483f:	8b 54 24 08          	mov    0x8(%esp),%edx
80104843:	55                   	push   %ebp
80104844:	53                   	push   %ebx
80104845:	56                   	push   %esi
80104846:	57                   	push   %edi
80104847:	89 20                	mov    %esp,(%eax)
80104849:	89 d4                	mov    %edx,%esp
8010484b:	5f                   	pop    %edi
8010484c:	5e                   	pop    %esi
8010484d:	5b                   	pop    %ebx
8010484e:	5d                   	pop    %ebp
8010484f:	c3                   	ret    

80104850 <fetchint>:
80104850:	55                   	push   %ebp
80104851:	89 e5                	mov    %esp,%ebp
80104853:	53                   	push   %ebx
80104854:	83 ec 04             	sub    $0x4,%esp
80104857:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010485a:	e8 31 ef ff ff       	call   80103790 <myproc>
8010485f:	8b 00                	mov    (%eax),%eax
80104861:	39 d8                	cmp    %ebx,%eax
80104863:	76 1b                	jbe    80104880 <fetchint+0x30>
80104865:	8d 53 04             	lea    0x4(%ebx),%edx
80104868:	39 d0                	cmp    %edx,%eax
8010486a:	72 14                	jb     80104880 <fetchint+0x30>
8010486c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010486f:	8b 13                	mov    (%ebx),%edx
80104871:	89 10                	mov    %edx,(%eax)
80104873:	31 c0                	xor    %eax,%eax
80104875:	83 c4 04             	add    $0x4,%esp
80104878:	5b                   	pop    %ebx
80104879:	5d                   	pop    %ebp
8010487a:	c3                   	ret    
8010487b:	90                   	nop
8010487c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104880:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104885:	eb ee                	jmp    80104875 <fetchint+0x25>
80104887:	89 f6                	mov    %esi,%esi
80104889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104890 <fetchstr>:
80104890:	55                   	push   %ebp
80104891:	89 e5                	mov    %esp,%ebp
80104893:	53                   	push   %ebx
80104894:	83 ec 04             	sub    $0x4,%esp
80104897:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010489a:	e8 f1 ee ff ff       	call   80103790 <myproc>
8010489f:	39 18                	cmp    %ebx,(%eax)
801048a1:	76 29                	jbe    801048cc <fetchstr+0x3c>
801048a3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801048a6:	89 da                	mov    %ebx,%edx
801048a8:	89 19                	mov    %ebx,(%ecx)
801048aa:	8b 00                	mov    (%eax),%eax
801048ac:	39 c3                	cmp    %eax,%ebx
801048ae:	73 1c                	jae    801048cc <fetchstr+0x3c>
801048b0:	80 3b 00             	cmpb   $0x0,(%ebx)
801048b3:	75 10                	jne    801048c5 <fetchstr+0x35>
801048b5:	eb 29                	jmp    801048e0 <fetchstr+0x50>
801048b7:	89 f6                	mov    %esi,%esi
801048b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801048c0:	80 3a 00             	cmpb   $0x0,(%edx)
801048c3:	74 1b                	je     801048e0 <fetchstr+0x50>
801048c5:	83 c2 01             	add    $0x1,%edx
801048c8:	39 d0                	cmp    %edx,%eax
801048ca:	77 f4                	ja     801048c0 <fetchstr+0x30>
801048cc:	83 c4 04             	add    $0x4,%esp
801048cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801048d4:	5b                   	pop    %ebx
801048d5:	5d                   	pop    %ebp
801048d6:	c3                   	ret    
801048d7:	89 f6                	mov    %esi,%esi
801048d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801048e0:	83 c4 04             	add    $0x4,%esp
801048e3:	89 d0                	mov    %edx,%eax
801048e5:	29 d8                	sub    %ebx,%eax
801048e7:	5b                   	pop    %ebx
801048e8:	5d                   	pop    %ebp
801048e9:	c3                   	ret    
801048ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801048f0 <argint>:
801048f0:	55                   	push   %ebp
801048f1:	89 e5                	mov    %esp,%ebp
801048f3:	56                   	push   %esi
801048f4:	53                   	push   %ebx
801048f5:	e8 96 ee ff ff       	call   80103790 <myproc>
801048fa:	8b 40 18             	mov    0x18(%eax),%eax
801048fd:	8b 55 08             	mov    0x8(%ebp),%edx
80104900:	8b 40 44             	mov    0x44(%eax),%eax
80104903:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104906:	e8 85 ee ff ff       	call   80103790 <myproc>
8010490b:	8b 00                	mov    (%eax),%eax
8010490d:	8d 73 04             	lea    0x4(%ebx),%esi
80104910:	39 c6                	cmp    %eax,%esi
80104912:	73 1c                	jae    80104930 <argint+0x40>
80104914:	8d 53 08             	lea    0x8(%ebx),%edx
80104917:	39 d0                	cmp    %edx,%eax
80104919:	72 15                	jb     80104930 <argint+0x40>
8010491b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010491e:	8b 53 04             	mov    0x4(%ebx),%edx
80104921:	89 10                	mov    %edx,(%eax)
80104923:	31 c0                	xor    %eax,%eax
80104925:	5b                   	pop    %ebx
80104926:	5e                   	pop    %esi
80104927:	5d                   	pop    %ebp
80104928:	c3                   	ret    
80104929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104930:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104935:	eb ee                	jmp    80104925 <argint+0x35>
80104937:	89 f6                	mov    %esi,%esi
80104939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104940 <argptr>:
80104940:	55                   	push   %ebp
80104941:	89 e5                	mov    %esp,%ebp
80104943:	56                   	push   %esi
80104944:	53                   	push   %ebx
80104945:	83 ec 10             	sub    $0x10,%esp
80104948:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010494b:	e8 40 ee ff ff       	call   80103790 <myproc>
80104950:	89 c6                	mov    %eax,%esi
80104952:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104955:	83 ec 08             	sub    $0x8,%esp
80104958:	50                   	push   %eax
80104959:	ff 75 08             	pushl  0x8(%ebp)
8010495c:	e8 8f ff ff ff       	call   801048f0 <argint>
80104961:	c1 e8 1f             	shr    $0x1f,%eax
80104964:	83 c4 10             	add    $0x10,%esp
80104967:	84 c0                	test   %al,%al
80104969:	75 2d                	jne    80104998 <argptr+0x58>
8010496b:	89 d8                	mov    %ebx,%eax
8010496d:	c1 e8 1f             	shr    $0x1f,%eax
80104970:	84 c0                	test   %al,%al
80104972:	75 24                	jne    80104998 <argptr+0x58>
80104974:	8b 16                	mov    (%esi),%edx
80104976:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104979:	39 c2                	cmp    %eax,%edx
8010497b:	76 1b                	jbe    80104998 <argptr+0x58>
8010497d:	01 c3                	add    %eax,%ebx
8010497f:	39 da                	cmp    %ebx,%edx
80104981:	72 15                	jb     80104998 <argptr+0x58>
80104983:	8b 55 0c             	mov    0xc(%ebp),%edx
80104986:	89 02                	mov    %eax,(%edx)
80104988:	31 c0                	xor    %eax,%eax
8010498a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010498d:	5b                   	pop    %ebx
8010498e:	5e                   	pop    %esi
8010498f:	5d                   	pop    %ebp
80104990:	c3                   	ret    
80104991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104998:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010499d:	eb eb                	jmp    8010498a <argptr+0x4a>
8010499f:	90                   	nop

801049a0 <argstr>:
801049a0:	55                   	push   %ebp
801049a1:	89 e5                	mov    %esp,%ebp
801049a3:	83 ec 20             	sub    $0x20,%esp
801049a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801049a9:	50                   	push   %eax
801049aa:	ff 75 08             	pushl  0x8(%ebp)
801049ad:	e8 3e ff ff ff       	call   801048f0 <argint>
801049b2:	83 c4 10             	add    $0x10,%esp
801049b5:	85 c0                	test   %eax,%eax
801049b7:	78 17                	js     801049d0 <argstr+0x30>
801049b9:	83 ec 08             	sub    $0x8,%esp
801049bc:	ff 75 0c             	pushl  0xc(%ebp)
801049bf:	ff 75 f4             	pushl  -0xc(%ebp)
801049c2:	e8 c9 fe ff ff       	call   80104890 <fetchstr>
801049c7:	83 c4 10             	add    $0x10,%esp
801049ca:	c9                   	leave  
801049cb:	c3                   	ret    
801049cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801049d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049d5:	c9                   	leave  
801049d6:	c3                   	ret    
801049d7:	89 f6                	mov    %esi,%esi
801049d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801049e0 <syscall>:
801049e0:	55                   	push   %ebp
801049e1:	89 e5                	mov    %esp,%ebp
801049e3:	53                   	push   %ebx
801049e4:	83 ec 04             	sub    $0x4,%esp
801049e7:	a1 1c a6 10 80       	mov    0x8010a61c,%eax
801049ec:	85 c0                	test   %eax,%eax
801049ee:	75 27                	jne    80104a17 <syscall+0x37>
801049f0:	b8 40 b6 10 80       	mov    $0x8010b640,%eax
801049f5:	ba a0 b6 10 80       	mov    $0x8010b6a0,%edx
801049fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a00:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104a06:	83 c0 04             	add    $0x4,%eax
80104a09:	39 c2                	cmp    %eax,%edx
80104a0b:	75 f3                	jne    80104a00 <syscall+0x20>
80104a0d:	c7 05 1c a6 10 80 01 	movl   $0x1,0x8010a61c
80104a14:	00 00 00 
80104a17:	e8 74 ed ff ff       	call   80103790 <myproc>
80104a1c:	89 c3                	mov    %eax,%ebx
80104a1e:	8b 40 18             	mov    0x18(%eax),%eax
80104a21:	8b 50 1c             	mov    0x1c(%eax),%edx
80104a24:	8d 42 ff             	lea    -0x1(%edx),%eax
80104a27:	83 04 85 40 b6 10 80 	addl   $0x1,-0x7fef49c0(,%eax,4)
80104a2e:	01 
80104a2f:	83 f8 17             	cmp    $0x17,%eax
80104a32:	77 1c                	ja     80104a50 <syscall+0x70>
80104a34:	8b 04 95 20 79 10 80 	mov    -0x7fef86e0(,%edx,4),%eax
80104a3b:	85 c0                	test   %eax,%eax
80104a3d:	74 11                	je     80104a50 <syscall+0x70>
80104a3f:	8b 5b 18             	mov    0x18(%ebx),%ebx
80104a42:	ff d0                	call   *%eax
80104a44:	89 43 1c             	mov    %eax,0x1c(%ebx)
80104a47:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a4a:	c9                   	leave  
80104a4b:	c3                   	ret    
80104a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a50:	8d 43 6c             	lea    0x6c(%ebx),%eax
80104a53:	52                   	push   %edx
80104a54:	50                   	push   %eax
80104a55:	ff 73 10             	pushl  0x10(%ebx)
80104a58:	68 99 78 10 80       	push   $0x80107899
80104a5d:	e8 fe bb ff ff       	call   80100660 <cprintf>
80104a62:	8b 43 18             	mov    0x18(%ebx),%eax
80104a65:	83 c4 10             	add    $0x10,%esp
80104a68:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80104a6f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a72:	c9                   	leave  
80104a73:	c3                   	ret    
80104a74:	66 90                	xchg   %ax,%ax
80104a76:	66 90                	xchg   %ax,%ax
80104a78:	66 90                	xchg   %ax,%ax
80104a7a:	66 90                	xchg   %ax,%ax
80104a7c:	66 90                	xchg   %ax,%ax
80104a7e:	66 90                	xchg   %ax,%ax

80104a80 <create>:
80104a80:	55                   	push   %ebp
80104a81:	89 e5                	mov    %esp,%ebp
80104a83:	57                   	push   %edi
80104a84:	56                   	push   %esi
80104a85:	53                   	push   %ebx
80104a86:	8d 75 da             	lea    -0x26(%ebp),%esi
80104a89:	83 ec 44             	sub    $0x44,%esp
80104a8c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
80104a8f:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104a92:	56                   	push   %esi
80104a93:	50                   	push   %eax
80104a94:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104a97:	89 4d bc             	mov    %ecx,-0x44(%ebp)
80104a9a:	e8 41 d4 ff ff       	call   80101ee0 <nameiparent>
80104a9f:	83 c4 10             	add    $0x10,%esp
80104aa2:	85 c0                	test   %eax,%eax
80104aa4:	0f 84 f6 00 00 00    	je     80104ba0 <create+0x120>
80104aaa:	83 ec 0c             	sub    $0xc,%esp
80104aad:	89 c7                	mov    %eax,%edi
80104aaf:	50                   	push   %eax
80104ab0:	e8 bb cb ff ff       	call   80101670 <ilock>
80104ab5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104ab8:	83 c4 0c             	add    $0xc,%esp
80104abb:	50                   	push   %eax
80104abc:	56                   	push   %esi
80104abd:	57                   	push   %edi
80104abe:	e8 dd d0 ff ff       	call   80101ba0 <dirlookup>
80104ac3:	83 c4 10             	add    $0x10,%esp
80104ac6:	85 c0                	test   %eax,%eax
80104ac8:	89 c3                	mov    %eax,%ebx
80104aca:	74 54                	je     80104b20 <create+0xa0>
80104acc:	83 ec 0c             	sub    $0xc,%esp
80104acf:	57                   	push   %edi
80104ad0:	e8 2b ce ff ff       	call   80101900 <iunlockput>
80104ad5:	89 1c 24             	mov    %ebx,(%esp)
80104ad8:	e8 93 cb ff ff       	call   80101670 <ilock>
80104add:	83 c4 10             	add    $0x10,%esp
80104ae0:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104ae5:	75 19                	jne    80104b00 <create+0x80>
80104ae7:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104aec:	89 d8                	mov    %ebx,%eax
80104aee:	75 10                	jne    80104b00 <create+0x80>
80104af0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104af3:	5b                   	pop    %ebx
80104af4:	5e                   	pop    %esi
80104af5:	5f                   	pop    %edi
80104af6:	5d                   	pop    %ebp
80104af7:	c3                   	ret    
80104af8:	90                   	nop
80104af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b00:	83 ec 0c             	sub    $0xc,%esp
80104b03:	53                   	push   %ebx
80104b04:	e8 f7 cd ff ff       	call   80101900 <iunlockput>
80104b09:	83 c4 10             	add    $0x10,%esp
80104b0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b0f:	31 c0                	xor    %eax,%eax
80104b11:	5b                   	pop    %ebx
80104b12:	5e                   	pop    %esi
80104b13:	5f                   	pop    %edi
80104b14:	5d                   	pop    %ebp
80104b15:	c3                   	ret    
80104b16:	8d 76 00             	lea    0x0(%esi),%esi
80104b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104b20:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104b24:	83 ec 08             	sub    $0x8,%esp
80104b27:	50                   	push   %eax
80104b28:	ff 37                	pushl  (%edi)
80104b2a:	e8 d1 c9 ff ff       	call   80101500 <ialloc>
80104b2f:	83 c4 10             	add    $0x10,%esp
80104b32:	85 c0                	test   %eax,%eax
80104b34:	89 c3                	mov    %eax,%ebx
80104b36:	0f 84 cc 00 00 00    	je     80104c08 <create+0x188>
80104b3c:	83 ec 0c             	sub    $0xc,%esp
80104b3f:	50                   	push   %eax
80104b40:	e8 2b cb ff ff       	call   80101670 <ilock>
80104b45:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104b49:	66 89 43 52          	mov    %ax,0x52(%ebx)
80104b4d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104b51:	66 89 43 54          	mov    %ax,0x54(%ebx)
80104b55:	b8 01 00 00 00       	mov    $0x1,%eax
80104b5a:	66 89 43 56          	mov    %ax,0x56(%ebx)
80104b5e:	89 1c 24             	mov    %ebx,(%esp)
80104b61:	e8 5a ca ff ff       	call   801015c0 <iupdate>
80104b66:	83 c4 10             	add    $0x10,%esp
80104b69:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104b6e:	74 40                	je     80104bb0 <create+0x130>
80104b70:	83 ec 04             	sub    $0x4,%esp
80104b73:	ff 73 04             	pushl  0x4(%ebx)
80104b76:	56                   	push   %esi
80104b77:	57                   	push   %edi
80104b78:	e8 83 d2 ff ff       	call   80101e00 <dirlink>
80104b7d:	83 c4 10             	add    $0x10,%esp
80104b80:	85 c0                	test   %eax,%eax
80104b82:	78 77                	js     80104bfb <create+0x17b>
80104b84:	83 ec 0c             	sub    $0xc,%esp
80104b87:	57                   	push   %edi
80104b88:	e8 73 cd ff ff       	call   80101900 <iunlockput>
80104b8d:	83 c4 10             	add    $0x10,%esp
80104b90:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b93:	89 d8                	mov    %ebx,%eax
80104b95:	5b                   	pop    %ebx
80104b96:	5e                   	pop    %esi
80104b97:	5f                   	pop    %edi
80104b98:	5d                   	pop    %ebp
80104b99:	c3                   	ret    
80104b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104ba0:	31 c0                	xor    %eax,%eax
80104ba2:	e9 49 ff ff ff       	jmp    80104af0 <create+0x70>
80104ba7:	89 f6                	mov    %esi,%esi
80104ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104bb0:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
80104bb5:	83 ec 0c             	sub    $0xc,%esp
80104bb8:	57                   	push   %edi
80104bb9:	e8 02 ca ff ff       	call   801015c0 <iupdate>
80104bbe:	83 c4 0c             	add    $0xc,%esp
80104bc1:	ff 73 04             	pushl  0x4(%ebx)
80104bc4:	68 a0 79 10 80       	push   $0x801079a0
80104bc9:	53                   	push   %ebx
80104bca:	e8 31 d2 ff ff       	call   80101e00 <dirlink>
80104bcf:	83 c4 10             	add    $0x10,%esp
80104bd2:	85 c0                	test   %eax,%eax
80104bd4:	78 18                	js     80104bee <create+0x16e>
80104bd6:	83 ec 04             	sub    $0x4,%esp
80104bd9:	ff 77 04             	pushl  0x4(%edi)
80104bdc:	68 9f 79 10 80       	push   $0x8010799f
80104be1:	53                   	push   %ebx
80104be2:	e8 19 d2 ff ff       	call   80101e00 <dirlink>
80104be7:	83 c4 10             	add    $0x10,%esp
80104bea:	85 c0                	test   %eax,%eax
80104bec:	79 82                	jns    80104b70 <create+0xf0>
80104bee:	83 ec 0c             	sub    $0xc,%esp
80104bf1:	68 93 79 10 80       	push   $0x80107993
80104bf6:	e8 75 b7 ff ff       	call   80100370 <panic>
80104bfb:	83 ec 0c             	sub    $0xc,%esp
80104bfe:	68 a2 79 10 80       	push   $0x801079a2
80104c03:	e8 68 b7 ff ff       	call   80100370 <panic>
80104c08:	83 ec 0c             	sub    $0xc,%esp
80104c0b:	68 84 79 10 80       	push   $0x80107984
80104c10:	e8 5b b7 ff ff       	call   80100370 <panic>
80104c15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c20 <argfd.constprop.0>:
80104c20:	55                   	push   %ebp
80104c21:	89 e5                	mov    %esp,%ebp
80104c23:	56                   	push   %esi
80104c24:	53                   	push   %ebx
80104c25:	89 c6                	mov    %eax,%esi
80104c27:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c2a:	89 d3                	mov    %edx,%ebx
80104c2c:	83 ec 18             	sub    $0x18,%esp
80104c2f:	50                   	push   %eax
80104c30:	6a 00                	push   $0x0
80104c32:	e8 b9 fc ff ff       	call   801048f0 <argint>
80104c37:	83 c4 10             	add    $0x10,%esp
80104c3a:	85 c0                	test   %eax,%eax
80104c3c:	78 32                	js     80104c70 <argfd.constprop.0+0x50>
80104c3e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104c42:	77 2c                	ja     80104c70 <argfd.constprop.0+0x50>
80104c44:	e8 47 eb ff ff       	call   80103790 <myproc>
80104c49:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104c4c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104c50:	85 c0                	test   %eax,%eax
80104c52:	74 1c                	je     80104c70 <argfd.constprop.0+0x50>
80104c54:	85 f6                	test   %esi,%esi
80104c56:	74 02                	je     80104c5a <argfd.constprop.0+0x3a>
80104c58:	89 16                	mov    %edx,(%esi)
80104c5a:	85 db                	test   %ebx,%ebx
80104c5c:	74 22                	je     80104c80 <argfd.constprop.0+0x60>
80104c5e:	89 03                	mov    %eax,(%ebx)
80104c60:	31 c0                	xor    %eax,%eax
80104c62:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c65:	5b                   	pop    %ebx
80104c66:	5e                   	pop    %esi
80104c67:	5d                   	pop    %ebp
80104c68:	c3                   	ret    
80104c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c70:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c73:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c78:	5b                   	pop    %ebx
80104c79:	5e                   	pop    %esi
80104c7a:	5d                   	pop    %ebp
80104c7b:	c3                   	ret    
80104c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104c80:	31 c0                	xor    %eax,%eax
80104c82:	eb de                	jmp    80104c62 <argfd.constprop.0+0x42>
80104c84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104c8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104c90 <sys_dup>:
80104c90:	55                   	push   %ebp
80104c91:	31 c0                	xor    %eax,%eax
80104c93:	89 e5                	mov    %esp,%ebp
80104c95:	56                   	push   %esi
80104c96:	53                   	push   %ebx
80104c97:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104c9a:	83 ec 10             	sub    $0x10,%esp
80104c9d:	e8 7e ff ff ff       	call   80104c20 <argfd.constprop.0>
80104ca2:	85 c0                	test   %eax,%eax
80104ca4:	78 1a                	js     80104cc0 <sys_dup+0x30>
80104ca6:	31 db                	xor    %ebx,%ebx
80104ca8:	8b 75 f4             	mov    -0xc(%ebp),%esi
80104cab:	e8 e0 ea ff ff       	call   80103790 <myproc>
80104cb0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104cb4:	85 d2                	test   %edx,%edx
80104cb6:	74 18                	je     80104cd0 <sys_dup+0x40>
80104cb8:	83 c3 01             	add    $0x1,%ebx
80104cbb:	83 fb 10             	cmp    $0x10,%ebx
80104cbe:	75 f0                	jne    80104cb0 <sys_dup+0x20>
80104cc0:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104cc3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cc8:	5b                   	pop    %ebx
80104cc9:	5e                   	pop    %esi
80104cca:	5d                   	pop    %ebp
80104ccb:	c3                   	ret    
80104ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104cd0:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
80104cd4:	83 ec 0c             	sub    $0xc,%esp
80104cd7:	ff 75 f4             	pushl  -0xc(%ebp)
80104cda:	e8 01 c1 ff ff       	call   80100de0 <filedup>
80104cdf:	83 c4 10             	add    $0x10,%esp
80104ce2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104ce5:	89 d8                	mov    %ebx,%eax
80104ce7:	5b                   	pop    %ebx
80104ce8:	5e                   	pop    %esi
80104ce9:	5d                   	pop    %ebp
80104cea:	c3                   	ret    
80104ceb:	90                   	nop
80104cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104cf0 <sys_read>:
80104cf0:	55                   	push   %ebp
80104cf1:	31 c0                	xor    %eax,%eax
80104cf3:	89 e5                	mov    %esp,%ebp
80104cf5:	83 ec 18             	sub    $0x18,%esp
80104cf8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104cfb:	e8 20 ff ff ff       	call   80104c20 <argfd.constprop.0>
80104d00:	85 c0                	test   %eax,%eax
80104d02:	78 4c                	js     80104d50 <sys_read+0x60>
80104d04:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d07:	83 ec 08             	sub    $0x8,%esp
80104d0a:	50                   	push   %eax
80104d0b:	6a 02                	push   $0x2
80104d0d:	e8 de fb ff ff       	call   801048f0 <argint>
80104d12:	83 c4 10             	add    $0x10,%esp
80104d15:	85 c0                	test   %eax,%eax
80104d17:	78 37                	js     80104d50 <sys_read+0x60>
80104d19:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d1c:	83 ec 04             	sub    $0x4,%esp
80104d1f:	ff 75 f0             	pushl  -0x10(%ebp)
80104d22:	50                   	push   %eax
80104d23:	6a 01                	push   $0x1
80104d25:	e8 16 fc ff ff       	call   80104940 <argptr>
80104d2a:	83 c4 10             	add    $0x10,%esp
80104d2d:	85 c0                	test   %eax,%eax
80104d2f:	78 1f                	js     80104d50 <sys_read+0x60>
80104d31:	83 ec 04             	sub    $0x4,%esp
80104d34:	ff 75 f0             	pushl  -0x10(%ebp)
80104d37:	ff 75 f4             	pushl  -0xc(%ebp)
80104d3a:	ff 75 ec             	pushl  -0x14(%ebp)
80104d3d:	e8 0e c2 ff ff       	call   80100f50 <fileread>
80104d42:	83 c4 10             	add    $0x10,%esp
80104d45:	c9                   	leave  
80104d46:	c3                   	ret    
80104d47:	89 f6                	mov    %esi,%esi
80104d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104d50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d55:	c9                   	leave  
80104d56:	c3                   	ret    
80104d57:	89 f6                	mov    %esi,%esi
80104d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d60 <sys_write>:
80104d60:	55                   	push   %ebp
80104d61:	31 c0                	xor    %eax,%eax
80104d63:	89 e5                	mov    %esp,%ebp
80104d65:	83 ec 18             	sub    $0x18,%esp
80104d68:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104d6b:	e8 b0 fe ff ff       	call   80104c20 <argfd.constprop.0>
80104d70:	85 c0                	test   %eax,%eax
80104d72:	78 4c                	js     80104dc0 <sys_write+0x60>
80104d74:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d77:	83 ec 08             	sub    $0x8,%esp
80104d7a:	50                   	push   %eax
80104d7b:	6a 02                	push   $0x2
80104d7d:	e8 6e fb ff ff       	call   801048f0 <argint>
80104d82:	83 c4 10             	add    $0x10,%esp
80104d85:	85 c0                	test   %eax,%eax
80104d87:	78 37                	js     80104dc0 <sys_write+0x60>
80104d89:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d8c:	83 ec 04             	sub    $0x4,%esp
80104d8f:	ff 75 f0             	pushl  -0x10(%ebp)
80104d92:	50                   	push   %eax
80104d93:	6a 01                	push   $0x1
80104d95:	e8 a6 fb ff ff       	call   80104940 <argptr>
80104d9a:	83 c4 10             	add    $0x10,%esp
80104d9d:	85 c0                	test   %eax,%eax
80104d9f:	78 1f                	js     80104dc0 <sys_write+0x60>
80104da1:	83 ec 04             	sub    $0x4,%esp
80104da4:	ff 75 f0             	pushl  -0x10(%ebp)
80104da7:	ff 75 f4             	pushl  -0xc(%ebp)
80104daa:	ff 75 ec             	pushl  -0x14(%ebp)
80104dad:	e8 2e c2 ff ff       	call   80100fe0 <filewrite>
80104db2:	83 c4 10             	add    $0x10,%esp
80104db5:	c9                   	leave  
80104db6:	c3                   	ret    
80104db7:	89 f6                	mov    %esi,%esi
80104db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104dc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104dc5:	c9                   	leave  
80104dc6:	c3                   	ret    
80104dc7:	89 f6                	mov    %esi,%esi
80104dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104dd0 <sys_close>:
80104dd0:	55                   	push   %ebp
80104dd1:	89 e5                	mov    %esp,%ebp
80104dd3:	83 ec 18             	sub    $0x18,%esp
80104dd6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104dd9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104ddc:	e8 3f fe ff ff       	call   80104c20 <argfd.constprop.0>
80104de1:	85 c0                	test   %eax,%eax
80104de3:	78 2b                	js     80104e10 <sys_close+0x40>
80104de5:	e8 a6 e9 ff ff       	call   80103790 <myproc>
80104dea:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104ded:	83 ec 0c             	sub    $0xc,%esp
80104df0:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104df7:	00 
80104df8:	ff 75 f4             	pushl  -0xc(%ebp)
80104dfb:	e8 30 c0 ff ff       	call   80100e30 <fileclose>
80104e00:	83 c4 10             	add    $0x10,%esp
80104e03:	31 c0                	xor    %eax,%eax
80104e05:	c9                   	leave  
80104e06:	c3                   	ret    
80104e07:	89 f6                	mov    %esi,%esi
80104e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104e10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e15:	c9                   	leave  
80104e16:	c3                   	ret    
80104e17:	89 f6                	mov    %esi,%esi
80104e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e20 <sys_fstat>:
80104e20:	55                   	push   %ebp
80104e21:	31 c0                	xor    %eax,%eax
80104e23:	89 e5                	mov    %esp,%ebp
80104e25:	83 ec 18             	sub    $0x18,%esp
80104e28:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104e2b:	e8 f0 fd ff ff       	call   80104c20 <argfd.constprop.0>
80104e30:	85 c0                	test   %eax,%eax
80104e32:	78 2c                	js     80104e60 <sys_fstat+0x40>
80104e34:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e37:	83 ec 04             	sub    $0x4,%esp
80104e3a:	6a 14                	push   $0x14
80104e3c:	50                   	push   %eax
80104e3d:	6a 01                	push   $0x1
80104e3f:	e8 fc fa ff ff       	call   80104940 <argptr>
80104e44:	83 c4 10             	add    $0x10,%esp
80104e47:	85 c0                	test   %eax,%eax
80104e49:	78 15                	js     80104e60 <sys_fstat+0x40>
80104e4b:	83 ec 08             	sub    $0x8,%esp
80104e4e:	ff 75 f4             	pushl  -0xc(%ebp)
80104e51:	ff 75 f0             	pushl  -0x10(%ebp)
80104e54:	e8 a7 c0 ff ff       	call   80100f00 <filestat>
80104e59:	83 c4 10             	add    $0x10,%esp
80104e5c:	c9                   	leave  
80104e5d:	c3                   	ret    
80104e5e:	66 90                	xchg   %ax,%ax
80104e60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e65:	c9                   	leave  
80104e66:	c3                   	ret    
80104e67:	89 f6                	mov    %esi,%esi
80104e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e70 <sys_link>:
80104e70:	55                   	push   %ebp
80104e71:	89 e5                	mov    %esp,%ebp
80104e73:	57                   	push   %edi
80104e74:	56                   	push   %esi
80104e75:	53                   	push   %ebx
80104e76:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104e79:	83 ec 34             	sub    $0x34,%esp
80104e7c:	50                   	push   %eax
80104e7d:	6a 00                	push   $0x0
80104e7f:	e8 1c fb ff ff       	call   801049a0 <argstr>
80104e84:	83 c4 10             	add    $0x10,%esp
80104e87:	85 c0                	test   %eax,%eax
80104e89:	0f 88 fb 00 00 00    	js     80104f8a <sys_link+0x11a>
80104e8f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104e92:	83 ec 08             	sub    $0x8,%esp
80104e95:	50                   	push   %eax
80104e96:	6a 01                	push   $0x1
80104e98:	e8 03 fb ff ff       	call   801049a0 <argstr>
80104e9d:	83 c4 10             	add    $0x10,%esp
80104ea0:	85 c0                	test   %eax,%eax
80104ea2:	0f 88 e2 00 00 00    	js     80104f8a <sys_link+0x11a>
80104ea8:	e8 a3 dc ff ff       	call   80102b50 <begin_op>
80104ead:	83 ec 0c             	sub    $0xc,%esp
80104eb0:	ff 75 d4             	pushl  -0x2c(%ebp)
80104eb3:	e8 08 d0 ff ff       	call   80101ec0 <namei>
80104eb8:	83 c4 10             	add    $0x10,%esp
80104ebb:	85 c0                	test   %eax,%eax
80104ebd:	89 c3                	mov    %eax,%ebx
80104ebf:	0f 84 f3 00 00 00    	je     80104fb8 <sys_link+0x148>
80104ec5:	83 ec 0c             	sub    $0xc,%esp
80104ec8:	50                   	push   %eax
80104ec9:	e8 a2 c7 ff ff       	call   80101670 <ilock>
80104ece:	83 c4 10             	add    $0x10,%esp
80104ed1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104ed6:	0f 84 c4 00 00 00    	je     80104fa0 <sys_link+0x130>
80104edc:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104ee1:	83 ec 0c             	sub    $0xc,%esp
80104ee4:	8d 7d da             	lea    -0x26(%ebp),%edi
80104ee7:	53                   	push   %ebx
80104ee8:	e8 d3 c6 ff ff       	call   801015c0 <iupdate>
80104eed:	89 1c 24             	mov    %ebx,(%esp)
80104ef0:	e8 5b c8 ff ff       	call   80101750 <iunlock>
80104ef5:	58                   	pop    %eax
80104ef6:	5a                   	pop    %edx
80104ef7:	57                   	push   %edi
80104ef8:	ff 75 d0             	pushl  -0x30(%ebp)
80104efb:	e8 e0 cf ff ff       	call   80101ee0 <nameiparent>
80104f00:	83 c4 10             	add    $0x10,%esp
80104f03:	85 c0                	test   %eax,%eax
80104f05:	89 c6                	mov    %eax,%esi
80104f07:	74 5b                	je     80104f64 <sys_link+0xf4>
80104f09:	83 ec 0c             	sub    $0xc,%esp
80104f0c:	50                   	push   %eax
80104f0d:	e8 5e c7 ff ff       	call   80101670 <ilock>
80104f12:	83 c4 10             	add    $0x10,%esp
80104f15:	8b 03                	mov    (%ebx),%eax
80104f17:	39 06                	cmp    %eax,(%esi)
80104f19:	75 3d                	jne    80104f58 <sys_link+0xe8>
80104f1b:	83 ec 04             	sub    $0x4,%esp
80104f1e:	ff 73 04             	pushl  0x4(%ebx)
80104f21:	57                   	push   %edi
80104f22:	56                   	push   %esi
80104f23:	e8 d8 ce ff ff       	call   80101e00 <dirlink>
80104f28:	83 c4 10             	add    $0x10,%esp
80104f2b:	85 c0                	test   %eax,%eax
80104f2d:	78 29                	js     80104f58 <sys_link+0xe8>
80104f2f:	83 ec 0c             	sub    $0xc,%esp
80104f32:	56                   	push   %esi
80104f33:	e8 c8 c9 ff ff       	call   80101900 <iunlockput>
80104f38:	89 1c 24             	mov    %ebx,(%esp)
80104f3b:	e8 60 c8 ff ff       	call   801017a0 <iput>
80104f40:	e8 7b dc ff ff       	call   80102bc0 <end_op>
80104f45:	83 c4 10             	add    $0x10,%esp
80104f48:	31 c0                	xor    %eax,%eax
80104f4a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f4d:	5b                   	pop    %ebx
80104f4e:	5e                   	pop    %esi
80104f4f:	5f                   	pop    %edi
80104f50:	5d                   	pop    %ebp
80104f51:	c3                   	ret    
80104f52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104f58:	83 ec 0c             	sub    $0xc,%esp
80104f5b:	56                   	push   %esi
80104f5c:	e8 9f c9 ff ff       	call   80101900 <iunlockput>
80104f61:	83 c4 10             	add    $0x10,%esp
80104f64:	83 ec 0c             	sub    $0xc,%esp
80104f67:	53                   	push   %ebx
80104f68:	e8 03 c7 ff ff       	call   80101670 <ilock>
80104f6d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104f72:	89 1c 24             	mov    %ebx,(%esp)
80104f75:	e8 46 c6 ff ff       	call   801015c0 <iupdate>
80104f7a:	89 1c 24             	mov    %ebx,(%esp)
80104f7d:	e8 7e c9 ff ff       	call   80101900 <iunlockput>
80104f82:	e8 39 dc ff ff       	call   80102bc0 <end_op>
80104f87:	83 c4 10             	add    $0x10,%esp
80104f8a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f8d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f92:	5b                   	pop    %ebx
80104f93:	5e                   	pop    %esi
80104f94:	5f                   	pop    %edi
80104f95:	5d                   	pop    %ebp
80104f96:	c3                   	ret    
80104f97:	89 f6                	mov    %esi,%esi
80104f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104fa0:	83 ec 0c             	sub    $0xc,%esp
80104fa3:	53                   	push   %ebx
80104fa4:	e8 57 c9 ff ff       	call   80101900 <iunlockput>
80104fa9:	e8 12 dc ff ff       	call   80102bc0 <end_op>
80104fae:	83 c4 10             	add    $0x10,%esp
80104fb1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fb6:	eb 92                	jmp    80104f4a <sys_link+0xda>
80104fb8:	e8 03 dc ff ff       	call   80102bc0 <end_op>
80104fbd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fc2:	eb 86                	jmp    80104f4a <sys_link+0xda>
80104fc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104fca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104fd0 <sys_unlink>:
80104fd0:	55                   	push   %ebp
80104fd1:	89 e5                	mov    %esp,%ebp
80104fd3:	57                   	push   %edi
80104fd4:	56                   	push   %esi
80104fd5:	53                   	push   %ebx
80104fd6:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104fd9:	83 ec 54             	sub    $0x54,%esp
80104fdc:	50                   	push   %eax
80104fdd:	6a 00                	push   $0x0
80104fdf:	e8 bc f9 ff ff       	call   801049a0 <argstr>
80104fe4:	83 c4 10             	add    $0x10,%esp
80104fe7:	85 c0                	test   %eax,%eax
80104fe9:	0f 88 82 01 00 00    	js     80105171 <sys_unlink+0x1a1>
80104fef:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104ff2:	e8 59 db ff ff       	call   80102b50 <begin_op>
80104ff7:	83 ec 08             	sub    $0x8,%esp
80104ffa:	53                   	push   %ebx
80104ffb:	ff 75 c0             	pushl  -0x40(%ebp)
80104ffe:	e8 dd ce ff ff       	call   80101ee0 <nameiparent>
80105003:	83 c4 10             	add    $0x10,%esp
80105006:	85 c0                	test   %eax,%eax
80105008:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010500b:	0f 84 6a 01 00 00    	je     8010517b <sys_unlink+0x1ab>
80105011:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80105014:	83 ec 0c             	sub    $0xc,%esp
80105017:	56                   	push   %esi
80105018:	e8 53 c6 ff ff       	call   80101670 <ilock>
8010501d:	58                   	pop    %eax
8010501e:	5a                   	pop    %edx
8010501f:	68 a0 79 10 80       	push   $0x801079a0
80105024:	53                   	push   %ebx
80105025:	e8 56 cb ff ff       	call   80101b80 <namecmp>
8010502a:	83 c4 10             	add    $0x10,%esp
8010502d:	85 c0                	test   %eax,%eax
8010502f:	0f 84 fc 00 00 00    	je     80105131 <sys_unlink+0x161>
80105035:	83 ec 08             	sub    $0x8,%esp
80105038:	68 9f 79 10 80       	push   $0x8010799f
8010503d:	53                   	push   %ebx
8010503e:	e8 3d cb ff ff       	call   80101b80 <namecmp>
80105043:	83 c4 10             	add    $0x10,%esp
80105046:	85 c0                	test   %eax,%eax
80105048:	0f 84 e3 00 00 00    	je     80105131 <sys_unlink+0x161>
8010504e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80105051:	83 ec 04             	sub    $0x4,%esp
80105054:	50                   	push   %eax
80105055:	53                   	push   %ebx
80105056:	56                   	push   %esi
80105057:	e8 44 cb ff ff       	call   80101ba0 <dirlookup>
8010505c:	83 c4 10             	add    $0x10,%esp
8010505f:	85 c0                	test   %eax,%eax
80105061:	89 c3                	mov    %eax,%ebx
80105063:	0f 84 c8 00 00 00    	je     80105131 <sys_unlink+0x161>
80105069:	83 ec 0c             	sub    $0xc,%esp
8010506c:	50                   	push   %eax
8010506d:	e8 fe c5 ff ff       	call   80101670 <ilock>
80105072:	83 c4 10             	add    $0x10,%esp
80105075:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010507a:	0f 8e 24 01 00 00    	jle    801051a4 <sys_unlink+0x1d4>
80105080:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105085:	8d 75 d8             	lea    -0x28(%ebp),%esi
80105088:	74 66                	je     801050f0 <sys_unlink+0x120>
8010508a:	83 ec 04             	sub    $0x4,%esp
8010508d:	6a 10                	push   $0x10
8010508f:	6a 00                	push   $0x0
80105091:	56                   	push   %esi
80105092:	e8 49 f5 ff ff       	call   801045e0 <memset>
80105097:	6a 10                	push   $0x10
80105099:	ff 75 c4             	pushl  -0x3c(%ebp)
8010509c:	56                   	push   %esi
8010509d:	ff 75 b4             	pushl  -0x4c(%ebp)
801050a0:	e8 ab c9 ff ff       	call   80101a50 <writei>
801050a5:	83 c4 20             	add    $0x20,%esp
801050a8:	83 f8 10             	cmp    $0x10,%eax
801050ab:	0f 85 e6 00 00 00    	jne    80105197 <sys_unlink+0x1c7>
801050b1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801050b6:	0f 84 9c 00 00 00    	je     80105158 <sys_unlink+0x188>
801050bc:	83 ec 0c             	sub    $0xc,%esp
801050bf:	ff 75 b4             	pushl  -0x4c(%ebp)
801050c2:	e8 39 c8 ff ff       	call   80101900 <iunlockput>
801050c7:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
801050cc:	89 1c 24             	mov    %ebx,(%esp)
801050cf:	e8 ec c4 ff ff       	call   801015c0 <iupdate>
801050d4:	89 1c 24             	mov    %ebx,(%esp)
801050d7:	e8 24 c8 ff ff       	call   80101900 <iunlockput>
801050dc:	e8 df da ff ff       	call   80102bc0 <end_op>
801050e1:	83 c4 10             	add    $0x10,%esp
801050e4:	31 c0                	xor    %eax,%eax
801050e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801050e9:	5b                   	pop    %ebx
801050ea:	5e                   	pop    %esi
801050eb:	5f                   	pop    %edi
801050ec:	5d                   	pop    %ebp
801050ed:	c3                   	ret    
801050ee:	66 90                	xchg   %ax,%ax
801050f0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
801050f4:	76 94                	jbe    8010508a <sys_unlink+0xba>
801050f6:	bf 20 00 00 00       	mov    $0x20,%edi
801050fb:	eb 0f                	jmp    8010510c <sys_unlink+0x13c>
801050fd:	8d 76 00             	lea    0x0(%esi),%esi
80105100:	83 c7 10             	add    $0x10,%edi
80105103:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105106:	0f 83 7e ff ff ff    	jae    8010508a <sys_unlink+0xba>
8010510c:	6a 10                	push   $0x10
8010510e:	57                   	push   %edi
8010510f:	56                   	push   %esi
80105110:	53                   	push   %ebx
80105111:	e8 3a c8 ff ff       	call   80101950 <readi>
80105116:	83 c4 10             	add    $0x10,%esp
80105119:	83 f8 10             	cmp    $0x10,%eax
8010511c:	75 6c                	jne    8010518a <sys_unlink+0x1ba>
8010511e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105123:	74 db                	je     80105100 <sys_unlink+0x130>
80105125:	83 ec 0c             	sub    $0xc,%esp
80105128:	53                   	push   %ebx
80105129:	e8 d2 c7 ff ff       	call   80101900 <iunlockput>
8010512e:	83 c4 10             	add    $0x10,%esp
80105131:	83 ec 0c             	sub    $0xc,%esp
80105134:	ff 75 b4             	pushl  -0x4c(%ebp)
80105137:	e8 c4 c7 ff ff       	call   80101900 <iunlockput>
8010513c:	e8 7f da ff ff       	call   80102bc0 <end_op>
80105141:	83 c4 10             	add    $0x10,%esp
80105144:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105147:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010514c:	5b                   	pop    %ebx
8010514d:	5e                   	pop    %esi
8010514e:	5f                   	pop    %edi
8010514f:	5d                   	pop    %ebp
80105150:	c3                   	ret    
80105151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105158:	8b 45 b4             	mov    -0x4c(%ebp),%eax
8010515b:	83 ec 0c             	sub    $0xc,%esp
8010515e:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
80105163:	50                   	push   %eax
80105164:	e8 57 c4 ff ff       	call   801015c0 <iupdate>
80105169:	83 c4 10             	add    $0x10,%esp
8010516c:	e9 4b ff ff ff       	jmp    801050bc <sys_unlink+0xec>
80105171:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105176:	e9 6b ff ff ff       	jmp    801050e6 <sys_unlink+0x116>
8010517b:	e8 40 da ff ff       	call   80102bc0 <end_op>
80105180:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105185:	e9 5c ff ff ff       	jmp    801050e6 <sys_unlink+0x116>
8010518a:	83 ec 0c             	sub    $0xc,%esp
8010518d:	68 c4 79 10 80       	push   $0x801079c4
80105192:	e8 d9 b1 ff ff       	call   80100370 <panic>
80105197:	83 ec 0c             	sub    $0xc,%esp
8010519a:	68 d6 79 10 80       	push   $0x801079d6
8010519f:	e8 cc b1 ff ff       	call   80100370 <panic>
801051a4:	83 ec 0c             	sub    $0xc,%esp
801051a7:	68 b2 79 10 80       	push   $0x801079b2
801051ac:	e8 bf b1 ff ff       	call   80100370 <panic>
801051b1:	eb 0d                	jmp    801051c0 <sys_open>
801051b3:	90                   	nop
801051b4:	90                   	nop
801051b5:	90                   	nop
801051b6:	90                   	nop
801051b7:	90                   	nop
801051b8:	90                   	nop
801051b9:	90                   	nop
801051ba:	90                   	nop
801051bb:	90                   	nop
801051bc:	90                   	nop
801051bd:	90                   	nop
801051be:	90                   	nop
801051bf:	90                   	nop

801051c0 <sys_open>:
801051c0:	55                   	push   %ebp
801051c1:	89 e5                	mov    %esp,%ebp
801051c3:	57                   	push   %edi
801051c4:	56                   	push   %esi
801051c5:	53                   	push   %ebx
801051c6:	8d 45 e0             	lea    -0x20(%ebp),%eax
801051c9:	83 ec 24             	sub    $0x24,%esp
801051cc:	50                   	push   %eax
801051cd:	6a 00                	push   $0x0
801051cf:	e8 cc f7 ff ff       	call   801049a0 <argstr>
801051d4:	83 c4 10             	add    $0x10,%esp
801051d7:	85 c0                	test   %eax,%eax
801051d9:	0f 88 9e 00 00 00    	js     8010527d <sys_open+0xbd>
801051df:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801051e2:	83 ec 08             	sub    $0x8,%esp
801051e5:	50                   	push   %eax
801051e6:	6a 01                	push   $0x1
801051e8:	e8 03 f7 ff ff       	call   801048f0 <argint>
801051ed:	83 c4 10             	add    $0x10,%esp
801051f0:	85 c0                	test   %eax,%eax
801051f2:	0f 88 85 00 00 00    	js     8010527d <sys_open+0xbd>
801051f8:	e8 53 d9 ff ff       	call   80102b50 <begin_op>
801051fd:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105201:	0f 85 89 00 00 00    	jne    80105290 <sys_open+0xd0>
80105207:	83 ec 0c             	sub    $0xc,%esp
8010520a:	ff 75 e0             	pushl  -0x20(%ebp)
8010520d:	e8 ae cc ff ff       	call   80101ec0 <namei>
80105212:	83 c4 10             	add    $0x10,%esp
80105215:	85 c0                	test   %eax,%eax
80105217:	89 c6                	mov    %eax,%esi
80105219:	0f 84 8e 00 00 00    	je     801052ad <sys_open+0xed>
8010521f:	83 ec 0c             	sub    $0xc,%esp
80105222:	50                   	push   %eax
80105223:	e8 48 c4 ff ff       	call   80101670 <ilock>
80105228:	83 c4 10             	add    $0x10,%esp
8010522b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105230:	0f 84 d2 00 00 00    	je     80105308 <sys_open+0x148>
80105236:	e8 35 bb ff ff       	call   80100d70 <filealloc>
8010523b:	85 c0                	test   %eax,%eax
8010523d:	89 c7                	mov    %eax,%edi
8010523f:	74 2b                	je     8010526c <sys_open+0xac>
80105241:	31 db                	xor    %ebx,%ebx
80105243:	e8 48 e5 ff ff       	call   80103790 <myproc>
80105248:	90                   	nop
80105249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105250:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105254:	85 d2                	test   %edx,%edx
80105256:	74 68                	je     801052c0 <sys_open+0x100>
80105258:	83 c3 01             	add    $0x1,%ebx
8010525b:	83 fb 10             	cmp    $0x10,%ebx
8010525e:	75 f0                	jne    80105250 <sys_open+0x90>
80105260:	83 ec 0c             	sub    $0xc,%esp
80105263:	57                   	push   %edi
80105264:	e8 c7 bb ff ff       	call   80100e30 <fileclose>
80105269:	83 c4 10             	add    $0x10,%esp
8010526c:	83 ec 0c             	sub    $0xc,%esp
8010526f:	56                   	push   %esi
80105270:	e8 8b c6 ff ff       	call   80101900 <iunlockput>
80105275:	e8 46 d9 ff ff       	call   80102bc0 <end_op>
8010527a:	83 c4 10             	add    $0x10,%esp
8010527d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105280:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105285:	5b                   	pop    %ebx
80105286:	5e                   	pop    %esi
80105287:	5f                   	pop    %edi
80105288:	5d                   	pop    %ebp
80105289:	c3                   	ret    
8010528a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105290:	83 ec 0c             	sub    $0xc,%esp
80105293:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105296:	31 c9                	xor    %ecx,%ecx
80105298:	6a 00                	push   $0x0
8010529a:	ba 02 00 00 00       	mov    $0x2,%edx
8010529f:	e8 dc f7 ff ff       	call   80104a80 <create>
801052a4:	83 c4 10             	add    $0x10,%esp
801052a7:	85 c0                	test   %eax,%eax
801052a9:	89 c6                	mov    %eax,%esi
801052ab:	75 89                	jne    80105236 <sys_open+0x76>
801052ad:	e8 0e d9 ff ff       	call   80102bc0 <end_op>
801052b2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052b7:	eb 43                	jmp    801052fc <sys_open+0x13c>
801052b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801052c0:	83 ec 0c             	sub    $0xc,%esp
801052c3:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
801052c7:	56                   	push   %esi
801052c8:	e8 83 c4 ff ff       	call   80101750 <iunlock>
801052cd:	e8 ee d8 ff ff       	call   80102bc0 <end_op>
801052d2:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
801052d8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801052db:	83 c4 10             	add    $0x10,%esp
801052de:	89 77 10             	mov    %esi,0x10(%edi)
801052e1:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
801052e8:	89 d0                	mov    %edx,%eax
801052ea:	83 e0 01             	and    $0x1,%eax
801052ed:	83 f0 01             	xor    $0x1,%eax
801052f0:	83 e2 03             	and    $0x3,%edx
801052f3:	88 47 08             	mov    %al,0x8(%edi)
801052f6:	0f 95 47 09          	setne  0x9(%edi)
801052fa:	89 d8                	mov    %ebx,%eax
801052fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801052ff:	5b                   	pop    %ebx
80105300:	5e                   	pop    %esi
80105301:	5f                   	pop    %edi
80105302:	5d                   	pop    %ebp
80105303:	c3                   	ret    
80105304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105308:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010530b:	85 c9                	test   %ecx,%ecx
8010530d:	0f 84 23 ff ff ff    	je     80105236 <sys_open+0x76>
80105313:	e9 54 ff ff ff       	jmp    8010526c <sys_open+0xac>
80105318:	90                   	nop
80105319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105320 <sys_mkdir>:
80105320:	55                   	push   %ebp
80105321:	89 e5                	mov    %esp,%ebp
80105323:	83 ec 18             	sub    $0x18,%esp
80105326:	e8 25 d8 ff ff       	call   80102b50 <begin_op>
8010532b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010532e:	83 ec 08             	sub    $0x8,%esp
80105331:	50                   	push   %eax
80105332:	6a 00                	push   $0x0
80105334:	e8 67 f6 ff ff       	call   801049a0 <argstr>
80105339:	83 c4 10             	add    $0x10,%esp
8010533c:	85 c0                	test   %eax,%eax
8010533e:	78 30                	js     80105370 <sys_mkdir+0x50>
80105340:	83 ec 0c             	sub    $0xc,%esp
80105343:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105346:	31 c9                	xor    %ecx,%ecx
80105348:	6a 00                	push   $0x0
8010534a:	ba 01 00 00 00       	mov    $0x1,%edx
8010534f:	e8 2c f7 ff ff       	call   80104a80 <create>
80105354:	83 c4 10             	add    $0x10,%esp
80105357:	85 c0                	test   %eax,%eax
80105359:	74 15                	je     80105370 <sys_mkdir+0x50>
8010535b:	83 ec 0c             	sub    $0xc,%esp
8010535e:	50                   	push   %eax
8010535f:	e8 9c c5 ff ff       	call   80101900 <iunlockput>
80105364:	e8 57 d8 ff ff       	call   80102bc0 <end_op>
80105369:	83 c4 10             	add    $0x10,%esp
8010536c:	31 c0                	xor    %eax,%eax
8010536e:	c9                   	leave  
8010536f:	c3                   	ret    
80105370:	e8 4b d8 ff ff       	call   80102bc0 <end_op>
80105375:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010537a:	c9                   	leave  
8010537b:	c3                   	ret    
8010537c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105380 <sys_mknod>:
80105380:	55                   	push   %ebp
80105381:	89 e5                	mov    %esp,%ebp
80105383:	83 ec 18             	sub    $0x18,%esp
80105386:	e8 c5 d7 ff ff       	call   80102b50 <begin_op>
8010538b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010538e:	83 ec 08             	sub    $0x8,%esp
80105391:	50                   	push   %eax
80105392:	6a 00                	push   $0x0
80105394:	e8 07 f6 ff ff       	call   801049a0 <argstr>
80105399:	83 c4 10             	add    $0x10,%esp
8010539c:	85 c0                	test   %eax,%eax
8010539e:	78 60                	js     80105400 <sys_mknod+0x80>
801053a0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801053a3:	83 ec 08             	sub    $0x8,%esp
801053a6:	50                   	push   %eax
801053a7:	6a 01                	push   $0x1
801053a9:	e8 42 f5 ff ff       	call   801048f0 <argint>
801053ae:	83 c4 10             	add    $0x10,%esp
801053b1:	85 c0                	test   %eax,%eax
801053b3:	78 4b                	js     80105400 <sys_mknod+0x80>
801053b5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053b8:	83 ec 08             	sub    $0x8,%esp
801053bb:	50                   	push   %eax
801053bc:	6a 02                	push   $0x2
801053be:	e8 2d f5 ff ff       	call   801048f0 <argint>
801053c3:	83 c4 10             	add    $0x10,%esp
801053c6:	85 c0                	test   %eax,%eax
801053c8:	78 36                	js     80105400 <sys_mknod+0x80>
801053ca:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801053ce:	83 ec 0c             	sub    $0xc,%esp
801053d1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801053d5:	ba 03 00 00 00       	mov    $0x3,%edx
801053da:	50                   	push   %eax
801053db:	8b 45 ec             	mov    -0x14(%ebp),%eax
801053de:	e8 9d f6 ff ff       	call   80104a80 <create>
801053e3:	83 c4 10             	add    $0x10,%esp
801053e6:	85 c0                	test   %eax,%eax
801053e8:	74 16                	je     80105400 <sys_mknod+0x80>
801053ea:	83 ec 0c             	sub    $0xc,%esp
801053ed:	50                   	push   %eax
801053ee:	e8 0d c5 ff ff       	call   80101900 <iunlockput>
801053f3:	e8 c8 d7 ff ff       	call   80102bc0 <end_op>
801053f8:	83 c4 10             	add    $0x10,%esp
801053fb:	31 c0                	xor    %eax,%eax
801053fd:	c9                   	leave  
801053fe:	c3                   	ret    
801053ff:	90                   	nop
80105400:	e8 bb d7 ff ff       	call   80102bc0 <end_op>
80105405:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010540a:	c9                   	leave  
8010540b:	c3                   	ret    
8010540c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105410 <sys_chdir>:
80105410:	55                   	push   %ebp
80105411:	89 e5                	mov    %esp,%ebp
80105413:	56                   	push   %esi
80105414:	53                   	push   %ebx
80105415:	83 ec 10             	sub    $0x10,%esp
80105418:	e8 73 e3 ff ff       	call   80103790 <myproc>
8010541d:	89 c6                	mov    %eax,%esi
8010541f:	e8 2c d7 ff ff       	call   80102b50 <begin_op>
80105424:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105427:	83 ec 08             	sub    $0x8,%esp
8010542a:	50                   	push   %eax
8010542b:	6a 00                	push   $0x0
8010542d:	e8 6e f5 ff ff       	call   801049a0 <argstr>
80105432:	83 c4 10             	add    $0x10,%esp
80105435:	85 c0                	test   %eax,%eax
80105437:	78 77                	js     801054b0 <sys_chdir+0xa0>
80105439:	83 ec 0c             	sub    $0xc,%esp
8010543c:	ff 75 f4             	pushl  -0xc(%ebp)
8010543f:	e8 7c ca ff ff       	call   80101ec0 <namei>
80105444:	83 c4 10             	add    $0x10,%esp
80105447:	85 c0                	test   %eax,%eax
80105449:	89 c3                	mov    %eax,%ebx
8010544b:	74 63                	je     801054b0 <sys_chdir+0xa0>
8010544d:	83 ec 0c             	sub    $0xc,%esp
80105450:	50                   	push   %eax
80105451:	e8 1a c2 ff ff       	call   80101670 <ilock>
80105456:	83 c4 10             	add    $0x10,%esp
80105459:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010545e:	75 30                	jne    80105490 <sys_chdir+0x80>
80105460:	83 ec 0c             	sub    $0xc,%esp
80105463:	53                   	push   %ebx
80105464:	e8 e7 c2 ff ff       	call   80101750 <iunlock>
80105469:	58                   	pop    %eax
8010546a:	ff 76 68             	pushl  0x68(%esi)
8010546d:	e8 2e c3 ff ff       	call   801017a0 <iput>
80105472:	e8 49 d7 ff ff       	call   80102bc0 <end_op>
80105477:	89 5e 68             	mov    %ebx,0x68(%esi)
8010547a:	83 c4 10             	add    $0x10,%esp
8010547d:	31 c0                	xor    %eax,%eax
8010547f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105482:	5b                   	pop    %ebx
80105483:	5e                   	pop    %esi
80105484:	5d                   	pop    %ebp
80105485:	c3                   	ret    
80105486:	8d 76 00             	lea    0x0(%esi),%esi
80105489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105490:	83 ec 0c             	sub    $0xc,%esp
80105493:	53                   	push   %ebx
80105494:	e8 67 c4 ff ff       	call   80101900 <iunlockput>
80105499:	e8 22 d7 ff ff       	call   80102bc0 <end_op>
8010549e:	83 c4 10             	add    $0x10,%esp
801054a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054a6:	eb d7                	jmp    8010547f <sys_chdir+0x6f>
801054a8:	90                   	nop
801054a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801054b0:	e8 0b d7 ff ff       	call   80102bc0 <end_op>
801054b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054ba:	eb c3                	jmp    8010547f <sys_chdir+0x6f>
801054bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054c0 <sys_exec>:
801054c0:	55                   	push   %ebp
801054c1:	89 e5                	mov    %esp,%ebp
801054c3:	57                   	push   %edi
801054c4:	56                   	push   %esi
801054c5:	53                   	push   %ebx
801054c6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
801054cc:	81 ec a4 00 00 00    	sub    $0xa4,%esp
801054d2:	50                   	push   %eax
801054d3:	6a 00                	push   $0x0
801054d5:	e8 c6 f4 ff ff       	call   801049a0 <argstr>
801054da:	83 c4 10             	add    $0x10,%esp
801054dd:	85 c0                	test   %eax,%eax
801054df:	78 7f                	js     80105560 <sys_exec+0xa0>
801054e1:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801054e7:	83 ec 08             	sub    $0x8,%esp
801054ea:	50                   	push   %eax
801054eb:	6a 01                	push   $0x1
801054ed:	e8 fe f3 ff ff       	call   801048f0 <argint>
801054f2:	83 c4 10             	add    $0x10,%esp
801054f5:	85 c0                	test   %eax,%eax
801054f7:	78 67                	js     80105560 <sys_exec+0xa0>
801054f9:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801054ff:	83 ec 04             	sub    $0x4,%esp
80105502:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105508:	68 80 00 00 00       	push   $0x80
8010550d:	6a 00                	push   $0x0
8010550f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105515:	50                   	push   %eax
80105516:	31 db                	xor    %ebx,%ebx
80105518:	e8 c3 f0 ff ff       	call   801045e0 <memset>
8010551d:	83 c4 10             	add    $0x10,%esp
80105520:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105526:	83 ec 08             	sub    $0x8,%esp
80105529:	57                   	push   %edi
8010552a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010552d:	50                   	push   %eax
8010552e:	e8 1d f3 ff ff       	call   80104850 <fetchint>
80105533:	83 c4 10             	add    $0x10,%esp
80105536:	85 c0                	test   %eax,%eax
80105538:	78 26                	js     80105560 <sys_exec+0xa0>
8010553a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105540:	85 c0                	test   %eax,%eax
80105542:	74 2c                	je     80105570 <sys_exec+0xb0>
80105544:	83 ec 08             	sub    $0x8,%esp
80105547:	56                   	push   %esi
80105548:	50                   	push   %eax
80105549:	e8 42 f3 ff ff       	call   80104890 <fetchstr>
8010554e:	83 c4 10             	add    $0x10,%esp
80105551:	85 c0                	test   %eax,%eax
80105553:	78 0b                	js     80105560 <sys_exec+0xa0>
80105555:	83 c3 01             	add    $0x1,%ebx
80105558:	83 c6 04             	add    $0x4,%esi
8010555b:	83 fb 20             	cmp    $0x20,%ebx
8010555e:	75 c0                	jne    80105520 <sys_exec+0x60>
80105560:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105563:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105568:	5b                   	pop    %ebx
80105569:	5e                   	pop    %esi
8010556a:	5f                   	pop    %edi
8010556b:	5d                   	pop    %ebp
8010556c:	c3                   	ret    
8010556d:	8d 76 00             	lea    0x0(%esi),%esi
80105570:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105576:	83 ec 08             	sub    $0x8,%esp
80105579:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105580:	00 00 00 00 
80105584:	50                   	push   %eax
80105585:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010558b:	e8 60 b4 ff ff       	call   801009f0 <exec>
80105590:	83 c4 10             	add    $0x10,%esp
80105593:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105596:	5b                   	pop    %ebx
80105597:	5e                   	pop    %esi
80105598:	5f                   	pop    %edi
80105599:	5d                   	pop    %ebp
8010559a:	c3                   	ret    
8010559b:	90                   	nop
8010559c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801055a0 <sys_pipe>:
801055a0:	55                   	push   %ebp
801055a1:	89 e5                	mov    %esp,%ebp
801055a3:	57                   	push   %edi
801055a4:	56                   	push   %esi
801055a5:	53                   	push   %ebx
801055a6:	8d 45 dc             	lea    -0x24(%ebp),%eax
801055a9:	83 ec 20             	sub    $0x20,%esp
801055ac:	6a 08                	push   $0x8
801055ae:	50                   	push   %eax
801055af:	6a 00                	push   $0x0
801055b1:	e8 8a f3 ff ff       	call   80104940 <argptr>
801055b6:	83 c4 10             	add    $0x10,%esp
801055b9:	85 c0                	test   %eax,%eax
801055bb:	78 4a                	js     80105607 <sys_pipe+0x67>
801055bd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801055c0:	83 ec 08             	sub    $0x8,%esp
801055c3:	50                   	push   %eax
801055c4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801055c7:	50                   	push   %eax
801055c8:	e8 23 dc ff ff       	call   801031f0 <pipealloc>
801055cd:	83 c4 10             	add    $0x10,%esp
801055d0:	85 c0                	test   %eax,%eax
801055d2:	78 33                	js     80105607 <sys_pipe+0x67>
801055d4:	31 db                	xor    %ebx,%ebx
801055d6:	8b 7d e0             	mov    -0x20(%ebp),%edi
801055d9:	e8 b2 e1 ff ff       	call   80103790 <myproc>
801055de:	66 90                	xchg   %ax,%ax
801055e0:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
801055e4:	85 f6                	test   %esi,%esi
801055e6:	74 30                	je     80105618 <sys_pipe+0x78>
801055e8:	83 c3 01             	add    $0x1,%ebx
801055eb:	83 fb 10             	cmp    $0x10,%ebx
801055ee:	75 f0                	jne    801055e0 <sys_pipe+0x40>
801055f0:	83 ec 0c             	sub    $0xc,%esp
801055f3:	ff 75 e0             	pushl  -0x20(%ebp)
801055f6:	e8 35 b8 ff ff       	call   80100e30 <fileclose>
801055fb:	58                   	pop    %eax
801055fc:	ff 75 e4             	pushl  -0x1c(%ebp)
801055ff:	e8 2c b8 ff ff       	call   80100e30 <fileclose>
80105604:	83 c4 10             	add    $0x10,%esp
80105607:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010560a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010560f:	5b                   	pop    %ebx
80105610:	5e                   	pop    %esi
80105611:	5f                   	pop    %edi
80105612:	5d                   	pop    %ebp
80105613:	c3                   	ret    
80105614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105618:	8d 73 08             	lea    0x8(%ebx),%esi
8010561b:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
8010561f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80105622:	e8 69 e1 ff ff       	call   80103790 <myproc>
80105627:	31 d2                	xor    %edx,%edx
80105629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105630:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105634:	85 c9                	test   %ecx,%ecx
80105636:	74 18                	je     80105650 <sys_pipe+0xb0>
80105638:	83 c2 01             	add    $0x1,%edx
8010563b:	83 fa 10             	cmp    $0x10,%edx
8010563e:	75 f0                	jne    80105630 <sys_pipe+0x90>
80105640:	e8 4b e1 ff ff       	call   80103790 <myproc>
80105645:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
8010564c:	00 
8010564d:	eb a1                	jmp    801055f0 <sys_pipe+0x50>
8010564f:	90                   	nop
80105650:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
80105654:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105657:	89 18                	mov    %ebx,(%eax)
80105659:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010565c:	89 50 04             	mov    %edx,0x4(%eax)
8010565f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105662:	31 c0                	xor    %eax,%eax
80105664:	5b                   	pop    %ebx
80105665:	5e                   	pop    %esi
80105666:	5f                   	pop    %edi
80105667:	5d                   	pop    %ebp
80105668:	c3                   	ret    
80105669:	66 90                	xchg   %ax,%ax
8010566b:	66 90                	xchg   %ax,%ax
8010566d:	66 90                	xchg   %ax,%ax
8010566f:	90                   	nop

80105670 <sys_fork>:
80105670:	55                   	push   %ebp
80105671:	89 e5                	mov    %esp,%ebp
80105673:	5d                   	pop    %ebp
80105674:	e9 b7 e2 ff ff       	jmp    80103930 <fork>
80105679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105680 <sys_exit>:
80105680:	55                   	push   %ebp
80105681:	89 e5                	mov    %esp,%ebp
80105683:	83 ec 08             	sub    $0x8,%esp
80105686:	e8 55 e5 ff ff       	call   80103be0 <exit>
8010568b:	31 c0                	xor    %eax,%eax
8010568d:	c9                   	leave  
8010568e:	c3                   	ret    
8010568f:	90                   	nop

80105690 <sys_wait>:
80105690:	55                   	push   %ebp
80105691:	89 e5                	mov    %esp,%ebp
80105693:	5d                   	pop    %ebp
80105694:	e9 87 e7 ff ff       	jmp    80103e20 <wait>
80105699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801056a0 <sys_kill>:
801056a0:	55                   	push   %ebp
801056a1:	89 e5                	mov    %esp,%ebp
801056a3:	83 ec 20             	sub    $0x20,%esp
801056a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801056a9:	50                   	push   %eax
801056aa:	6a 00                	push   $0x0
801056ac:	e8 3f f2 ff ff       	call   801048f0 <argint>
801056b1:	83 c4 10             	add    $0x10,%esp
801056b4:	85 c0                	test   %eax,%eax
801056b6:	78 18                	js     801056d0 <sys_kill+0x30>
801056b8:	83 ec 0c             	sub    $0xc,%esp
801056bb:	ff 75 f4             	pushl  -0xc(%ebp)
801056be:	e8 bd e8 ff ff       	call   80103f80 <kill>
801056c3:	83 c4 10             	add    $0x10,%esp
801056c6:	c9                   	leave  
801056c7:	c3                   	ret    
801056c8:	90                   	nop
801056c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801056d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056d5:	c9                   	leave  
801056d6:	c3                   	ret    
801056d7:	89 f6                	mov    %esi,%esi
801056d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801056e0 <sys_getpid>:
801056e0:	55                   	push   %ebp
801056e1:	89 e5                	mov    %esp,%ebp
801056e3:	83 ec 08             	sub    $0x8,%esp
801056e6:	e8 a5 e0 ff ff       	call   80103790 <myproc>
801056eb:	8b 40 10             	mov    0x10(%eax),%eax
801056ee:	c9                   	leave  
801056ef:	c3                   	ret    

801056f0 <sys_sbrk>:
801056f0:	55                   	push   %ebp
801056f1:	89 e5                	mov    %esp,%ebp
801056f3:	53                   	push   %ebx
801056f4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801056f7:	83 ec 1c             	sub    $0x1c,%esp
801056fa:	50                   	push   %eax
801056fb:	6a 00                	push   $0x0
801056fd:	e8 ee f1 ff ff       	call   801048f0 <argint>
80105702:	83 c4 10             	add    $0x10,%esp
80105705:	85 c0                	test   %eax,%eax
80105707:	78 27                	js     80105730 <sys_sbrk+0x40>
80105709:	e8 82 e0 ff ff       	call   80103790 <myproc>
8010570e:	83 ec 0c             	sub    $0xc,%esp
80105711:	8b 18                	mov    (%eax),%ebx
80105713:	ff 75 f4             	pushl  -0xc(%ebp)
80105716:	e8 95 e1 ff ff       	call   801038b0 <growproc>
8010571b:	83 c4 10             	add    $0x10,%esp
8010571e:	85 c0                	test   %eax,%eax
80105720:	78 0e                	js     80105730 <sys_sbrk+0x40>
80105722:	89 d8                	mov    %ebx,%eax
80105724:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105727:	c9                   	leave  
80105728:	c3                   	ret    
80105729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105730:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105735:	eb ed                	jmp    80105724 <sys_sbrk+0x34>
80105737:	89 f6                	mov    %esi,%esi
80105739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105740 <sys_sleep>:
80105740:	55                   	push   %ebp
80105741:	89 e5                	mov    %esp,%ebp
80105743:	53                   	push   %ebx
80105744:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105747:	83 ec 1c             	sub    $0x1c,%esp
8010574a:	50                   	push   %eax
8010574b:	6a 00                	push   $0x0
8010574d:	e8 9e f1 ff ff       	call   801048f0 <argint>
80105752:	83 c4 10             	add    $0x10,%esp
80105755:	85 c0                	test   %eax,%eax
80105757:	0f 88 8a 00 00 00    	js     801057e7 <sys_sleep+0xa7>
8010575d:	83 ec 0c             	sub    $0xc,%esp
80105760:	68 20 4a 11 80       	push   $0x80114a20
80105765:	e8 06 ed ff ff       	call   80104470 <acquire>
8010576a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010576d:	83 c4 10             	add    $0x10,%esp
80105770:	8b 1d 60 52 11 80    	mov    0x80115260,%ebx
80105776:	85 d2                	test   %edx,%edx
80105778:	75 27                	jne    801057a1 <sys_sleep+0x61>
8010577a:	eb 54                	jmp    801057d0 <sys_sleep+0x90>
8010577c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105780:	83 ec 08             	sub    $0x8,%esp
80105783:	68 20 4a 11 80       	push   $0x80114a20
80105788:	68 60 52 11 80       	push   $0x80115260
8010578d:	e8 ce e5 ff ff       	call   80103d60 <sleep>
80105792:	a1 60 52 11 80       	mov    0x80115260,%eax
80105797:	83 c4 10             	add    $0x10,%esp
8010579a:	29 d8                	sub    %ebx,%eax
8010579c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010579f:	73 2f                	jae    801057d0 <sys_sleep+0x90>
801057a1:	e8 ea df ff ff       	call   80103790 <myproc>
801057a6:	8b 40 24             	mov    0x24(%eax),%eax
801057a9:	85 c0                	test   %eax,%eax
801057ab:	74 d3                	je     80105780 <sys_sleep+0x40>
801057ad:	83 ec 0c             	sub    $0xc,%esp
801057b0:	68 20 4a 11 80       	push   $0x80114a20
801057b5:	e8 d6 ed ff ff       	call   80104590 <release>
801057ba:	83 c4 10             	add    $0x10,%esp
801057bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057c5:	c9                   	leave  
801057c6:	c3                   	ret    
801057c7:	89 f6                	mov    %esi,%esi
801057c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801057d0:	83 ec 0c             	sub    $0xc,%esp
801057d3:	68 20 4a 11 80       	push   $0x80114a20
801057d8:	e8 b3 ed ff ff       	call   80104590 <release>
801057dd:	83 c4 10             	add    $0x10,%esp
801057e0:	31 c0                	xor    %eax,%eax
801057e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057e5:	c9                   	leave  
801057e6:	c3                   	ret    
801057e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057ec:	eb d4                	jmp    801057c2 <sys_sleep+0x82>
801057ee:	66 90                	xchg   %ax,%ax

801057f0 <sys_uptime>:
801057f0:	55                   	push   %ebp
801057f1:	89 e5                	mov    %esp,%ebp
801057f3:	53                   	push   %ebx
801057f4:	83 ec 10             	sub    $0x10,%esp
801057f7:	68 20 4a 11 80       	push   $0x80114a20
801057fc:	e8 6f ec ff ff       	call   80104470 <acquire>
80105801:	8b 1d 60 52 11 80    	mov    0x80115260,%ebx
80105807:	c7 04 24 20 4a 11 80 	movl   $0x80114a20,(%esp)
8010580e:	e8 7d ed ff ff       	call   80104590 <release>
80105813:	89 d8                	mov    %ebx,%eax
80105815:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105818:	c9                   	leave  
80105819:	c3                   	ret    
8010581a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105820 <sys_cpsys>:
80105820:	55                   	push   %ebp
80105821:	89 e5                	mov    %esp,%ebp
80105823:	5d                   	pop    %ebp
80105824:	e9 a7 e8 ff ff       	jmp    801040d0 <cpsys>
80105829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105830 <sys_csc>:
80105830:	55                   	push   %ebp
80105831:	89 e5                	mov    %esp,%ebp
80105833:	5d                   	pop    %ebp
80105834:	e9 67 e9 ff ff       	jmp    801041a0 <csc>
80105839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105840 <sys_chpr>:
80105840:	55                   	push   %ebp
80105841:	89 e5                	mov    %esp,%ebp
80105843:	83 ec 20             	sub    $0x20,%esp
80105846:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105849:	50                   	push   %eax
8010584a:	6a 00                	push   $0x0
8010584c:	e8 9f f0 ff ff       	call   801048f0 <argint>
80105851:	83 c4 10             	add    $0x10,%esp
80105854:	85 c0                	test   %eax,%eax
80105856:	78 28                	js     80105880 <sys_chpr+0x40>
80105858:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010585b:	83 ec 08             	sub    $0x8,%esp
8010585e:	50                   	push   %eax
8010585f:	6a 01                	push   $0x1
80105861:	e8 8a f0 ff ff       	call   801048f0 <argint>
80105866:	83 c4 10             	add    $0x10,%esp
80105869:	85 c0                	test   %eax,%eax
8010586b:	78 13                	js     80105880 <sys_chpr+0x40>
8010586d:	83 ec 08             	sub    $0x8,%esp
80105870:	ff 75 f4             	pushl  -0xc(%ebp)
80105873:	ff 75 f0             	pushl  -0x10(%ebp)
80105876:	e8 95 e9 ff ff       	call   80104210 <chpr>
8010587b:	83 c4 10             	add    $0x10,%esp
8010587e:	c9                   	leave  
8010587f:	c3                   	ret    
80105880:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105885:	c9                   	leave  
80105886:	c3                   	ret    

80105887 <alltraps>:
80105887:	1e                   	push   %ds
80105888:	06                   	push   %es
80105889:	0f a0                	push   %fs
8010588b:	0f a8                	push   %gs
8010588d:	60                   	pusha  
8010588e:	66 b8 10 00          	mov    $0x10,%ax
80105892:	8e d8                	mov    %eax,%ds
80105894:	8e c0                	mov    %eax,%es
80105896:	54                   	push   %esp
80105897:	e8 e4 00 00 00       	call   80105980 <trap>
8010589c:	83 c4 04             	add    $0x4,%esp

8010589f <trapret>:
8010589f:	61                   	popa   
801058a0:	0f a9                	pop    %gs
801058a2:	0f a1                	pop    %fs
801058a4:	07                   	pop    %es
801058a5:	1f                   	pop    %ds
801058a6:	83 c4 08             	add    $0x8,%esp
801058a9:	cf                   	iret   
801058aa:	66 90                	xchg   %ax,%ax
801058ac:	66 90                	xchg   %ax,%ax
801058ae:	66 90                	xchg   %ax,%ax

801058b0 <tvinit>:
801058b0:	31 c0                	xor    %eax,%eax
801058b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801058b8:	8b 14 85 80 a0 10 80 	mov    -0x7fef5f80(,%eax,4),%edx
801058bf:	b9 08 00 00 00       	mov    $0x8,%ecx
801058c4:	c6 04 c5 64 4a 11 80 	movb   $0x0,-0x7feeb59c(,%eax,8)
801058cb:	00 
801058cc:	66 89 0c c5 62 4a 11 	mov    %cx,-0x7feeb59e(,%eax,8)
801058d3:	80 
801058d4:	c6 04 c5 65 4a 11 80 	movb   $0x8e,-0x7feeb59b(,%eax,8)
801058db:	8e 
801058dc:	66 89 14 c5 60 4a 11 	mov    %dx,-0x7feeb5a0(,%eax,8)
801058e3:	80 
801058e4:	c1 ea 10             	shr    $0x10,%edx
801058e7:	66 89 14 c5 66 4a 11 	mov    %dx,-0x7feeb59a(,%eax,8)
801058ee:	80 
801058ef:	83 c0 01             	add    $0x1,%eax
801058f2:	3d 00 01 00 00       	cmp    $0x100,%eax
801058f7:	75 bf                	jne    801058b8 <tvinit+0x8>
801058f9:	55                   	push   %ebp
801058fa:	ba 08 00 00 00       	mov    $0x8,%edx
801058ff:	89 e5                	mov    %esp,%ebp
80105901:	83 ec 10             	sub    $0x10,%esp
80105904:	a1 80 a1 10 80       	mov    0x8010a180,%eax
80105909:	68 e3 78 10 80       	push   $0x801078e3
8010590e:	68 20 4a 11 80       	push   $0x80114a20
80105913:	66 89 15 62 4c 11 80 	mov    %dx,0x80114c62
8010591a:	c6 05 64 4c 11 80 00 	movb   $0x0,0x80114c64
80105921:	66 a3 60 4c 11 80    	mov    %ax,0x80114c60
80105927:	c1 e8 10             	shr    $0x10,%eax
8010592a:	c6 05 65 4c 11 80 ef 	movb   $0xef,0x80114c65
80105931:	66 a3 66 4c 11 80    	mov    %ax,0x80114c66
80105937:	e8 34 ea ff ff       	call   80104370 <initlock>
8010593c:	83 c4 10             	add    $0x10,%esp
8010593f:	c9                   	leave  
80105940:	c3                   	ret    
80105941:	eb 0d                	jmp    80105950 <idtinit>
80105943:	90                   	nop
80105944:	90                   	nop
80105945:	90                   	nop
80105946:	90                   	nop
80105947:	90                   	nop
80105948:	90                   	nop
80105949:	90                   	nop
8010594a:	90                   	nop
8010594b:	90                   	nop
8010594c:	90                   	nop
8010594d:	90                   	nop
8010594e:	90                   	nop
8010594f:	90                   	nop

80105950 <idtinit>:
80105950:	55                   	push   %ebp
80105951:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105956:	89 e5                	mov    %esp,%ebp
80105958:	83 ec 10             	sub    $0x10,%esp
8010595b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
8010595f:	b8 60 4a 11 80       	mov    $0x80114a60,%eax
80105964:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80105968:	c1 e8 10             	shr    $0x10,%eax
8010596b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
8010596f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105972:	0f 01 18             	lidtl  (%eax)
80105975:	c9                   	leave  
80105976:	c3                   	ret    
80105977:	89 f6                	mov    %esi,%esi
80105979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105980 <trap>:
80105980:	55                   	push   %ebp
80105981:	89 e5                	mov    %esp,%ebp
80105983:	57                   	push   %edi
80105984:	56                   	push   %esi
80105985:	53                   	push   %ebx
80105986:	83 ec 1c             	sub    $0x1c,%esp
80105989:	8b 7d 08             	mov    0x8(%ebp),%edi
8010598c:	8b 47 30             	mov    0x30(%edi),%eax
8010598f:	83 f8 40             	cmp    $0x40,%eax
80105992:	0f 84 88 01 00 00    	je     80105b20 <trap+0x1a0>
80105998:	83 e8 20             	sub    $0x20,%eax
8010599b:	83 f8 1f             	cmp    $0x1f,%eax
8010599e:	77 10                	ja     801059b0 <trap+0x30>
801059a0:	ff 24 85 88 7a 10 80 	jmp    *-0x7fef8578(,%eax,4)
801059a7:	89 f6                	mov    %esi,%esi
801059a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801059b0:	e8 db dd ff ff       	call   80103790 <myproc>
801059b5:	85 c0                	test   %eax,%eax
801059b7:	0f 84 d7 01 00 00    	je     80105b94 <trap+0x214>
801059bd:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
801059c1:	0f 84 cd 01 00 00    	je     80105b94 <trap+0x214>
801059c7:	0f 20 d1             	mov    %cr2,%ecx
801059ca:	8b 57 38             	mov    0x38(%edi),%edx
801059cd:	89 4d d8             	mov    %ecx,-0x28(%ebp)
801059d0:	89 55 dc             	mov    %edx,-0x24(%ebp)
801059d3:	e8 98 dd ff ff       	call   80103770 <cpuid>
801059d8:	8b 77 34             	mov    0x34(%edi),%esi
801059db:	8b 5f 30             	mov    0x30(%edi),%ebx
801059de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801059e1:	e8 aa dd ff ff       	call   80103790 <myproc>
801059e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801059e9:	e8 a2 dd ff ff       	call   80103790 <myproc>
801059ee:	8b 4d d8             	mov    -0x28(%ebp),%ecx
801059f1:	8b 55 dc             	mov    -0x24(%ebp),%edx
801059f4:	51                   	push   %ecx
801059f5:	52                   	push   %edx
801059f6:	8b 55 e0             	mov    -0x20(%ebp),%edx
801059f9:	ff 75 e4             	pushl  -0x1c(%ebp)
801059fc:	56                   	push   %esi
801059fd:	53                   	push   %ebx
801059fe:	83 c2 6c             	add    $0x6c,%edx
80105a01:	52                   	push   %edx
80105a02:	ff 70 10             	pushl  0x10(%eax)
80105a05:	68 44 7a 10 80       	push   $0x80107a44
80105a0a:	e8 51 ac ff ff       	call   80100660 <cprintf>
80105a0f:	83 c4 20             	add    $0x20,%esp
80105a12:	e8 79 dd ff ff       	call   80103790 <myproc>
80105a17:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105a1e:	66 90                	xchg   %ax,%ax
80105a20:	e8 6b dd ff ff       	call   80103790 <myproc>
80105a25:	85 c0                	test   %eax,%eax
80105a27:	74 0c                	je     80105a35 <trap+0xb5>
80105a29:	e8 62 dd ff ff       	call   80103790 <myproc>
80105a2e:	8b 50 24             	mov    0x24(%eax),%edx
80105a31:	85 d2                	test   %edx,%edx
80105a33:	75 4b                	jne    80105a80 <trap+0x100>
80105a35:	e8 56 dd ff ff       	call   80103790 <myproc>
80105a3a:	85 c0                	test   %eax,%eax
80105a3c:	74 0b                	je     80105a49 <trap+0xc9>
80105a3e:	e8 4d dd ff ff       	call   80103790 <myproc>
80105a43:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105a47:	74 4f                	je     80105a98 <trap+0x118>
80105a49:	e8 42 dd ff ff       	call   80103790 <myproc>
80105a4e:	85 c0                	test   %eax,%eax
80105a50:	74 1d                	je     80105a6f <trap+0xef>
80105a52:	e8 39 dd ff ff       	call   80103790 <myproc>
80105a57:	8b 40 24             	mov    0x24(%eax),%eax
80105a5a:	85 c0                	test   %eax,%eax
80105a5c:	74 11                	je     80105a6f <trap+0xef>
80105a5e:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105a62:	83 e0 03             	and    $0x3,%eax
80105a65:	66 83 f8 03          	cmp    $0x3,%ax
80105a69:	0f 84 da 00 00 00    	je     80105b49 <trap+0x1c9>
80105a6f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a72:	5b                   	pop    %ebx
80105a73:	5e                   	pop    %esi
80105a74:	5f                   	pop    %edi
80105a75:	5d                   	pop    %ebp
80105a76:	c3                   	ret    
80105a77:	89 f6                	mov    %esi,%esi
80105a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105a80:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105a84:	83 e0 03             	and    $0x3,%eax
80105a87:	66 83 f8 03          	cmp    $0x3,%ax
80105a8b:	75 a8                	jne    80105a35 <trap+0xb5>
80105a8d:	e8 4e e1 ff ff       	call   80103be0 <exit>
80105a92:	eb a1                	jmp    80105a35 <trap+0xb5>
80105a94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105a98:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105a9c:	75 ab                	jne    80105a49 <trap+0xc9>
80105a9e:	e8 6d e2 ff ff       	call   80103d10 <yield>
80105aa3:	eb a4                	jmp    80105a49 <trap+0xc9>
80105aa5:	8d 76 00             	lea    0x0(%esi),%esi
80105aa8:	e8 c3 dc ff ff       	call   80103770 <cpuid>
80105aad:	85 c0                	test   %eax,%eax
80105aaf:	0f 84 ab 00 00 00    	je     80105b60 <trap+0x1e0>
80105ab5:	e8 56 cc ff ff       	call   80102710 <lapiceoi>
80105aba:	e9 61 ff ff ff       	jmp    80105a20 <trap+0xa0>
80105abf:	90                   	nop
80105ac0:	e8 0b cb ff ff       	call   801025d0 <kbdintr>
80105ac5:	e8 46 cc ff ff       	call   80102710 <lapiceoi>
80105aca:	e9 51 ff ff ff       	jmp    80105a20 <trap+0xa0>
80105acf:	90                   	nop
80105ad0:	e8 5b 02 00 00       	call   80105d30 <uartintr>
80105ad5:	e8 36 cc ff ff       	call   80102710 <lapiceoi>
80105ada:	e9 41 ff ff ff       	jmp    80105a20 <trap+0xa0>
80105adf:	90                   	nop
80105ae0:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105ae4:	8b 77 38             	mov    0x38(%edi),%esi
80105ae7:	e8 84 dc ff ff       	call   80103770 <cpuid>
80105aec:	56                   	push   %esi
80105aed:	53                   	push   %ebx
80105aee:	50                   	push   %eax
80105aef:	68 ec 79 10 80       	push   $0x801079ec
80105af4:	e8 67 ab ff ff       	call   80100660 <cprintf>
80105af9:	e8 12 cc ff ff       	call   80102710 <lapiceoi>
80105afe:	83 c4 10             	add    $0x10,%esp
80105b01:	e9 1a ff ff ff       	jmp    80105a20 <trap+0xa0>
80105b06:	8d 76 00             	lea    0x0(%esi),%esi
80105b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b10:	e8 3b c5 ff ff       	call   80102050 <ideintr>
80105b15:	eb 9e                	jmp    80105ab5 <trap+0x135>
80105b17:	89 f6                	mov    %esi,%esi
80105b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b20:	e8 6b dc ff ff       	call   80103790 <myproc>
80105b25:	8b 58 24             	mov    0x24(%eax),%ebx
80105b28:	85 db                	test   %ebx,%ebx
80105b2a:	75 2c                	jne    80105b58 <trap+0x1d8>
80105b2c:	e8 5f dc ff ff       	call   80103790 <myproc>
80105b31:	89 78 18             	mov    %edi,0x18(%eax)
80105b34:	e8 a7 ee ff ff       	call   801049e0 <syscall>
80105b39:	e8 52 dc ff ff       	call   80103790 <myproc>
80105b3e:	8b 48 24             	mov    0x24(%eax),%ecx
80105b41:	85 c9                	test   %ecx,%ecx
80105b43:	0f 84 26 ff ff ff    	je     80105a6f <trap+0xef>
80105b49:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b4c:	5b                   	pop    %ebx
80105b4d:	5e                   	pop    %esi
80105b4e:	5f                   	pop    %edi
80105b4f:	5d                   	pop    %ebp
80105b50:	e9 8b e0 ff ff       	jmp    80103be0 <exit>
80105b55:	8d 76 00             	lea    0x0(%esi),%esi
80105b58:	e8 83 e0 ff ff       	call   80103be0 <exit>
80105b5d:	eb cd                	jmp    80105b2c <trap+0x1ac>
80105b5f:	90                   	nop
80105b60:	83 ec 0c             	sub    $0xc,%esp
80105b63:	68 20 4a 11 80       	push   $0x80114a20
80105b68:	e8 03 e9 ff ff       	call   80104470 <acquire>
80105b6d:	c7 04 24 60 52 11 80 	movl   $0x80115260,(%esp)
80105b74:	83 05 60 52 11 80 01 	addl   $0x1,0x80115260
80105b7b:	e8 a0 e3 ff ff       	call   80103f20 <wakeup>
80105b80:	c7 04 24 20 4a 11 80 	movl   $0x80114a20,(%esp)
80105b87:	e8 04 ea ff ff       	call   80104590 <release>
80105b8c:	83 c4 10             	add    $0x10,%esp
80105b8f:	e9 21 ff ff ff       	jmp    80105ab5 <trap+0x135>
80105b94:	0f 20 d6             	mov    %cr2,%esi
80105b97:	8b 5f 38             	mov    0x38(%edi),%ebx
80105b9a:	e8 d1 db ff ff       	call   80103770 <cpuid>
80105b9f:	83 ec 0c             	sub    $0xc,%esp
80105ba2:	56                   	push   %esi
80105ba3:	53                   	push   %ebx
80105ba4:	50                   	push   %eax
80105ba5:	ff 77 30             	pushl  0x30(%edi)
80105ba8:	68 10 7a 10 80       	push   $0x80107a10
80105bad:	e8 ae aa ff ff       	call   80100660 <cprintf>
80105bb2:	83 c4 14             	add    $0x14,%esp
80105bb5:	68 e5 79 10 80       	push   $0x801079e5
80105bba:	e8 b1 a7 ff ff       	call   80100370 <panic>
80105bbf:	90                   	nop

80105bc0 <uartgetc>:
80105bc0:	a1 20 a6 10 80       	mov    0x8010a620,%eax
80105bc5:	55                   	push   %ebp
80105bc6:	89 e5                	mov    %esp,%ebp
80105bc8:	85 c0                	test   %eax,%eax
80105bca:	74 1c                	je     80105be8 <uartgetc+0x28>
80105bcc:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105bd1:	ec                   	in     (%dx),%al
80105bd2:	a8 01                	test   $0x1,%al
80105bd4:	74 12                	je     80105be8 <uartgetc+0x28>
80105bd6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105bdb:	ec                   	in     (%dx),%al
80105bdc:	0f b6 c0             	movzbl %al,%eax
80105bdf:	5d                   	pop    %ebp
80105be0:	c3                   	ret    
80105be1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105be8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105bed:	5d                   	pop    %ebp
80105bee:	c3                   	ret    
80105bef:	90                   	nop

80105bf0 <uartputc.part.0>:
80105bf0:	55                   	push   %ebp
80105bf1:	89 e5                	mov    %esp,%ebp
80105bf3:	57                   	push   %edi
80105bf4:	56                   	push   %esi
80105bf5:	53                   	push   %ebx
80105bf6:	89 c7                	mov    %eax,%edi
80105bf8:	bb 80 00 00 00       	mov    $0x80,%ebx
80105bfd:	be fd 03 00 00       	mov    $0x3fd,%esi
80105c02:	83 ec 0c             	sub    $0xc,%esp
80105c05:	eb 1b                	jmp    80105c22 <uartputc.part.0+0x32>
80105c07:	89 f6                	mov    %esi,%esi
80105c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105c10:	83 ec 0c             	sub    $0xc,%esp
80105c13:	6a 0a                	push   $0xa
80105c15:	e8 16 cb ff ff       	call   80102730 <microdelay>
80105c1a:	83 c4 10             	add    $0x10,%esp
80105c1d:	83 eb 01             	sub    $0x1,%ebx
80105c20:	74 07                	je     80105c29 <uartputc.part.0+0x39>
80105c22:	89 f2                	mov    %esi,%edx
80105c24:	ec                   	in     (%dx),%al
80105c25:	a8 20                	test   $0x20,%al
80105c27:	74 e7                	je     80105c10 <uartputc.part.0+0x20>
80105c29:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c2e:	89 f8                	mov    %edi,%eax
80105c30:	ee                   	out    %al,(%dx)
80105c31:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c34:	5b                   	pop    %ebx
80105c35:	5e                   	pop    %esi
80105c36:	5f                   	pop    %edi
80105c37:	5d                   	pop    %ebp
80105c38:	c3                   	ret    
80105c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105c40 <uartinit>:
80105c40:	55                   	push   %ebp
80105c41:	31 c9                	xor    %ecx,%ecx
80105c43:	89 c8                	mov    %ecx,%eax
80105c45:	89 e5                	mov    %esp,%ebp
80105c47:	57                   	push   %edi
80105c48:	56                   	push   %esi
80105c49:	53                   	push   %ebx
80105c4a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105c4f:	89 da                	mov    %ebx,%edx
80105c51:	83 ec 0c             	sub    $0xc,%esp
80105c54:	ee                   	out    %al,(%dx)
80105c55:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105c5a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105c5f:	89 fa                	mov    %edi,%edx
80105c61:	ee                   	out    %al,(%dx)
80105c62:	b8 0c 00 00 00       	mov    $0xc,%eax
80105c67:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c6c:	ee                   	out    %al,(%dx)
80105c6d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105c72:	89 c8                	mov    %ecx,%eax
80105c74:	89 f2                	mov    %esi,%edx
80105c76:	ee                   	out    %al,(%dx)
80105c77:	b8 03 00 00 00       	mov    $0x3,%eax
80105c7c:	89 fa                	mov    %edi,%edx
80105c7e:	ee                   	out    %al,(%dx)
80105c7f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105c84:	89 c8                	mov    %ecx,%eax
80105c86:	ee                   	out    %al,(%dx)
80105c87:	b8 01 00 00 00       	mov    $0x1,%eax
80105c8c:	89 f2                	mov    %esi,%edx
80105c8e:	ee                   	out    %al,(%dx)
80105c8f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105c94:	ec                   	in     (%dx),%al
80105c95:	3c ff                	cmp    $0xff,%al
80105c97:	74 5a                	je     80105cf3 <uartinit+0xb3>
80105c99:	c7 05 20 a6 10 80 01 	movl   $0x1,0x8010a620
80105ca0:	00 00 00 
80105ca3:	89 da                	mov    %ebx,%edx
80105ca5:	ec                   	in     (%dx),%al
80105ca6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105cab:	ec                   	in     (%dx),%al
80105cac:	83 ec 08             	sub    $0x8,%esp
80105caf:	bb 08 7b 10 80       	mov    $0x80107b08,%ebx
80105cb4:	6a 00                	push   $0x0
80105cb6:	6a 04                	push   $0x4
80105cb8:	e8 e3 c5 ff ff       	call   801022a0 <ioapicenable>
80105cbd:	83 c4 10             	add    $0x10,%esp
80105cc0:	b8 78 00 00 00       	mov    $0x78,%eax
80105cc5:	eb 13                	jmp    80105cda <uartinit+0x9a>
80105cc7:	89 f6                	mov    %esi,%esi
80105cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105cd0:	83 c3 01             	add    $0x1,%ebx
80105cd3:	0f be 03             	movsbl (%ebx),%eax
80105cd6:	84 c0                	test   %al,%al
80105cd8:	74 19                	je     80105cf3 <uartinit+0xb3>
80105cda:	8b 15 20 a6 10 80    	mov    0x8010a620,%edx
80105ce0:	85 d2                	test   %edx,%edx
80105ce2:	74 ec                	je     80105cd0 <uartinit+0x90>
80105ce4:	83 c3 01             	add    $0x1,%ebx
80105ce7:	e8 04 ff ff ff       	call   80105bf0 <uartputc.part.0>
80105cec:	0f be 03             	movsbl (%ebx),%eax
80105cef:	84 c0                	test   %al,%al
80105cf1:	75 e7                	jne    80105cda <uartinit+0x9a>
80105cf3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105cf6:	5b                   	pop    %ebx
80105cf7:	5e                   	pop    %esi
80105cf8:	5f                   	pop    %edi
80105cf9:	5d                   	pop    %ebp
80105cfa:	c3                   	ret    
80105cfb:	90                   	nop
80105cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105d00 <uartputc>:
80105d00:	8b 15 20 a6 10 80    	mov    0x8010a620,%edx
80105d06:	55                   	push   %ebp
80105d07:	89 e5                	mov    %esp,%ebp
80105d09:	85 d2                	test   %edx,%edx
80105d0b:	8b 45 08             	mov    0x8(%ebp),%eax
80105d0e:	74 10                	je     80105d20 <uartputc+0x20>
80105d10:	5d                   	pop    %ebp
80105d11:	e9 da fe ff ff       	jmp    80105bf0 <uartputc.part.0>
80105d16:	8d 76 00             	lea    0x0(%esi),%esi
80105d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105d20:	5d                   	pop    %ebp
80105d21:	c3                   	ret    
80105d22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105d30 <uartintr>:
80105d30:	55                   	push   %ebp
80105d31:	89 e5                	mov    %esp,%ebp
80105d33:	83 ec 14             	sub    $0x14,%esp
80105d36:	68 c0 5b 10 80       	push   $0x80105bc0
80105d3b:	e8 b0 aa ff ff       	call   801007f0 <consoleintr>
80105d40:	83 c4 10             	add    $0x10,%esp
80105d43:	c9                   	leave  
80105d44:	c3                   	ret    

80105d45 <vector0>:
80105d45:	6a 00                	push   $0x0
80105d47:	6a 00                	push   $0x0
80105d49:	e9 39 fb ff ff       	jmp    80105887 <alltraps>

80105d4e <vector1>:
80105d4e:	6a 00                	push   $0x0
80105d50:	6a 01                	push   $0x1
80105d52:	e9 30 fb ff ff       	jmp    80105887 <alltraps>

80105d57 <vector2>:
80105d57:	6a 00                	push   $0x0
80105d59:	6a 02                	push   $0x2
80105d5b:	e9 27 fb ff ff       	jmp    80105887 <alltraps>

80105d60 <vector3>:
80105d60:	6a 00                	push   $0x0
80105d62:	6a 03                	push   $0x3
80105d64:	e9 1e fb ff ff       	jmp    80105887 <alltraps>

80105d69 <vector4>:
80105d69:	6a 00                	push   $0x0
80105d6b:	6a 04                	push   $0x4
80105d6d:	e9 15 fb ff ff       	jmp    80105887 <alltraps>

80105d72 <vector5>:
80105d72:	6a 00                	push   $0x0
80105d74:	6a 05                	push   $0x5
80105d76:	e9 0c fb ff ff       	jmp    80105887 <alltraps>

80105d7b <vector6>:
80105d7b:	6a 00                	push   $0x0
80105d7d:	6a 06                	push   $0x6
80105d7f:	e9 03 fb ff ff       	jmp    80105887 <alltraps>

80105d84 <vector7>:
80105d84:	6a 00                	push   $0x0
80105d86:	6a 07                	push   $0x7
80105d88:	e9 fa fa ff ff       	jmp    80105887 <alltraps>

80105d8d <vector8>:
80105d8d:	6a 08                	push   $0x8
80105d8f:	e9 f3 fa ff ff       	jmp    80105887 <alltraps>

80105d94 <vector9>:
80105d94:	6a 00                	push   $0x0
80105d96:	6a 09                	push   $0x9
80105d98:	e9 ea fa ff ff       	jmp    80105887 <alltraps>

80105d9d <vector10>:
80105d9d:	6a 0a                	push   $0xa
80105d9f:	e9 e3 fa ff ff       	jmp    80105887 <alltraps>

80105da4 <vector11>:
80105da4:	6a 0b                	push   $0xb
80105da6:	e9 dc fa ff ff       	jmp    80105887 <alltraps>

80105dab <vector12>:
80105dab:	6a 0c                	push   $0xc
80105dad:	e9 d5 fa ff ff       	jmp    80105887 <alltraps>

80105db2 <vector13>:
80105db2:	6a 0d                	push   $0xd
80105db4:	e9 ce fa ff ff       	jmp    80105887 <alltraps>

80105db9 <vector14>:
80105db9:	6a 0e                	push   $0xe
80105dbb:	e9 c7 fa ff ff       	jmp    80105887 <alltraps>

80105dc0 <vector15>:
80105dc0:	6a 00                	push   $0x0
80105dc2:	6a 0f                	push   $0xf
80105dc4:	e9 be fa ff ff       	jmp    80105887 <alltraps>

80105dc9 <vector16>:
80105dc9:	6a 00                	push   $0x0
80105dcb:	6a 10                	push   $0x10
80105dcd:	e9 b5 fa ff ff       	jmp    80105887 <alltraps>

80105dd2 <vector17>:
80105dd2:	6a 11                	push   $0x11
80105dd4:	e9 ae fa ff ff       	jmp    80105887 <alltraps>

80105dd9 <vector18>:
80105dd9:	6a 00                	push   $0x0
80105ddb:	6a 12                	push   $0x12
80105ddd:	e9 a5 fa ff ff       	jmp    80105887 <alltraps>

80105de2 <vector19>:
80105de2:	6a 00                	push   $0x0
80105de4:	6a 13                	push   $0x13
80105de6:	e9 9c fa ff ff       	jmp    80105887 <alltraps>

80105deb <vector20>:
80105deb:	6a 00                	push   $0x0
80105ded:	6a 14                	push   $0x14
80105def:	e9 93 fa ff ff       	jmp    80105887 <alltraps>

80105df4 <vector21>:
80105df4:	6a 00                	push   $0x0
80105df6:	6a 15                	push   $0x15
80105df8:	e9 8a fa ff ff       	jmp    80105887 <alltraps>

80105dfd <vector22>:
80105dfd:	6a 00                	push   $0x0
80105dff:	6a 16                	push   $0x16
80105e01:	e9 81 fa ff ff       	jmp    80105887 <alltraps>

80105e06 <vector23>:
80105e06:	6a 00                	push   $0x0
80105e08:	6a 17                	push   $0x17
80105e0a:	e9 78 fa ff ff       	jmp    80105887 <alltraps>

80105e0f <vector24>:
80105e0f:	6a 00                	push   $0x0
80105e11:	6a 18                	push   $0x18
80105e13:	e9 6f fa ff ff       	jmp    80105887 <alltraps>

80105e18 <vector25>:
80105e18:	6a 00                	push   $0x0
80105e1a:	6a 19                	push   $0x19
80105e1c:	e9 66 fa ff ff       	jmp    80105887 <alltraps>

80105e21 <vector26>:
80105e21:	6a 00                	push   $0x0
80105e23:	6a 1a                	push   $0x1a
80105e25:	e9 5d fa ff ff       	jmp    80105887 <alltraps>

80105e2a <vector27>:
80105e2a:	6a 00                	push   $0x0
80105e2c:	6a 1b                	push   $0x1b
80105e2e:	e9 54 fa ff ff       	jmp    80105887 <alltraps>

80105e33 <vector28>:
80105e33:	6a 00                	push   $0x0
80105e35:	6a 1c                	push   $0x1c
80105e37:	e9 4b fa ff ff       	jmp    80105887 <alltraps>

80105e3c <vector29>:
80105e3c:	6a 00                	push   $0x0
80105e3e:	6a 1d                	push   $0x1d
80105e40:	e9 42 fa ff ff       	jmp    80105887 <alltraps>

80105e45 <vector30>:
80105e45:	6a 00                	push   $0x0
80105e47:	6a 1e                	push   $0x1e
80105e49:	e9 39 fa ff ff       	jmp    80105887 <alltraps>

80105e4e <vector31>:
80105e4e:	6a 00                	push   $0x0
80105e50:	6a 1f                	push   $0x1f
80105e52:	e9 30 fa ff ff       	jmp    80105887 <alltraps>

80105e57 <vector32>:
80105e57:	6a 00                	push   $0x0
80105e59:	6a 20                	push   $0x20
80105e5b:	e9 27 fa ff ff       	jmp    80105887 <alltraps>

80105e60 <vector33>:
80105e60:	6a 00                	push   $0x0
80105e62:	6a 21                	push   $0x21
80105e64:	e9 1e fa ff ff       	jmp    80105887 <alltraps>

80105e69 <vector34>:
80105e69:	6a 00                	push   $0x0
80105e6b:	6a 22                	push   $0x22
80105e6d:	e9 15 fa ff ff       	jmp    80105887 <alltraps>

80105e72 <vector35>:
80105e72:	6a 00                	push   $0x0
80105e74:	6a 23                	push   $0x23
80105e76:	e9 0c fa ff ff       	jmp    80105887 <alltraps>

80105e7b <vector36>:
80105e7b:	6a 00                	push   $0x0
80105e7d:	6a 24                	push   $0x24
80105e7f:	e9 03 fa ff ff       	jmp    80105887 <alltraps>

80105e84 <vector37>:
80105e84:	6a 00                	push   $0x0
80105e86:	6a 25                	push   $0x25
80105e88:	e9 fa f9 ff ff       	jmp    80105887 <alltraps>

80105e8d <vector38>:
80105e8d:	6a 00                	push   $0x0
80105e8f:	6a 26                	push   $0x26
80105e91:	e9 f1 f9 ff ff       	jmp    80105887 <alltraps>

80105e96 <vector39>:
80105e96:	6a 00                	push   $0x0
80105e98:	6a 27                	push   $0x27
80105e9a:	e9 e8 f9 ff ff       	jmp    80105887 <alltraps>

80105e9f <vector40>:
80105e9f:	6a 00                	push   $0x0
80105ea1:	6a 28                	push   $0x28
80105ea3:	e9 df f9 ff ff       	jmp    80105887 <alltraps>

80105ea8 <vector41>:
80105ea8:	6a 00                	push   $0x0
80105eaa:	6a 29                	push   $0x29
80105eac:	e9 d6 f9 ff ff       	jmp    80105887 <alltraps>

80105eb1 <vector42>:
80105eb1:	6a 00                	push   $0x0
80105eb3:	6a 2a                	push   $0x2a
80105eb5:	e9 cd f9 ff ff       	jmp    80105887 <alltraps>

80105eba <vector43>:
80105eba:	6a 00                	push   $0x0
80105ebc:	6a 2b                	push   $0x2b
80105ebe:	e9 c4 f9 ff ff       	jmp    80105887 <alltraps>

80105ec3 <vector44>:
80105ec3:	6a 00                	push   $0x0
80105ec5:	6a 2c                	push   $0x2c
80105ec7:	e9 bb f9 ff ff       	jmp    80105887 <alltraps>

80105ecc <vector45>:
80105ecc:	6a 00                	push   $0x0
80105ece:	6a 2d                	push   $0x2d
80105ed0:	e9 b2 f9 ff ff       	jmp    80105887 <alltraps>

80105ed5 <vector46>:
80105ed5:	6a 00                	push   $0x0
80105ed7:	6a 2e                	push   $0x2e
80105ed9:	e9 a9 f9 ff ff       	jmp    80105887 <alltraps>

80105ede <vector47>:
80105ede:	6a 00                	push   $0x0
80105ee0:	6a 2f                	push   $0x2f
80105ee2:	e9 a0 f9 ff ff       	jmp    80105887 <alltraps>

80105ee7 <vector48>:
80105ee7:	6a 00                	push   $0x0
80105ee9:	6a 30                	push   $0x30
80105eeb:	e9 97 f9 ff ff       	jmp    80105887 <alltraps>

80105ef0 <vector49>:
80105ef0:	6a 00                	push   $0x0
80105ef2:	6a 31                	push   $0x31
80105ef4:	e9 8e f9 ff ff       	jmp    80105887 <alltraps>

80105ef9 <vector50>:
80105ef9:	6a 00                	push   $0x0
80105efb:	6a 32                	push   $0x32
80105efd:	e9 85 f9 ff ff       	jmp    80105887 <alltraps>

80105f02 <vector51>:
80105f02:	6a 00                	push   $0x0
80105f04:	6a 33                	push   $0x33
80105f06:	e9 7c f9 ff ff       	jmp    80105887 <alltraps>

80105f0b <vector52>:
80105f0b:	6a 00                	push   $0x0
80105f0d:	6a 34                	push   $0x34
80105f0f:	e9 73 f9 ff ff       	jmp    80105887 <alltraps>

80105f14 <vector53>:
80105f14:	6a 00                	push   $0x0
80105f16:	6a 35                	push   $0x35
80105f18:	e9 6a f9 ff ff       	jmp    80105887 <alltraps>

80105f1d <vector54>:
80105f1d:	6a 00                	push   $0x0
80105f1f:	6a 36                	push   $0x36
80105f21:	e9 61 f9 ff ff       	jmp    80105887 <alltraps>

80105f26 <vector55>:
80105f26:	6a 00                	push   $0x0
80105f28:	6a 37                	push   $0x37
80105f2a:	e9 58 f9 ff ff       	jmp    80105887 <alltraps>

80105f2f <vector56>:
80105f2f:	6a 00                	push   $0x0
80105f31:	6a 38                	push   $0x38
80105f33:	e9 4f f9 ff ff       	jmp    80105887 <alltraps>

80105f38 <vector57>:
80105f38:	6a 00                	push   $0x0
80105f3a:	6a 39                	push   $0x39
80105f3c:	e9 46 f9 ff ff       	jmp    80105887 <alltraps>

80105f41 <vector58>:
80105f41:	6a 00                	push   $0x0
80105f43:	6a 3a                	push   $0x3a
80105f45:	e9 3d f9 ff ff       	jmp    80105887 <alltraps>

80105f4a <vector59>:
80105f4a:	6a 00                	push   $0x0
80105f4c:	6a 3b                	push   $0x3b
80105f4e:	e9 34 f9 ff ff       	jmp    80105887 <alltraps>

80105f53 <vector60>:
80105f53:	6a 00                	push   $0x0
80105f55:	6a 3c                	push   $0x3c
80105f57:	e9 2b f9 ff ff       	jmp    80105887 <alltraps>

80105f5c <vector61>:
80105f5c:	6a 00                	push   $0x0
80105f5e:	6a 3d                	push   $0x3d
80105f60:	e9 22 f9 ff ff       	jmp    80105887 <alltraps>

80105f65 <vector62>:
80105f65:	6a 00                	push   $0x0
80105f67:	6a 3e                	push   $0x3e
80105f69:	e9 19 f9 ff ff       	jmp    80105887 <alltraps>

80105f6e <vector63>:
80105f6e:	6a 00                	push   $0x0
80105f70:	6a 3f                	push   $0x3f
80105f72:	e9 10 f9 ff ff       	jmp    80105887 <alltraps>

80105f77 <vector64>:
80105f77:	6a 00                	push   $0x0
80105f79:	6a 40                	push   $0x40
80105f7b:	e9 07 f9 ff ff       	jmp    80105887 <alltraps>

80105f80 <vector65>:
80105f80:	6a 00                	push   $0x0
80105f82:	6a 41                	push   $0x41
80105f84:	e9 fe f8 ff ff       	jmp    80105887 <alltraps>

80105f89 <vector66>:
80105f89:	6a 00                	push   $0x0
80105f8b:	6a 42                	push   $0x42
80105f8d:	e9 f5 f8 ff ff       	jmp    80105887 <alltraps>

80105f92 <vector67>:
80105f92:	6a 00                	push   $0x0
80105f94:	6a 43                	push   $0x43
80105f96:	e9 ec f8 ff ff       	jmp    80105887 <alltraps>

80105f9b <vector68>:
80105f9b:	6a 00                	push   $0x0
80105f9d:	6a 44                	push   $0x44
80105f9f:	e9 e3 f8 ff ff       	jmp    80105887 <alltraps>

80105fa4 <vector69>:
80105fa4:	6a 00                	push   $0x0
80105fa6:	6a 45                	push   $0x45
80105fa8:	e9 da f8 ff ff       	jmp    80105887 <alltraps>

80105fad <vector70>:
80105fad:	6a 00                	push   $0x0
80105faf:	6a 46                	push   $0x46
80105fb1:	e9 d1 f8 ff ff       	jmp    80105887 <alltraps>

80105fb6 <vector71>:
80105fb6:	6a 00                	push   $0x0
80105fb8:	6a 47                	push   $0x47
80105fba:	e9 c8 f8 ff ff       	jmp    80105887 <alltraps>

80105fbf <vector72>:
80105fbf:	6a 00                	push   $0x0
80105fc1:	6a 48                	push   $0x48
80105fc3:	e9 bf f8 ff ff       	jmp    80105887 <alltraps>

80105fc8 <vector73>:
80105fc8:	6a 00                	push   $0x0
80105fca:	6a 49                	push   $0x49
80105fcc:	e9 b6 f8 ff ff       	jmp    80105887 <alltraps>

80105fd1 <vector74>:
80105fd1:	6a 00                	push   $0x0
80105fd3:	6a 4a                	push   $0x4a
80105fd5:	e9 ad f8 ff ff       	jmp    80105887 <alltraps>

80105fda <vector75>:
80105fda:	6a 00                	push   $0x0
80105fdc:	6a 4b                	push   $0x4b
80105fde:	e9 a4 f8 ff ff       	jmp    80105887 <alltraps>

80105fe3 <vector76>:
80105fe3:	6a 00                	push   $0x0
80105fe5:	6a 4c                	push   $0x4c
80105fe7:	e9 9b f8 ff ff       	jmp    80105887 <alltraps>

80105fec <vector77>:
80105fec:	6a 00                	push   $0x0
80105fee:	6a 4d                	push   $0x4d
80105ff0:	e9 92 f8 ff ff       	jmp    80105887 <alltraps>

80105ff5 <vector78>:
80105ff5:	6a 00                	push   $0x0
80105ff7:	6a 4e                	push   $0x4e
80105ff9:	e9 89 f8 ff ff       	jmp    80105887 <alltraps>

80105ffe <vector79>:
80105ffe:	6a 00                	push   $0x0
80106000:	6a 4f                	push   $0x4f
80106002:	e9 80 f8 ff ff       	jmp    80105887 <alltraps>

80106007 <vector80>:
80106007:	6a 00                	push   $0x0
80106009:	6a 50                	push   $0x50
8010600b:	e9 77 f8 ff ff       	jmp    80105887 <alltraps>

80106010 <vector81>:
80106010:	6a 00                	push   $0x0
80106012:	6a 51                	push   $0x51
80106014:	e9 6e f8 ff ff       	jmp    80105887 <alltraps>

80106019 <vector82>:
80106019:	6a 00                	push   $0x0
8010601b:	6a 52                	push   $0x52
8010601d:	e9 65 f8 ff ff       	jmp    80105887 <alltraps>

80106022 <vector83>:
80106022:	6a 00                	push   $0x0
80106024:	6a 53                	push   $0x53
80106026:	e9 5c f8 ff ff       	jmp    80105887 <alltraps>

8010602b <vector84>:
8010602b:	6a 00                	push   $0x0
8010602d:	6a 54                	push   $0x54
8010602f:	e9 53 f8 ff ff       	jmp    80105887 <alltraps>

80106034 <vector85>:
80106034:	6a 00                	push   $0x0
80106036:	6a 55                	push   $0x55
80106038:	e9 4a f8 ff ff       	jmp    80105887 <alltraps>

8010603d <vector86>:
8010603d:	6a 00                	push   $0x0
8010603f:	6a 56                	push   $0x56
80106041:	e9 41 f8 ff ff       	jmp    80105887 <alltraps>

80106046 <vector87>:
80106046:	6a 00                	push   $0x0
80106048:	6a 57                	push   $0x57
8010604a:	e9 38 f8 ff ff       	jmp    80105887 <alltraps>

8010604f <vector88>:
8010604f:	6a 00                	push   $0x0
80106051:	6a 58                	push   $0x58
80106053:	e9 2f f8 ff ff       	jmp    80105887 <alltraps>

80106058 <vector89>:
80106058:	6a 00                	push   $0x0
8010605a:	6a 59                	push   $0x59
8010605c:	e9 26 f8 ff ff       	jmp    80105887 <alltraps>

80106061 <vector90>:
80106061:	6a 00                	push   $0x0
80106063:	6a 5a                	push   $0x5a
80106065:	e9 1d f8 ff ff       	jmp    80105887 <alltraps>

8010606a <vector91>:
8010606a:	6a 00                	push   $0x0
8010606c:	6a 5b                	push   $0x5b
8010606e:	e9 14 f8 ff ff       	jmp    80105887 <alltraps>

80106073 <vector92>:
80106073:	6a 00                	push   $0x0
80106075:	6a 5c                	push   $0x5c
80106077:	e9 0b f8 ff ff       	jmp    80105887 <alltraps>

8010607c <vector93>:
8010607c:	6a 00                	push   $0x0
8010607e:	6a 5d                	push   $0x5d
80106080:	e9 02 f8 ff ff       	jmp    80105887 <alltraps>

80106085 <vector94>:
80106085:	6a 00                	push   $0x0
80106087:	6a 5e                	push   $0x5e
80106089:	e9 f9 f7 ff ff       	jmp    80105887 <alltraps>

8010608e <vector95>:
8010608e:	6a 00                	push   $0x0
80106090:	6a 5f                	push   $0x5f
80106092:	e9 f0 f7 ff ff       	jmp    80105887 <alltraps>

80106097 <vector96>:
80106097:	6a 00                	push   $0x0
80106099:	6a 60                	push   $0x60
8010609b:	e9 e7 f7 ff ff       	jmp    80105887 <alltraps>

801060a0 <vector97>:
801060a0:	6a 00                	push   $0x0
801060a2:	6a 61                	push   $0x61
801060a4:	e9 de f7 ff ff       	jmp    80105887 <alltraps>

801060a9 <vector98>:
801060a9:	6a 00                	push   $0x0
801060ab:	6a 62                	push   $0x62
801060ad:	e9 d5 f7 ff ff       	jmp    80105887 <alltraps>

801060b2 <vector99>:
801060b2:	6a 00                	push   $0x0
801060b4:	6a 63                	push   $0x63
801060b6:	e9 cc f7 ff ff       	jmp    80105887 <alltraps>

801060bb <vector100>:
801060bb:	6a 00                	push   $0x0
801060bd:	6a 64                	push   $0x64
801060bf:	e9 c3 f7 ff ff       	jmp    80105887 <alltraps>

801060c4 <vector101>:
801060c4:	6a 00                	push   $0x0
801060c6:	6a 65                	push   $0x65
801060c8:	e9 ba f7 ff ff       	jmp    80105887 <alltraps>

801060cd <vector102>:
801060cd:	6a 00                	push   $0x0
801060cf:	6a 66                	push   $0x66
801060d1:	e9 b1 f7 ff ff       	jmp    80105887 <alltraps>

801060d6 <vector103>:
801060d6:	6a 00                	push   $0x0
801060d8:	6a 67                	push   $0x67
801060da:	e9 a8 f7 ff ff       	jmp    80105887 <alltraps>

801060df <vector104>:
801060df:	6a 00                	push   $0x0
801060e1:	6a 68                	push   $0x68
801060e3:	e9 9f f7 ff ff       	jmp    80105887 <alltraps>

801060e8 <vector105>:
801060e8:	6a 00                	push   $0x0
801060ea:	6a 69                	push   $0x69
801060ec:	e9 96 f7 ff ff       	jmp    80105887 <alltraps>

801060f1 <vector106>:
801060f1:	6a 00                	push   $0x0
801060f3:	6a 6a                	push   $0x6a
801060f5:	e9 8d f7 ff ff       	jmp    80105887 <alltraps>

801060fa <vector107>:
801060fa:	6a 00                	push   $0x0
801060fc:	6a 6b                	push   $0x6b
801060fe:	e9 84 f7 ff ff       	jmp    80105887 <alltraps>

80106103 <vector108>:
80106103:	6a 00                	push   $0x0
80106105:	6a 6c                	push   $0x6c
80106107:	e9 7b f7 ff ff       	jmp    80105887 <alltraps>

8010610c <vector109>:
8010610c:	6a 00                	push   $0x0
8010610e:	6a 6d                	push   $0x6d
80106110:	e9 72 f7 ff ff       	jmp    80105887 <alltraps>

80106115 <vector110>:
80106115:	6a 00                	push   $0x0
80106117:	6a 6e                	push   $0x6e
80106119:	e9 69 f7 ff ff       	jmp    80105887 <alltraps>

8010611e <vector111>:
8010611e:	6a 00                	push   $0x0
80106120:	6a 6f                	push   $0x6f
80106122:	e9 60 f7 ff ff       	jmp    80105887 <alltraps>

80106127 <vector112>:
80106127:	6a 00                	push   $0x0
80106129:	6a 70                	push   $0x70
8010612b:	e9 57 f7 ff ff       	jmp    80105887 <alltraps>

80106130 <vector113>:
80106130:	6a 00                	push   $0x0
80106132:	6a 71                	push   $0x71
80106134:	e9 4e f7 ff ff       	jmp    80105887 <alltraps>

80106139 <vector114>:
80106139:	6a 00                	push   $0x0
8010613b:	6a 72                	push   $0x72
8010613d:	e9 45 f7 ff ff       	jmp    80105887 <alltraps>

80106142 <vector115>:
80106142:	6a 00                	push   $0x0
80106144:	6a 73                	push   $0x73
80106146:	e9 3c f7 ff ff       	jmp    80105887 <alltraps>

8010614b <vector116>:
8010614b:	6a 00                	push   $0x0
8010614d:	6a 74                	push   $0x74
8010614f:	e9 33 f7 ff ff       	jmp    80105887 <alltraps>

80106154 <vector117>:
80106154:	6a 00                	push   $0x0
80106156:	6a 75                	push   $0x75
80106158:	e9 2a f7 ff ff       	jmp    80105887 <alltraps>

8010615d <vector118>:
8010615d:	6a 00                	push   $0x0
8010615f:	6a 76                	push   $0x76
80106161:	e9 21 f7 ff ff       	jmp    80105887 <alltraps>

80106166 <vector119>:
80106166:	6a 00                	push   $0x0
80106168:	6a 77                	push   $0x77
8010616a:	e9 18 f7 ff ff       	jmp    80105887 <alltraps>

8010616f <vector120>:
8010616f:	6a 00                	push   $0x0
80106171:	6a 78                	push   $0x78
80106173:	e9 0f f7 ff ff       	jmp    80105887 <alltraps>

80106178 <vector121>:
80106178:	6a 00                	push   $0x0
8010617a:	6a 79                	push   $0x79
8010617c:	e9 06 f7 ff ff       	jmp    80105887 <alltraps>

80106181 <vector122>:
80106181:	6a 00                	push   $0x0
80106183:	6a 7a                	push   $0x7a
80106185:	e9 fd f6 ff ff       	jmp    80105887 <alltraps>

8010618a <vector123>:
8010618a:	6a 00                	push   $0x0
8010618c:	6a 7b                	push   $0x7b
8010618e:	e9 f4 f6 ff ff       	jmp    80105887 <alltraps>

80106193 <vector124>:
80106193:	6a 00                	push   $0x0
80106195:	6a 7c                	push   $0x7c
80106197:	e9 eb f6 ff ff       	jmp    80105887 <alltraps>

8010619c <vector125>:
8010619c:	6a 00                	push   $0x0
8010619e:	6a 7d                	push   $0x7d
801061a0:	e9 e2 f6 ff ff       	jmp    80105887 <alltraps>

801061a5 <vector126>:
801061a5:	6a 00                	push   $0x0
801061a7:	6a 7e                	push   $0x7e
801061a9:	e9 d9 f6 ff ff       	jmp    80105887 <alltraps>

801061ae <vector127>:
801061ae:	6a 00                	push   $0x0
801061b0:	6a 7f                	push   $0x7f
801061b2:	e9 d0 f6 ff ff       	jmp    80105887 <alltraps>

801061b7 <vector128>:
801061b7:	6a 00                	push   $0x0
801061b9:	68 80 00 00 00       	push   $0x80
801061be:	e9 c4 f6 ff ff       	jmp    80105887 <alltraps>

801061c3 <vector129>:
801061c3:	6a 00                	push   $0x0
801061c5:	68 81 00 00 00       	push   $0x81
801061ca:	e9 b8 f6 ff ff       	jmp    80105887 <alltraps>

801061cf <vector130>:
801061cf:	6a 00                	push   $0x0
801061d1:	68 82 00 00 00       	push   $0x82
801061d6:	e9 ac f6 ff ff       	jmp    80105887 <alltraps>

801061db <vector131>:
801061db:	6a 00                	push   $0x0
801061dd:	68 83 00 00 00       	push   $0x83
801061e2:	e9 a0 f6 ff ff       	jmp    80105887 <alltraps>

801061e7 <vector132>:
801061e7:	6a 00                	push   $0x0
801061e9:	68 84 00 00 00       	push   $0x84
801061ee:	e9 94 f6 ff ff       	jmp    80105887 <alltraps>

801061f3 <vector133>:
801061f3:	6a 00                	push   $0x0
801061f5:	68 85 00 00 00       	push   $0x85
801061fa:	e9 88 f6 ff ff       	jmp    80105887 <alltraps>

801061ff <vector134>:
801061ff:	6a 00                	push   $0x0
80106201:	68 86 00 00 00       	push   $0x86
80106206:	e9 7c f6 ff ff       	jmp    80105887 <alltraps>

8010620b <vector135>:
8010620b:	6a 00                	push   $0x0
8010620d:	68 87 00 00 00       	push   $0x87
80106212:	e9 70 f6 ff ff       	jmp    80105887 <alltraps>

80106217 <vector136>:
80106217:	6a 00                	push   $0x0
80106219:	68 88 00 00 00       	push   $0x88
8010621e:	e9 64 f6 ff ff       	jmp    80105887 <alltraps>

80106223 <vector137>:
80106223:	6a 00                	push   $0x0
80106225:	68 89 00 00 00       	push   $0x89
8010622a:	e9 58 f6 ff ff       	jmp    80105887 <alltraps>

8010622f <vector138>:
8010622f:	6a 00                	push   $0x0
80106231:	68 8a 00 00 00       	push   $0x8a
80106236:	e9 4c f6 ff ff       	jmp    80105887 <alltraps>

8010623b <vector139>:
8010623b:	6a 00                	push   $0x0
8010623d:	68 8b 00 00 00       	push   $0x8b
80106242:	e9 40 f6 ff ff       	jmp    80105887 <alltraps>

80106247 <vector140>:
80106247:	6a 00                	push   $0x0
80106249:	68 8c 00 00 00       	push   $0x8c
8010624e:	e9 34 f6 ff ff       	jmp    80105887 <alltraps>

80106253 <vector141>:
80106253:	6a 00                	push   $0x0
80106255:	68 8d 00 00 00       	push   $0x8d
8010625a:	e9 28 f6 ff ff       	jmp    80105887 <alltraps>

8010625f <vector142>:
8010625f:	6a 00                	push   $0x0
80106261:	68 8e 00 00 00       	push   $0x8e
80106266:	e9 1c f6 ff ff       	jmp    80105887 <alltraps>

8010626b <vector143>:
8010626b:	6a 00                	push   $0x0
8010626d:	68 8f 00 00 00       	push   $0x8f
80106272:	e9 10 f6 ff ff       	jmp    80105887 <alltraps>

80106277 <vector144>:
80106277:	6a 00                	push   $0x0
80106279:	68 90 00 00 00       	push   $0x90
8010627e:	e9 04 f6 ff ff       	jmp    80105887 <alltraps>

80106283 <vector145>:
80106283:	6a 00                	push   $0x0
80106285:	68 91 00 00 00       	push   $0x91
8010628a:	e9 f8 f5 ff ff       	jmp    80105887 <alltraps>

8010628f <vector146>:
8010628f:	6a 00                	push   $0x0
80106291:	68 92 00 00 00       	push   $0x92
80106296:	e9 ec f5 ff ff       	jmp    80105887 <alltraps>

8010629b <vector147>:
8010629b:	6a 00                	push   $0x0
8010629d:	68 93 00 00 00       	push   $0x93
801062a2:	e9 e0 f5 ff ff       	jmp    80105887 <alltraps>

801062a7 <vector148>:
801062a7:	6a 00                	push   $0x0
801062a9:	68 94 00 00 00       	push   $0x94
801062ae:	e9 d4 f5 ff ff       	jmp    80105887 <alltraps>

801062b3 <vector149>:
801062b3:	6a 00                	push   $0x0
801062b5:	68 95 00 00 00       	push   $0x95
801062ba:	e9 c8 f5 ff ff       	jmp    80105887 <alltraps>

801062bf <vector150>:
801062bf:	6a 00                	push   $0x0
801062c1:	68 96 00 00 00       	push   $0x96
801062c6:	e9 bc f5 ff ff       	jmp    80105887 <alltraps>

801062cb <vector151>:
801062cb:	6a 00                	push   $0x0
801062cd:	68 97 00 00 00       	push   $0x97
801062d2:	e9 b0 f5 ff ff       	jmp    80105887 <alltraps>

801062d7 <vector152>:
801062d7:	6a 00                	push   $0x0
801062d9:	68 98 00 00 00       	push   $0x98
801062de:	e9 a4 f5 ff ff       	jmp    80105887 <alltraps>

801062e3 <vector153>:
801062e3:	6a 00                	push   $0x0
801062e5:	68 99 00 00 00       	push   $0x99
801062ea:	e9 98 f5 ff ff       	jmp    80105887 <alltraps>

801062ef <vector154>:
801062ef:	6a 00                	push   $0x0
801062f1:	68 9a 00 00 00       	push   $0x9a
801062f6:	e9 8c f5 ff ff       	jmp    80105887 <alltraps>

801062fb <vector155>:
801062fb:	6a 00                	push   $0x0
801062fd:	68 9b 00 00 00       	push   $0x9b
80106302:	e9 80 f5 ff ff       	jmp    80105887 <alltraps>

80106307 <vector156>:
80106307:	6a 00                	push   $0x0
80106309:	68 9c 00 00 00       	push   $0x9c
8010630e:	e9 74 f5 ff ff       	jmp    80105887 <alltraps>

80106313 <vector157>:
80106313:	6a 00                	push   $0x0
80106315:	68 9d 00 00 00       	push   $0x9d
8010631a:	e9 68 f5 ff ff       	jmp    80105887 <alltraps>

8010631f <vector158>:
8010631f:	6a 00                	push   $0x0
80106321:	68 9e 00 00 00       	push   $0x9e
80106326:	e9 5c f5 ff ff       	jmp    80105887 <alltraps>

8010632b <vector159>:
8010632b:	6a 00                	push   $0x0
8010632d:	68 9f 00 00 00       	push   $0x9f
80106332:	e9 50 f5 ff ff       	jmp    80105887 <alltraps>

80106337 <vector160>:
80106337:	6a 00                	push   $0x0
80106339:	68 a0 00 00 00       	push   $0xa0
8010633e:	e9 44 f5 ff ff       	jmp    80105887 <alltraps>

80106343 <vector161>:
80106343:	6a 00                	push   $0x0
80106345:	68 a1 00 00 00       	push   $0xa1
8010634a:	e9 38 f5 ff ff       	jmp    80105887 <alltraps>

8010634f <vector162>:
8010634f:	6a 00                	push   $0x0
80106351:	68 a2 00 00 00       	push   $0xa2
80106356:	e9 2c f5 ff ff       	jmp    80105887 <alltraps>

8010635b <vector163>:
8010635b:	6a 00                	push   $0x0
8010635d:	68 a3 00 00 00       	push   $0xa3
80106362:	e9 20 f5 ff ff       	jmp    80105887 <alltraps>

80106367 <vector164>:
80106367:	6a 00                	push   $0x0
80106369:	68 a4 00 00 00       	push   $0xa4
8010636e:	e9 14 f5 ff ff       	jmp    80105887 <alltraps>

80106373 <vector165>:
80106373:	6a 00                	push   $0x0
80106375:	68 a5 00 00 00       	push   $0xa5
8010637a:	e9 08 f5 ff ff       	jmp    80105887 <alltraps>

8010637f <vector166>:
8010637f:	6a 00                	push   $0x0
80106381:	68 a6 00 00 00       	push   $0xa6
80106386:	e9 fc f4 ff ff       	jmp    80105887 <alltraps>

8010638b <vector167>:
8010638b:	6a 00                	push   $0x0
8010638d:	68 a7 00 00 00       	push   $0xa7
80106392:	e9 f0 f4 ff ff       	jmp    80105887 <alltraps>

80106397 <vector168>:
80106397:	6a 00                	push   $0x0
80106399:	68 a8 00 00 00       	push   $0xa8
8010639e:	e9 e4 f4 ff ff       	jmp    80105887 <alltraps>

801063a3 <vector169>:
801063a3:	6a 00                	push   $0x0
801063a5:	68 a9 00 00 00       	push   $0xa9
801063aa:	e9 d8 f4 ff ff       	jmp    80105887 <alltraps>

801063af <vector170>:
801063af:	6a 00                	push   $0x0
801063b1:	68 aa 00 00 00       	push   $0xaa
801063b6:	e9 cc f4 ff ff       	jmp    80105887 <alltraps>

801063bb <vector171>:
801063bb:	6a 00                	push   $0x0
801063bd:	68 ab 00 00 00       	push   $0xab
801063c2:	e9 c0 f4 ff ff       	jmp    80105887 <alltraps>

801063c7 <vector172>:
801063c7:	6a 00                	push   $0x0
801063c9:	68 ac 00 00 00       	push   $0xac
801063ce:	e9 b4 f4 ff ff       	jmp    80105887 <alltraps>

801063d3 <vector173>:
801063d3:	6a 00                	push   $0x0
801063d5:	68 ad 00 00 00       	push   $0xad
801063da:	e9 a8 f4 ff ff       	jmp    80105887 <alltraps>

801063df <vector174>:
801063df:	6a 00                	push   $0x0
801063e1:	68 ae 00 00 00       	push   $0xae
801063e6:	e9 9c f4 ff ff       	jmp    80105887 <alltraps>

801063eb <vector175>:
801063eb:	6a 00                	push   $0x0
801063ed:	68 af 00 00 00       	push   $0xaf
801063f2:	e9 90 f4 ff ff       	jmp    80105887 <alltraps>

801063f7 <vector176>:
801063f7:	6a 00                	push   $0x0
801063f9:	68 b0 00 00 00       	push   $0xb0
801063fe:	e9 84 f4 ff ff       	jmp    80105887 <alltraps>

80106403 <vector177>:
80106403:	6a 00                	push   $0x0
80106405:	68 b1 00 00 00       	push   $0xb1
8010640a:	e9 78 f4 ff ff       	jmp    80105887 <alltraps>

8010640f <vector178>:
8010640f:	6a 00                	push   $0x0
80106411:	68 b2 00 00 00       	push   $0xb2
80106416:	e9 6c f4 ff ff       	jmp    80105887 <alltraps>

8010641b <vector179>:
8010641b:	6a 00                	push   $0x0
8010641d:	68 b3 00 00 00       	push   $0xb3
80106422:	e9 60 f4 ff ff       	jmp    80105887 <alltraps>

80106427 <vector180>:
80106427:	6a 00                	push   $0x0
80106429:	68 b4 00 00 00       	push   $0xb4
8010642e:	e9 54 f4 ff ff       	jmp    80105887 <alltraps>

80106433 <vector181>:
80106433:	6a 00                	push   $0x0
80106435:	68 b5 00 00 00       	push   $0xb5
8010643a:	e9 48 f4 ff ff       	jmp    80105887 <alltraps>

8010643f <vector182>:
8010643f:	6a 00                	push   $0x0
80106441:	68 b6 00 00 00       	push   $0xb6
80106446:	e9 3c f4 ff ff       	jmp    80105887 <alltraps>

8010644b <vector183>:
8010644b:	6a 00                	push   $0x0
8010644d:	68 b7 00 00 00       	push   $0xb7
80106452:	e9 30 f4 ff ff       	jmp    80105887 <alltraps>

80106457 <vector184>:
80106457:	6a 00                	push   $0x0
80106459:	68 b8 00 00 00       	push   $0xb8
8010645e:	e9 24 f4 ff ff       	jmp    80105887 <alltraps>

80106463 <vector185>:
80106463:	6a 00                	push   $0x0
80106465:	68 b9 00 00 00       	push   $0xb9
8010646a:	e9 18 f4 ff ff       	jmp    80105887 <alltraps>

8010646f <vector186>:
8010646f:	6a 00                	push   $0x0
80106471:	68 ba 00 00 00       	push   $0xba
80106476:	e9 0c f4 ff ff       	jmp    80105887 <alltraps>

8010647b <vector187>:
8010647b:	6a 00                	push   $0x0
8010647d:	68 bb 00 00 00       	push   $0xbb
80106482:	e9 00 f4 ff ff       	jmp    80105887 <alltraps>

80106487 <vector188>:
80106487:	6a 00                	push   $0x0
80106489:	68 bc 00 00 00       	push   $0xbc
8010648e:	e9 f4 f3 ff ff       	jmp    80105887 <alltraps>

80106493 <vector189>:
80106493:	6a 00                	push   $0x0
80106495:	68 bd 00 00 00       	push   $0xbd
8010649a:	e9 e8 f3 ff ff       	jmp    80105887 <alltraps>

8010649f <vector190>:
8010649f:	6a 00                	push   $0x0
801064a1:	68 be 00 00 00       	push   $0xbe
801064a6:	e9 dc f3 ff ff       	jmp    80105887 <alltraps>

801064ab <vector191>:
801064ab:	6a 00                	push   $0x0
801064ad:	68 bf 00 00 00       	push   $0xbf
801064b2:	e9 d0 f3 ff ff       	jmp    80105887 <alltraps>

801064b7 <vector192>:
801064b7:	6a 00                	push   $0x0
801064b9:	68 c0 00 00 00       	push   $0xc0
801064be:	e9 c4 f3 ff ff       	jmp    80105887 <alltraps>

801064c3 <vector193>:
801064c3:	6a 00                	push   $0x0
801064c5:	68 c1 00 00 00       	push   $0xc1
801064ca:	e9 b8 f3 ff ff       	jmp    80105887 <alltraps>

801064cf <vector194>:
801064cf:	6a 00                	push   $0x0
801064d1:	68 c2 00 00 00       	push   $0xc2
801064d6:	e9 ac f3 ff ff       	jmp    80105887 <alltraps>

801064db <vector195>:
801064db:	6a 00                	push   $0x0
801064dd:	68 c3 00 00 00       	push   $0xc3
801064e2:	e9 a0 f3 ff ff       	jmp    80105887 <alltraps>

801064e7 <vector196>:
801064e7:	6a 00                	push   $0x0
801064e9:	68 c4 00 00 00       	push   $0xc4
801064ee:	e9 94 f3 ff ff       	jmp    80105887 <alltraps>

801064f3 <vector197>:
801064f3:	6a 00                	push   $0x0
801064f5:	68 c5 00 00 00       	push   $0xc5
801064fa:	e9 88 f3 ff ff       	jmp    80105887 <alltraps>

801064ff <vector198>:
801064ff:	6a 00                	push   $0x0
80106501:	68 c6 00 00 00       	push   $0xc6
80106506:	e9 7c f3 ff ff       	jmp    80105887 <alltraps>

8010650b <vector199>:
8010650b:	6a 00                	push   $0x0
8010650d:	68 c7 00 00 00       	push   $0xc7
80106512:	e9 70 f3 ff ff       	jmp    80105887 <alltraps>

80106517 <vector200>:
80106517:	6a 00                	push   $0x0
80106519:	68 c8 00 00 00       	push   $0xc8
8010651e:	e9 64 f3 ff ff       	jmp    80105887 <alltraps>

80106523 <vector201>:
80106523:	6a 00                	push   $0x0
80106525:	68 c9 00 00 00       	push   $0xc9
8010652a:	e9 58 f3 ff ff       	jmp    80105887 <alltraps>

8010652f <vector202>:
8010652f:	6a 00                	push   $0x0
80106531:	68 ca 00 00 00       	push   $0xca
80106536:	e9 4c f3 ff ff       	jmp    80105887 <alltraps>

8010653b <vector203>:
8010653b:	6a 00                	push   $0x0
8010653d:	68 cb 00 00 00       	push   $0xcb
80106542:	e9 40 f3 ff ff       	jmp    80105887 <alltraps>

80106547 <vector204>:
80106547:	6a 00                	push   $0x0
80106549:	68 cc 00 00 00       	push   $0xcc
8010654e:	e9 34 f3 ff ff       	jmp    80105887 <alltraps>

80106553 <vector205>:
80106553:	6a 00                	push   $0x0
80106555:	68 cd 00 00 00       	push   $0xcd
8010655a:	e9 28 f3 ff ff       	jmp    80105887 <alltraps>

8010655f <vector206>:
8010655f:	6a 00                	push   $0x0
80106561:	68 ce 00 00 00       	push   $0xce
80106566:	e9 1c f3 ff ff       	jmp    80105887 <alltraps>

8010656b <vector207>:
8010656b:	6a 00                	push   $0x0
8010656d:	68 cf 00 00 00       	push   $0xcf
80106572:	e9 10 f3 ff ff       	jmp    80105887 <alltraps>

80106577 <vector208>:
80106577:	6a 00                	push   $0x0
80106579:	68 d0 00 00 00       	push   $0xd0
8010657e:	e9 04 f3 ff ff       	jmp    80105887 <alltraps>

80106583 <vector209>:
80106583:	6a 00                	push   $0x0
80106585:	68 d1 00 00 00       	push   $0xd1
8010658a:	e9 f8 f2 ff ff       	jmp    80105887 <alltraps>

8010658f <vector210>:
8010658f:	6a 00                	push   $0x0
80106591:	68 d2 00 00 00       	push   $0xd2
80106596:	e9 ec f2 ff ff       	jmp    80105887 <alltraps>

8010659b <vector211>:
8010659b:	6a 00                	push   $0x0
8010659d:	68 d3 00 00 00       	push   $0xd3
801065a2:	e9 e0 f2 ff ff       	jmp    80105887 <alltraps>

801065a7 <vector212>:
801065a7:	6a 00                	push   $0x0
801065a9:	68 d4 00 00 00       	push   $0xd4
801065ae:	e9 d4 f2 ff ff       	jmp    80105887 <alltraps>

801065b3 <vector213>:
801065b3:	6a 00                	push   $0x0
801065b5:	68 d5 00 00 00       	push   $0xd5
801065ba:	e9 c8 f2 ff ff       	jmp    80105887 <alltraps>

801065bf <vector214>:
801065bf:	6a 00                	push   $0x0
801065c1:	68 d6 00 00 00       	push   $0xd6
801065c6:	e9 bc f2 ff ff       	jmp    80105887 <alltraps>

801065cb <vector215>:
801065cb:	6a 00                	push   $0x0
801065cd:	68 d7 00 00 00       	push   $0xd7
801065d2:	e9 b0 f2 ff ff       	jmp    80105887 <alltraps>

801065d7 <vector216>:
801065d7:	6a 00                	push   $0x0
801065d9:	68 d8 00 00 00       	push   $0xd8
801065de:	e9 a4 f2 ff ff       	jmp    80105887 <alltraps>

801065e3 <vector217>:
801065e3:	6a 00                	push   $0x0
801065e5:	68 d9 00 00 00       	push   $0xd9
801065ea:	e9 98 f2 ff ff       	jmp    80105887 <alltraps>

801065ef <vector218>:
801065ef:	6a 00                	push   $0x0
801065f1:	68 da 00 00 00       	push   $0xda
801065f6:	e9 8c f2 ff ff       	jmp    80105887 <alltraps>

801065fb <vector219>:
801065fb:	6a 00                	push   $0x0
801065fd:	68 db 00 00 00       	push   $0xdb
80106602:	e9 80 f2 ff ff       	jmp    80105887 <alltraps>

80106607 <vector220>:
80106607:	6a 00                	push   $0x0
80106609:	68 dc 00 00 00       	push   $0xdc
8010660e:	e9 74 f2 ff ff       	jmp    80105887 <alltraps>

80106613 <vector221>:
80106613:	6a 00                	push   $0x0
80106615:	68 dd 00 00 00       	push   $0xdd
8010661a:	e9 68 f2 ff ff       	jmp    80105887 <alltraps>

8010661f <vector222>:
8010661f:	6a 00                	push   $0x0
80106621:	68 de 00 00 00       	push   $0xde
80106626:	e9 5c f2 ff ff       	jmp    80105887 <alltraps>

8010662b <vector223>:
8010662b:	6a 00                	push   $0x0
8010662d:	68 df 00 00 00       	push   $0xdf
80106632:	e9 50 f2 ff ff       	jmp    80105887 <alltraps>

80106637 <vector224>:
80106637:	6a 00                	push   $0x0
80106639:	68 e0 00 00 00       	push   $0xe0
8010663e:	e9 44 f2 ff ff       	jmp    80105887 <alltraps>

80106643 <vector225>:
80106643:	6a 00                	push   $0x0
80106645:	68 e1 00 00 00       	push   $0xe1
8010664a:	e9 38 f2 ff ff       	jmp    80105887 <alltraps>

8010664f <vector226>:
8010664f:	6a 00                	push   $0x0
80106651:	68 e2 00 00 00       	push   $0xe2
80106656:	e9 2c f2 ff ff       	jmp    80105887 <alltraps>

8010665b <vector227>:
8010665b:	6a 00                	push   $0x0
8010665d:	68 e3 00 00 00       	push   $0xe3
80106662:	e9 20 f2 ff ff       	jmp    80105887 <alltraps>

80106667 <vector228>:
80106667:	6a 00                	push   $0x0
80106669:	68 e4 00 00 00       	push   $0xe4
8010666e:	e9 14 f2 ff ff       	jmp    80105887 <alltraps>

80106673 <vector229>:
80106673:	6a 00                	push   $0x0
80106675:	68 e5 00 00 00       	push   $0xe5
8010667a:	e9 08 f2 ff ff       	jmp    80105887 <alltraps>

8010667f <vector230>:
8010667f:	6a 00                	push   $0x0
80106681:	68 e6 00 00 00       	push   $0xe6
80106686:	e9 fc f1 ff ff       	jmp    80105887 <alltraps>

8010668b <vector231>:
8010668b:	6a 00                	push   $0x0
8010668d:	68 e7 00 00 00       	push   $0xe7
80106692:	e9 f0 f1 ff ff       	jmp    80105887 <alltraps>

80106697 <vector232>:
80106697:	6a 00                	push   $0x0
80106699:	68 e8 00 00 00       	push   $0xe8
8010669e:	e9 e4 f1 ff ff       	jmp    80105887 <alltraps>

801066a3 <vector233>:
801066a3:	6a 00                	push   $0x0
801066a5:	68 e9 00 00 00       	push   $0xe9
801066aa:	e9 d8 f1 ff ff       	jmp    80105887 <alltraps>

801066af <vector234>:
801066af:	6a 00                	push   $0x0
801066b1:	68 ea 00 00 00       	push   $0xea
801066b6:	e9 cc f1 ff ff       	jmp    80105887 <alltraps>

801066bb <vector235>:
801066bb:	6a 00                	push   $0x0
801066bd:	68 eb 00 00 00       	push   $0xeb
801066c2:	e9 c0 f1 ff ff       	jmp    80105887 <alltraps>

801066c7 <vector236>:
801066c7:	6a 00                	push   $0x0
801066c9:	68 ec 00 00 00       	push   $0xec
801066ce:	e9 b4 f1 ff ff       	jmp    80105887 <alltraps>

801066d3 <vector237>:
801066d3:	6a 00                	push   $0x0
801066d5:	68 ed 00 00 00       	push   $0xed
801066da:	e9 a8 f1 ff ff       	jmp    80105887 <alltraps>

801066df <vector238>:
801066df:	6a 00                	push   $0x0
801066e1:	68 ee 00 00 00       	push   $0xee
801066e6:	e9 9c f1 ff ff       	jmp    80105887 <alltraps>

801066eb <vector239>:
801066eb:	6a 00                	push   $0x0
801066ed:	68 ef 00 00 00       	push   $0xef
801066f2:	e9 90 f1 ff ff       	jmp    80105887 <alltraps>

801066f7 <vector240>:
801066f7:	6a 00                	push   $0x0
801066f9:	68 f0 00 00 00       	push   $0xf0
801066fe:	e9 84 f1 ff ff       	jmp    80105887 <alltraps>

80106703 <vector241>:
80106703:	6a 00                	push   $0x0
80106705:	68 f1 00 00 00       	push   $0xf1
8010670a:	e9 78 f1 ff ff       	jmp    80105887 <alltraps>

8010670f <vector242>:
8010670f:	6a 00                	push   $0x0
80106711:	68 f2 00 00 00       	push   $0xf2
80106716:	e9 6c f1 ff ff       	jmp    80105887 <alltraps>

8010671b <vector243>:
8010671b:	6a 00                	push   $0x0
8010671d:	68 f3 00 00 00       	push   $0xf3
80106722:	e9 60 f1 ff ff       	jmp    80105887 <alltraps>

80106727 <vector244>:
80106727:	6a 00                	push   $0x0
80106729:	68 f4 00 00 00       	push   $0xf4
8010672e:	e9 54 f1 ff ff       	jmp    80105887 <alltraps>

80106733 <vector245>:
80106733:	6a 00                	push   $0x0
80106735:	68 f5 00 00 00       	push   $0xf5
8010673a:	e9 48 f1 ff ff       	jmp    80105887 <alltraps>

8010673f <vector246>:
8010673f:	6a 00                	push   $0x0
80106741:	68 f6 00 00 00       	push   $0xf6
80106746:	e9 3c f1 ff ff       	jmp    80105887 <alltraps>

8010674b <vector247>:
8010674b:	6a 00                	push   $0x0
8010674d:	68 f7 00 00 00       	push   $0xf7
80106752:	e9 30 f1 ff ff       	jmp    80105887 <alltraps>

80106757 <vector248>:
80106757:	6a 00                	push   $0x0
80106759:	68 f8 00 00 00       	push   $0xf8
8010675e:	e9 24 f1 ff ff       	jmp    80105887 <alltraps>

80106763 <vector249>:
80106763:	6a 00                	push   $0x0
80106765:	68 f9 00 00 00       	push   $0xf9
8010676a:	e9 18 f1 ff ff       	jmp    80105887 <alltraps>

8010676f <vector250>:
8010676f:	6a 00                	push   $0x0
80106771:	68 fa 00 00 00       	push   $0xfa
80106776:	e9 0c f1 ff ff       	jmp    80105887 <alltraps>

8010677b <vector251>:
8010677b:	6a 00                	push   $0x0
8010677d:	68 fb 00 00 00       	push   $0xfb
80106782:	e9 00 f1 ff ff       	jmp    80105887 <alltraps>

80106787 <vector252>:
80106787:	6a 00                	push   $0x0
80106789:	68 fc 00 00 00       	push   $0xfc
8010678e:	e9 f4 f0 ff ff       	jmp    80105887 <alltraps>

80106793 <vector253>:
80106793:	6a 00                	push   $0x0
80106795:	68 fd 00 00 00       	push   $0xfd
8010679a:	e9 e8 f0 ff ff       	jmp    80105887 <alltraps>

8010679f <vector254>:
8010679f:	6a 00                	push   $0x0
801067a1:	68 fe 00 00 00       	push   $0xfe
801067a6:	e9 dc f0 ff ff       	jmp    80105887 <alltraps>

801067ab <vector255>:
801067ab:	6a 00                	push   $0x0
801067ad:	68 ff 00 00 00       	push   $0xff
801067b2:	e9 d0 f0 ff ff       	jmp    80105887 <alltraps>
801067b7:	66 90                	xchg   %ax,%ax
801067b9:	66 90                	xchg   %ax,%ax
801067bb:	66 90                	xchg   %ax,%ax
801067bd:	66 90                	xchg   %ax,%ax
801067bf:	90                   	nop

801067c0 <walkpgdir>:
801067c0:	55                   	push   %ebp
801067c1:	89 e5                	mov    %esp,%ebp
801067c3:	57                   	push   %edi
801067c4:	56                   	push   %esi
801067c5:	53                   	push   %ebx
801067c6:	89 d3                	mov    %edx,%ebx
801067c8:	c1 ea 16             	shr    $0x16,%edx
801067cb:	8d 3c 90             	lea    (%eax,%edx,4),%edi
801067ce:	83 ec 0c             	sub    $0xc,%esp
801067d1:	8b 07                	mov    (%edi),%eax
801067d3:	a8 01                	test   $0x1,%al
801067d5:	74 29                	je     80106800 <walkpgdir+0x40>
801067d7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801067dc:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
801067e2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801067e5:	c1 eb 0a             	shr    $0xa,%ebx
801067e8:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
801067ee:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
801067f1:	5b                   	pop    %ebx
801067f2:	5e                   	pop    %esi
801067f3:	5f                   	pop    %edi
801067f4:	5d                   	pop    %ebp
801067f5:	c3                   	ret    
801067f6:	8d 76 00             	lea    0x0(%esi),%esi
801067f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106800:	85 c9                	test   %ecx,%ecx
80106802:	74 2c                	je     80106830 <walkpgdir+0x70>
80106804:	e8 87 bc ff ff       	call   80102490 <kalloc>
80106809:	85 c0                	test   %eax,%eax
8010680b:	89 c6                	mov    %eax,%esi
8010680d:	74 21                	je     80106830 <walkpgdir+0x70>
8010680f:	83 ec 04             	sub    $0x4,%esp
80106812:	68 00 10 00 00       	push   $0x1000
80106817:	6a 00                	push   $0x0
80106819:	50                   	push   %eax
8010681a:	e8 c1 dd ff ff       	call   801045e0 <memset>
8010681f:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106825:	83 c4 10             	add    $0x10,%esp
80106828:	83 c8 07             	or     $0x7,%eax
8010682b:	89 07                	mov    %eax,(%edi)
8010682d:	eb b3                	jmp    801067e2 <walkpgdir+0x22>
8010682f:	90                   	nop
80106830:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106833:	31 c0                	xor    %eax,%eax
80106835:	5b                   	pop    %ebx
80106836:	5e                   	pop    %esi
80106837:	5f                   	pop    %edi
80106838:	5d                   	pop    %ebp
80106839:	c3                   	ret    
8010683a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106840 <mappages>:
80106840:	55                   	push   %ebp
80106841:	89 e5                	mov    %esp,%ebp
80106843:	57                   	push   %edi
80106844:	56                   	push   %esi
80106845:	53                   	push   %ebx
80106846:	89 d3                	mov    %edx,%ebx
80106848:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010684e:	83 ec 1c             	sub    $0x1c,%esp
80106851:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106854:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106858:	8b 7d 08             	mov    0x8(%ebp),%edi
8010685b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106860:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106863:	8b 45 0c             	mov    0xc(%ebp),%eax
80106866:	29 df                	sub    %ebx,%edi
80106868:	83 c8 01             	or     $0x1,%eax
8010686b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010686e:	eb 15                	jmp    80106885 <mappages+0x45>
80106870:	f6 00 01             	testb  $0x1,(%eax)
80106873:	75 45                	jne    801068ba <mappages+0x7a>
80106875:	0b 75 dc             	or     -0x24(%ebp),%esi
80106878:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
8010687b:	89 30                	mov    %esi,(%eax)
8010687d:	74 31                	je     801068b0 <mappages+0x70>
8010687f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106885:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106888:	b9 01 00 00 00       	mov    $0x1,%ecx
8010688d:	89 da                	mov    %ebx,%edx
8010688f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106892:	e8 29 ff ff ff       	call   801067c0 <walkpgdir>
80106897:	85 c0                	test   %eax,%eax
80106899:	75 d5                	jne    80106870 <mappages+0x30>
8010689b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010689e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801068a3:	5b                   	pop    %ebx
801068a4:	5e                   	pop    %esi
801068a5:	5f                   	pop    %edi
801068a6:	5d                   	pop    %ebp
801068a7:	c3                   	ret    
801068a8:	90                   	nop
801068a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801068b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068b3:	31 c0                	xor    %eax,%eax
801068b5:	5b                   	pop    %ebx
801068b6:	5e                   	pop    %esi
801068b7:	5f                   	pop    %edi
801068b8:	5d                   	pop    %ebp
801068b9:	c3                   	ret    
801068ba:	83 ec 0c             	sub    $0xc,%esp
801068bd:	68 10 7b 10 80       	push   $0x80107b10
801068c2:	e8 a9 9a ff ff       	call   80100370 <panic>
801068c7:	89 f6                	mov    %esi,%esi
801068c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068d0 <deallocuvm.part.0>:
801068d0:	55                   	push   %ebp
801068d1:	89 e5                	mov    %esp,%ebp
801068d3:	57                   	push   %edi
801068d4:	56                   	push   %esi
801068d5:	53                   	push   %ebx
801068d6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
801068dc:	89 c7                	mov    %eax,%edi
801068de:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801068e4:	83 ec 1c             	sub    $0x1c,%esp
801068e7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801068ea:	39 d3                	cmp    %edx,%ebx
801068ec:	73 66                	jae    80106954 <deallocuvm.part.0+0x84>
801068ee:	89 d6                	mov    %edx,%esi
801068f0:	eb 3d                	jmp    8010692f <deallocuvm.part.0+0x5f>
801068f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801068f8:	8b 10                	mov    (%eax),%edx
801068fa:	f6 c2 01             	test   $0x1,%dl
801068fd:	74 26                	je     80106925 <deallocuvm.part.0+0x55>
801068ff:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106905:	74 58                	je     8010695f <deallocuvm.part.0+0x8f>
80106907:	83 ec 0c             	sub    $0xc,%esp
8010690a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106910:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106913:	52                   	push   %edx
80106914:	e8 c7 b9 ff ff       	call   801022e0 <kfree>
80106919:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010691c:	83 c4 10             	add    $0x10,%esp
8010691f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80106925:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010692b:	39 f3                	cmp    %esi,%ebx
8010692d:	73 25                	jae    80106954 <deallocuvm.part.0+0x84>
8010692f:	31 c9                	xor    %ecx,%ecx
80106931:	89 da                	mov    %ebx,%edx
80106933:	89 f8                	mov    %edi,%eax
80106935:	e8 86 fe ff ff       	call   801067c0 <walkpgdir>
8010693a:	85 c0                	test   %eax,%eax
8010693c:	75 ba                	jne    801068f8 <deallocuvm.part.0+0x28>
8010693e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106944:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
8010694a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106950:	39 f3                	cmp    %esi,%ebx
80106952:	72 db                	jb     8010692f <deallocuvm.part.0+0x5f>
80106954:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106957:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010695a:	5b                   	pop    %ebx
8010695b:	5e                   	pop    %esi
8010695c:	5f                   	pop    %edi
8010695d:	5d                   	pop    %ebp
8010695e:	c3                   	ret    
8010695f:	83 ec 0c             	sub    $0xc,%esp
80106962:	68 a6 73 10 80       	push   $0x801073a6
80106967:	e8 04 9a ff ff       	call   80100370 <panic>
8010696c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106970 <seginit>:
80106970:	55                   	push   %ebp
80106971:	89 e5                	mov    %esp,%ebp
80106973:	83 ec 18             	sub    $0x18,%esp
80106976:	e8 f5 cd ff ff       	call   80103770 <cpuid>
8010697b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106981:	31 c9                	xor    %ecx,%ecx
80106983:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106988:	66 89 90 d8 28 11 80 	mov    %dx,-0x7feed728(%eax)
8010698f:	66 89 88 da 28 11 80 	mov    %cx,-0x7feed726(%eax)
80106996:	ba ff ff ff ff       	mov    $0xffffffff,%edx
8010699b:	31 c9                	xor    %ecx,%ecx
8010699d:	66 89 90 e0 28 11 80 	mov    %dx,-0x7feed720(%eax)
801069a4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801069a9:	66 89 88 e2 28 11 80 	mov    %cx,-0x7feed71e(%eax)
801069b0:	31 c9                	xor    %ecx,%ecx
801069b2:	66 89 90 e8 28 11 80 	mov    %dx,-0x7feed718(%eax)
801069b9:	66 89 88 ea 28 11 80 	mov    %cx,-0x7feed716(%eax)
801069c0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801069c5:	31 c9                	xor    %ecx,%ecx
801069c7:	66 89 90 f0 28 11 80 	mov    %dx,-0x7feed710(%eax)
801069ce:	c6 80 dc 28 11 80 00 	movb   $0x0,-0x7feed724(%eax)
801069d5:	ba 2f 00 00 00       	mov    $0x2f,%edx
801069da:	c6 80 dd 28 11 80 9a 	movb   $0x9a,-0x7feed723(%eax)
801069e1:	c6 80 de 28 11 80 cf 	movb   $0xcf,-0x7feed722(%eax)
801069e8:	c6 80 df 28 11 80 00 	movb   $0x0,-0x7feed721(%eax)
801069ef:	c6 80 e4 28 11 80 00 	movb   $0x0,-0x7feed71c(%eax)
801069f6:	c6 80 e5 28 11 80 92 	movb   $0x92,-0x7feed71b(%eax)
801069fd:	c6 80 e6 28 11 80 cf 	movb   $0xcf,-0x7feed71a(%eax)
80106a04:	c6 80 e7 28 11 80 00 	movb   $0x0,-0x7feed719(%eax)
80106a0b:	c6 80 ec 28 11 80 00 	movb   $0x0,-0x7feed714(%eax)
80106a12:	c6 80 ed 28 11 80 fa 	movb   $0xfa,-0x7feed713(%eax)
80106a19:	c6 80 ee 28 11 80 cf 	movb   $0xcf,-0x7feed712(%eax)
80106a20:	c6 80 ef 28 11 80 00 	movb   $0x0,-0x7feed711(%eax)
80106a27:	66 89 88 f2 28 11 80 	mov    %cx,-0x7feed70e(%eax)
80106a2e:	c6 80 f4 28 11 80 00 	movb   $0x0,-0x7feed70c(%eax)
80106a35:	c6 80 f5 28 11 80 f2 	movb   $0xf2,-0x7feed70b(%eax)
80106a3c:	c6 80 f6 28 11 80 cf 	movb   $0xcf,-0x7feed70a(%eax)
80106a43:	c6 80 f7 28 11 80 00 	movb   $0x0,-0x7feed709(%eax)
80106a4a:	05 d0 28 11 80       	add    $0x801128d0,%eax
80106a4f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
80106a53:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106a57:	c1 e8 10             	shr    $0x10,%eax
80106a5a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
80106a5e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106a61:	0f 01 10             	lgdtl  (%eax)
80106a64:	c9                   	leave  
80106a65:	c3                   	ret    
80106a66:	8d 76 00             	lea    0x0(%esi),%esi
80106a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a70 <switchkvm>:
80106a70:	a1 64 52 11 80       	mov    0x80115264,%eax
80106a75:	55                   	push   %ebp
80106a76:	89 e5                	mov    %esp,%ebp
80106a78:	05 00 00 00 80       	add    $0x80000000,%eax
80106a7d:	0f 22 d8             	mov    %eax,%cr3
80106a80:	5d                   	pop    %ebp
80106a81:	c3                   	ret    
80106a82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a90 <switchuvm>:
80106a90:	55                   	push   %ebp
80106a91:	89 e5                	mov    %esp,%ebp
80106a93:	57                   	push   %edi
80106a94:	56                   	push   %esi
80106a95:	53                   	push   %ebx
80106a96:	83 ec 1c             	sub    $0x1c,%esp
80106a99:	8b 75 08             	mov    0x8(%ebp),%esi
80106a9c:	85 f6                	test   %esi,%esi
80106a9e:	0f 84 cd 00 00 00    	je     80106b71 <switchuvm+0xe1>
80106aa4:	8b 46 08             	mov    0x8(%esi),%eax
80106aa7:	85 c0                	test   %eax,%eax
80106aa9:	0f 84 dc 00 00 00    	je     80106b8b <switchuvm+0xfb>
80106aaf:	8b 7e 04             	mov    0x4(%esi),%edi
80106ab2:	85 ff                	test   %edi,%edi
80106ab4:	0f 84 c4 00 00 00    	je     80106b7e <switchuvm+0xee>
80106aba:	e8 71 d9 ff ff       	call   80104430 <pushcli>
80106abf:	e8 3c cc ff ff       	call   80103700 <mycpu>
80106ac4:	89 c3                	mov    %eax,%ebx
80106ac6:	e8 35 cc ff ff       	call   80103700 <mycpu>
80106acb:	89 c7                	mov    %eax,%edi
80106acd:	e8 2e cc ff ff       	call   80103700 <mycpu>
80106ad2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106ad5:	83 c7 08             	add    $0x8,%edi
80106ad8:	e8 23 cc ff ff       	call   80103700 <mycpu>
80106add:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106ae0:	83 c0 08             	add    $0x8,%eax
80106ae3:	ba 67 00 00 00       	mov    $0x67,%edx
80106ae8:	c1 e8 18             	shr    $0x18,%eax
80106aeb:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106af2:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106af9:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80106b00:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80106b07:	83 c1 08             	add    $0x8,%ecx
80106b0a:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106b10:	c1 e9 10             	shr    $0x10,%ecx
80106b13:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80106b19:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80106b1e:	e8 dd cb ff ff       	call   80103700 <mycpu>
80106b23:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
80106b2a:	e8 d1 cb ff ff       	call   80103700 <mycpu>
80106b2f:	b9 10 00 00 00       	mov    $0x10,%ecx
80106b34:	66 89 48 10          	mov    %cx,0x10(%eax)
80106b38:	e8 c3 cb ff ff       	call   80103700 <mycpu>
80106b3d:	8b 56 08             	mov    0x8(%esi),%edx
80106b40:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80106b46:	89 48 0c             	mov    %ecx,0xc(%eax)
80106b49:	e8 b2 cb ff ff       	call   80103700 <mycpu>
80106b4e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
80106b52:	b8 28 00 00 00       	mov    $0x28,%eax
80106b57:	0f 00 d8             	ltr    %ax
80106b5a:	8b 46 04             	mov    0x4(%esi),%eax
80106b5d:	05 00 00 00 80       	add    $0x80000000,%eax
80106b62:	0f 22 d8             	mov    %eax,%cr3
80106b65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b68:	5b                   	pop    %ebx
80106b69:	5e                   	pop    %esi
80106b6a:	5f                   	pop    %edi
80106b6b:	5d                   	pop    %ebp
80106b6c:	e9 af d9 ff ff       	jmp    80104520 <popcli>
80106b71:	83 ec 0c             	sub    $0xc,%esp
80106b74:	68 16 7b 10 80       	push   $0x80107b16
80106b79:	e8 f2 97 ff ff       	call   80100370 <panic>
80106b7e:	83 ec 0c             	sub    $0xc,%esp
80106b81:	68 41 7b 10 80       	push   $0x80107b41
80106b86:	e8 e5 97 ff ff       	call   80100370 <panic>
80106b8b:	83 ec 0c             	sub    $0xc,%esp
80106b8e:	68 2c 7b 10 80       	push   $0x80107b2c
80106b93:	e8 d8 97 ff ff       	call   80100370 <panic>
80106b98:	90                   	nop
80106b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106ba0 <inituvm>:
80106ba0:	55                   	push   %ebp
80106ba1:	89 e5                	mov    %esp,%ebp
80106ba3:	57                   	push   %edi
80106ba4:	56                   	push   %esi
80106ba5:	53                   	push   %ebx
80106ba6:	83 ec 1c             	sub    $0x1c,%esp
80106ba9:	8b 75 10             	mov    0x10(%ebp),%esi
80106bac:	8b 45 08             	mov    0x8(%ebp),%eax
80106baf:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106bb2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106bb8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106bbb:	77 49                	ja     80106c06 <inituvm+0x66>
80106bbd:	e8 ce b8 ff ff       	call   80102490 <kalloc>
80106bc2:	83 ec 04             	sub    $0x4,%esp
80106bc5:	89 c3                	mov    %eax,%ebx
80106bc7:	68 00 10 00 00       	push   $0x1000
80106bcc:	6a 00                	push   $0x0
80106bce:	50                   	push   %eax
80106bcf:	e8 0c da ff ff       	call   801045e0 <memset>
80106bd4:	58                   	pop    %eax
80106bd5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106bdb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106be0:	5a                   	pop    %edx
80106be1:	6a 06                	push   $0x6
80106be3:	50                   	push   %eax
80106be4:	31 d2                	xor    %edx,%edx
80106be6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106be9:	e8 52 fc ff ff       	call   80106840 <mappages>
80106bee:	89 75 10             	mov    %esi,0x10(%ebp)
80106bf1:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106bf4:	83 c4 10             	add    $0x10,%esp
80106bf7:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106bfa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106bfd:	5b                   	pop    %ebx
80106bfe:	5e                   	pop    %esi
80106bff:	5f                   	pop    %edi
80106c00:	5d                   	pop    %ebp
80106c01:	e9 8a da ff ff       	jmp    80104690 <memmove>
80106c06:	83 ec 0c             	sub    $0xc,%esp
80106c09:	68 55 7b 10 80       	push   $0x80107b55
80106c0e:	e8 5d 97 ff ff       	call   80100370 <panic>
80106c13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c20 <loaduvm>:
80106c20:	55                   	push   %ebp
80106c21:	89 e5                	mov    %esp,%ebp
80106c23:	57                   	push   %edi
80106c24:	56                   	push   %esi
80106c25:	53                   	push   %ebx
80106c26:	83 ec 0c             	sub    $0xc,%esp
80106c29:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106c30:	0f 85 91 00 00 00    	jne    80106cc7 <loaduvm+0xa7>
80106c36:	8b 75 18             	mov    0x18(%ebp),%esi
80106c39:	31 db                	xor    %ebx,%ebx
80106c3b:	85 f6                	test   %esi,%esi
80106c3d:	75 1a                	jne    80106c59 <loaduvm+0x39>
80106c3f:	eb 6f                	jmp    80106cb0 <loaduvm+0x90>
80106c41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c48:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c4e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106c54:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106c57:	76 57                	jbe    80106cb0 <loaduvm+0x90>
80106c59:	8b 55 0c             	mov    0xc(%ebp),%edx
80106c5c:	8b 45 08             	mov    0x8(%ebp),%eax
80106c5f:	31 c9                	xor    %ecx,%ecx
80106c61:	01 da                	add    %ebx,%edx
80106c63:	e8 58 fb ff ff       	call   801067c0 <walkpgdir>
80106c68:	85 c0                	test   %eax,%eax
80106c6a:	74 4e                	je     80106cba <loaduvm+0x9a>
80106c6c:	8b 00                	mov    (%eax),%eax
80106c6e:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106c71:	bf 00 10 00 00       	mov    $0x1000,%edi
80106c76:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106c7b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106c81:	0f 46 fe             	cmovbe %esi,%edi
80106c84:	01 d9                	add    %ebx,%ecx
80106c86:	05 00 00 00 80       	add    $0x80000000,%eax
80106c8b:	57                   	push   %edi
80106c8c:	51                   	push   %ecx
80106c8d:	50                   	push   %eax
80106c8e:	ff 75 10             	pushl  0x10(%ebp)
80106c91:	e8 ba ac ff ff       	call   80101950 <readi>
80106c96:	83 c4 10             	add    $0x10,%esp
80106c99:	39 c7                	cmp    %eax,%edi
80106c9b:	74 ab                	je     80106c48 <loaduvm+0x28>
80106c9d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ca0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106ca5:	5b                   	pop    %ebx
80106ca6:	5e                   	pop    %esi
80106ca7:	5f                   	pop    %edi
80106ca8:	5d                   	pop    %ebp
80106ca9:	c3                   	ret    
80106caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106cb0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cb3:	31 c0                	xor    %eax,%eax
80106cb5:	5b                   	pop    %ebx
80106cb6:	5e                   	pop    %esi
80106cb7:	5f                   	pop    %edi
80106cb8:	5d                   	pop    %ebp
80106cb9:	c3                   	ret    
80106cba:	83 ec 0c             	sub    $0xc,%esp
80106cbd:	68 6f 7b 10 80       	push   $0x80107b6f
80106cc2:	e8 a9 96 ff ff       	call   80100370 <panic>
80106cc7:	83 ec 0c             	sub    $0xc,%esp
80106cca:	68 10 7c 10 80       	push   $0x80107c10
80106ccf:	e8 9c 96 ff ff       	call   80100370 <panic>
80106cd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106cda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ce0 <allocuvm>:
80106ce0:	55                   	push   %ebp
80106ce1:	89 e5                	mov    %esp,%ebp
80106ce3:	57                   	push   %edi
80106ce4:	56                   	push   %esi
80106ce5:	53                   	push   %ebx
80106ce6:	83 ec 0c             	sub    $0xc,%esp
80106ce9:	8b 7d 10             	mov    0x10(%ebp),%edi
80106cec:	85 ff                	test   %edi,%edi
80106cee:	0f 88 ca 00 00 00    	js     80106dbe <allocuvm+0xde>
80106cf4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106cf7:	8b 45 0c             	mov    0xc(%ebp),%eax
80106cfa:	0f 82 82 00 00 00    	jb     80106d82 <allocuvm+0xa2>
80106d00:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106d06:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106d0c:	39 df                	cmp    %ebx,%edi
80106d0e:	77 43                	ja     80106d53 <allocuvm+0x73>
80106d10:	e9 bb 00 00 00       	jmp    80106dd0 <allocuvm+0xf0>
80106d15:	8d 76 00             	lea    0x0(%esi),%esi
80106d18:	83 ec 04             	sub    $0x4,%esp
80106d1b:	68 00 10 00 00       	push   $0x1000
80106d20:	6a 00                	push   $0x0
80106d22:	50                   	push   %eax
80106d23:	e8 b8 d8 ff ff       	call   801045e0 <memset>
80106d28:	58                   	pop    %eax
80106d29:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106d2f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106d34:	5a                   	pop    %edx
80106d35:	6a 06                	push   $0x6
80106d37:	50                   	push   %eax
80106d38:	89 da                	mov    %ebx,%edx
80106d3a:	8b 45 08             	mov    0x8(%ebp),%eax
80106d3d:	e8 fe fa ff ff       	call   80106840 <mappages>
80106d42:	83 c4 10             	add    $0x10,%esp
80106d45:	85 c0                	test   %eax,%eax
80106d47:	78 47                	js     80106d90 <allocuvm+0xb0>
80106d49:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106d4f:	39 df                	cmp    %ebx,%edi
80106d51:	76 7d                	jbe    80106dd0 <allocuvm+0xf0>
80106d53:	e8 38 b7 ff ff       	call   80102490 <kalloc>
80106d58:	85 c0                	test   %eax,%eax
80106d5a:	89 c6                	mov    %eax,%esi
80106d5c:	75 ba                	jne    80106d18 <allocuvm+0x38>
80106d5e:	83 ec 0c             	sub    $0xc,%esp
80106d61:	68 8d 7b 10 80       	push   $0x80107b8d
80106d66:	e8 f5 98 ff ff       	call   80100660 <cprintf>
80106d6b:	83 c4 10             	add    $0x10,%esp
80106d6e:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106d71:	76 4b                	jbe    80106dbe <allocuvm+0xde>
80106d73:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106d76:	8b 45 08             	mov    0x8(%ebp),%eax
80106d79:	89 fa                	mov    %edi,%edx
80106d7b:	e8 50 fb ff ff       	call   801068d0 <deallocuvm.part.0>
80106d80:	31 c0                	xor    %eax,%eax
80106d82:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d85:	5b                   	pop    %ebx
80106d86:	5e                   	pop    %esi
80106d87:	5f                   	pop    %edi
80106d88:	5d                   	pop    %ebp
80106d89:	c3                   	ret    
80106d8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d90:	83 ec 0c             	sub    $0xc,%esp
80106d93:	68 a5 7b 10 80       	push   $0x80107ba5
80106d98:	e8 c3 98 ff ff       	call   80100660 <cprintf>
80106d9d:	83 c4 10             	add    $0x10,%esp
80106da0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106da3:	76 0d                	jbe    80106db2 <allocuvm+0xd2>
80106da5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106da8:	8b 45 08             	mov    0x8(%ebp),%eax
80106dab:	89 fa                	mov    %edi,%edx
80106dad:	e8 1e fb ff ff       	call   801068d0 <deallocuvm.part.0>
80106db2:	83 ec 0c             	sub    $0xc,%esp
80106db5:	56                   	push   %esi
80106db6:	e8 25 b5 ff ff       	call   801022e0 <kfree>
80106dbb:	83 c4 10             	add    $0x10,%esp
80106dbe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106dc1:	31 c0                	xor    %eax,%eax
80106dc3:	5b                   	pop    %ebx
80106dc4:	5e                   	pop    %esi
80106dc5:	5f                   	pop    %edi
80106dc6:	5d                   	pop    %ebp
80106dc7:	c3                   	ret    
80106dc8:	90                   	nop
80106dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106dd0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106dd3:	89 f8                	mov    %edi,%eax
80106dd5:	5b                   	pop    %ebx
80106dd6:	5e                   	pop    %esi
80106dd7:	5f                   	pop    %edi
80106dd8:	5d                   	pop    %ebp
80106dd9:	c3                   	ret    
80106dda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106de0 <deallocuvm>:
80106de0:	55                   	push   %ebp
80106de1:	89 e5                	mov    %esp,%ebp
80106de3:	8b 55 0c             	mov    0xc(%ebp),%edx
80106de6:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106de9:	8b 45 08             	mov    0x8(%ebp),%eax
80106dec:	39 d1                	cmp    %edx,%ecx
80106dee:	73 10                	jae    80106e00 <deallocuvm+0x20>
80106df0:	5d                   	pop    %ebp
80106df1:	e9 da fa ff ff       	jmp    801068d0 <deallocuvm.part.0>
80106df6:	8d 76 00             	lea    0x0(%esi),%esi
80106df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106e00:	89 d0                	mov    %edx,%eax
80106e02:	5d                   	pop    %ebp
80106e03:	c3                   	ret    
80106e04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106e10 <freevm>:
80106e10:	55                   	push   %ebp
80106e11:	89 e5                	mov    %esp,%ebp
80106e13:	57                   	push   %edi
80106e14:	56                   	push   %esi
80106e15:	53                   	push   %ebx
80106e16:	83 ec 0c             	sub    $0xc,%esp
80106e19:	8b 75 08             	mov    0x8(%ebp),%esi
80106e1c:	85 f6                	test   %esi,%esi
80106e1e:	74 59                	je     80106e79 <freevm+0x69>
80106e20:	31 c9                	xor    %ecx,%ecx
80106e22:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106e27:	89 f0                	mov    %esi,%eax
80106e29:	e8 a2 fa ff ff       	call   801068d0 <deallocuvm.part.0>
80106e2e:	89 f3                	mov    %esi,%ebx
80106e30:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106e36:	eb 0f                	jmp    80106e47 <freevm+0x37>
80106e38:	90                   	nop
80106e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e40:	83 c3 04             	add    $0x4,%ebx
80106e43:	39 fb                	cmp    %edi,%ebx
80106e45:	74 23                	je     80106e6a <freevm+0x5a>
80106e47:	8b 03                	mov    (%ebx),%eax
80106e49:	a8 01                	test   $0x1,%al
80106e4b:	74 f3                	je     80106e40 <freevm+0x30>
80106e4d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106e52:	83 ec 0c             	sub    $0xc,%esp
80106e55:	83 c3 04             	add    $0x4,%ebx
80106e58:	05 00 00 00 80       	add    $0x80000000,%eax
80106e5d:	50                   	push   %eax
80106e5e:	e8 7d b4 ff ff       	call   801022e0 <kfree>
80106e63:	83 c4 10             	add    $0x10,%esp
80106e66:	39 fb                	cmp    %edi,%ebx
80106e68:	75 dd                	jne    80106e47 <freevm+0x37>
80106e6a:	89 75 08             	mov    %esi,0x8(%ebp)
80106e6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e70:	5b                   	pop    %ebx
80106e71:	5e                   	pop    %esi
80106e72:	5f                   	pop    %edi
80106e73:	5d                   	pop    %ebp
80106e74:	e9 67 b4 ff ff       	jmp    801022e0 <kfree>
80106e79:	83 ec 0c             	sub    $0xc,%esp
80106e7c:	68 c1 7b 10 80       	push   $0x80107bc1
80106e81:	e8 ea 94 ff ff       	call   80100370 <panic>
80106e86:	8d 76 00             	lea    0x0(%esi),%esi
80106e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e90 <setupkvm>:
80106e90:	55                   	push   %ebp
80106e91:	89 e5                	mov    %esp,%ebp
80106e93:	56                   	push   %esi
80106e94:	53                   	push   %ebx
80106e95:	e8 f6 b5 ff ff       	call   80102490 <kalloc>
80106e9a:	85 c0                	test   %eax,%eax
80106e9c:	74 6a                	je     80106f08 <setupkvm+0x78>
80106e9e:	83 ec 04             	sub    $0x4,%esp
80106ea1:	89 c6                	mov    %eax,%esi
80106ea3:	bb 80 a4 10 80       	mov    $0x8010a480,%ebx
80106ea8:	68 00 10 00 00       	push   $0x1000
80106ead:	6a 00                	push   $0x0
80106eaf:	50                   	push   %eax
80106eb0:	e8 2b d7 ff ff       	call   801045e0 <memset>
80106eb5:	83 c4 10             	add    $0x10,%esp
80106eb8:	8b 43 04             	mov    0x4(%ebx),%eax
80106ebb:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106ebe:	83 ec 08             	sub    $0x8,%esp
80106ec1:	8b 13                	mov    (%ebx),%edx
80106ec3:	ff 73 0c             	pushl  0xc(%ebx)
80106ec6:	50                   	push   %eax
80106ec7:	29 c1                	sub    %eax,%ecx
80106ec9:	89 f0                	mov    %esi,%eax
80106ecb:	e8 70 f9 ff ff       	call   80106840 <mappages>
80106ed0:	83 c4 10             	add    $0x10,%esp
80106ed3:	85 c0                	test   %eax,%eax
80106ed5:	78 19                	js     80106ef0 <setupkvm+0x60>
80106ed7:	83 c3 10             	add    $0x10,%ebx
80106eda:	81 fb c0 a4 10 80    	cmp    $0x8010a4c0,%ebx
80106ee0:	75 d6                	jne    80106eb8 <setupkvm+0x28>
80106ee2:	89 f0                	mov    %esi,%eax
80106ee4:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106ee7:	5b                   	pop    %ebx
80106ee8:	5e                   	pop    %esi
80106ee9:	5d                   	pop    %ebp
80106eea:	c3                   	ret    
80106eeb:	90                   	nop
80106eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106ef0:	83 ec 0c             	sub    $0xc,%esp
80106ef3:	56                   	push   %esi
80106ef4:	e8 17 ff ff ff       	call   80106e10 <freevm>
80106ef9:	83 c4 10             	add    $0x10,%esp
80106efc:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106eff:	31 c0                	xor    %eax,%eax
80106f01:	5b                   	pop    %ebx
80106f02:	5e                   	pop    %esi
80106f03:	5d                   	pop    %ebp
80106f04:	c3                   	ret    
80106f05:	8d 76 00             	lea    0x0(%esi),%esi
80106f08:	31 c0                	xor    %eax,%eax
80106f0a:	eb d8                	jmp    80106ee4 <setupkvm+0x54>
80106f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106f10 <kvmalloc>:
80106f10:	55                   	push   %ebp
80106f11:	89 e5                	mov    %esp,%ebp
80106f13:	83 ec 08             	sub    $0x8,%esp
80106f16:	e8 75 ff ff ff       	call   80106e90 <setupkvm>
80106f1b:	a3 64 52 11 80       	mov    %eax,0x80115264
80106f20:	05 00 00 00 80       	add    $0x80000000,%eax
80106f25:	0f 22 d8             	mov    %eax,%cr3
80106f28:	c9                   	leave  
80106f29:	c3                   	ret    
80106f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106f30 <clearpteu>:
80106f30:	55                   	push   %ebp
80106f31:	31 c9                	xor    %ecx,%ecx
80106f33:	89 e5                	mov    %esp,%ebp
80106f35:	83 ec 08             	sub    $0x8,%esp
80106f38:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f3b:	8b 45 08             	mov    0x8(%ebp),%eax
80106f3e:	e8 7d f8 ff ff       	call   801067c0 <walkpgdir>
80106f43:	85 c0                	test   %eax,%eax
80106f45:	74 05                	je     80106f4c <clearpteu+0x1c>
80106f47:	83 20 fb             	andl   $0xfffffffb,(%eax)
80106f4a:	c9                   	leave  
80106f4b:	c3                   	ret    
80106f4c:	83 ec 0c             	sub    $0xc,%esp
80106f4f:	68 d2 7b 10 80       	push   $0x80107bd2
80106f54:	e8 17 94 ff ff       	call   80100370 <panic>
80106f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106f60 <copyuvm>:
80106f60:	55                   	push   %ebp
80106f61:	89 e5                	mov    %esp,%ebp
80106f63:	57                   	push   %edi
80106f64:	56                   	push   %esi
80106f65:	53                   	push   %ebx
80106f66:	83 ec 1c             	sub    $0x1c,%esp
80106f69:	e8 22 ff ff ff       	call   80106e90 <setupkvm>
80106f6e:	85 c0                	test   %eax,%eax
80106f70:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106f73:	0f 84 b2 00 00 00    	je     8010702b <copyuvm+0xcb>
80106f79:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106f7c:	85 c9                	test   %ecx,%ecx
80106f7e:	0f 84 9c 00 00 00    	je     80107020 <copyuvm+0xc0>
80106f84:	31 f6                	xor    %esi,%esi
80106f86:	eb 4a                	jmp    80106fd2 <copyuvm+0x72>
80106f88:	90                   	nop
80106f89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f90:	83 ec 04             	sub    $0x4,%esp
80106f93:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106f99:	68 00 10 00 00       	push   $0x1000
80106f9e:	57                   	push   %edi
80106f9f:	50                   	push   %eax
80106fa0:	e8 eb d6 ff ff       	call   80104690 <memmove>
80106fa5:	58                   	pop    %eax
80106fa6:	5a                   	pop    %edx
80106fa7:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
80106fad:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106fb0:	ff 75 e4             	pushl  -0x1c(%ebp)
80106fb3:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106fb8:	52                   	push   %edx
80106fb9:	89 f2                	mov    %esi,%edx
80106fbb:	e8 80 f8 ff ff       	call   80106840 <mappages>
80106fc0:	83 c4 10             	add    $0x10,%esp
80106fc3:	85 c0                	test   %eax,%eax
80106fc5:	78 3e                	js     80107005 <copyuvm+0xa5>
80106fc7:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106fcd:	39 75 0c             	cmp    %esi,0xc(%ebp)
80106fd0:	76 4e                	jbe    80107020 <copyuvm+0xc0>
80106fd2:	8b 45 08             	mov    0x8(%ebp),%eax
80106fd5:	31 c9                	xor    %ecx,%ecx
80106fd7:	89 f2                	mov    %esi,%edx
80106fd9:	e8 e2 f7 ff ff       	call   801067c0 <walkpgdir>
80106fde:	85 c0                	test   %eax,%eax
80106fe0:	74 5a                	je     8010703c <copyuvm+0xdc>
80106fe2:	8b 18                	mov    (%eax),%ebx
80106fe4:	f6 c3 01             	test   $0x1,%bl
80106fe7:	74 46                	je     8010702f <copyuvm+0xcf>
80106fe9:	89 df                	mov    %ebx,%edi
80106feb:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80106ff1:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80106ff4:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80106ffa:	e8 91 b4 ff ff       	call   80102490 <kalloc>
80106fff:	85 c0                	test   %eax,%eax
80107001:	89 c3                	mov    %eax,%ebx
80107003:	75 8b                	jne    80106f90 <copyuvm+0x30>
80107005:	83 ec 0c             	sub    $0xc,%esp
80107008:	ff 75 e0             	pushl  -0x20(%ebp)
8010700b:	e8 00 fe ff ff       	call   80106e10 <freevm>
80107010:	83 c4 10             	add    $0x10,%esp
80107013:	31 c0                	xor    %eax,%eax
80107015:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107018:	5b                   	pop    %ebx
80107019:	5e                   	pop    %esi
8010701a:	5f                   	pop    %edi
8010701b:	5d                   	pop    %ebp
8010701c:	c3                   	ret    
8010701d:	8d 76 00             	lea    0x0(%esi),%esi
80107020:	8b 45 e0             	mov    -0x20(%ebp),%eax
80107023:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107026:	5b                   	pop    %ebx
80107027:	5e                   	pop    %esi
80107028:	5f                   	pop    %edi
80107029:	5d                   	pop    %ebp
8010702a:	c3                   	ret    
8010702b:	31 c0                	xor    %eax,%eax
8010702d:	eb e6                	jmp    80107015 <copyuvm+0xb5>
8010702f:	83 ec 0c             	sub    $0xc,%esp
80107032:	68 f6 7b 10 80       	push   $0x80107bf6
80107037:	e8 34 93 ff ff       	call   80100370 <panic>
8010703c:	83 ec 0c             	sub    $0xc,%esp
8010703f:	68 dc 7b 10 80       	push   $0x80107bdc
80107044:	e8 27 93 ff ff       	call   80100370 <panic>
80107049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107050 <uva2ka>:
80107050:	55                   	push   %ebp
80107051:	31 c9                	xor    %ecx,%ecx
80107053:	89 e5                	mov    %esp,%ebp
80107055:	83 ec 08             	sub    $0x8,%esp
80107058:	8b 55 0c             	mov    0xc(%ebp),%edx
8010705b:	8b 45 08             	mov    0x8(%ebp),%eax
8010705e:	e8 5d f7 ff ff       	call   801067c0 <walkpgdir>
80107063:	8b 00                	mov    (%eax),%eax
80107065:	89 c2                	mov    %eax,%edx
80107067:	83 e2 05             	and    $0x5,%edx
8010706a:	83 fa 05             	cmp    $0x5,%edx
8010706d:	75 11                	jne    80107080 <uva2ka+0x30>
8010706f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107074:	c9                   	leave  
80107075:	05 00 00 00 80       	add    $0x80000000,%eax
8010707a:	c3                   	ret    
8010707b:	90                   	nop
8010707c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107080:	31 c0                	xor    %eax,%eax
80107082:	c9                   	leave  
80107083:	c3                   	ret    
80107084:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010708a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107090 <copyout>:
80107090:	55                   	push   %ebp
80107091:	89 e5                	mov    %esp,%ebp
80107093:	57                   	push   %edi
80107094:	56                   	push   %esi
80107095:	53                   	push   %ebx
80107096:	83 ec 1c             	sub    $0x1c,%esp
80107099:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010709c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010709f:	8b 7d 10             	mov    0x10(%ebp),%edi
801070a2:	85 db                	test   %ebx,%ebx
801070a4:	75 40                	jne    801070e6 <copyout+0x56>
801070a6:	eb 70                	jmp    80107118 <copyout+0x88>
801070a8:	90                   	nop
801070a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801070b0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801070b3:	89 f1                	mov    %esi,%ecx
801070b5:	29 d1                	sub    %edx,%ecx
801070b7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
801070bd:	39 d9                	cmp    %ebx,%ecx
801070bf:	0f 47 cb             	cmova  %ebx,%ecx
801070c2:	29 f2                	sub    %esi,%edx
801070c4:	83 ec 04             	sub    $0x4,%esp
801070c7:	01 d0                	add    %edx,%eax
801070c9:	51                   	push   %ecx
801070ca:	57                   	push   %edi
801070cb:	50                   	push   %eax
801070cc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801070cf:	e8 bc d5 ff ff       	call   80104690 <memmove>
801070d4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801070d7:	83 c4 10             	add    $0x10,%esp
801070da:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
801070e0:	01 cf                	add    %ecx,%edi
801070e2:	29 cb                	sub    %ecx,%ebx
801070e4:	74 32                	je     80107118 <copyout+0x88>
801070e6:	89 d6                	mov    %edx,%esi
801070e8:	83 ec 08             	sub    $0x8,%esp
801070eb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801070ee:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
801070f4:	56                   	push   %esi
801070f5:	ff 75 08             	pushl  0x8(%ebp)
801070f8:	e8 53 ff ff ff       	call   80107050 <uva2ka>
801070fd:	83 c4 10             	add    $0x10,%esp
80107100:	85 c0                	test   %eax,%eax
80107102:	75 ac                	jne    801070b0 <copyout+0x20>
80107104:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107107:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010710c:	5b                   	pop    %ebx
8010710d:	5e                   	pop    %esi
8010710e:	5f                   	pop    %edi
8010710f:	5d                   	pop    %ebp
80107110:	c3                   	ret    
80107111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107118:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010711b:	31 c0                	xor    %eax,%eax
8010711d:	5b                   	pop    %ebx
8010711e:	5e                   	pop    %esi
8010711f:	5f                   	pop    %edi
80107120:	5d                   	pop    %ebp
80107121:	c3                   	ret    
