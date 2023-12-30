
../../../Desktop/CS211/lab0/cs211_23f_lab_sim_framework/riscv-elf/fmsub.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	add	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	628000ef          	jal	10724 <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	051000ef          	jal	10964 <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00011537          	lui	a0,0x11
   10124:	84c50513          	add	a0,a0,-1972 # 1084c <__libc_fini_array>
   10128:	7800006f          	j	108a8 <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00001197          	auipc	gp,0x1
   10134:	6f018193          	add	gp,gp,1776 # 11820 <__global_pointer$>
   10138:	f6018513          	add	a0,gp,-160 # 11780 <completed.1>
   1013c:	f9818613          	add	a2,gp,-104 # 117b8 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	500000ef          	jal	10648 <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	75c50513          	add	a0,a0,1884 # 108a8 <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	6f450513          	add	a0,a0,1780 # 1084c <__libc_fini_array>
   10160:	748000ef          	jal	108a8 <atexit>
   10164:	448000ef          	jal	105ac <__libc_init_array>
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
   101f4:	99c7a787          	flw	fa5,-1636(a5) # 1099c <__errno+0x8>
   101f8:	fef42627          	fsw	fa5,-20(s0)
   101fc:	000117b7          	lui	a5,0x11
   10200:	9a07a787          	flw	fa5,-1632(a5) # 109a0 <__errno+0xc>
   10204:	fef42427          	fsw	fa5,-24(s0)
   10208:	000117b7          	lui	a5,0x11
   1020c:	9a47a787          	flw	fa5,-1628(a5) # 109a4 <__errno+0x10>
   10210:	fef42227          	fsw	fa5,-28(s0)
   10214:	fe442607          	flw	fa2,-28(s0)
   10218:	fe842587          	flw	fa1,-24(s0)
   1021c:	fec42507          	flw	fa0,-20(s0)
   10220:	338000ef          	jal	10558 <fmsubs>
   10224:	000117b7          	lui	a5,0x11
   10228:	9a87a787          	flw	fa5,-1624(a5) # 109a8 <__errno+0x14>
   1022c:	fef42627          	fsw	fa5,-20(s0)
   10230:	000117b7          	lui	a5,0x11
   10234:	9ac7a787          	flw	fa5,-1620(a5) # 109ac <__errno+0x18>
   10238:	fef42427          	fsw	fa5,-24(s0)
   1023c:	000117b7          	lui	a5,0x11
   10240:	9b07a787          	flw	fa5,-1616(a5) # 109b0 <__errno+0x1c>
   10244:	fef42227          	fsw	fa5,-28(s0)
   10248:	fe442607          	flw	fa2,-28(s0)
   1024c:	fe842587          	flw	fa1,-24(s0)
   10250:	fec42507          	flw	fa0,-20(s0)
   10254:	304000ef          	jal	10558 <fmsubs>
   10258:	09c000ef          	jal	102f4 <exit_proc>
   1025c:	00000793          	li	a5,0
   10260:	00078513          	mv	a0,a5
   10264:	01813083          	ld	ra,24(sp)
   10268:	01013403          	ld	s0,16(sp)
   1026c:	02010113          	add	sp,sp,32
   10270:	00008067          	ret

0000000000010274 <print_d>:
   10274:	fe010113          	add	sp,sp,-32
   10278:	00813c23          	sd	s0,24(sp)
   1027c:	02010413          	add	s0,sp,32
   10280:	00050793          	mv	a5,a0
   10284:	fef42623          	sw	a5,-20(s0)
   10288:	00200893          	li	a7,2
   1028c:	00000073          	ecall
   10290:	00000013          	nop
   10294:	01813403          	ld	s0,24(sp)
   10298:	02010113          	add	sp,sp,32
   1029c:	00008067          	ret

00000000000102a0 <print_s>:
   102a0:	fe010113          	add	sp,sp,-32
   102a4:	00813c23          	sd	s0,24(sp)
   102a8:	02010413          	add	s0,sp,32
   102ac:	fea43423          	sd	a0,-24(s0)
   102b0:	00000893          	li	a7,0
   102b4:	00000073          	ecall
   102b8:	00000013          	nop
   102bc:	01813403          	ld	s0,24(sp)
   102c0:	02010113          	add	sp,sp,32
   102c4:	00008067          	ret

