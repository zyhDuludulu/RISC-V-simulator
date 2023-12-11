
../../../Desktop/CS211/cs211-lab/lab3/trap_handler/riscv-elf/test_trap.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	add	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	50c000ef          	jal	10608 <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	734000ef          	jal	10848 <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00010537          	lui	a0,0x10
   10124:	73050513          	add	a0,a0,1840 # 10730 <__libc_fini_array>
   10128:	6640006f          	j	1078c <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00001197          	auipc	gp,0x1
   10134:	6f018193          	add	gp,gp,1776 # 11820 <__global_pointer$>
   10138:	f6018513          	add	a0,gp,-160 # 11780 <completed.1>
   1013c:	f9818613          	add	a2,gp,-104 # 117b8 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	3e4000ef          	jal	1052c <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	64050513          	add	a0,a0,1600 # 1078c <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	5d850513          	add	a0,a0,1496 # 10730 <__libc_fini_array>
   10160:	62c000ef          	jal	1078c <atexit>
   10164:	32c000ef          	jal	10490 <__libc_init_array>
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
   101e0:	fc010113          	add	sp,sp,-64
   101e4:	02113c23          	sd	ra,56(sp)
   101e8:	02813823          	sd	s0,48(sp)
   101ec:	04010413          	add	s0,sp,64
   101f0:	00a00793          	li	a5,10
   101f4:	fef42623          	sw	a5,-20(s0)
   101f8:	01400793          	li	a5,20
   101fc:	fef42423          	sw	a5,-24(s0)
   10200:	01e00793          	li	a5,30
   10204:	fef42223          	sw	a5,-28(s0)
   10208:	000037b7          	lui	a5,0x3
   1020c:	03978793          	add	a5,a5,57 # 3039 <exit-0xd0af>
   10210:	fef42023          	sw	a5,-32(s0)
   10214:	00100793          	li	a5,1
   10218:	fcf42e23          	sw	a5,-36(s0)
   1021c:	00200793          	li	a5,2
   10220:	fcf42c23          	sw	a5,-40(s0)
   10224:	fec42783          	lw	a5,-20(s0)
   10228:	00078713          	mv	a4,a5
   1022c:	fe842783          	lw	a5,-24(s0)
   10230:	00f707bb          	addw	a5,a4,a5
   10234:	fcf42a23          	sw	a5,-44(s0)
   10238:	fd442783          	lw	a5,-44(s0)
   1023c:	00078513          	mv	a0,a5
   10240:	100000ef          	jal	10340 <print_d>
   10244:	00a00513          	li	a0,10
   10248:	14c000ef          	jal	10394 <print_c>
   1024c:	fec42783          	lw	a5,-20(s0)
   10250:	00078713          	mv	a4,a5
   10254:	fe842783          	lw	a5,-24(s0)
   10258:	40f707bb          	subw	a5,a4,a5
   1025c:	fcf42823          	sw	a5,-48(s0)
   10260:	fd042783          	lw	a5,-48(s0)
   10264:	00078513          	mv	a0,a5
   10268:	0d8000ef          	jal	10340 <print_d>
   1026c:	00a00513          	li	a0,10
   10270:	124000ef          	jal	10394 <print_c>
   10274:	fe442783          	lw	a5,-28(s0)
   10278:	00078713          	mv	a4,a5
   1027c:	fe042783          	lw	a5,-32(s0)
   10280:	02f707bb          	mulw	a5,a4,a5
   10284:	fcf42623          	sw	a5,-52(s0)
   10288:	fcc42783          	lw	a5,-52(s0)
   1028c:	00078513          	mv	a0,a5
   10290:	0b0000ef          	jal	10340 <print_d>
   10294:	00a00513          	li	a0,10
   10298:	0fc000ef          	jal	10394 <print_c>
   1029c:	000117b7          	lui	a5,0x11
   102a0:	88078513          	add	a0,a5,-1920 # 10880 <__errno+0x8>
   102a4:	0c8000ef          	jal	1036c <print_s>
   102a8:	1c4000ef          	jal	1046c <syscall>
   102ac:	000117b7          	lui	a5,0x11
   102b0:	89878513          	add	a0,a5,-1896 # 10898 <__errno+0x20>
   102b4:	0b8000ef          	jal	1036c <print_s>
   102b8:	fe042783          	lw	a5,-32(s0)
   102bc:	00078713          	mv	a4,a5
   102c0:	fe442783          	lw	a5,-28(s0)
   102c4:	02f747bb          	divw	a5,a4,a5
   102c8:	fcf42a23          	sw	a5,-44(s0)
   102cc:	fd442783          	lw	a5,-44(s0)
   102d0:	00078513          	mv	a0,a5
   102d4:	06c000ef          	jal	10340 <print_d>
   102d8:	00a00513          	li	a0,10
   102dc:	0b8000ef          	jal	10394 <print_c>
   102e0:	fd842783          	lw	a5,-40(s0)
   102e4:	fe042703          	lw	a4,-32(s0)
   102e8:	00f717bb          	sllw	a5,a4,a5
   102ec:	fcf42823          	sw	a5,-48(s0)
   102f0:	fd042783          	lw	a5,-48(s0)
   102f4:	00078513          	mv	a0,a5
   102f8:	048000ef          	jal	10340 <print_d>
   102fc:	00a00513          	li	a0,10
   10300:	094000ef          	jal	10394 <print_c>
   10304:	fe042783          	lw	a5,-32(s0)
   10308:	4047d79b          	sraw	a5,a5,0x4
   1030c:	fcf42623          	sw	a5,-52(s0)
   10310:	fcc42783          	lw	a5,-52(s0)
   10314:	00078513          	mv	a0,a5
   10318:	028000ef          	jal	10340 <print_d>
   1031c:	00a00513          	li	a0,10
   10320:	074000ef          	jal	10394 <print_c>
   10324:	09c000ef          	jal	103c0 <exit_proc>
   10328:	00000793          	li	a5,0
   1032c:	00078513          	mv	a0,a5
   10330:	03813083          	ld	ra,56(sp)
   10334:	03013403          	ld	s0,48(sp)
   10338:	04010113          	add	sp,sp,64
   1033c:	00008067          	ret

