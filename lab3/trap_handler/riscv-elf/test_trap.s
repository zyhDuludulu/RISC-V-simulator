
../../../Desktop/CS211/cs211-lab/lab3/trap_handler/riscv-elf/test_trap.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	add	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	4bc000ef          	jal	105b8 <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	6e4000ef          	jal	107f8 <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00010537          	lui	a0,0x10
   10124:	6e050513          	add	a0,a0,1760 # 106e0 <__libc_fini_array>
   10128:	6140006f          	j	1073c <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00001197          	auipc	gp,0x1
   10134:	6f018193          	add	gp,gp,1776 # 11820 <__global_pointer$>
   10138:	f6018513          	add	a0,gp,-160 # 11780 <completed.1>
   1013c:	f9818613          	add	a2,gp,-104 # 117b8 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	394000ef          	jal	104dc <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	5f050513          	add	a0,a0,1520 # 1073c <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	58850513          	add	a0,a0,1416 # 106e0 <__libc_fini_array>
   10160:	5dc000ef          	jal	1073c <atexit>
   10164:	2dc000ef          	jal	10440 <__libc_init_array>
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
   10240:	0b0000ef          	jal	102f0 <print_d>
   10244:	00a00513          	li	a0,10
   10248:	0fc000ef          	jal	10344 <print_c>
   1024c:	fec42783          	lw	a5,-20(s0)
   10250:	00078713          	mv	a4,a5
   10254:	fe842783          	lw	a5,-24(s0)
   10258:	40f707bb          	subw	a5,a4,a5
   1025c:	fcf42823          	sw	a5,-48(s0)
   10260:	fd042783          	lw	a5,-48(s0)
   10264:	00078513          	mv	a0,a5
   10268:	088000ef          	jal	102f0 <print_d>
   1026c:	00a00513          	li	a0,10
   10270:	0d4000ef          	jal	10344 <print_c>
   10274:	000117b7          	lui	a5,0x11
   10278:	83078513          	add	a0,a5,-2000 # 10830 <__errno+0x8>
   1027c:	0a0000ef          	jal	1031c <print_s>
   10280:	19c000ef          	jal	1041c <syscall>
   10284:	000117b7          	lui	a5,0x11
   10288:	84878513          	add	a0,a5,-1976 # 10848 <__errno+0x20>
   1028c:	090000ef          	jal	1031c <print_s>
   10290:	fd842783          	lw	a5,-40(s0)
   10294:	fe042703          	lw	a4,-32(s0)
   10298:	00f717bb          	sllw	a5,a4,a5
   1029c:	fcf42823          	sw	a5,-48(s0)
   102a0:	fd042783          	lw	a5,-48(s0)
   102a4:	00078513          	mv	a0,a5
   102a8:	048000ef          	jal	102f0 <print_d>
   102ac:	00a00513          	li	a0,10
   102b0:	094000ef          	jal	10344 <print_c>
   102b4:	fe042783          	lw	a5,-32(s0)
   102b8:	4047d79b          	sraw	a5,a5,0x4
   102bc:	fcf42623          	sw	a5,-52(s0)
   102c0:	fcc42783          	lw	a5,-52(s0)
   102c4:	00078513          	mv	a0,a5
   102c8:	028000ef          	jal	102f0 <print_d>
   102cc:	00a00513          	li	a0,10
   102d0:	074000ef          	jal	10344 <print_c>
   102d4:	09c000ef          	jal	10370 <exit_proc>
   102d8:	00000793          	li	a5,0
   102dc:	00078513          	mv	a0,a5
   102e0:	03813083          	ld	ra,56(sp)
   102e4:	03013403          	ld	s0,48(sp)
   102e8:	04010113          	add	sp,sp,64
   102ec:	00008067          	ret

