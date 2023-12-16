
../../../Desktop/CS211/cs211-lab/lab3/trap_handler/riscv-elf/kernel.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	add	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	4fc000ef          	jal	105f8 <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	724000ef          	jal	10838 <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00010537          	lui	a0,0x10
   10124:	72050513          	add	a0,a0,1824 # 10720 <__libc_fini_array>
   10128:	6540006f          	j	1077c <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00001197          	auipc	gp,0x1
   10134:	6f018193          	add	gp,gp,1776 # 11820 <__global_pointer$>
   10138:	f6018513          	add	a0,gp,-160 # 11780 <completed.1>
   1013c:	f9818613          	add	a2,gp,-104 # 117b8 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	3d4000ef          	jal	1051c <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	63050513          	add	a0,a0,1584 # 1077c <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	5c850513          	add	a0,a0,1480 # 10720 <__libc_fini_array>
   10160:	61c000ef          	jal	1077c <atexit>
   10164:	31c000ef          	jal	10480 <__libc_init_array>
   10168:	00012503          	lw	a0,0(sp)
   1016c:	00810593          	add	a1,sp,8
   10170:	00000613          	li	a2,0
   10174:	06c000ef          	jal	101e0 <main>
   10178:	f71ff06f          	j	100e8 <exit>

000000000001017c <__do_global_dtors_aux>:
   1017c:	ff010113          	add	sp,sp,-16
   10180:	00813023          	sd	s0,0(sp)
   10184:	f601c783          	lbu	a5,-160(gp) # 11780 <completed.1>
   10188:	00113423          	sd	ra,8(sp)
   1018c:	02079263          	bnez	a5,101b0 <__do_global_dtors_aux+0x34>
   10190:	00000793          	li	a5,0
   10194:	00078a63          	beqz	a5,101a8 <__do_global_dtors_aux+0x2c>
   10198:	00011537          	lui	a0,0x11
   1019c:	00050513          	mv	a0,a0
   101a0:	00000097          	auipc	ra,0x0
   101a4:	000000e7          	jalr	zero # 0 <exit-0x100e8>
   101a8:	00100793          	li	a5,1
   101ac:	f6f18023          	sb	a5,-160(gp) # 11780 <completed.1>
   101b0:	00813083          	ld	ra,8(sp)
   101b4:	00013403          	ld	s0,0(sp)
   101b8:	01010113          	add	sp,sp,16
   101bc:	00008067          	ret

00000000000101c0 <frame_dummy>:
   101c0:	00000793          	li	a5,0
   101c4:	00078c63          	beqz	a5,101dc <frame_dummy+0x1c>
   101c8:	00011537          	lui	a0,0x11
   101cc:	f6818593          	add	a1,gp,-152 # 11788 <object.0>
   101d0:	00050513          	mv	a0,a0
   101d4:	00000317          	auipc	t1,0x0
   101d8:	00000067          	jr	zero # 0 <exit-0x100e8>
   101dc:	00008067          	ret