0000000000010340 <print_d>:
   10340:	fe010113          	add	sp,sp,-32
   10344:	00813c23          	sd	s0,24(sp)
   10348:	02010413          	add	s0,sp,32
   1034c:	00050793          	mv	a5,a0
   10350:	fef42623          	sw	a5,-20(s0)
   10354:	00200893          	li	a7,2
   10358:	00000073          	ecall
   1035c:	00000013          	nop
   10360:	01813403          	ld	s0,24(sp)
   10364:	02010113          	add	sp,sp,32
   10368:	00008067          	ret

000000000001036c <print_s>:
   1036c:	fe010113          	add	sp,sp,-32
   10370:	00813c23          	sd	s0,24(sp)
   10374:	02010413          	add	s0,sp,32
   10378:	fea43423          	sd	a0,-24(s0)
   1037c:	00000893          	li	a7,0
   10380:	00000073          	ecall
   10384:	00000013          	nop
   10388:	01813403          	ld	s0,24(sp)
   1038c:	02010113          	add	sp,sp,32
   10390:	00008067          	ret

0000000000010394 <print_c>:
   10394:	fe010113          	add	sp,sp,-32
   10398:	00813c23          	sd	s0,24(sp)
   1039c:	02010413          	add	s0,sp,32
   103a0:	00050793          	mv	a5,a0
   103a4:	fef407a3          	sb	a5,-17(s0)
   103a8:	00100893          	li	a7,1
   103ac:	00000073          	ecall
   103b0:	00000013          	nop
   103b4:	01813403          	ld	s0,24(sp)
   103b8:	02010113          	add	sp,sp,32
   103bc:	00008067          	ret

00000000000103c0 <exit_proc>:
   103c0:	ff010113          	add	sp,sp,-16
   103c4:	00813423          	sd	s0,8(sp)
   103c8:	01010413          	add	s0,sp,16
   103cc:	00300893          	li	a7,3
   103d0:	00000073          	ecall
   103d4:	00000013          	nop
   103d8:	00813403          	ld	s0,8(sp)
   103dc:	01010113          	add	sp,sp,16
   103e0:	00008067          	ret

00000000000103e4 <read_char>:
   103e4:	fe010113          	add	sp,sp,-32
   103e8:	00813c23          	sd	s0,24(sp)
   103ec:	02010413          	add	s0,sp,32
   103f0:	00400893          	li	a7,4
   103f4:	00000073          	ecall
   103f8:	00050793          	mv	a5,a0
   103fc:	fef407a3          	sb	a5,-17(s0)
   10400:	fef44783          	lbu	a5,-17(s0)
   10404:	00078513          	mv	a0,a5
   10408:	01813403          	ld	s0,24(sp)
   1040c:	02010113          	add	sp,sp,32
   10410:	00008067          	ret

