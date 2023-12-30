
../../../Desktop/CS211/lab0/cs211_23f_lab_sim_framework/riscv-elf/fcvtws.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	add	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	5fc000ef          	jal	106f8 <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	025000ef          	jal	10938 <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00011537          	lui	a0,0x11
   10124:	82050513          	add	a0,a0,-2016 # 10820 <__libc_fini_array>
   10128:	7540006f          	j	1087c <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00001197          	auipc	gp,0x1
   10134:	6f018193          	add	gp,gp,1776 # 11820 <__global_pointer$>
   10138:	f6018513          	add	a0,gp,-160 # 11780 <completed.1>
   1013c:	f9818613          	add	a2,gp,-104 # 117b8 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	4d4000ef          	jal	1061c <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	73050513          	add	a0,a0,1840 # 1087c <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	6c850513          	add	a0,a0,1736 # 10820 <__libc_fini_array>
   10160:	71c000ef          	jal	1087c <atexit>
   10164:	41c000ef          	jal	10580 <__libc_init_array>
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
   101e0:	fe010113          	add	sp,sp,-32
   101e4:	00113c23          	sd	ra,24(sp)
   101e8:	00813823          	sd	s0,16(sp)
   101ec:	02010413          	add	s0,sp,32
   101f0:	000117b7          	lui	a5,0x11
   101f4:	9707a787          	flw	fa5,-1680(a5) # 10970 <__errno+0x8>
   101f8:	fef42627          	fsw	fa5,-20(s0)
   101fc:	fec42507          	flw	fa0,-20(s0)
   10200:	248000ef          	jal	10448 <fcvtws>
   10204:	000117b7          	lui	a5,0x11
   10208:	9747a787          	flw	fa5,-1676(a5) # 10974 <__errno+0xc>
   1020c:	fef42627          	fsw	fa5,-20(s0)
   10210:	fec42507          	flw	fa0,-20(s0)
   10214:	234000ef          	jal	10448 <fcvtws>
   10218:	000117b7          	lui	a5,0x11
   1021c:	9787a787          	flw	fa5,-1672(a5) # 10978 <__errno+0x10>
   10220:	fef42627          	fsw	fa5,-20(s0)
   10224:	fec42507          	flw	fa0,-20(s0)
   10228:	220000ef          	jal	10448 <fcvtws>
   1022c:	09c000ef          	jal	102c8 <exit_proc>
   10230:	00000793          	li	a5,0
   10234:	00078513          	mv	a0,a5
   10238:	01813083          	ld	ra,24(sp)
   1023c:	01013403          	ld	s0,16(sp)
   10240:	02010113          	add	sp,sp,32
   10244:	00008067          	ret

0000000000010248 <print_d>:
   10248:	fe010113          	add	sp,sp,-32
   1024c:	00813c23          	sd	s0,24(sp)
   10250:	02010413          	add	s0,sp,32
   10254:	00050793          	mv	a5,a0
   10258:	fef42623          	sw	a5,-20(s0)
   1025c:	00200893          	li	a7,2
   10260:	00000073          	ecall
   10264:	00000013          	nop
   10268:	01813403          	ld	s0,24(sp)
   1026c:	02010113          	add	sp,sp,32
   10270:	00008067          	ret

0000000000010274 <print_s>:
   10274:	fe010113          	add	sp,sp,-32
   10278:	00813c23          	sd	s0,24(sp)
   1027c:	02010413          	add	s0,sp,32
   10280:	fea43423          	sd	a0,-24(s0)
   10284:	00000893          	li	a7,0
   10288:	00000073          	ecall
   1028c:	00000013          	nop
   10290:	01813403          	ld	s0,24(sp)
   10294:	02010113          	add	sp,sp,32
   10298:	00008067          	ret

000000000001029c <print_c>:
   1029c:	fe010113          	add	sp,sp,-32
   102a0:	00813c23          	sd	s0,24(sp)
   102a4:	02010413          	add	s0,sp,32
   102a8:	00050793          	mv	a5,a0
   102ac:	fef407a3          	sb	a5,-17(s0)
   102b0:	00100893          	li	a7,1
   102b4:	00000073          	ecall
   102b8:	00000013          	nop
   102bc:	01813403          	ld	s0,24(sp)
   102c0:	02010113          	add	sp,sp,32
   102c4:	00008067          	ret