00000000000101e0 <main>:
   101e0:	f9010113          	add	sp,sp,-112
   101e4:	06113423          	sd	ra,104(sp)
   101e8:	06813023          	sd	s0,96(sp)
   101ec:	07010413          	add	s0,sp,112
   101f0:	fe042623          	sw	zero,-20(s0)
   101f4:	fe042423          	sw	zero,-24(s0)
   101f8:	0280006f          	j	10220 <main+0x40>
   101fc:	fe842783          	lw	a5,-24(s0)
   10200:	00279793          	sll	a5,a5,0x2
   10204:	ff078793          	add	a5,a5,-16
   10208:	008787b3          	add	a5,a5,s0
   1020c:	01e00713          	li	a4,30
   10210:	fae7a023          	sw	a4,-96(a5)
   10214:	fe842783          	lw	a5,-24(s0)
   10218:	0017879b          	addw	a5,a5,1
   1021c:	fef42423          	sw	a5,-24(s0)
   10220:	fe842783          	lw	a5,-24(s0)
   10224:	0007871b          	sext.w	a4,a5
   10228:	01300793          	li	a5,19
   1022c:	fce7d8e3          	bge	a5,a4,101fc <main+0x1c>
   10230:	f8042823          	sw	zero,-112(s0)
   10234:	02800793          	li	a5,40
   10238:	faf42023          	sw	a5,-96(s0)
   1023c:	03c00793          	li	a5,60
   10240:	faf42423          	sw	a5,-88(s0)
   10244:	06400793          	li	a5,100
   10248:	faf42c23          	sw	a5,-72(s0)
   1024c:	06e00793          	li	a5,110
   10250:	faf42e23          	sw	a5,-68(s0)
   10254:	08200793          	li	a5,130
   10258:	fcf42223          	sw	a5,-60(s0)
   1025c:	09600793          	li	a5,150
   10260:	fcf42623          	sw	a5,-52(s0)
   10264:	0b400793          	li	a5,180
   10268:	fcf42c23          	sw	a5,-40(s0)
   1026c:	000117b7          	lui	a5,0x11
   10270:	87078513          	add	a0,a5,-1936 # 10870 <__errno+0x8>
   10274:	0e8000ef          	jal	1035c <print_s>
   10278:	fe042223          	sw	zero,-28(s0)
   1027c:	06c0006f          	j	102e8 <main+0x108>
   10280:	fe442783          	lw	a5,-28(s0)
   10284:	00279793          	sll	a5,a5,0x2
   10288:	ff078793          	add	a5,a5,-16
   1028c:	008787b3          	add	a5,a5,s0
   10290:	fa07a783          	lw	a5,-96(a5)
   10294:	00078513          	mv	a0,a5
   10298:	098000ef          	jal	10330 <print_d>
   1029c:	02000513          	li	a0,32
   102a0:	0e4000ef          	jal	10384 <print_c>
   102a4:	fe442783          	lw	a5,-28(s0)
   102a8:	00279793          	sll	a5,a5,0x2
   102ac:	ff078793          	add	a5,a5,-16
   102b0:	008787b3          	add	a5,a5,s0
   102b4:	fa07a703          	lw	a4,-96(a5)
   102b8:	fec42783          	lw	a5,-20(s0)
   102bc:	0007879b          	sext.w	a5,a5
   102c0:	00e7de63          	bge	a5,a4,102dc <main+0xfc>
   102c4:	fe442783          	lw	a5,-28(s0)
   102c8:	00279793          	sll	a5,a5,0x2
   102cc:	ff078793          	add	a5,a5,-16
   102d0:	008787b3          	add	a5,a5,s0
   102d4:	fa07a783          	lw	a5,-96(a5)
   102d8:	fef42623          	sw	a5,-20(s0)
   102dc:	fe442783          	lw	a5,-28(s0)
   102e0:	0017879b          	addw	a5,a5,1
   102e4:	fef42223          	sw	a5,-28(s0)
   102e8:	fe442783          	lw	a5,-28(s0)
   102ec:	0007871b          	sext.w	a4,a5
   102f0:	01300793          	li	a5,19
   102f4:	f8e7d6e3          	bge	a5,a4,10280 <main+0xa0>
   102f8:	000117b7          	lui	a5,0x11
   102fc:	88878513          	add	a0,a5,-1912 # 10888 <__errno+0x20>
   10300:	05c000ef          	jal	1035c <print_s>
   10304:	fec42783          	lw	a5,-20(s0)
   10308:	00078513          	mv	a0,a5
   1030c:	024000ef          	jal	10330 <print_d>
   10310:	00a00513          	li	a0,10
   10314:	070000ef          	jal	10384 <print_c>
   10318:	00000793          	li	a5,0
   1031c:	00078513          	mv	a0,a5
   10320:	06813083          	ld	ra,104(sp)
   10324:	06013403          	ld	s0,96(sp)
   10328:	07010113          	add	sp,sp,112
   1032c:	00008067          	ret