0000000000010414 <read_num>:
   10414:	fe010113          	add	sp,sp,-32
   10418:	00813c23          	sd	s0,24(sp)
   1041c:	02010413          	add	s0,sp,32
   10420:	00500893          	li	a7,5
   10424:	00000073          	ecall
   10428:	00050793          	mv	a5,a0
   1042c:	fef43423          	sd	a5,-24(s0)
   10430:	fe843783          	ld	a5,-24(s0)
   10434:	00078513          	mv	a0,a5
   10438:	01813403          	ld	s0,24(sp)
   1043c:	02010113          	add	sp,sp,32
   10440:	00008067          	ret

0000000000010444 <print_f>:
   10444:	fe010113          	add	sp,sp,-32
   10448:	00813c23          	sd	s0,24(sp)
   1044c:	02010413          	add	s0,sp,32
   10450:	fea42627          	fsw	fa0,-20(s0)
   10454:	00600893          	li	a7,6
   10458:	00000073          	ecall
   1045c:	00000013          	nop
   10460:	01813403          	ld	s0,24(sp)
   10464:	02010113          	add	sp,sp,32
   10468:	00008067          	ret

000000000001046c <syscall>:
   1046c:	ff010113          	add	sp,sp,-16
   10470:	00813423          	sd	s0,8(sp)
   10474:	01010413          	add	s0,sp,16
   10478:	00700893          	li	a7,7
   1047c:	00000073          	ecall
   10480:	00000013          	nop
   10484:	00813403          	ld	s0,8(sp)
   10488:	01010113          	add	sp,sp,16
   1048c:	00008067          	ret

0000000000010490 <__libc_init_array>:
   10490:	fe010113          	add	sp,sp,-32
   10494:	00813823          	sd	s0,16(sp)
   10498:	000117b7          	lui	a5,0x11
   1049c:	00011437          	lui	s0,0x11
   104a0:	01213023          	sd	s2,0(sp)
   104a4:	00478793          	add	a5,a5,4 # 11004 <__preinit_array_end>
   104a8:	00440713          	add	a4,s0,4 # 11004 <__preinit_array_end>
   104ac:	00113c23          	sd	ra,24(sp)
   104b0:	00913423          	sd	s1,8(sp)
   104b4:	40e78933          	sub	s2,a5,a4
   104b8:	02e78263          	beq	a5,a4,104dc <__libc_init_array+0x4c>
   104bc:	40395913          	sra	s2,s2,0x3
   104c0:	00440413          	add	s0,s0,4
   104c4:	00000493          	li	s1,0
   104c8:	00043783          	ld	a5,0(s0)
   104cc:	00148493          	add	s1,s1,1
   104d0:	00840413          	add	s0,s0,8
   104d4:	000780e7          	jalr	a5
   104d8:	ff24e8e3          	bltu	s1,s2,104c8 <__libc_init_array+0x38>
   104dc:	00011437          	lui	s0,0x11
   104e0:	000117b7          	lui	a5,0x11
   104e4:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   104e8:	00840713          	add	a4,s0,8 # 11008 <__init_array_start>
   104ec:	40e78933          	sub	s2,a5,a4
   104f0:	40395913          	sra	s2,s2,0x3
   104f4:	02e78063          	beq	a5,a4,10514 <__libc_init_array+0x84>
   104f8:	00840413          	add	s0,s0,8
   104fc:	00000493          	li	s1,0
   10500:	00043783          	ld	a5,0(s0)
   10504:	00148493          	add	s1,s1,1
   10508:	00840413          	add	s0,s0,8
   1050c:	000780e7          	jalr	a5
   10510:	ff24e8e3          	bltu	s1,s2,10500 <__libc_init_array+0x70>
   10514:	01813083          	ld	ra,24(sp)
   10518:	01013403          	ld	s0,16(sp)
   1051c:	00813483          	ld	s1,8(sp)
   10520:	00013903          	ld	s2,0(sp)
   10524:	02010113          	add	sp,sp,32
   10528:	00008067          	ret

