
../../../Desktop/CS211/cs211-lab/lab3/trap_handler/riscv-elf/test_trap.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	add	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	4e4000ef          	jal	105e0 <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	70c000ef          	jal	10820 <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00010537          	lui	a0,0x10
   10124:	70850513          	add	a0,a0,1800 # 10708 <__libc_fini_array>
   10128:	63c0006f          	j	10764 <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00001197          	auipc	gp,0x1
   10134:	6f018193          	add	gp,gp,1776 # 11820 <__global_pointer$>
   10138:	f6018513          	add	a0,gp,-160 # 11780 <completed.1>
   1013c:	f9818613          	add	a2,gp,-104 # 117b8 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	3bc000ef          	jal	10504 <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	61850513          	add	a0,a0,1560 # 10764 <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	5b050513          	add	a0,a0,1456 # 10708 <__libc_fini_array>
   10160:	604000ef          	jal	10764 <atexit>
   10164:	304000ef          	jal	10468 <__libc_init_array>
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
   10240:	0d8000ef          	jal	10318 <print_d>
   10244:	00a00513          	li	a0,10
   10248:	124000ef          	jal	1036c <print_c>
   1024c:	fec42783          	lw	a5,-20(s0)
   10250:	00078713          	mv	a4,a5
   10254:	fe842783          	lw	a5,-24(s0)
   10258:	40f707bb          	subw	a5,a4,a5
   1025c:	fcf42823          	sw	a5,-48(s0)
   10260:	fd042783          	lw	a5,-48(s0)
   10264:	00078513          	mv	a0,a5
   10268:	0b0000ef          	jal	10318 <print_d>
   1026c:	00a00513          	li	a0,10
   10270:	0fc000ef          	jal	1036c <print_c>
   10274:	000117b7          	lui	a5,0x11
   10278:	85878513          	add	a0,a5,-1960 # 10858 <__errno+0x8>
   1027c:	0c8000ef          	jal	10344 <print_s>
   10280:	1c4000ef          	jal	10444 <syscall>
   10284:	000117b7          	lui	a5,0x11
   10288:	87078513          	add	a0,a5,-1936 # 10870 <__errno+0x20>
   1028c:	0b8000ef          	jal	10344 <print_s>
   10290:	fe042783          	lw	a5,-32(s0)
   10294:	00078713          	mv	a4,a5
   10298:	fe442783          	lw	a5,-28(s0)
   1029c:	02f747bb          	divw	a5,a4,a5
   102a0:	fcf42a23          	sw	a5,-44(s0)
   102a4:	fd442783          	lw	a5,-44(s0)
   102a8:	00078513          	mv	a0,a5
   102ac:	06c000ef          	jal	10318 <print_d>
   102b0:	00a00513          	li	a0,10
   102b4:	0b8000ef          	jal	1036c <print_c>
   102b8:	fd842783          	lw	a5,-40(s0)
   102bc:	fe042703          	lw	a4,-32(s0)
   102c0:	00f717bb          	sllw	a5,a4,a5
   102c4:	fcf42823          	sw	a5,-48(s0)
   102c8:	fd042783          	lw	a5,-48(s0)
   102cc:	00078513          	mv	a0,a5
   102d0:	048000ef          	jal	10318 <print_d>
   102d4:	00a00513          	li	a0,10
   102d8:	094000ef          	jal	1036c <print_c>
   102dc:	fe042783          	lw	a5,-32(s0)
   102e0:	4047d79b          	sraw	a5,a5,0x4
   102e4:	fcf42623          	sw	a5,-52(s0)
   102e8:	fcc42783          	lw	a5,-52(s0)
   102ec:	00078513          	mv	a0,a5
   102f0:	028000ef          	jal	10318 <print_d>
   102f4:	00a00513          	li	a0,10
   102f8:	074000ef          	jal	1036c <print_c>
   102fc:	09c000ef          	jal	10398 <exit_proc>
   10300:	00000793          	li	a5,0
   10304:	00078513          	mv	a0,a5
   10308:	03813083          	ld	ra,56(sp)
   1030c:	03013403          	ld	s0,48(sp)
   10310:	04010113          	add	sp,sp,64
   10314:	00008067          	ret