00000000000102c8 <print_c>:
   102c8:	fe010113          	add	sp,sp,-32
   102cc:	00813c23          	sd	s0,24(sp)
   102d0:	02010413          	add	s0,sp,32
   102d4:	00050793          	mv	a5,a0
   102d8:	fef407a3          	sb	a5,-17(s0)
   102dc:	00100893          	li	a7,1
   102e0:	00000073          	ecall
   102e4:	00000013          	nop
   102e8:	01813403          	ld	s0,24(sp)
   102ec:	02010113          	add	sp,sp,32
   102f0:	00008067          	ret

00000000000102f4 <exit_proc>:
   102f4:	ff010113          	add	sp,sp,-16
   102f8:	00813423          	sd	s0,8(sp)
   102fc:	01010413          	add	s0,sp,16
   10300:	00300893          	li	a7,3
   10304:	00000073          	ecall
   10308:	00000013          	nop
   1030c:	00813403          	ld	s0,8(sp)
   10310:	01010113          	add	sp,sp,16
   10314:	00008067          	ret

0000000000010318 <read_char>:
   10318:	fe010113          	add	sp,sp,-32
   1031c:	00813c23          	sd	s0,24(sp)
   10320:	02010413          	add	s0,sp,32
   10324:	00400893          	li	a7,4
   10328:	00000073          	ecall
   1032c:	00050793          	mv	a5,a0
   10330:	fef407a3          	sb	a5,-17(s0)
   10334:	fef44783          	lbu	a5,-17(s0)
   10338:	00078513          	mv	a0,a5
   1033c:	01813403          	ld	s0,24(sp)
   10340:	02010113          	add	sp,sp,32
   10344:	00008067          	ret

0000000000010348 <read_num>:
   10348:	fe010113          	add	sp,sp,-32
   1034c:	00813c23          	sd	s0,24(sp)
   10350:	02010413          	add	s0,sp,32
   10354:	00500893          	li	a7,5
   10358:	00000073          	ecall
   1035c:	00050793          	mv	a5,a0
   10360:	fef43423          	sd	a5,-24(s0)
   10364:	fe843783          	ld	a5,-24(s0)
   10368:	00078513          	mv	a0,a5
   1036c:	01813403          	ld	s0,24(sp)
   10370:	02010113          	add	sp,sp,32
   10374:	00008067          	ret

0000000000010378 <print_f>:
   10378:	fe010113          	add	sp,sp,-32
   1037c:	00813c23          	sd	s0,24(sp)
   10380:	02010413          	add	s0,sp,32
   10384:	fea42627          	fsw	fa0,-20(s0)
   10388:	00600893          	li	a7,6
   1038c:	00000073          	ecall
   10390:	00000013          	nop
   10394:	01813403          	ld	s0,24(sp)
   10398:	02010113          	add	sp,sp,32
   1039c:	00008067          	ret

00000000000103a0 <fsqrt>:
   103a0:	fd010113          	add	sp,sp,-48
   103a4:	02113423          	sd	ra,40(sp)
   103a8:	02813023          	sd	s0,32(sp)
   103ac:	03010413          	add	s0,sp,48
   103b0:	fca42e27          	fsw	fa0,-36(s0)
   103b4:	fdc42787          	flw	fa5,-36(s0)
   103b8:	5807f7d3          	fsqrt.s	fa5,fa5
   103bc:	fef42627          	fsw	fa5,-20(s0)
   103c0:	fec42507          	flw	fa0,-20(s0)
   103c4:	fb5ff0ef          	jal	10378 <print_f>
   103c8:	00a00513          	li	a0,10
   103cc:	efdff0ef          	jal	102c8 <print_c>
   103d0:	00000013          	nop
   103d4:	02813083          	ld	ra,40(sp)
   103d8:	02013403          	ld	s0,32(sp)
   103dc:	03010113          	add	sp,sp,48
   103e0:	00008067          	ret

00000000000103e4 <fmvxw>:
   103e4:	fd010113          	add	sp,sp,-48
   103e8:	02113423          	sd	ra,40(sp)
   103ec:	02813023          	sd	s0,32(sp)
   103f0:	03010413          	add	s0,sp,48
   103f4:	fca42e27          	fsw	fa0,-36(s0)
   103f8:	fdc42787          	flw	fa5,-36(s0)
   103fc:	e00787d3          	fmv.x.w	a5,fa5
   10400:	fef42623          	sw	a5,-20(s0)
   10404:	fec42783          	lw	a5,-20(s0)
   10408:	00078513          	mv	a0,a5
   1040c:	e69ff0ef          	jal	10274 <print_d>
   10410:	00a00513          	li	a0,10
   10414:	eb5ff0ef          	jal	102c8 <print_c>
   10418:	00000013          	nop
   1041c:	02813083          	ld	ra,40(sp)
   10420:	02013403          	ld	s0,32(sp)
   10424:	03010113          	add	sp,sp,48
   10428:	00008067          	ret