000000000001052c <memset>:
   1052c:	00f00313          	li	t1,15
   10530:	00050713          	mv	a4,a0
   10534:	02c37a63          	bgeu	t1,a2,10568 <memset+0x3c>
   10538:	00f77793          	and	a5,a4,15
   1053c:	0a079063          	bnez	a5,105dc <memset+0xb0>
   10540:	06059e63          	bnez	a1,105bc <memset+0x90>
   10544:	ff067693          	and	a3,a2,-16
   10548:	00f67613          	and	a2,a2,15
   1054c:	00e686b3          	add	a3,a3,a4
   10550:	00b73023          	sd	a1,0(a4)
   10554:	00b73423          	sd	a1,8(a4)
   10558:	01070713          	add	a4,a4,16
   1055c:	fed76ae3          	bltu	a4,a3,10550 <memset+0x24>
   10560:	00061463          	bnez	a2,10568 <memset+0x3c>
   10564:	00008067          	ret
   10568:	40c306b3          	sub	a3,t1,a2
   1056c:	00269693          	sll	a3,a3,0x2
   10570:	00000297          	auipc	t0,0x0
   10574:	005686b3          	add	a3,a3,t0
   10578:	00c68067          	jr	12(a3)
   1057c:	00b70723          	sb	a1,14(a4)
   10580:	00b706a3          	sb	a1,13(a4)
   10584:	00b70623          	sb	a1,12(a4)
   10588:	00b705a3          	sb	a1,11(a4)
   1058c:	00b70523          	sb	a1,10(a4)
   10590:	00b704a3          	sb	a1,9(a4)
   10594:	00b70423          	sb	a1,8(a4)
   10598:	00b703a3          	sb	a1,7(a4)
   1059c:	00b70323          	sb	a1,6(a4)
   105a0:	00b702a3          	sb	a1,5(a4)
   105a4:	00b70223          	sb	a1,4(a4)
   105a8:	00b701a3          	sb	a1,3(a4)
   105ac:	00b70123          	sb	a1,2(a4)
   105b0:	00b700a3          	sb	a1,1(a4)
   105b4:	00b70023          	sb	a1,0(a4)
   105b8:	00008067          	ret
   105bc:	0ff5f593          	zext.b	a1,a1
   105c0:	00859693          	sll	a3,a1,0x8
   105c4:	00d5e5b3          	or	a1,a1,a3
   105c8:	01059693          	sll	a3,a1,0x10
   105cc:	00d5e5b3          	or	a1,a1,a3
   105d0:	02059693          	sll	a3,a1,0x20
   105d4:	00d5e5b3          	or	a1,a1,a3
   105d8:	f6dff06f          	j	10544 <memset+0x18>
   105dc:	00279693          	sll	a3,a5,0x2
   105e0:	00000297          	auipc	t0,0x0
   105e4:	005686b3          	add	a3,a3,t0
   105e8:	00008293          	mv	t0,ra
   105ec:	f98680e7          	jalr	-104(a3)
   105f0:	00028093          	mv	ra,t0
   105f4:	ff078793          	add	a5,a5,-16
   105f8:	40f70733          	sub	a4,a4,a5
   105fc:	00f60633          	add	a2,a2,a5
   10600:	f6c374e3          	bgeu	t1,a2,10568 <memset+0x3c>
   10604:	f3dff06f          	j	10540 <memset+0x14>