0000000000010330 <print_d>:
   10330:	fe010113          	add	sp,sp,-32
   10334:	00813c23          	sd	s0,24(sp)
   10338:	02010413          	add	s0,sp,32
   1033c:	00050793          	mv	a5,a0
   10340:	fef42623          	sw	a5,-20(s0)
   10344:	00200893          	li	a7,2
   10348:	00000073          	ecall
   1034c:	00000013          	nop
   10350:	01813403          	ld	s0,24(sp)
   10354:	02010113          	add	sp,sp,32
   10358:	00008067          	ret

000000000001035c <print_s>:
   1035c:	fe010113          	add	sp,sp,-32
   10360:	00813c23          	sd	s0,24(sp)
   10364:	02010413          	add	s0,sp,32
   10368:	fea43423          	sd	a0,-24(s0)
   1036c:	00000893          	li	a7,0
   10370:	00000073          	ecall
   10374:	00000013          	nop
   10378:	01813403          	ld	s0,24(sp)
   1037c:	02010113          	add	sp,sp,32
   10380:	00008067          	ret

0000000000010384 <print_c>:
   10384:	fe010113          	add	sp,sp,-32
   10388:	00813c23          	sd	s0,24(sp)
   1038c:	02010413          	add	s0,sp,32
   10390:	00050793          	mv	a5,a0
   10394:	fef407a3          	sb	a5,-17(s0)
   10398:	00100893          	li	a7,1
   1039c:	00000073          	ecall
   103a0:	00000013          	nop
   103a4:	01813403          	ld	s0,24(sp)
   103a8:	02010113          	add	sp,sp,32
   103ac:	00008067          	ret

00000000000103b0 <exit_proc>:
   103b0:	ff010113          	add	sp,sp,-16
   103b4:	00813423          	sd	s0,8(sp)
   103b8:	01010413          	add	s0,sp,16
   103bc:	00300893          	li	a7,3
   103c0:	00000073          	ecall
   103c4:	00000013          	nop
   103c8:	00813403          	ld	s0,8(sp)
   103cc:	01010113          	add	sp,sp,16
   103d0:	00008067          	ret

00000000000103d4 <read_char>:
   103d4:	fe010113          	add	sp,sp,-32
   103d8:	00813c23          	sd	s0,24(sp)
   103dc:	02010413          	add	s0,sp,32
   103e0:	00400893          	li	a7,4
   103e4:	00000073          	ecall
   103e8:	00050793          	mv	a5,a0
   103ec:	fef407a3          	sb	a5,-17(s0)
   103f0:	fef44783          	lbu	a5,-17(s0)
   103f4:	00078513          	mv	a0,a5
   103f8:	01813403          	ld	s0,24(sp)
   103fc:	02010113          	add	sp,sp,32
   10400:	00008067          	ret

0000000000010404 <read_num>:
   10404:	fe010113          	add	sp,sp,-32
   10408:	00813c23          	sd	s0,24(sp)
   1040c:	02010413          	add	s0,sp,32
   10410:	00500893          	li	a7,5
   10414:	00000073          	ecall
   10418:	00050793          	mv	a5,a0
   1041c:	fef43423          	sd	a5,-24(s0)
   10420:	fe843783          	ld	a5,-24(s0)
   10424:	00078513          	mv	a0,a5
   10428:	01813403          	ld	s0,24(sp)
   1042c:	02010113          	add	sp,sp,32
   10430:	00008067          	ret

0000000000010434 <print_f>:
   10434:	fe010113          	add	sp,sp,-32
   10438:	00813c23          	sd	s0,24(sp)
   1043c:	02010413          	add	s0,sp,32
   10440:	fea42627          	fsw	fa0,-20(s0)
   10444:	00600893          	li	a7,6
   10448:	00000073          	ecall
   1044c:	00000013          	nop
   10450:	01813403          	ld	s0,24(sp)
   10454:	02010113          	add	sp,sp,32
   10458:	00008067          	ret