0000000000010318 <print_d>:
   10318:	fe010113          	add	sp,sp,-32
   1031c:	00813c23          	sd	s0,24(sp)
   10320:	02010413          	add	s0,sp,32
   10324:	00050793          	mv	a5,a0
   10328:	fef42623          	sw	a5,-20(s0)
   1032c:	00200893          	li	a7,2
   10330:	00000073          	ecall
   10334:	00000013          	nop
   10338:	01813403          	ld	s0,24(sp)
   1033c:	02010113          	add	sp,sp,32
   10340:	00008067          	ret

0000000000010344 <print_s>:
   10344:	fe010113          	add	sp,sp,-32
   10348:	00813c23          	sd	s0,24(sp)
   1034c:	02010413          	add	s0,sp,32
   10350:	fea43423          	sd	a0,-24(s0)
   10354:	00000893          	li	a7,0
   10358:	00000073          	ecall
   1035c:	00000013          	nop
   10360:	01813403          	ld	s0,24(sp)
   10364:	02010113          	add	sp,sp,32
   10368:	00008067          	ret

000000000001036c <print_c>:
   1036c:	fe010113          	add	sp,sp,-32
   10370:	00813c23          	sd	s0,24(sp)
   10374:	02010413          	add	s0,sp,32
   10378:	00050793          	mv	a5,a0
   1037c:	fef407a3          	sb	a5,-17(s0)
   10380:	00100893          	li	a7,1
   10384:	00000073          	ecall
   10388:	00000013          	nop
   1038c:	01813403          	ld	s0,24(sp)
   10390:	02010113          	add	sp,sp,32
   10394:	00008067          	ret

0000000000010398 <exit_proc>:
   10398:	ff010113          	add	sp,sp,-16
   1039c:	00813423          	sd	s0,8(sp)
   103a0:	01010413          	add	s0,sp,16
   103a4:	00300893          	li	a7,3
   103a8:	00000073          	ecall
   103ac:	00000013          	nop
   103b0:	00813403          	ld	s0,8(sp)
   103b4:	01010113          	add	sp,sp,16
   103b8:	00008067          	ret

00000000000103bc <read_char>:
   103bc:	fe010113          	add	sp,sp,-32
   103c0:	00813c23          	sd	s0,24(sp)
   103c4:	02010413          	add	s0,sp,32
   103c8:	00400893          	li	a7,4
   103cc:	00000073          	ecall
   103d0:	00050793          	mv	a5,a0
   103d4:	fef407a3          	sb	a5,-17(s0)
   103d8:	fef44783          	lbu	a5,-17(s0)
   103dc:	00078513          	mv	a0,a5
   103e0:	01813403          	ld	s0,24(sp)
   103e4:	02010113          	add	sp,sp,32
   103e8:	00008067          	ret

00000000000103ec <read_num>:
   103ec:	fe010113          	add	sp,sp,-32
   103f0:	00813c23          	sd	s0,24(sp)
   103f4:	02010413          	add	s0,sp,32
   103f8:	00500893          	li	a7,5
   103fc:	00000073          	ecall
   10400:	00050793          	mv	a5,a0
   10404:	fef43423          	sd	a5,-24(s0)
   10408:	fe843783          	ld	a5,-24(s0)
   1040c:	00078513          	mv	a0,a5
   10410:	01813403          	ld	s0,24(sp)
   10414:	02010113          	add	sp,sp,32
   10418:	00008067          	ret

000000000001041c <print_f>:
   1041c:	fe010113          	add	sp,sp,-32
   10420:	00813c23          	sd	s0,24(sp)
   10424:	02010413          	add	s0,sp,32
   10428:	fea42627          	fsw	fa0,-20(s0)
   1042c:	00600893          	li	a7,6
   10430:	00000073          	ecall
   10434:	00000013          	nop
   10438:	01813403          	ld	s0,24(sp)
   1043c:	02010113          	add	sp,sp,32
   10440:	00008067          	ret