000000000001042c <fmvwx>:
   1042c:	fd010113          	add	sp,sp,-48
   10430:	02113423          	sd	ra,40(sp)
   10434:	02813023          	sd	s0,32(sp)
   10438:	03010413          	add	s0,sp,48
   1043c:	00050793          	mv	a5,a0
   10440:	fcf42e23          	sw	a5,-36(s0)
   10444:	fdc42783          	lw	a5,-36(s0)
   10448:	f00787d3          	fmv.w.x	fa5,a5
   1044c:	fef42627          	fsw	fa5,-20(s0)
   10450:	fec42507          	flw	fa0,-20(s0)
   10454:	f25ff0ef          	jal	10378 <print_f>
   10458:	00a00513          	li	a0,10
   1045c:	e6dff0ef          	jal	102c8 <print_c>
   10460:	00000013          	nop
   10464:	02813083          	ld	ra,40(sp)
   10468:	02013403          	ld	s0,32(sp)
   1046c:	03010113          	add	sp,sp,48
   10470:	00008067          	ret

0000000000010474 <fcvtws>:
   10474:	fd010113          	add	sp,sp,-48
   10478:	02113423          	sd	ra,40(sp)
   1047c:	02813023          	sd	s0,32(sp)
   10480:	03010413          	add	s0,sp,48
   10484:	fca42e27          	fsw	fa0,-36(s0)
   10488:	fdc42787          	flw	fa5,-36(s0)
   1048c:	c007f7d3          	fcvt.w.s	a5,fa5
   10490:	fef42623          	sw	a5,-20(s0)
   10494:	fec42783          	lw	a5,-20(s0)
   10498:	00078513          	mv	a0,a5
   1049c:	dd9ff0ef          	jal	10274 <print_d>
   104a0:	00a00513          	li	a0,10
   104a4:	e25ff0ef          	jal	102c8 <print_c>
   104a8:	00000013          	nop
   104ac:	02813083          	ld	ra,40(sp)
   104b0:	02013403          	ld	s0,32(sp)
   104b4:	03010113          	add	sp,sp,48
   104b8:	00008067          	ret

00000000000104bc <fcvtsw>:
   104bc:	fd010113          	add	sp,sp,-48
   104c0:	02113423          	sd	ra,40(sp)
   104c4:	02813023          	sd	s0,32(sp)
   104c8:	03010413          	add	s0,sp,48
   104cc:	00050793          	mv	a5,a0
   104d0:	fcf42e23          	sw	a5,-36(s0)
   104d4:	fdc42783          	lw	a5,-36(s0)
   104d8:	d007f7d3          	fcvt.s.w	fa5,a5
   104dc:	fef42627          	fsw	fa5,-20(s0)
   104e0:	fec42507          	flw	fa0,-20(s0)
   104e4:	e95ff0ef          	jal	10378 <print_f>
   104e8:	00a00513          	li	a0,10
   104ec:	dddff0ef          	jal	102c8 <print_c>
   104f0:	00000013          	nop
   104f4:	02813083          	ld	ra,40(sp)
   104f8:	02013403          	ld	s0,32(sp)
   104fc:	03010113          	add	sp,sp,48
   10500:	00008067          	ret

0000000000010504 <fmadds>:
   10504:	fd010113          	add	sp,sp,-48
   10508:	02113423          	sd	ra,40(sp)
   1050c:	02813023          	sd	s0,32(sp)
   10510:	03010413          	add	s0,sp,48
   10514:	fca42e27          	fsw	fa0,-36(s0)
   10518:	fcb42c27          	fsw	fa1,-40(s0)
   1051c:	fcc42a27          	fsw	fa2,-44(s0)
   10520:	fdc42787          	flw	fa5,-36(s0)
   10524:	fd842707          	flw	fa4,-40(s0)
   10528:	fd442687          	flw	fa3,-44(s0)
   1052c:	68e7f7c3          	fmadd.s	fa5,fa5,fa4,fa3
   10530:	fef42627          	fsw	fa5,-20(s0)
   10534:	fec42507          	flw	fa0,-20(s0)
   10538:	e41ff0ef          	jal	10378 <print_f>
   1053c:	00a00513          	li	a0,10
   10540:	d89ff0ef          	jal	102c8 <print_c>
   10544:	00000013          	nop
   10548:	02813083          	ld	ra,40(sp)
   1054c:	02013403          	ld	s0,32(sp)
   10550:	03010113          	add	sp,sp,48
   10554:	00008067          	ret