000000000001045c <syscall>:
   1045c:	ff010113          	add	sp,sp,-16
   10460:	00813423          	sd	s0,8(sp)
   10464:	01010413          	add	s0,sp,16
   10468:	00700893          	li	a7,7
   1046c:	00000073          	ecall
   10470:	00000013          	nop
   10474:	00813403          	ld	s0,8(sp)
   10478:	01010113          	add	sp,sp,16
   1047c:	00008067          	ret

0000000000010480 <__libc_init_array>:
   10480:	fe010113          	add	sp,sp,-32
   10484:	00813823          	sd	s0,16(sp)
   10488:	000117b7          	lui	a5,0x11
   1048c:	00011437          	lui	s0,0x11
   10490:	01213023          	sd	s2,0(sp)
   10494:	00478793          	add	a5,a5,4 # 11004 <__preinit_array_end>
   10498:	00440713          	add	a4,s0,4 # 11004 <__preinit_array_end>
   1049c:	00113c23          	sd	ra,24(sp)
   104a0:	00913423          	sd	s1,8(sp)
   104a4:	40e78933          	sub	s2,a5,a4
   104a8:	02e78263          	beq	a5,a4,104cc <__libc_init_array+0x4c>
   104ac:	40395913          	sra	s2,s2,0x3
   104b0:	00440413          	add	s0,s0,4
   104b4:	00000493          	li	s1,0
   104b8:	00043783          	ld	a5,0(s0)
   104bc:	00148493          	add	s1,s1,1
   104c0:	00840413          	add	s0,s0,8
   104c4:	000780e7          	jalr	a5
   104c8:	ff24e8e3          	bltu	s1,s2,104b8 <__libc_init_array+0x38>
   104cc:	00011437          	lui	s0,0x11
   104d0:	000117b7          	lui	a5,0x11
   104d4:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   104d8:	00840713          	add	a4,s0,8 # 11008 <__init_array_start>
   104dc:	40e78933          	sub	s2,a5,a4
   104e0:	40395913          	sra	s2,s2,0x3
   104e4:	02e78063          	beq	a5,a4,10504 <__libc_init_array+0x84>
   104e8:	00840413          	add	s0,s0,8
   104ec:	00000493          	li	s1,0
   104f0:	00043783          	ld	a5,0(s0)
   104f4:	00148493          	add	s1,s1,1
   104f8:	00840413          	add	s0,s0,8
   104fc:	000780e7          	jalr	a5
   10500:	ff24e8e3          	bltu	s1,s2,104f0 <__libc_init_array+0x70>
   10504:	01813083          	ld	ra,24(sp)
   10508:	01013403          	ld	s0,16(sp)
   1050c:	00813483          	ld	s1,8(sp)
   10510:	00013903          	ld	s2,0(sp)
   10514:	02010113          	add	sp,sp,32
   10518:	00008067          	ret