0000000000010444 <syscall>:
   10444:	ff010113          	add	sp,sp,-16
   10448:	00813423          	sd	s0,8(sp)
   1044c:	01010413          	add	s0,sp,16
   10450:	00700893          	li	a7,7
   10454:	00000073          	ecall
   10458:	00000013          	nop
   1045c:	00813403          	ld	s0,8(sp)
   10460:	01010113          	add	sp,sp,16
   10464:	00008067          	ret

0000000000010468 <__libc_init_array>:
   10468:	fe010113          	add	sp,sp,-32
   1046c:	00813823          	sd	s0,16(sp)
   10470:	000117b7          	lui	a5,0x11
   10474:	00011437          	lui	s0,0x11
   10478:	01213023          	sd	s2,0(sp)
   1047c:	00478793          	add	a5,a5,4 # 11004 <__preinit_array_end>
   10480:	00440713          	add	a4,s0,4 # 11004 <__preinit_array_end>
   10484:	00113c23          	sd	ra,24(sp)
   10488:	00913423          	sd	s1,8(sp)
   1048c:	40e78933          	sub	s2,a5,a4
   10490:	02e78263          	beq	a5,a4,104b4 <__libc_init_array+0x4c>
   10494:	40395913          	sra	s2,s2,0x3
   10498:	00440413          	add	s0,s0,4
   1049c:	00000493          	li	s1,0
   104a0:	00043783          	ld	a5,0(s0)
   104a4:	00148493          	add	s1,s1,1
   104a8:	00840413          	add	s0,s0,8
   104ac:	000780e7          	jalr	a5
   104b0:	ff24e8e3          	bltu	s1,s2,104a0 <__libc_init_array+0x38>
   104b4:	00011437          	lui	s0,0x11
   104b8:	000117b7          	lui	a5,0x11
   104bc:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   104c0:	00840713          	add	a4,s0,8 # 11008 <__init_array_start>
   104c4:	40e78933          	sub	s2,a5,a4
   104c8:	40395913          	sra	s2,s2,0x3
   104cc:	02e78063          	beq	a5,a4,104ec <__libc_init_array+0x84>
   104d0:	00840413          	add	s0,s0,8
   104d4:	00000493          	li	s1,0
   104d8:	00043783          	ld	a5,0(s0)
   104dc:	00148493          	add	s1,s1,1
   104e0:	00840413          	add	s0,s0,8
   104e4:	000780e7          	jalr	a5
   104e8:	ff24e8e3          	bltu	s1,s2,104d8 <__libc_init_array+0x70>
   104ec:	01813083          	ld	ra,24(sp)
   104f0:	01013403          	ld	s0,16(sp)
   104f4:	00813483          	ld	s1,8(sp)
   104f8:	00013903          	ld	s2,0(sp)
   104fc:	02010113          	add	sp,sp,32
   10500:	00008067          	ret