0000000000010558 <fmsubs>:
   10558:	fd010113          	add	sp,sp,-48
   1055c:	02113423          	sd	ra,40(sp)
   10560:	02813023          	sd	s0,32(sp)
   10564:	03010413          	add	s0,sp,48
   10568:	fca42e27          	fsw	fa0,-36(s0)
   1056c:	fcb42c27          	fsw	fa1,-40(s0)
   10570:	fcc42a27          	fsw	fa2,-44(s0)
   10574:	fdc42787          	flw	fa5,-36(s0)
   10578:	fd842707          	flw	fa4,-40(s0)
   1057c:	fd442687          	flw	fa3,-44(s0)
   10580:	68e7f7c7          	fmsub.s	fa5,fa5,fa4,fa3
   10584:	fef42627          	fsw	fa5,-20(s0)
   10588:	fec42507          	flw	fa0,-20(s0)
   1058c:	dedff0ef          	jal	10378 <print_f>
   10590:	00a00513          	li	a0,10
   10594:	d35ff0ef          	jal	102c8 <print_c>
   10598:	00000013          	nop
   1059c:	02813083          	ld	ra,40(sp)
   105a0:	02013403          	ld	s0,32(sp)
   105a4:	03010113          	add	sp,sp,48
   105a8:	00008067          	ret

00000000000105ac <__libc_init_array>:
   105ac:	fe010113          	add	sp,sp,-32
   105b0:	00813823          	sd	s0,16(sp)
   105b4:	000117b7          	lui	a5,0x11
   105b8:	00011437          	lui	s0,0x11
   105bc:	01213023          	sd	s2,0(sp)
   105c0:	00478793          	add	a5,a5,4 # 11004 <__preinit_array_end>
   105c4:	00440713          	add	a4,s0,4 # 11004 <__preinit_array_end>
   105c8:	00113c23          	sd	ra,24(sp)
   105cc:	00913423          	sd	s1,8(sp)
   105d0:	40e78933          	sub	s2,a5,a4
   105d4:	02e78263          	beq	a5,a4,105f8 <__libc_init_array+0x4c>
   105d8:	40395913          	sra	s2,s2,0x3
   105dc:	00440413          	add	s0,s0,4
   105e0:	00000493          	li	s1,0
   105e4:	00043783          	ld	a5,0(s0)
   105e8:	00148493          	add	s1,s1,1
   105ec:	00840413          	add	s0,s0,8
   105f0:	000780e7          	jalr	a5
   105f4:	ff24e8e3          	bltu	s1,s2,105e4 <__libc_init_array+0x38>
   105f8:	00011437          	lui	s0,0x11
   105fc:	000117b7          	lui	a5,0x11
   10600:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   10604:	00840713          	add	a4,s0,8 # 11008 <__init_array_start>
   10608:	40e78933          	sub	s2,a5,a4
   1060c:	40395913          	sra	s2,s2,0x3
   10610:	02e78063          	beq	a5,a4,10630 <__libc_init_array+0x84>
   10614:	00840413          	add	s0,s0,8
   10618:	00000493          	li	s1,0
   1061c:	00043783          	ld	a5,0(s0)
   10620:	00148493          	add	s1,s1,1
   10624:	00840413          	add	s0,s0,8
   10628:	000780e7          	jalr	a5
   1062c:	ff24e8e3          	bltu	s1,s2,1061c <__libc_init_array+0x70>
   10630:	01813083          	ld	ra,24(sp)
   10634:	01013403          	ld	s0,16(sp)
   10638:	00813483          	ld	s1,8(sp)
   1063c:	00013903          	ld	s2,0(sp)
   10640:	02010113          	add	sp,sp,32
   10644:	00008067          	ret