0000000000010608 <__call_exitprocs>:
   10608:	fb010113          	add	sp,sp,-80
   1060c:	03413023          	sd	s4,32(sp)
   10610:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   10614:	03213823          	sd	s2,48(sp)
   10618:	04113423          	sd	ra,72(sp)
   1061c:	1f8a3903          	ld	s2,504(s4)
   10620:	04813023          	sd	s0,64(sp)
   10624:	02913c23          	sd	s1,56(sp)
   10628:	03313423          	sd	s3,40(sp)
   1062c:	01513c23          	sd	s5,24(sp)
   10630:	01613823          	sd	s6,16(sp)
   10634:	01713423          	sd	s7,8(sp)
   10638:	01813023          	sd	s8,0(sp)
   1063c:	04090063          	beqz	s2,1067c <__call_exitprocs+0x74>
   10640:	00050b13          	mv	s6,a0
   10644:	00058b93          	mv	s7,a1
   10648:	00100a93          	li	s5,1
   1064c:	fff00993          	li	s3,-1
   10650:	00892483          	lw	s1,8(s2)
   10654:	fff4841b          	addw	s0,s1,-1
   10658:	02044263          	bltz	s0,1067c <__call_exitprocs+0x74>
   1065c:	00349493          	sll	s1,s1,0x3
   10660:	009904b3          	add	s1,s2,s1
   10664:	040b8463          	beqz	s7,106ac <__call_exitprocs+0xa4>
   10668:	2084b783          	ld	a5,520(s1)
   1066c:	05778063          	beq	a5,s7,106ac <__call_exitprocs+0xa4>
   10670:	fff4041b          	addw	s0,s0,-1
   10674:	ff848493          	add	s1,s1,-8
   10678:	ff3416e3          	bne	s0,s3,10664 <__call_exitprocs+0x5c>
   1067c:	04813083          	ld	ra,72(sp)
   10680:	04013403          	ld	s0,64(sp)
   10684:	03813483          	ld	s1,56(sp)
   10688:	03013903          	ld	s2,48(sp)
   1068c:	02813983          	ld	s3,40(sp)
   10690:	02013a03          	ld	s4,32(sp)
   10694:	01813a83          	ld	s5,24(sp)
   10698:	01013b03          	ld	s6,16(sp)
   1069c:	00813b83          	ld	s7,8(sp)
   106a0:	00013c03          	ld	s8,0(sp)
   106a4:	05010113          	add	sp,sp,80
   106a8:	00008067          	ret
   106ac:	00892783          	lw	a5,8(s2)
   106b0:	0084b703          	ld	a4,8(s1)
   106b4:	fff7879b          	addw	a5,a5,-1
   106b8:	06878263          	beq	a5,s0,1071c <__call_exitprocs+0x114>
   106bc:	0004b423          	sd	zero,8(s1)
   106c0:	fa0708e3          	beqz	a4,10670 <__call_exitprocs+0x68>
   106c4:	31092783          	lw	a5,784(s2)
   106c8:	008a96bb          	sllw	a3,s5,s0
   106cc:	00892c03          	lw	s8,8(s2)
   106d0:	00d7f7b3          	and	a5,a5,a3
   106d4:	0007879b          	sext.w	a5,a5
   106d8:	02079263          	bnez	a5,106fc <__call_exitprocs+0xf4>
   106dc:	000700e7          	jalr	a4
   106e0:	00892703          	lw	a4,8(s2)
   106e4:	1f8a3783          	ld	a5,504(s4)
   106e8:	01871463          	bne	a4,s8,106f0 <__call_exitprocs+0xe8>
   106ec:	f92782e3          	beq	a5,s2,10670 <__call_exitprocs+0x68>
   106f0:	f80786e3          	beqz	a5,1067c <__call_exitprocs+0x74>
   106f4:	00078913          	mv	s2,a5
   106f8:	f59ff06f          	j	10650 <__call_exitprocs+0x48>
   106fc:	31492783          	lw	a5,788(s2)
   10700:	1084b583          	ld	a1,264(s1)
   10704:	00d7f7b3          	and	a5,a5,a3
   10708:	0007879b          	sext.w	a5,a5
   1070c:	00079c63          	bnez	a5,10724 <__call_exitprocs+0x11c>
   10710:	000b0513          	mv	a0,s6
   10714:	000700e7          	jalr	a4
   10718:	fc9ff06f          	j	106e0 <__call_exitprocs+0xd8>
   1071c:	00892423          	sw	s0,8(s2)
   10720:	fa1ff06f          	j	106c0 <__call_exitprocs+0xb8>
   10724:	00058513          	mv	a0,a1
   10728:	000700e7          	jalr	a4
   1072c:	fb5ff06f          	j	106e0 <__call_exitprocs+0xd8>