00000000000102c8 <exit_proc>:
   102c8:	ff010113          	add	sp,sp,-16
   102cc:	00813423          	sd	s0,8(sp)
   102d0:	01010413          	add	s0,sp,16
   102d4:	00300893          	li	a7,3
   102d8:	00000073          	ecall
   102dc:	00000013          	nop
   102e0:	00813403          	ld	s0,8(sp)
   102e4:	01010113          	add	sp,sp,16
   102e8:	00008067          	ret

00000000000102ec <read_char>:
   102ec:	fe010113          	add	sp,sp,-32
   102f0:	00813c23          	sd	s0,24(sp)
   102f4:	02010413          	add	s0,sp,32
   102f8:	00400893          	li	a7,4
   102fc:	00000073          	ecall
   10300:	00050793          	mv	a5,a0
   10304:	fef407a3          	sb	a5,-17(s0)
   10308:	fef44783          	lbu	a5,-17(s0)
   1030c:	00078513          	mv	a0,a5
   10310:	01813403          	ld	s0,24(sp)
   10314:	02010113          	add	sp,sp,32
   10318:	00008067          	ret

000000000001031c <read_num>:
   1031c:	fe010113          	add	sp,sp,-32
   10320:	00813c23          	sd	s0,24(sp)
   10324:	02010413          	add	s0,sp,32
   10328:	00500893          	li	a7,5
   1032c:	00000073          	ecall
   10330:	00050793          	mv	a5,a0
   10334:	fef43423          	sd	a5,-24(s0)
   10338:	fe843783          	ld	a5,-24(s0)
   1033c:	00078513          	mv	a0,a5
   10340:	01813403          	ld	s0,24(sp)
   10344:	02010113          	add	sp,sp,32
   10348:	00008067          	ret

000000000001034c <print_f>:
   1034c:	fe010113          	add	sp,sp,-32
   10350:	00813c23          	sd	s0,24(sp)
   10354:	02010413          	add	s0,sp,32
   10358:	fea42627          	fsw	fa0,-20(s0)
   1035c:	00600893          	li	a7,6
   10360:	00000073          	ecall
   10364:	00000013          	nop
   10368:	01813403          	ld	s0,24(sp)
   1036c:	02010113          	add	sp,sp,32
   10370:	00008067          	ret

0000000000010374 <fsqrt>:
   10374:	fd010113          	add	sp,sp,-48
   10378:	02113423          	sd	ra,40(sp)
   1037c:	02813023          	sd	s0,32(sp)
   10380:	03010413          	add	s0,sp,48
   10384:	fca42e27          	fsw	fa0,-36(s0)
   10388:	fdc42787          	flw	fa5,-36(s0)
   1038c:	5807f7d3          	fsqrt.s	fa5,fa5
   10390:	fef42627          	fsw	fa5,-20(s0)
   10394:	fec42507          	flw	fa0,-20(s0)
   10398:	fb5ff0ef          	jal	1034c <print_f>
   1039c:	00a00513          	li	a0,10
   103a0:	efdff0ef          	jal	1029c <print_c>
   103a4:	00000013          	nop
   103a8:	02813083          	ld	ra,40(sp)
   103ac:	02013403          	ld	s0,32(sp)
   103b0:	03010113          	add	sp,sp,48
   103b4:	00008067          	ret

00000000000103b8 <fmvxw>:
   103b8:	fd010113          	add	sp,sp,-48
   103bc:	02113423          	sd	ra,40(sp)
   103c0:	02813023          	sd	s0,32(sp)
   103c4:	03010413          	add	s0,sp,48
   103c8:	fca42e27          	fsw	fa0,-36(s0)
   103cc:	fdc42787          	flw	fa5,-36(s0)
   103d0:	e00787d3          	fmv.x.w	a5,fa5
   103d4:	fef42623          	sw	a5,-20(s0)
   103d8:	fec42783          	lw	a5,-20(s0)
   103dc:	00078513          	mv	a0,a5
   103e0:	e69ff0ef          	jal	10248 <print_d>
   103e4:	00a00513          	li	a0,10
   103e8:	eb5ff0ef          	jal	1029c <print_c>
   103ec:	00000013          	nop
   103f0:	02813083          	ld	ra,40(sp)
   103f4:	02013403          	ld	s0,32(sp)
   103f8:	03010113          	add	sp,sp,48
   103fc:	00008067          	ret