000000000001051c <memset>:
   1051c:	00f00313          	li	t1,15
   10520:	00050713          	mv	a4,a0
   10524:	02c37a63          	bgeu	t1,a2,10558 <memset+0x3c>
   10528:	00f77793          	and	a5,a4,15
   1052c:	0a079063          	bnez	a5,105cc <memset+0xb0>
   10530:	06059e63          	bnez	a1,105ac <memset+0x90>
   10534:	ff067693          	and	a3,a2,-16
   10538:	00f67613          	and	a2,a2,15
   1053c:	00e686b3          	add	a3,a3,a4
   10540:	00b73023          	sd	a1,0(a4)
   10544:	00b73423          	sd	a1,8(a4)
   10548:	01070713          	add	a4,a4,16
   1054c:	fed76ae3          	bltu	a4,a3,10540 <memset+0x24>
   10550:	00061463          	bnez	a2,10558 <memset+0x3c>
   10554:	00008067          	ret
   10558:	40c306b3          	sub	a3,t1,a2
   1055c:	00269693          	sll	a3,a3,0x2
   10560:	00000297          	auipc	t0,0x0
   10564:	005686b3          	add	a3,a3,t0
   10568:	00c68067          	jr	12(a3)
   1056c:	00b70723          	sb	a1,14(a4)
   10570:	00b706a3          	sb	a1,13(a4)
   10574:	00b70623          	sb	a1,12(a4)
   10578:	00b705a3          	sb	a1,11(a4)
   1057c:	00b70523          	sb	a1,10(a4)
   10580:	00b704a3          	sb	a1,9(a4)
   10584:	00b70423          	sb	a1,8(a4)
   10588:	00b703a3          	sb	a1,7(a4)
   1058c:	00b70323          	sb	a1,6(a4)
   10590:	00b702a3          	sb	a1,5(a4)
   10594:	00b70223          	sb	a1,4(a4)
   10598:	00b701a3          	sb	a1,3(a4)
   1059c:	00b70123          	sb	a1,2(a4)
   105a0:	00b700a3          	sb	a1,1(a4)
   105a4:	00b70023          	sb	a1,0(a4)
   105a8:	00008067          	ret
   105ac:	0ff5f593          	zext.b	a1,a1
   105b0:	00859693          	sll	a3,a1,0x8
   105b4:	00d5e5b3          	or	a1,a1,a3
   105b8:	01059693          	sll	a3,a1,0x10
   105bc:	00d5e5b3          	or	a1,a1,a3
   105c0:	02059693          	sll	a3,a1,0x20
   105c4:	00d5e5b3          	or	a1,a1,a3
   105c8:	f6dff06f          	j	10534 <memset+0x18>
   105cc:	00279693          	sll	a3,a5,0x2
   105d0:	00000297          	auipc	t0,0x0
   105d4:	005686b3          	add	a3,a3,t0
   105d8:	00008293          	mv	t0,ra
   105dc:	f98680e7          	jalr	-104(a3)
   105e0:	00028093          	mv	ra,t0
   105e4:	ff078793          	add	a5,a5,-16
   105e8:	40f70733          	sub	a4,a4,a5
   105ec:	00f60633          	add	a2,a2,a5
   105f0:	f6c374e3          	bgeu	t1,a2,10558 <memset+0x3c>
   105f4:	f3dff06f          	j	10530 <memset+0x14>