00000000000102f0 <print_d>:
   102f0:	fe010113          	add	sp,sp,-32
   102f4:	00813c23          	sd	s0,24(sp)
   102f8:	02010413          	add	s0,sp,32
   102fc:	00050793          	mv	a5,a0
   10300:	fef42623          	sw	a5,-20(s0)
   10304:	00200893          	li	a7,2
   10308:	00000073          	ecall
   1030c:	00000013          	nop
   10310:	01813403          	ld	s0,24(sp)
   10314:	02010113          	add	sp,sp,32
   10318:	00008067          	ret

000000000001031c <print_s>:
   1031c:	fe010113          	add	sp,sp,-32
   10320:	00813c23          	sd	s0,24(sp)
   10324:	02010413          	add	s0,sp,32
   10328:	fea43423          	sd	a0,-24(s0)
   1032c:	00000893          	li	a7,0
   10330:	00000073          	ecall
   10334:	00000013          	nop
   10338:	01813403          	ld	s0,24(sp)
   1033c:	02010113          	add	sp,sp,32
   10340:	00008067          	ret

0000000000010344 <print_c>:
   10344:	fe010113          	add	sp,sp,-32
   10348:	00813c23          	sd	s0,24(sp)
   1034c:	02010413          	add	s0,sp,32
   10350:	00050793          	mv	a5,a0
   10354:	fef407a3          	sb	a5,-17(s0)
   10358:	00100893          	li	a7,1
   1035c:	00000073          	ecall
   10360:	00000013          	nop
   10364:	01813403          	ld	s0,24(sp)
   10368:	02010113          	add	sp,sp,32
   1036c:	00008067          	ret

0000000000010370 <exit_proc>:
   10370:	ff010113          	add	sp,sp,-16
   10374:	00813423          	sd	s0,8(sp)
   10378:	01010413          	add	s0,sp,16
   1037c:	00300893          	li	a7,3
   10380:	00000073          	ecall
   10384:	00000013          	nop
   10388:	00813403          	ld	s0,8(sp)
   1038c:	01010113          	add	sp,sp,16
   10390:	00008067          	ret

0000000000010394 <read_char>:
   10394:	fe010113          	add	sp,sp,-32
   10398:	00813c23          	sd	s0,24(sp)
   1039c:	02010413          	add	s0,sp,32
   103a0:	00400893          	li	a7,4
   103a4:	00000073          	ecall
   103a8:	00050793          	mv	a5,a0
   103ac:	fef407a3          	sb	a5,-17(s0)
   103b0:	fef44783          	lbu	a5,-17(s0)
   103b4:	00078513          	mv	a0,a5
   103b8:	01813403          	ld	s0,24(sp)
   103bc:	02010113          	add	sp,sp,32
   103c0:	00008067          	ret

00000000000103c4 <read_num>:
   103c4:	fe010113          	add	sp,sp,-32
   103c8:	00813c23          	sd	s0,24(sp)
   103cc:	02010413          	add	s0,sp,32
   103d0:	00500893          	li	a7,5
   103d4:	00000073          	ecall
   103d8:	00050793          	mv	a5,a0
   103dc:	fef43423          	sd	a5,-24(s0)
   103e0:	fe843783          	ld	a5,-24(s0)
   103e4:	00078513          	mv	a0,a5
   103e8:	01813403          	ld	s0,24(sp)
   103ec:	02010113          	add	sp,sp,32
   103f0:	00008067          	ret

00000000000103f4 <print_f>:
   103f4:	fe010113          	add	sp,sp,-32
   103f8:	00813c23          	sd	s0,24(sp)
   103fc:	02010413          	add	s0,sp,32
   10400:	fea42627          	fsw	fa0,-20(s0)
   10404:	00600893          	li	a7,6
   10408:	00000073          	ecall
   1040c:	00000013          	nop
   10410:	01813403          	ld	s0,24(sp)
   10414:	02010113          	add	sp,sp,32
   10418:	00008067          	ret