0000000000010400 <fmvwx>:
   10400:	fd010113          	add	sp,sp,-48
   10404:	02113423          	sd	ra,40(sp)
   10408:	02813023          	sd	s0,32(sp)
   1040c:	03010413          	add	s0,sp,48
   10410:	00050793          	mv	a5,a0
   10414:	fcf42e23          	sw	a5,-36(s0)
   10418:	fdc42783          	lw	a5,-36(s0)
   1041c:	f00787d3          	fmv.w.x	fa5,a5
   10420:	fef42627          	fsw	fa5,-20(s0)
   10424:	fec42507          	flw	fa0,-20(s0)
   10428:	f25ff0ef          	jal	1034c <print_f>
   1042c:	00a00513          	li	a0,10
   10430:	e6dff0ef          	jal	1029c <print_c>
   10434:	00000013          	nop
   10438:	02813083          	ld	ra,40(sp)
   1043c:	02013403          	ld	s0,32(sp)
   10440:	03010113          	add	sp,sp,48
   10444:	00008067          	ret

0000000000010448 <fcvtws>:
   10448:	fd010113          	add	sp,sp,-48
   1044c:	02113423          	sd	ra,40(sp)
   10450:	02813023          	sd	s0,32(sp)
   10454:	03010413          	add	s0,sp,48
   10458:	fca42e27          	fsw	fa0,-36(s0)
   1045c:	fdc42787          	flw	fa5,-36(s0)
   10460:	c007f7d3          	fcvt.w.s	a5,fa5
   10464:	fef42623          	sw	a5,-20(s0)
   10468:	fec42783          	lw	a5,-20(s0)
   1046c:	00078513          	mv	a0,a5
   10470:	dd9ff0ef          	jal	10248 <print_d>
   10474:	00a00513          	li	a0,10
   10478:	e25ff0ef          	jal	1029c <print_c>
   1047c:	00000013          	nop
   10480:	02813083          	ld	ra,40(sp)
   10484:	02013403          	ld	s0,32(sp)
   10488:	03010113          	add	sp,sp,48
   1048c:	00008067          	ret

0000000000010490 <fcvtsw>:
   10490:	fd010113          	add	sp,sp,-48
   10494:	02113423          	sd	ra,40(sp)
   10498:	02813023          	sd	s0,32(sp)
   1049c:	03010413          	add	s0,sp,48
   104a0:	00050793          	mv	a5,a0
   104a4:	fcf42e23          	sw	a5,-36(s0)
   104a8:	fdc42783          	lw	a5,-36(s0)
   104ac:	d007f7d3          	fcvt.s.w	fa5,a5
   104b0:	fef42627          	fsw	fa5,-20(s0)
   104b4:	fec42507          	flw	fa0,-20(s0)
   104b8:	e95ff0ef          	jal	1034c <print_f>
   104bc:	00a00513          	li	a0,10
   104c0:	dddff0ef          	jal	1029c <print_c>
   104c4:	00000013          	nop
   104c8:	02813083          	ld	ra,40(sp)
   104cc:	02013403          	ld	s0,32(sp)
   104d0:	03010113          	add	sp,sp,48
   104d4:	00008067          	ret

00000000000104d8 <fmadds>:
   104d8:	fd010113          	add	sp,sp,-48
   104dc:	02113423          	sd	ra,40(sp)
   104e0:	02813023          	sd	s0,32(sp)
   104e4:	03010413          	add	s0,sp,48
   104e8:	fca42e27          	fsw	fa0,-36(s0)
   104ec:	fcb42c27          	fsw	fa1,-40(s0)
   104f0:	fcc42a27          	fsw	fa2,-44(s0)
   104f4:	fdc42787          	flw	fa5,-36(s0)
   104f8:	fd842707          	flw	fa4,-40(s0)
   104fc:	fd442687          	flw	fa3,-44(s0)
   10500:	68e7f7c3          	fmadd.s	fa5,fa5,fa4,fa3
   10504:	fef42627          	fsw	fa5,-20(s0)
   10508:	fec42507          	flw	fa0,-20(s0)
   1050c:	e41ff0ef          	jal	1034c <print_f>
   10510:	00a00513          	li	a0,10
   10514:	d89ff0ef          	jal	1029c <print_c>
   10518:	00000013          	nop
   1051c:	02813083          	ld	ra,40(sp)
   10520:	02013403          	ld	s0,32(sp)
   10524:	03010113          	add	sp,sp,48
   10528:	00008067          	ret