00000000000105f8 <__call_exitprocs>:
   105f8:	fb010113          	add	sp,sp,-80
   105fc:	03413023          	sd	s4,32(sp)
   10600:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   10604:	03213823          	sd	s2,48(sp)
   10608:	04113423          	sd	ra,72(sp)
   1060c:	1f8a3903          	ld	s2,504(s4)
   10610:	04813023          	sd	s0,64(sp)
   10614:	02913c23          	sd	s1,56(sp)
   10618:	03313423          	sd	s3,40(sp)
   1061c:	01513c23          	sd	s5,24(sp)
   10620:	01613823          	sd	s6,16(sp)
   10624:	01713423          	sd	s7,8(sp)
   10628:	01813023          	sd	s8,0(sp)
   1062c:	04090063          	beqz	s2,1066c <__call_exitprocs+0x74>
   10630:	00050b13          	mv	s6,a0
   10634:	00058b93          	mv	s7,a1
   10638:	00100a93          	li	s5,1
   1063c:	fff00993          	li	s3,-1
   10640:	00892483          	lw	s1,8(s2)
   10644:	fff4841b          	addw	s0,s1,-1
   10648:	02044263          	bltz	s0,1066c <__call_exitprocs+0x74>
   1064c:	00349493          	sll	s1,s1,0x3
   10650:	009904b3          	add	s1,s2,s1
   10654:	040b8463          	beqz	s7,1069c <__call_exitprocs+0xa4>
   10658:	2084b783          	ld	a5,520(s1)
   1065c:	05778063          	beq	a5,s7,1069c <__call_exitprocs+0xa4>
   10660:	fff4041b          	addw	s0,s0,-1
   10664:	ff848493          	add	s1,s1,-8
   10668:	ff3416e3          	bne	s0,s3,10654 <__call_exitprocs+0x5c>
   1066c:	04813083          	ld	ra,72(sp)
   10670:	04013403          	ld	s0,64(sp)
   10674:	03813483          	ld	s1,56(sp)
   10678:	03013903          	ld	s2,48(sp)
   1067c:	02813983          	ld	s3,40(sp)
   10680:	02013a03          	ld	s4,32(sp)
   10684:	01813a83          	ld	s5,24(sp)
   10688:	01013b03          	ld	s6,16(sp)
   1068c:	00813b83          	ld	s7,8(sp)
   10690:	00013c03          	ld	s8,0(sp)
   10694:	05010113          	add	sp,sp,80
   10698:	00008067          	ret
   1069c:	00892783          	lw	a5,8(s2)
   106a0:	0084b703          	ld	a4,8(s1)
   106a4:	fff7879b          	addw	a5,a5,-1
   106a8:	06878263          	beq	a5,s0,1070c <__call_exitprocs+0x114>
   106ac:	0004b423          	sd	zero,8(s1)
   106b0:	fa0708e3          	beqz	a4,10660 <__call_exitprocs+0x68>
   106b4:	31092783          	lw	a5,784(s2)
   106b8:	008a96bb          	sllw	a3,s5,s0
   106bc:	00892c03          	lw	s8,8(s2)
   106c0:	00d7f7b3          	and	a5,a5,a3
   106c4:	0007879b          	sext.w	a5,a5
   106c8:	02079263          	bnez	a5,106ec <__call_exitprocs+0xf4>
   106cc:	000700e7          	jalr	a4
   106d0:	00892703          	lw	a4,8(s2)
   106d4:	1f8a3783          	ld	a5,504(s4)
   106d8:	01871463          	bne	a4,s8,106e0 <__call_exitprocs+0xe8>
   106dc:	f92782e3          	beq	a5,s2,10660 <__call_exitprocs+0x68>
   106e0:	f80786e3          	beqz	a5,1066c <__call_exitprocs+0x74>
   106e4:	00078913          	mv	s2,a5
   106e8:	f59ff06f          	j	10640 <__call_exitprocs+0x48>
   106ec:	31492783          	lw	a5,788(s2)
   106f0:	1084b583          	ld	a1,264(s1)
   106f4:	00d7f7b3          	and	a5,a5,a3
   106f8:	0007879b          	sext.w	a5,a5
   106fc:	00079c63          	bnez	a5,10714 <__call_exitprocs+0x11c>
   10700:	000b0513          	mv	a0,s6
   10704:	000700e7          	jalr	a4
   10708:	fc9ff06f          	j	106d0 <__call_exitprocs+0xd8>
   1070c:	00892423          	sw	s0,8(s2)
   10710:	fa1ff06f          	j	106b0 <__call_exitprocs+0xb8>
   10714:	00058513          	mv	a0,a1
   10718:	000700e7          	jalr	a4
   1071c:	fb5ff06f          	j	106d0 <__call_exitprocs+0xd8>

0000000000010720 <__libc_fini_array>:
   10720:	fe010113          	add	sp,sp,-32
   10724:	00813823          	sd	s0,16(sp)
   10728:	000117b7          	lui	a5,0x11
   1072c:	00011437          	lui	s0,0x11
   10730:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   10734:	02040413          	add	s0,s0,32 # 11020 <impure_data>
   10738:	40f40433          	sub	s0,s0,a5
   1073c:	00913423          	sd	s1,8(sp)
   10740:	00113c23          	sd	ra,24(sp)
   10744:	40345493          	sra	s1,s0,0x3
   10748:	02048063          	beqz	s1,10768 <__libc_fini_array+0x48>
   1074c:	ff840413          	add	s0,s0,-8
   10750:	00f40433          	add	s0,s0,a5
   10754:	00043783          	ld	a5,0(s0)
   10758:	fff48493          	add	s1,s1,-1
   1075c:	ff840413          	add	s0,s0,-8
   10760:	000780e7          	jalr	a5
   10764:	fe0498e3          	bnez	s1,10754 <__libc_fini_array+0x34>
   10768:	01813083          	ld	ra,24(sp)
   1076c:	01013403          	ld	s0,16(sp)
   10770:	00813483          	ld	s1,8(sp)
   10774:	02010113          	add	sp,sp,32
   10778:	00008067          	ret