0000000000010648 <memset>:
   10648:	00f00313          	li	t1,15
   1064c:	00050713          	mv	a4,a0
   10650:	02c37a63          	bgeu	t1,a2,10684 <memset+0x3c>
   10654:	00f77793          	and	a5,a4,15
   10658:	0a079063          	bnez	a5,106f8 <memset+0xb0>
   1065c:	06059e63          	bnez	a1,106d8 <memset+0x90>
   10660:	ff067693          	and	a3,a2,-16
   10664:	00f67613          	and	a2,a2,15
   10668:	00e686b3          	add	a3,a3,a4
   1066c:	00b73023          	sd	a1,0(a4)
   10670:	00b73423          	sd	a1,8(a4)
   10674:	01070713          	add	a4,a4,16
   10678:	fed76ae3          	bltu	a4,a3,1066c <memset+0x24>
   1067c:	00061463          	bnez	a2,10684 <memset+0x3c>
   10680:	00008067          	ret
   10684:	40c306b3          	sub	a3,t1,a2
   10688:	00269693          	sll	a3,a3,0x2
   1068c:	00000297          	auipc	t0,0x0
   10690:	005686b3          	add	a3,a3,t0
   10694:	00c68067          	jr	12(a3)
   10698:	00b70723          	sb	a1,14(a4)
   1069c:	00b706a3          	sb	a1,13(a4)
   106a0:	00b70623          	sb	a1,12(a4)
   106a4:	00b705a3          	sb	a1,11(a4)
   106a8:	00b70523          	sb	a1,10(a4)
   106ac:	00b704a3          	sb	a1,9(a4)
   106b0:	00b70423          	sb	a1,8(a4)
   106b4:	00b703a3          	sb	a1,7(a4)
   106b8:	00b70323          	sb	a1,6(a4)
   106bc:	00b702a3          	sb	a1,5(a4)
   106c0:	00b70223          	sb	a1,4(a4)
   106c4:	00b701a3          	sb	a1,3(a4)
   106c8:	00b70123          	sb	a1,2(a4)
   106cc:	00b700a3          	sb	a1,1(a4)
   106d0:	00b70023          	sb	a1,0(a4)
   106d4:	00008067          	ret
   106d8:	0ff5f593          	zext.b	a1,a1
   106dc:	00859693          	sll	a3,a1,0x8
   106e0:	00d5e5b3          	or	a1,a1,a3
   106e4:	01059693          	sll	a3,a1,0x10
   106e8:	00d5e5b3          	or	a1,a1,a3
   106ec:	02059693          	sll	a3,a1,0x20
   106f0:	00d5e5b3          	or	a1,a1,a3
   106f4:	f6dff06f          	j	10660 <memset+0x18>
   106f8:	00279693          	sll	a3,a5,0x2
   106fc:	00000297          	auipc	t0,0x0
   10700:	005686b3          	add	a3,a3,t0
   10704:	00008293          	mv	t0,ra
   10708:	f98680e7          	jalr	-104(a3)
   1070c:	00028093          	mv	ra,t0
   10710:	ff078793          	add	a5,a5,-16
   10714:	40f70733          	sub	a4,a4,a5
   10718:	00f60633          	add	a2,a2,a5
   1071c:	f6c374e3          	bgeu	t1,a2,10684 <memset+0x3c>
   10720:	f3dff06f          	j	1065c <memset+0x14>