000000000001052c <fmsubs>:
   1052c:	fd010113          	add	sp,sp,-48
   10530:	02113423          	sd	ra,40(sp)
   10534:	02813023          	sd	s0,32(sp)
   10538:	03010413          	add	s0,sp,48
   1053c:	fca42e27          	fsw	fa0,-36(s0)
   10540:	fcb42c27          	fsw	fa1,-40(s0)
   10544:	fcc42a27          	fsw	fa2,-44(s0)
   10548:	fdc42787          	flw	fa5,-36(s0)
   1054c:	fd842707          	flw	fa4,-40(s0)
   10550:	fd442687          	flw	fa3,-44(s0)
   10554:	68e7f7c7          	fmsub.s	fa5,fa5,fa4,fa3
   10558:	fef42627          	fsw	fa5,-20(s0)
   1055c:	fec42507          	flw	fa0,-20(s0)
   10560:	dedff0ef          	jal	1034c <print_f>
   10564:	00a00513          	li	a0,10
   10568:	d35ff0ef          	jal	1029c <print_c>
   1056c:	00000013          	nop
   10570:	02813083          	ld	ra,40(sp)
   10574:	02013403          	ld	s0,32(sp)
   10578:	03010113          	add	sp,sp,48
   1057c:	00008067          	ret

0000000000010580 <__libc_init_array>:
   10580:	fe010113          	add	sp,sp,-32
   10584:	00813823          	sd	s0,16(sp)
   10588:	000117b7          	lui	a5,0x11
   1058c:	00011437          	lui	s0,0x11
   10590:	01213023          	sd	s2,0(sp)
   10594:	00478793          	add	a5,a5,4 # 11004 <__preinit_array_end>
   10598:	00440713          	add	a4,s0,4 # 11004 <__preinit_array_end>
   1059c:	00113c23          	sd	ra,24(sp)
   105a0:	00913423          	sd	s1,8(sp)
   105a4:	40e78933          	sub	s2,a5,a4
   105a8:	02e78263          	beq	a5,a4,105cc <__libc_init_array+0x4c>
   105ac:	40395913          	sra	s2,s2,0x3
   105b0:	00440413          	add	s0,s0,4
   105b4:	00000493          	li	s1,0
   105b8:	00043783          	ld	a5,0(s0)
   105bc:	00148493          	add	s1,s1,1
   105c0:	00840413          	add	s0,s0,8
   105c4:	000780e7          	jalr	a5
   105c8:	ff24e8e3          	bltu	s1,s2,105b8 <__libc_init_array+0x38>
   105cc:	00011437          	lui	s0,0x11
   105d0:	000117b7          	lui	a5,0x11
   105d4:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   105d8:	00840713          	add	a4,s0,8 # 11008 <__init_array_start>
   105dc:	40e78933          	sub	s2,a5,a4
   105e0:	40395913          	sra	s2,s2,0x3
   105e4:	02e78063          	beq	a5,a4,10604 <__libc_init_array+0x84>
   105e8:	00840413          	add	s0,s0,8
   105ec:	00000493          	li	s1,0
   105f0:	00043783          	ld	a5,0(s0)
   105f4:	00148493          	add	s1,s1,1
   105f8:	00840413          	add	s0,s0,8
   105fc:	000780e7          	jalr	a5
   10600:	ff24e8e3          	bltu	s1,s2,105f0 <__libc_init_array+0x70>
   10604:	01813083          	ld	ra,24(sp)
   10608:	01013403          	ld	s0,16(sp)
   1060c:	00813483          	ld	s1,8(sp)
   10610:	00013903          	ld	s2,0(sp)
   10614:	02010113          	add	sp,sp,32
   10618:	00008067          	ret