000000000001041c <syscall>:
   1041c:	ff010113          	add	sp,sp,-16
   10420:	00813423          	sd	s0,8(sp)
   10424:	01010413          	add	s0,sp,16
   10428:	00700893          	li	a7,7
   1042c:	00000073          	ecall
   10430:	00000013          	nop
   10434:	00813403          	ld	s0,8(sp)
   10438:	01010113          	add	sp,sp,16
   1043c:	00008067          	ret

0000000000010440 <__libc_init_array>:
   10440:	fe010113          	add	sp,sp,-32
   10444:	00813823          	sd	s0,16(sp)
   10448:	000117b7          	lui	a5,0x11
   1044c:	00011437          	lui	s0,0x11
   10450:	01213023          	sd	s2,0(sp)
   10454:	00478793          	add	a5,a5,4 # 11004 <__preinit_array_end>
   10458:	00440713          	add	a4,s0,4 # 11004 <__preinit_array_end>
   1045c:	00113c23          	sd	ra,24(sp)
   10460:	00913423          	sd	s1,8(sp)
   10464:	40e78933          	sub	s2,a5,a4
   10468:	02e78263          	beq	a5,a4,1048c <__libc_init_array+0x4c>
   1046c:	40395913          	sra	s2,s2,0x3
   10470:	00440413          	add	s0,s0,4
   10474:	00000493          	li	s1,0
   10478:	00043783          	ld	a5,0(s0)
   1047c:	00148493          	add	s1,s1,1
   10480:	00840413          	add	s0,s0,8
   10484:	000780e7          	jalr	a5
   10488:	ff24e8e3          	bltu	s1,s2,10478 <__libc_init_array+0x38>
   1048c:	00011437          	lui	s0,0x11
   10490:	000117b7          	lui	a5,0x11
   10494:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   10498:	00840713          	add	a4,s0,8 # 11008 <__init_array_start>
   1049c:	40e78933          	sub	s2,a5,a4
   104a0:	40395913          	sra	s2,s2,0x3
   104a4:	02e78063          	beq	a5,a4,104c4 <__libc_init_array+0x84>
   104a8:	00840413          	add	s0,s0,8
   104ac:	00000493          	li	s1,0
   104b0:	00043783          	ld	a5,0(s0)
   104b4:	00148493          	add	s1,s1,1
   104b8:	00840413          	add	s0,s0,8
   104bc:	000780e7          	jalr	a5
   104c0:	ff24e8e3          	bltu	s1,s2,104b0 <__libc_init_array+0x70>
   104c4:	01813083          	ld	ra,24(sp)
   104c8:	01013403          	ld	s0,16(sp)
   104cc:	00813483          	ld	s1,8(sp)
   104d0:	00013903          	ld	s2,0(sp)
   104d4:	02010113          	add	sp,sp,32
   104d8:	00008067          	ret