0000000000010504 <memset>:
   10504:	00f00313          	li	t1,15
   10508:	00050713          	mv	a4,a0
   1050c:	02c37a63          	bgeu	t1,a2,10540 <memset+0x3c>
   10510:	00f77793          	and	a5,a4,15
   10514:	0a079063          	bnez	a5,105b4 <memset+0xb0>
   10518:	06059e63          	bnez	a1,10594 <memset+0x90>
   1051c:	ff067693          	and	a3,a2,-16
   10520:	00f67613          	and	a2,a2,15
   10524:	00e686b3          	add	a3,a3,a4
   10528:	00b73023          	sd	a1,0(a4)
   1052c:	00b73423          	sd	a1,8(a4)
   10530:	01070713          	add	a4,a4,16
   10534:	fed76ae3          	bltu	a4,a3,10528 <memset+0x24>
   10538:	00061463          	bnez	a2,10540 <memset+0x3c>
   1053c:	00008067          	ret
   10540:	40c306b3          	sub	a3,t1,a2
   10544:	00269693          	sll	a3,a3,0x2
   10548:	00000297          	auipc	t0,0x0
   1054c:	005686b3          	add	a3,a3,t0
   10550:	00c68067          	jr	12(a3)
   10554:	00b70723          	sb	a1,14(a4)
   10558:	00b706a3          	sb	a1,13(a4)
   1055c:	00b70623          	sb	a1,12(a4)
   10560:	00b705a3          	sb	a1,11(a4)
   10564:	00b70523          	sb	a1,10(a4)
   10568:	00b704a3          	sb	a1,9(a4)
   1056c:	00b70423          	sb	a1,8(a4)
   10570:	00b703a3          	sb	a1,7(a4)
   10574:	00b70323          	sb	a1,6(a4)
   10578:	00b702a3          	sb	a1,5(a4)
   1057c:	00b70223          	sb	a1,4(a4)
   10580:	00b701a3          	sb	a1,3(a4)
   10584:	00b70123          	sb	a1,2(a4)
   10588:	00b700a3          	sb	a1,1(a4)
   1058c:	00b70023          	sb	a1,0(a4)
   10590:	00008067          	ret
   10594:	0ff5f593          	zext.b	a1,a1
   10598:	00859693          	sll	a3,a1,0x8
   1059c:	00d5e5b3          	or	a1,a1,a3
   105a0:	01059693          	sll	a3,a1,0x10
   105a4:	00d5e5b3          	or	a1,a1,a3
   105a8:	02059693          	sll	a3,a1,0x20
   105ac:	00d5e5b3          	or	a1,a1,a3
   105b0:	f6dff06f          	j	1051c <memset+0x18>
   105b4:	00279693          	sll	a3,a5,0x2
   105b8:	00000297          	auipc	t0,0x0
   105bc:	005686b3          	add	a3,a3,t0
   105c0:	00008293          	mv	t0,ra
   105c4:	f98680e7          	jalr	-104(a3)
   105c8:	00028093          	mv	ra,t0
   105cc:	ff078793          	add	a5,a5,-16
   105d0:	40f70733          	sub	a4,a4,a5
   105d4:	00f60633          	add	a2,a2,a5
   105d8:	f6c374e3          	bgeu	t1,a2,10540 <memset+0x3c>
   105dc:	f3dff06f          	j	10518 <memset+0x14>