000000000001061c <memset>:
   1061c:	00f00313          	li	t1,15
   10620:	00050713          	mv	a4,a0
   10624:	02c37a63          	bgeu	t1,a2,10658 <memset+0x3c>
   10628:	00f77793          	and	a5,a4,15
   1062c:	0a079063          	bnez	a5,106cc <memset+0xb0>
   10630:	06059e63          	bnez	a1,106ac <memset+0x90>
   10634:	ff067693          	and	a3,a2,-16
   10638:	00f67613          	and	a2,a2,15
   1063c:	00e686b3          	add	a3,a3,a4
   10640:	00b73023          	sd	a1,0(a4)
   10644:	00b73423          	sd	a1,8(a4)
   10648:	01070713          	add	a4,a4,16
   1064c:	fed76ae3          	bltu	a4,a3,10640 <memset+0x24>
   10650:	00061463          	bnez	a2,10658 <memset+0x3c>
   10654:	00008067          	ret
   10658:	40c306b3          	sub	a3,t1,a2
   1065c:	00269693          	sll	a3,a3,0x2
   10660:	00000297          	auipc	t0,0x0
   10664:	005686b3          	add	a3,a3,t0
   10668:	00c68067          	jr	12(a3)
   1066c:	00b70723          	sb	a1,14(a4)
   10670:	00b706a3          	sb	a1,13(a4)
   10674:	00b70623          	sb	a1,12(a4)
   10678:	00b705a3          	sb	a1,11(a4)
   1067c:	00b70523          	sb	a1,10(a4)
   10680:	00b704a3          	sb	a1,9(a4)
   10684:	00b70423          	sb	a1,8(a4)
   10688:	00b703a3          	sb	a1,7(a4)
   1068c:	00b70323          	sb	a1,6(a4)
   10690:	00b702a3          	sb	a1,5(a4)
   10694:	00b70223          	sb	a1,4(a4)
   10698:	00b701a3          	sb	a1,3(a4)
   1069c:	00b70123          	sb	a1,2(a4)
   106a0:	00b700a3          	sb	a1,1(a4)
   106a4:	00b70023          	sb	a1,0(a4)
   106a8:	00008067          	ret
   106ac:	0ff5f593          	zext.b	a1,a1
   106b0:	00859693          	sll	a3,a1,0x8
   106b4:	00d5e5b3          	or	a1,a1,a3
   106b8:	01059693          	sll	a3,a1,0x10
   106bc:	00d5e5b3          	or	a1,a1,a3
   106c0:	02059693          	sll	a3,a1,0x20
   106c4:	00d5e5b3          	or	a1,a1,a3
   106c8:	f6dff06f          	j	10634 <memset+0x18>
   106cc:	00279693          	sll	a3,a5,0x2
   106d0:	00000297          	auipc	t0,0x0
   106d4:	005686b3          	add	a3,a3,t0
   106d8:	00008293          	mv	t0,ra
   106dc:	f98680e7          	jalr	-104(a3)
   106e0:	00028093          	mv	ra,t0
   106e4:	ff078793          	add	a5,a5,-16
   106e8:	40f70733          	sub	a4,a4,a5
   106ec:	00f60633          	add	a2,a2,a5
   106f0:	f6c374e3          	bgeu	t1,a2,10658 <memset+0x3c>
   106f4:	f3dff06f          	j	10630 <memset+0x14>