00000000000104dc <memset>:
   104dc:	00f00313          	li	t1,15
   104e0:	00050713          	mv	a4,a0
   104e4:	02c37a63          	bgeu	t1,a2,10518 <memset+0x3c>
   104e8:	00f77793          	and	a5,a4,15
   104ec:	0a079063          	bnez	a5,1058c <memset+0xb0>
   104f0:	06059e63          	bnez	a1,1056c <memset+0x90>
   104f4:	ff067693          	and	a3,a2,-16
   104f8:	00f67613          	and	a2,a2,15
   104fc:	00e686b3          	add	a3,a3,a4
   10500:	00b73023          	sd	a1,0(a4)
   10504:	00b73423          	sd	a1,8(a4)
   10508:	01070713          	add	a4,a4,16
   1050c:	fed76ae3          	bltu	a4,a3,10500 <memset+0x24>
   10510:	00061463          	bnez	a2,10518 <memset+0x3c>
   10514:	00008067          	ret
   10518:	40c306b3          	sub	a3,t1,a2
   1051c:	00269693          	sll	a3,a3,0x2
   10520:	00000297          	auipc	t0,0x0
   10524:	005686b3          	add	a3,a3,t0
   10528:	00c68067          	jr	12(a3)
   1052c:	00b70723          	sb	a1,14(a4)
   10530:	00b706a3          	sb	a1,13(a4)
   10534:	00b70623          	sb	a1,12(a4)
   10538:	00b705a3          	sb	a1,11(a4)
   1053c:	00b70523          	sb	a1,10(a4)
   10540:	00b704a3          	sb	a1,9(a4)
   10544:	00b70423          	sb	a1,8(a4)
   10548:	00b703a3          	sb	a1,7(a4)
   1054c:	00b70323          	sb	a1,6(a4)
   10550:	00b702a3          	sb	a1,5(a4)
   10554:	00b70223          	sb	a1,4(a4)
   10558:	00b701a3          	sb	a1,3(a4)
   1055c:	00b70123          	sb	a1,2(a4)
   10560:	00b700a3          	sb	a1,1(a4)
   10564:	00b70023          	sb	a1,0(a4)
   10568:	00008067          	ret
   1056c:	0ff5f593          	zext.b	a1,a1
   10570:	00859693          	sll	a3,a1,0x8
   10574:	00d5e5b3          	or	a1,a1,a3
   10578:	01059693          	sll	a3,a1,0x10
   1057c:	00d5e5b3          	or	a1,a1,a3
   10580:	02059693          	sll	a3,a1,0x20
   10584:	00d5e5b3          	or	a1,a1,a3
   10588:	f6dff06f          	j	104f4 <memset+0x18>
   1058c:	00279693          	sll	a3,a5,0x2
   10590:	00000297          	auipc	t0,0x0
   10594:	005686b3          	add	a3,a3,t0
   10598:	00008293          	mv	t0,ra
   1059c:	f98680e7          	jalr	-104(a3)
   105a0:	00028093          	mv	ra,t0
   105a4:	ff078793          	add	a5,a5,-16
   105a8:	40f70733          	sub	a4,a4,a5
   105ac:	00f60633          	add	a2,a2,a5
   105b0:	f6c374e3          	bgeu	t1,a2,10518 <memset+0x3c>
   105b4:	f3dff06f          	j	104f0 <memset+0x14>