0000000000010724 <__call_exitprocs>:
   10724:	fb010113          	add	sp,sp,-80
   10728:	03413023          	sd	s4,32(sp)
   1072c:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   10730:	03213823          	sd	s2,48(sp)
   10734:	04113423          	sd	ra,72(sp)
   10738:	1f8a3903          	ld	s2,504(s4)
   1073c:	04813023          	sd	s0,64(sp)
   10740:	02913c23          	sd	s1,56(sp)
   10744:	03313423          	sd	s3,40(sp)
   10748:	01513c23          	sd	s5,24(sp)
   1074c:	01613823          	sd	s6,16(sp)
   10750:	01713423          	sd	s7,8(sp)
   10754:	01813023          	sd	s8,0(sp)
   10758:	04090063          	beqz	s2,10798 <__call_exitprocs+0x74>
   1075c:	00050b13          	mv	s6,a0
   10760:	00058b93          	mv	s7,a1
   10764:	00100a93          	li	s5,1
   10768:	fff00993          	li	s3,-1
   1076c:	00892483          	lw	s1,8(s2)
   10770:	fff4841b          	addw	s0,s1,-1
   10774:	02044263          	bltz	s0,10798 <__call_exitprocs+0x74>
   10778:	00349493          	sll	s1,s1,0x3
   1077c:	009904b3          	add	s1,s2,s1
   10780:	040b8463          	beqz	s7,107c8 <__call_exitprocs+0xa4>
   10784:	2084b783          	ld	a5,520(s1)
   10788:	05778063          	beq	a5,s7,107c8 <__call_exitprocs+0xa4>
   1078c:	fff4041b          	addw	s0,s0,-1
   10790:	ff848493          	add	s1,s1,-8
   10794:	ff3416e3          	bne	s0,s3,10780 <__call_exitprocs+0x5c>
   10798:	04813083          	ld	ra,72(sp)
   1079c:	04013403          	ld	s0,64(sp)
   107a0:	03813483          	ld	s1,56(sp)
   107a4:	03013903          	ld	s2,48(sp)
   107a8:	02813983          	ld	s3,40(sp)
   107ac:	02013a03          	ld	s4,32(sp)
   107b0:	01813a83          	ld	s5,24(sp)
   107b4:	01013b03          	ld	s6,16(sp)
   107b8:	00813b83          	ld	s7,8(sp)
   107bc:	00013c03          	ld	s8,0(sp)
   107c0:	05010113          	add	sp,sp,80
   107c4:	00008067          	ret
   107c8:	00892783          	lw	a5,8(s2)
   107cc:	0084b703          	ld	a4,8(s1)
   107d0:	fff7879b          	addw	a5,a5,-1
   107d4:	06878263          	beq	a5,s0,10838 <__call_exitprocs+0x114>
   107d8:	0004b423          	sd	zero,8(s1)
   107dc:	fa0708e3          	beqz	a4,1078c <__call_exitprocs+0x68>
   107e0:	31092783          	lw	a5,784(s2)
   107e4:	008a96bb          	sllw	a3,s5,s0
   107e8:	00892c03          	lw	s8,8(s2)
   107ec:	00d7f7b3          	and	a5,a5,a3
   107f0:	0007879b          	sext.w	a5,a5
   107f4:	02079263          	bnez	a5,10818 <__call_exitprocs+0xf4>
   107f8:	000700e7          	jalr	a4
   107fc:	00892703          	lw	a4,8(s2)
   10800:	1f8a3783          	ld	a5,504(s4)
   10804:	01871463          	bne	a4,s8,1080c <__call_exitprocs+0xe8>
   10808:	f92782e3          	beq	a5,s2,1078c <__call_exitprocs+0x68>
   1080c:	f80786e3          	beqz	a5,10798 <__call_exitprocs+0x74>
   10810:	00078913          	mv	s2,a5
   10814:	f59ff06f          	j	1076c <__call_exitprocs+0x48>
   10818:	31492783          	lw	a5,788(s2)
   1081c:	1084b583          	ld	a1,264(s1)
   10820:	00d7f7b3          	and	a5,a5,a3
   10824:	0007879b          	sext.w	a5,a5
   10828:	00079c63          	bnez	a5,10840 <__call_exitprocs+0x11c>
   1082c:	000b0513          	mv	a0,s6
   10830:	000700e7          	jalr	a4
   10834:	fc9ff06f          	j	107fc <__call_exitprocs+0xd8>
   10838:	00892423          	sw	s0,8(s2)
   1083c:	fa1ff06f          	j	107dc <__call_exitprocs+0xb8>
   10840:	00058513          	mv	a0,a1
   10844:	000700e7          	jalr	a4
   10848:	fb5ff06f          	j	107fc <__call_exitprocs+0xd8>