00000000000106f8 <__call_exitprocs>:
   106f8:	fb010113          	add	sp,sp,-80
   106fc:	03413023          	sd	s4,32(sp)
   10700:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   10704:	03213823          	sd	s2,48(sp)
   10708:	04113423          	sd	ra,72(sp)
   1070c:	1f8a3903          	ld	s2,504(s4)
   10710:	04813023          	sd	s0,64(sp)
   10714:	02913c23          	sd	s1,56(sp)
   10718:	03313423          	sd	s3,40(sp)
   1071c:	01513c23          	sd	s5,24(sp)
   10720:	01613823          	sd	s6,16(sp)
   10724:	01713423          	sd	s7,8(sp)
   10728:	01813023          	sd	s8,0(sp)
   1072c:	04090063          	beqz	s2,1076c <__call_exitprocs+0x74>
   10730:	00050b13          	mv	s6,a0
   10734:	00058b93          	mv	s7,a1
   10738:	00100a93          	li	s5,1
   1073c:	fff00993          	li	s3,-1
   10740:	00892483          	lw	s1,8(s2)
   10744:	fff4841b          	addw	s0,s1,-1
   10748:	02044263          	bltz	s0,1076c <__call_exitprocs+0x74>
   1074c:	00349493          	sll	s1,s1,0x3
   10750:	009904b3          	add	s1,s2,s1
   10754:	040b8463          	beqz	s7,1079c <__call_exitprocs+0xa4>
   10758:	2084b783          	ld	a5,520(s1)
   1075c:	05778063          	beq	a5,s7,1079c <__call_exitprocs+0xa4>
   10760:	fff4041b          	addw	s0,s0,-1
   10764:	ff848493          	add	s1,s1,-8
   10768:	ff3416e3          	bne	s0,s3,10754 <__call_exitprocs+0x5c>
   1076c:	04813083          	ld	ra,72(sp)
   10770:	04013403          	ld	s0,64(sp)
   10774:	03813483          	ld	s1,56(sp)
   10778:	03013903          	ld	s2,48(sp)
   1077c:	02813983          	ld	s3,40(sp)
   10780:	02013a03          	ld	s4,32(sp)
   10784:	01813a83          	ld	s5,24(sp)
   10788:	01013b03          	ld	s6,16(sp)
   1078c:	00813b83          	ld	s7,8(sp)
   10790:	00013c03          	ld	s8,0(sp)
   10794:	05010113          	add	sp,sp,80
   10798:	00008067          	ret
   1079c:	00892783          	lw	a5,8(s2)
   107a0:	0084b703          	ld	a4,8(s1)
   107a4:	fff7879b          	addw	a5,a5,-1
   107a8:	06878263          	beq	a5,s0,1080c <__call_exitprocs+0x114>
   107ac:	0004b423          	sd	zero,8(s1)
   107b0:	fa0708e3          	beqz	a4,10760 <__call_exitprocs+0x68>
   107b4:	31092783          	lw	a5,784(s2)
   107b8:	008a96bb          	sllw	a3,s5,s0
   107bc:	00892c03          	lw	s8,8(s2)
   107c0:	00d7f7b3          	and	a5,a5,a3
   107c4:	0007879b          	sext.w	a5,a5
   107c8:	02079263          	bnez	a5,107ec <__call_exitprocs+0xf4>
   107cc:	000700e7          	jalr	a4
   107d0:	00892703          	lw	a4,8(s2)
   107d4:	1f8a3783          	ld	a5,504(s4)
   107d8:	01871463          	bne	a4,s8,107e0 <__call_exitprocs+0xe8>
   107dc:	f92782e3          	beq	a5,s2,10760 <__call_exitprocs+0x68>
   107e0:	f80786e3          	beqz	a5,1076c <__call_exitprocs+0x74>
   107e4:	00078913          	mv	s2,a5
   107e8:	f59ff06f          	j	10740 <__call_exitprocs+0x48>
   107ec:	31492783          	lw	a5,788(s2)
   107f0:	1084b583          	ld	a1,264(s1)
   107f4:	00d7f7b3          	and	a5,a5,a3
   107f8:	0007879b          	sext.w	a5,a5
   107fc:	00079c63          	bnez	a5,10814 <__call_exitprocs+0x11c>
   10800:	000b0513          	mv	a0,s6
   10804:	000700e7          	jalr	a4
   10808:	fc9ff06f          	j	107d0 <__call_exitprocs+0xd8>
   1080c:	00892423          	sw	s0,8(s2)
   10810:	fa1ff06f          	j	107b0 <__call_exitprocs+0xb8>
   10814:	00058513          	mv	a0,a1
   10818:	000700e7          	jalr	a4
   1081c:	fb5ff06f          	j	107d0 <__call_exitprocs+0xd8>

0000000000010820 <__libc_fini_array>:
   10820:	fe010113          	add	sp,sp,-32
   10824:	00813823          	sd	s0,16(sp)
   10828:	000117b7          	lui	a5,0x11
   1082c:	00011437          	lui	s0,0x11
   10830:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   10834:	02040413          	add	s0,s0,32 # 11020 <impure_data>
   10838:	40f40433          	sub	s0,s0,a5
   1083c:	00913423          	sd	s1,8(sp)
   10840:	00113c23          	sd	ra,24(sp)
   10844:	40345493          	sra	s1,s0,0x3
   10848:	02048063          	beqz	s1,10868 <__libc_fini_array+0x48>
   1084c:	ff840413          	add	s0,s0,-8
   10850:	00f40433          	add	s0,s0,a5
   10854:	00043783          	ld	a5,0(s0)
   10858:	fff48493          	add	s1,s1,-1
   1085c:	ff840413          	add	s0,s0,-8
   10860:	000780e7          	jalr	a5
   10864:	fe0498e3          	bnez	s1,10854 <__libc_fini_array+0x34>
   10868:	01813083          	ld	ra,24(sp)
   1086c:	01013403          	ld	s0,16(sp)
   10870:	00813483          	ld	s1,8(sp)
   10874:	02010113          	add	sp,sp,32
   10878:	00008067          	ret