00000000000105b8 <__call_exitprocs>:
   105b8:	fb010113          	add	sp,sp,-80
   105bc:	03413023          	sd	s4,32(sp)
   105c0:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   105c4:	03213823          	sd	s2,48(sp)
   105c8:	04113423          	sd	ra,72(sp)
   105cc:	1f8a3903          	ld	s2,504(s4)
   105d0:	04813023          	sd	s0,64(sp)
   105d4:	02913c23          	sd	s1,56(sp)
   105d8:	03313423          	sd	s3,40(sp)
   105dc:	01513c23          	sd	s5,24(sp)
   105e0:	01613823          	sd	s6,16(sp)
   105e4:	01713423          	sd	s7,8(sp)
   105e8:	01813023          	sd	s8,0(sp)
   105ec:	04090063          	beqz	s2,1062c <__call_exitprocs+0x74>
   105f0:	00050b13          	mv	s6,a0
   105f4:	00058b93          	mv	s7,a1
   105f8:	00100a93          	li	s5,1
   105fc:	fff00993          	li	s3,-1
   10600:	00892483          	lw	s1,8(s2)
   10604:	fff4841b          	addw	s0,s1,-1
   10608:	02044263          	bltz	s0,1062c <__call_exitprocs+0x74>
   1060c:	00349493          	sll	s1,s1,0x3
   10610:	009904b3          	add	s1,s2,s1
   10614:	040b8463          	beqz	s7,1065c <__call_exitprocs+0xa4>
   10618:	2084b783          	ld	a5,520(s1)
   1061c:	05778063          	beq	a5,s7,1065c <__call_exitprocs+0xa4>
   10620:	fff4041b          	addw	s0,s0,-1
   10624:	ff848493          	add	s1,s1,-8
   10628:	ff3416e3          	bne	s0,s3,10614 <__call_exitprocs+0x5c>
   1062c:	04813083          	ld	ra,72(sp)
   10630:	04013403          	ld	s0,64(sp)
   10634:	03813483          	ld	s1,56(sp)
   10638:	03013903          	ld	s2,48(sp)
   1063c:	02813983          	ld	s3,40(sp)
   10640:	02013a03          	ld	s4,32(sp)
   10644:	01813a83          	ld	s5,24(sp)
   10648:	01013b03          	ld	s6,16(sp)
   1064c:	00813b83          	ld	s7,8(sp)
   10650:	00013c03          	ld	s8,0(sp)
   10654:	05010113          	add	sp,sp,80
   10658:	00008067          	ret
   1065c:	00892783          	lw	a5,8(s2)
   10660:	0084b703          	ld	a4,8(s1)
   10664:	fff7879b          	addw	a5,a5,-1
   10668:	06878263          	beq	a5,s0,106cc <__call_exitprocs+0x114>
   1066c:	0004b423          	sd	zero,8(s1)
   10670:	fa0708e3          	beqz	a4,10620 <__call_exitprocs+0x68>
   10674:	31092783          	lw	a5,784(s2)
   10678:	008a96bb          	sllw	a3,s5,s0
   1067c:	00892c03          	lw	s8,8(s2)
   10680:	00d7f7b3          	and	a5,a5,a3
   10684:	0007879b          	sext.w	a5,a5
   10688:	02079263          	bnez	a5,106ac <__call_exitprocs+0xf4>
   1068c:	000700e7          	jalr	a4
   10690:	00892703          	lw	a4,8(s2)
   10694:	1f8a3783          	ld	a5,504(s4)
   10698:	01871463          	bne	a4,s8,106a0 <__call_exitprocs+0xe8>
   1069c:	f92782e3          	beq	a5,s2,10620 <__call_exitprocs+0x68>
   106a0:	f80786e3          	beqz	a5,1062c <__call_exitprocs+0x74>
   106a4:	00078913          	mv	s2,a5
   106a8:	f59ff06f          	j	10600 <__call_exitprocs+0x48>
   106ac:	31492783          	lw	a5,788(s2)
   106b0:	1084b583          	ld	a1,264(s1)
   106b4:	00d7f7b3          	and	a5,a5,a3
   106b8:	0007879b          	sext.w	a5,a5
   106bc:	00079c63          	bnez	a5,106d4 <__call_exitprocs+0x11c>
   106c0:	000b0513          	mv	a0,s6
   106c4:	000700e7          	jalr	a4
   106c8:	fc9ff06f          	j	10690 <__call_exitprocs+0xd8>
   106cc:	00892423          	sw	s0,8(s2)
   106d0:	fa1ff06f          	j	10670 <__call_exitprocs+0xb8>
   106d4:	00058513          	mv	a0,a1
   106d8:	000700e7          	jalr	a4
   106dc:	fb5ff06f          	j	10690 <__call_exitprocs+0xd8>

00000000000106e0 <__libc_fini_array>:
   106e0:	fe010113          	add	sp,sp,-32
   106e4:	00813823          	sd	s0,16(sp)
   106e8:	000117b7          	lui	a5,0x11
   106ec:	00011437          	lui	s0,0x11
   106f0:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   106f4:	02040413          	add	s0,s0,32 # 11020 <impure_data>
   106f8:	40f40433          	sub	s0,s0,a5
   106fc:	00913423          	sd	s1,8(sp)
   10700:	00113c23          	sd	ra,24(sp)
   10704:	40345493          	sra	s1,s0,0x3
   10708:	02048063          	beqz	s1,10728 <__libc_fini_array+0x48>
   1070c:	ff840413          	add	s0,s0,-8
   10710:	00f40433          	add	s0,s0,a5
   10714:	00043783          	ld	a5,0(s0)
   10718:	fff48493          	add	s1,s1,-1
   1071c:	ff840413          	add	s0,s0,-8
   10720:	000780e7          	jalr	a5
   10724:	fe0498e3          	bnez	s1,10714 <__libc_fini_array+0x34>
   10728:	01813083          	ld	ra,24(sp)
   1072c:	01013403          	ld	s0,16(sp)
   10730:	00813483          	ld	s1,8(sp)
   10734:	02010113          	add	sp,sp,32
   10738:	00008067          	ret