000000000001084c <__libc_fini_array>:
   1084c:	fe010113          	add	sp,sp,-32
   10850:	00813823          	sd	s0,16(sp)
   10854:	000117b7          	lui	a5,0x11
   10858:	00011437          	lui	s0,0x11
   1085c:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   10860:	02040413          	add	s0,s0,32 # 11020 <impure_data>
   10864:	40f40433          	sub	s0,s0,a5
   10868:	00913423          	sd	s1,8(sp)
   1086c:	00113c23          	sd	ra,24(sp)
   10870:	40345493          	sra	s1,s0,0x3
   10874:	02048063          	beqz	s1,10894 <__libc_fini_array+0x48>
   10878:	ff840413          	add	s0,s0,-8
   1087c:	00f40433          	add	s0,s0,a5
   10880:	00043783          	ld	a5,0(s0)
   10884:	fff48493          	add	s1,s1,-1
   10888:	ff840413          	add	s0,s0,-8
   1088c:	000780e7          	jalr	a5
   10890:	fe0498e3          	bnez	s1,10880 <__libc_fini_array+0x34>
   10894:	01813083          	ld	ra,24(sp)
   10898:	01013403          	ld	s0,16(sp)
   1089c:	00813483          	ld	s1,8(sp)
   108a0:	02010113          	add	sp,sp,32
   108a4:	00008067          	ret

00000000000108a8 <atexit>:
   108a8:	00050593          	mv	a1,a0
   108ac:	00000693          	li	a3,0
   108b0:	00000613          	li	a2,0
   108b4:	00000513          	li	a0,0
   108b8:	0040006f          	j	108bc <__register_exitproc>

00000000000108bc <__register_exitproc>:
   108bc:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   108c0:	1f873783          	ld	a5,504(a4)
   108c4:	06078063          	beqz	a5,10924 <__register_exitproc+0x68>
   108c8:	0087a703          	lw	a4,8(a5)
   108cc:	01f00813          	li	a6,31
   108d0:	08e84663          	blt	a6,a4,1095c <__register_exitproc+0xa0>
   108d4:	02050863          	beqz	a0,10904 <__register_exitproc+0x48>
   108d8:	00371813          	sll	a6,a4,0x3
   108dc:	01078833          	add	a6,a5,a6
   108e0:	10c83823          	sd	a2,272(a6)
   108e4:	3107a883          	lw	a7,784(a5)
   108e8:	00100613          	li	a2,1
   108ec:	00e6163b          	sllw	a2,a2,a4
   108f0:	00c8e8b3          	or	a7,a7,a2
   108f4:	3117a823          	sw	a7,784(a5)
   108f8:	20d83823          	sd	a3,528(a6)
   108fc:	00200693          	li	a3,2
   10900:	02d50863          	beq	a0,a3,10930 <__register_exitproc+0x74>
   10904:	00270693          	add	a3,a4,2
   10908:	00369693          	sll	a3,a3,0x3
   1090c:	0017071b          	addw	a4,a4,1
   10910:	00e7a423          	sw	a4,8(a5)
   10914:	00d787b3          	add	a5,a5,a3
   10918:	00b7b023          	sd	a1,0(a5)
   1091c:	00000513          	li	a0,0
   10920:	00008067          	ret
   10924:	20070793          	add	a5,a4,512
   10928:	1ef73c23          	sd	a5,504(a4)
   1092c:	f9dff06f          	j	108c8 <__register_exitproc+0xc>
   10930:	3147a683          	lw	a3,788(a5)
   10934:	00000513          	li	a0,0
   10938:	00c6e6b3          	or	a3,a3,a2
   1093c:	30d7aa23          	sw	a3,788(a5)
   10940:	00270693          	add	a3,a4,2
   10944:	00369693          	sll	a3,a3,0x3
   10948:	0017071b          	addw	a4,a4,1
   1094c:	00e7a423          	sw	a4,8(a5)
   10950:	00d787b3          	add	a5,a5,a3
   10954:	00b7b023          	sd	a1,0(a5)
   10958:	00008067          	ret
   1095c:	fff00513          	li	a0,-1
   10960:	00008067          	ret

0000000000010964 <_exit>:
   10964:	05d00893          	li	a7,93
   10968:	00000073          	ecall
   1096c:	00054463          	bltz	a0,10974 <_exit+0x10>
   10970:	0000006f          	j	10970 <_exit+0xc>
   10974:	ff010113          	add	sp,sp,-16
   10978:	00813023          	sd	s0,0(sp)
   1097c:	00050413          	mv	s0,a0
   10980:	00113423          	sd	ra,8(sp)
   10984:	4080043b          	negw	s0,s0
   10988:	00c000ef          	jal	10994 <__errno>
   1098c:	00852023          	sw	s0,0(a0) # 11000 <__EH_FRAME_BEGIN__>
   10990:	0000006f          	j	10990 <_exit+0x2c>

0000000000010994 <__errno>:
   10994:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10998:	00008067          	ret