000000000001087c <atexit>:
   1087c:	00050593          	mv	a1,a0
   10880:	00000693          	li	a3,0
   10884:	00000613          	li	a2,0
   10888:	00000513          	li	a0,0
   1088c:	0040006f          	j	10890 <__register_exitproc>

0000000000010890 <__register_exitproc>:
   10890:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   10894:	1f873783          	ld	a5,504(a4)
   10898:	06078063          	beqz	a5,108f8 <__register_exitproc+0x68>
   1089c:	0087a703          	lw	a4,8(a5)
   108a0:	01f00813          	li	a6,31
   108a4:	08e84663          	blt	a6,a4,10930 <__register_exitproc+0xa0>
   108a8:	02050863          	beqz	a0,108d8 <__register_exitproc+0x48>
   108ac:	00371813          	sll	a6,a4,0x3
   108b0:	01078833          	add	a6,a5,a6
   108b4:	10c83823          	sd	a2,272(a6)
   108b8:	3107a883          	lw	a7,784(a5)
   108bc:	00100613          	li	a2,1
   108c0:	00e6163b          	sllw	a2,a2,a4
   108c4:	00c8e8b3          	or	a7,a7,a2
   108c8:	3117a823          	sw	a7,784(a5)
   108cc:	20d83823          	sd	a3,528(a6)
   108d0:	00200693          	li	a3,2
   108d4:	02d50863          	beq	a0,a3,10904 <__register_exitproc+0x74>
   108d8:	00270693          	add	a3,a4,2
   108dc:	00369693          	sll	a3,a3,0x3
   108e0:	0017071b          	addw	a4,a4,1
   108e4:	00e7a423          	sw	a4,8(a5)
   108e8:	00d787b3          	add	a5,a5,a3
   108ec:	00b7b023          	sd	a1,0(a5)
   108f0:	00000513          	li	a0,0
   108f4:	00008067          	ret
   108f8:	20070793          	add	a5,a4,512
   108fc:	1ef73c23          	sd	a5,504(a4)
   10900:	f9dff06f          	j	1089c <__register_exitproc+0xc>
   10904:	3147a683          	lw	a3,788(a5)
   10908:	00000513          	li	a0,0
   1090c:	00c6e6b3          	or	a3,a3,a2
   10910:	30d7aa23          	sw	a3,788(a5)
   10914:	00270693          	add	a3,a4,2
   10918:	00369693          	sll	a3,a3,0x3
   1091c:	0017071b          	addw	a4,a4,1
   10920:	00e7a423          	sw	a4,8(a5)
   10924:	00d787b3          	add	a5,a5,a3
   10928:	00b7b023          	sd	a1,0(a5)
   1092c:	00008067          	ret
   10930:	fff00513          	li	a0,-1
   10934:	00008067          	ret

0000000000010938 <_exit>:
   10938:	05d00893          	li	a7,93
   1093c:	00000073          	ecall
   10940:	00054463          	bltz	a0,10948 <_exit+0x10>
   10944:	0000006f          	j	10944 <_exit+0xc>
   10948:	ff010113          	add	sp,sp,-16
   1094c:	00813023          	sd	s0,0(sp)
   10950:	00050413          	mv	s0,a0
   10954:	00113423          	sd	ra,8(sp)
   10958:	4080043b          	negw	s0,s0
   1095c:	00c000ef          	jal	10968 <__errno>
   10960:	00852023          	sw	s0,0(a0) # 11000 <__EH_FRAME_BEGIN__>
   10964:	0000006f          	j	10964 <_exit+0x2c>

0000000000010968 <__errno>:
   10968:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   1096c:	00008067          	ret