000000000001073c <atexit>:
   1073c:	00050593          	mv	a1,a0
   10740:	00000693          	li	a3,0
   10744:	00000613          	li	a2,0
   10748:	00000513          	li	a0,0
   1074c:	0040006f          	j	10750 <__register_exitproc>

0000000000010750 <__register_exitproc>:
   10750:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   10754:	1f873783          	ld	a5,504(a4)
   10758:	06078063          	beqz	a5,107b8 <__register_exitproc+0x68>
   1075c:	0087a703          	lw	a4,8(a5)
   10760:	01f00813          	li	a6,31
   10764:	08e84663          	blt	a6,a4,107f0 <__register_exitproc+0xa0>
   10768:	02050863          	beqz	a0,10798 <__register_exitproc+0x48>
   1076c:	00371813          	sll	a6,a4,0x3
   10770:	01078833          	add	a6,a5,a6
   10774:	10c83823          	sd	a2,272(a6)
   10778:	3107a883          	lw	a7,784(a5)
   1077c:	00100613          	li	a2,1
   10780:	00e6163b          	sllw	a2,a2,a4
   10784:	00c8e8b3          	or	a7,a7,a2
   10788:	3117a823          	sw	a7,784(a5)
   1078c:	20d83823          	sd	a3,528(a6)
   10790:	00200693          	li	a3,2
   10794:	02d50863          	beq	a0,a3,107c4 <__register_exitproc+0x74>
   10798:	00270693          	add	a3,a4,2
   1079c:	00369693          	sll	a3,a3,0x3
   107a0:	0017071b          	addw	a4,a4,1
   107a4:	00e7a423          	sw	a4,8(a5)
   107a8:	00d787b3          	add	a5,a5,a3
   107ac:	00b7b023          	sd	a1,0(a5)
   107b0:	00000513          	li	a0,0
   107b4:	00008067          	ret
   107b8:	20070793          	add	a5,a4,512
   107bc:	1ef73c23          	sd	a5,504(a4)
   107c0:	f9dff06f          	j	1075c <__register_exitproc+0xc>
   107c4:	3147a683          	lw	a3,788(a5)
   107c8:	00000513          	li	a0,0
   107cc:	00c6e6b3          	or	a3,a3,a2
   107d0:	30d7aa23          	sw	a3,788(a5)
   107d4:	00270693          	add	a3,a4,2
   107d8:	00369693          	sll	a3,a3,0x3
   107dc:	0017071b          	addw	a4,a4,1
   107e0:	00e7a423          	sw	a4,8(a5)
   107e4:	00d787b3          	add	a5,a5,a3
   107e8:	00b7b023          	sd	a1,0(a5)
   107ec:	00008067          	ret
   107f0:	fff00513          	li	a0,-1
   107f4:	00008067          	ret

00000000000107f8 <_exit>:
   107f8:	05d00893          	li	a7,93
   107fc:	00000073          	ecall
   10800:	00054463          	bltz	a0,10808 <_exit+0x10>
   10804:	0000006f          	j	10804 <_exit+0xc>
   10808:	ff010113          	add	sp,sp,-16
   1080c:	00813023          	sd	s0,0(sp)
   10810:	00050413          	mv	s0,a0
   10814:	00113423          	sd	ra,8(sp)
   10818:	4080043b          	negw	s0,s0
   1081c:	00c000ef          	jal	10828 <__errno>
   10820:	00852023          	sw	s0,0(a0) # 11000 <__EH_FRAME_BEGIN__>
   10824:	0000006f          	j	10824 <_exit+0x2c>

0000000000010828 <__errno>:
   10828:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   1082c:	00008067          	ret