00000000000105e0 <__call_exitprocs>:
   105e0:	fb010113          	add	sp,sp,-80
   105e4:	03413023          	sd	s4,32(sp)
   105e8:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   105ec:	03213823          	sd	s2,48(sp)
   105f0:	04113423          	sd	ra,72(sp)
   105f4:	1f8a3903          	ld	s2,504(s4)
   105f8:	04813023          	sd	s0,64(sp)
   105fc:	02913c23          	sd	s1,56(sp)
   10600:	03313423          	sd	s3,40(sp)
   10604:	01513c23          	sd	s5,24(sp)
   10608:	01613823          	sd	s6,16(sp)
   1060c:	01713423          	sd	s7,8(sp)
   10610:	01813023          	sd	s8,0(sp)
   10614:	04090063          	beqz	s2,10654 <__call_exitprocs+0x74>
   10618:	00050b13          	mv	s6,a0
   1061c:	00058b93          	mv	s7,a1
   10620:	00100a93          	li	s5,1
   10624:	fff00993          	li	s3,-1
   10628:	00892483          	lw	s1,8(s2)
   1062c:	fff4841b          	addw	s0,s1,-1
   10630:	02044263          	bltz	s0,10654 <__call_exitprocs+0x74>
   10634:	00349493          	sll	s1,s1,0x3
   10638:	009904b3          	add	s1,s2,s1
   1063c:	040b8463          	beqz	s7,10684 <__call_exitprocs+0xa4>
   10640:	2084b783          	ld	a5,520(s1)
   10644:	05778063          	beq	a5,s7,10684 <__call_exitprocs+0xa4>
   10648:	fff4041b          	addw	s0,s0,-1
   1064c:	ff848493          	add	s1,s1,-8
   10650:	ff3416e3          	bne	s0,s3,1063c <__call_exitprocs+0x5c>
   10654:	04813083          	ld	ra,72(sp)
   10658:	04013403          	ld	s0,64(sp)
   1065c:	03813483          	ld	s1,56(sp)
   10660:	03013903          	ld	s2,48(sp)
   10664:	02813983          	ld	s3,40(sp)
   10668:	02013a03          	ld	s4,32(sp)
   1066c:	01813a83          	ld	s5,24(sp)
   10670:	01013b03          	ld	s6,16(sp)
   10674:	00813b83          	ld	s7,8(sp)
   10678:	00013c03          	ld	s8,0(sp)
   1067c:	05010113          	add	sp,sp,80
   10680:	00008067          	ret
   10684:	00892783          	lw	a5,8(s2)
   10688:	0084b703          	ld	a4,8(s1)
   1068c:	fff7879b          	addw	a5,a5,-1
   10690:	06878263          	beq	a5,s0,106f4 <__call_exitprocs+0x114>
   10694:	0004b423          	sd	zero,8(s1)
   10698:	fa0708e3          	beqz	a4,10648 <__call_exitprocs+0x68>
   1069c:	31092783          	lw	a5,784(s2)
   106a0:	008a96bb          	sllw	a3,s5,s0
   106a4:	00892c03          	lw	s8,8(s2)
   106a8:	00d7f7b3          	and	a5,a5,a3
   106ac:	0007879b          	sext.w	a5,a5
   106b0:	02079263          	bnez	a5,106d4 <__call_exitprocs+0xf4>
   106b4:	000700e7          	jalr	a4
   106b8:	00892703          	lw	a4,8(s2)
   106bc:	1f8a3783          	ld	a5,504(s4)
   106c0:	01871463          	bne	a4,s8,106c8 <__call_exitprocs+0xe8>
   106c4:	f92782e3          	beq	a5,s2,10648 <__call_exitprocs+0x68>
   106c8:	f80786e3          	beqz	a5,10654 <__call_exitprocs+0x74>
   106cc:	00078913          	mv	s2,a5
   106d0:	f59ff06f          	j	10628 <__call_exitprocs+0x48>
   106d4:	31492783          	lw	a5,788(s2)
   106d8:	1084b583          	ld	a1,264(s1)
   106dc:	00d7f7b3          	and	a5,a5,a3
   106e0:	0007879b          	sext.w	a5,a5
   106e4:	00079c63          	bnez	a5,106fc <__call_exitprocs+0x11c>
   106e8:	000b0513          	mv	a0,s6
   106ec:	000700e7          	jalr	a4
   106f0:	fc9ff06f          	j	106b8 <__call_exitprocs+0xd8>
   106f4:	00892423          	sw	s0,8(s2)
   106f8:	fa1ff06f          	j	10698 <__call_exitprocs+0xb8>
   106fc:	00058513          	mv	a0,a1
   10700:	000700e7          	jalr	a4
   10704:	fb5ff06f          	j	106b8 <__call_exitprocs+0xd8>

0000000000010708 <__libc_fini_array>:
   10708:	fe010113          	add	sp,sp,-32
   1070c:	00813823          	sd	s0,16(sp)
   10710:	000117b7          	lui	a5,0x11
   10714:	00011437          	lui	s0,0x11
   10718:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   1071c:	02040413          	add	s0,s0,32 # 11020 <impure_data>
   10720:	40f40433          	sub	s0,s0,a5
   10724:	00913423          	sd	s1,8(sp)
   10728:	00113c23          	sd	ra,24(sp)
   1072c:	40345493          	sra	s1,s0,0x3
   10730:	02048063          	beqz	s1,10750 <__libc_fini_array+0x48>
   10734:	ff840413          	add	s0,s0,-8
   10738:	00f40433          	add	s0,s0,a5
   1073c:	00043783          	ld	a5,0(s0)
   10740:	fff48493          	add	s1,s1,-1
   10744:	ff840413          	add	s0,s0,-8
   10748:	000780e7          	jalr	a5
   1074c:	fe0498e3          	bnez	s1,1073c <__libc_fini_array+0x34>
   10750:	01813083          	ld	ra,24(sp)
   10754:	01013403          	ld	s0,16(sp)
   10758:	00813483          	ld	s1,8(sp)
   1075c:	02010113          	add	sp,sp,32
   10760:	00008067          	ret