0000000000010730 <__libc_fini_array>:
   10730:	fe010113          	add	sp,sp,-32
   10734:	00813823          	sd	s0,16(sp)
   10738:	000117b7          	lui	a5,0x11
   1073c:	00011437          	lui	s0,0x11
   10740:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   10744:	02040413          	add	s0,s0,32 # 11020 <impure_data>
   10748:	40f40433          	sub	s0,s0,a5
   1074c:	00913423          	sd	s1,8(sp)
   10750:	00113c23          	sd	ra,24(sp)
   10754:	40345493          	sra	s1,s0,0x3
   10758:	02048063          	beqz	s1,10778 <__libc_fini_array+0x48>
   1075c:	ff840413          	add	s0,s0,-8
   10760:	00f40433          	add	s0,s0,a5
   10764:	00043783          	ld	a5,0(s0)
   10768:	fff48493          	add	s1,s1,-1
   1076c:	ff840413          	add	s0,s0,-8
   10770:	000780e7          	jalr	a5
   10774:	fe0498e3          	bnez	s1,10764 <__libc_fini_array+0x34>
   10778:	01813083          	ld	ra,24(sp)
   1077c:	01013403          	ld	s0,16(sp)
   10780:	00813483          	ld	s1,8(sp)
   10784:	02010113          	add	sp,sp,32
   10788:	00008067          	ret

000000000001078c <atexit>:
   1078c:	00050593          	mv	a1,a0
   10790:	00000693          	li	a3,0
   10794:	00000613          	li	a2,0
   10798:	00000513          	li	a0,0
   1079c:	0040006f          	j	107a0 <__register_exitproc>

00000000000107a0 <__register_exitproc>:
   107a0:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   107a4:	1f873783          	ld	a5,504(a4)
   107a8:	06078063          	beqz	a5,10808 <__register_exitproc+0x68>
   107ac:	0087a703          	lw	a4,8(a5)
   107b0:	01f00813          	li	a6,31
   107b4:	08e84663          	blt	a6,a4,10840 <__register_exitproc+0xa0>
   107b8:	02050863          	beqz	a0,107e8 <__register_exitproc+0x48>
   107bc:	00371813          	sll	a6,a4,0x3
   107c0:	01078833          	add	a6,a5,a6
   107c4:	10c83823          	sd	a2,272(a6)
   107c8:	3107a883          	lw	a7,784(a5)
   107cc:	00100613          	li	a2,1
   107d0:	00e6163b          	sllw	a2,a2,a4
   107d4:	00c8e8b3          	or	a7,a7,a2
   107d8:	3117a823          	sw	a7,784(a5)
   107dc:	20d83823          	sd	a3,528(a6)
   107e0:	00200693          	li	a3,2
   107e4:	02d50863          	beq	a0,a3,10814 <__register_exitproc+0x74>
   107e8:	00270693          	add	a3,a4,2
   107ec:	00369693          	sll	a3,a3,0x3
   107f0:	0017071b          	addw	a4,a4,1
   107f4:	00e7a423          	sw	a4,8(a5)
   107f8:	00d787b3          	add	a5,a5,a3
   107fc:	00b7b023          	sd	a1,0(a5)
   10800:	00000513          	li	a0,0
   10804:	00008067          	ret
   10808:	20070793          	add	a5,a4,512
   1080c:	1ef73c23          	sd	a5,504(a4)
   10810:	f9dff06f          	j	107ac <__register_exitproc+0xc>
   10814:	3147a683          	lw	a3,788(a5)
   10818:	00000513          	li	a0,0
   1081c:	00c6e6b3          	or	a3,a3,a2
   10820:	30d7aa23          	sw	a3,788(a5)
   10824:	00270693          	add	a3,a4,2
   10828:	00369693          	sll	a3,a3,0x3
   1082c:	0017071b          	addw	a4,a4,1
   10830:	00e7a423          	sw	a4,8(a5)
   10834:	00d787b3          	add	a5,a5,a3
   10838:	00b7b023          	sd	a1,0(a5)
   1083c:	00008067          	ret
   10840:	fff00513          	li	a0,-1
   10844:	00008067          	ret

0000000000010848 <_exit>:
   10848:	05d00893          	li	a7,93
   1084c:	00000073          	ecall
   10850:	00054463          	bltz	a0,10858 <_exit+0x10>
   10854:	0000006f          	j	10854 <_exit+0xc>
   10858:	ff010113          	add	sp,sp,-16
   1085c:	00813023          	sd	s0,0(sp)
   10860:	00050413          	mv	s0,a0
   10864:	00113423          	sd	ra,8(sp)
   10868:	4080043b          	negw	s0,s0
   1086c:	00c000ef          	jal	10878 <__errno>
   10870:	00852023          	sw	s0,0(a0) # 11000 <__EH_FRAME_BEGIN__>
   10874:	0000006f          	j	10874 <_exit+0x2c>

0000000000010878 <__errno>:
   10878:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   1087c:	00008067          	ret