000000000001077c <atexit>:
   1077c:	00050593          	mv	a1,a0
   10780:	00000693          	li	a3,0
   10784:	00000613          	li	a2,0
   10788:	00000513          	li	a0,0
   1078c:	0040006f          	j	10790 <__register_exitproc>

0000000000010790 <__register_exitproc>:
   10790:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   10794:	1f873783          	ld	a5,504(a4)
   10798:	06078063          	beqz	a5,107f8 <__register_exitproc+0x68>
   1079c:	0087a703          	lw	a4,8(a5)
   107a0:	01f00813          	li	a6,31
   107a4:	08e84663          	blt	a6,a4,10830 <__register_exitproc+0xa0>
   107a8:	02050863          	beqz	a0,107d8 <__register_exitproc+0x48>
   107ac:	00371813          	sll	a6,a4,0x3
   107b0:	01078833          	add	a6,a5,a6
   107b4:	10c83823          	sd	a2,272(a6)
   107b8:	3107a883          	lw	a7,784(a5)
   107bc:	00100613          	li	a2,1
   107c0:	00e6163b          	sllw	a2,a2,a4
   107c4:	00c8e8b3          	or	a7,a7,a2
   107c8:	3117a823          	sw	a7,784(a5)
   107cc:	20d83823          	sd	a3,528(a6)
   107d0:	00200693          	li	a3,2
   107d4:	02d50863          	beq	a0,a3,10804 <__register_exitproc+0x74>
   107d8:	00270693          	add	a3,a4,2
   107dc:	00369693          	sll	a3,a3,0x3
   107e0:	0017071b          	addw	a4,a4,1
   107e4:	00e7a423          	sw	a4,8(a5)
   107e8:	00d787b3          	add	a5,a5,a3
   107ec:	00b7b023          	sd	a1,0(a5)
   107f0:	00000513          	li	a0,0
   107f4:	00008067          	ret
   107f8:	20070793          	add	a5,a4,512
   107fc:	1ef73c23          	sd	a5,504(a4)
   10800:	f9dff06f          	j	1079c <__register_exitproc+0xc>
   10804:	3147a683          	lw	a3,788(a5)
   10808:	00000513          	li	a0,0
   1080c:	00c6e6b3          	or	a3,a3,a2
   10810:	30d7aa23          	sw	a3,788(a5)
   10814:	00270693          	add	a3,a4,2
   10818:	00369693          	sll	a3,a3,0x3
   1081c:	0017071b          	addw	a4,a4,1
   10820:	00e7a423          	sw	a4,8(a5)
   10824:	00d787b3          	add	a5,a5,a3
   10828:	00b7b023          	sd	a1,0(a5)
   1082c:	00008067          	ret
   10830:	fff00513          	li	a0,-1
   10834:	00008067          	ret

0000000000010838 <_exit>:
   10838:	05d00893          	li	a7,93
   1083c:	00000073          	ecall
   10840:	00054463          	bltz	a0,10848 <_exit+0x10>
   10844:	0000006f          	j	10844 <_exit+0xc>
   10848:	ff010113          	add	sp,sp,-16
   1084c:	00813023          	sd	s0,0(sp)
   10850:	00050413          	mv	s0,a0
   10854:	00113423          	sd	ra,8(sp)
   10858:	4080043b          	negw	s0,s0
   1085c:	00c000ef          	jal	10868 <__errno>
   10860:	00852023          	sw	s0,0(a0) # 11000 <__EH_FRAME_BEGIN__>
   10864:	0000006f          	j	10864 <_exit+0x2c>

0000000000010868 <__errno>:
   10868:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   1086c:	00008067          	ret