0000000000010764 <atexit>:
   10764:	00050593          	mv	a1,a0
   10768:	00000693          	li	a3,0
   1076c:	00000613          	li	a2,0
   10770:	00000513          	li	a0,0
   10774:	0040006f          	j	10778 <__register_exitproc>

0000000000010778 <__register_exitproc>:
   10778:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   1077c:	1f873783          	ld	a5,504(a4)
   10780:	06078063          	beqz	a5,107e0 <__register_exitproc+0x68>
   10784:	0087a703          	lw	a4,8(a5)
   10788:	01f00813          	li	a6,31
   1078c:	08e84663          	blt	a6,a4,10818 <__register_exitproc+0xa0>
   10790:	02050863          	beqz	a0,107c0 <__register_exitproc+0x48>
   10794:	00371813          	sll	a6,a4,0x3
   10798:	01078833          	add	a6,a5,a6
   1079c:	10c83823          	sd	a2,272(a6)
   107a0:	3107a883          	lw	a7,784(a5)
   107a4:	00100613          	li	a2,1
   107a8:	00e6163b          	sllw	a2,a2,a4
   107ac:	00c8e8b3          	or	a7,a7,a2
   107b0:	3117a823          	sw	a7,784(a5)
   107b4:	20d83823          	sd	a3,528(a6)
   107b8:	00200693          	li	a3,2
   107bc:	02d50863          	beq	a0,a3,107ec <__register_exitproc+0x74>
   107c0:	00270693          	add	a3,a4,2
   107c4:	00369693          	sll	a3,a3,0x3
   107c8:	0017071b          	addw	a4,a4,1
   107cc:	00e7a423          	sw	a4,8(a5)
   107d0:	00d787b3          	add	a5,a5,a3
   107d4:	00b7b023          	sd	a1,0(a5)
   107d8:	00000513          	li	a0,0
   107dc:	00008067          	ret
   107e0:	20070793          	add	a5,a4,512
   107e4:	1ef73c23          	sd	a5,504(a4)
   107e8:	f9dff06f          	j	10784 <__register_exitproc+0xc>
   107ec:	3147a683          	lw	a3,788(a5)
   107f0:	00000513          	li	a0,0
   107f4:	00c6e6b3          	or	a3,a3,a2
   107f8:	30d7aa23          	sw	a3,788(a5)
   107fc:	00270693          	add	a3,a4,2
   10800:	00369693          	sll	a3,a3,0x3
   10804:	0017071b          	addw	a4,a4,1
   10808:	00e7a423          	sw	a4,8(a5)
   1080c:	00d787b3          	add	a5,a5,a3
   10810:	00b7b023          	sd	a1,0(a5)
   10814:	00008067          	ret
   10818:	fff00513          	li	a0,-1
   1081c:	00008067          	ret

0000000000010820 <_exit>:
   10820:	05d00893          	li	a7,93
   10824:	00000073          	ecall
   10828:	00054463          	bltz	a0,10830 <_exit+0x10>
   1082c:	0000006f          	j	1082c <_exit+0xc>
   10830:	ff010113          	add	sp,sp,-16
   10834:	00813023          	sd	s0,0(sp)
   10838:	00050413          	mv	s0,a0
   1083c:	00113423          	sd	ra,8(sp)
   10840:	4080043b          	negw	s0,s0
   10844:	00c000ef          	jal	10850 <__errno>
   10848:	00852023          	sw	s0,0(a0) # 11000 <__EH_FRAME_BEGIN__>
   1084c:	0000006f          	j	1084c <_exit+0x2c>

0000000000010850 <__errno>:
   10850:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10854:	00008067          	ret
