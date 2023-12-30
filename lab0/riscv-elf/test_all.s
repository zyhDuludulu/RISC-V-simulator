
../../../Desktop/CS211/lab0/cs211_23f_lab_sim_framework/riscv-elf/test_all.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	add	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	740000ef          	jal	1083c <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	169000ef          	jal	10a7c <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00011537          	lui	a0,0x11
   10124:	96450513          	add	a0,a0,-1692 # 10964 <__libc_fini_array>
   10128:	0990006f          	j	109c0 <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00001197          	auipc	gp,0x1
   10134:	6f018193          	add	gp,gp,1776 # 11820 <__global_pointer$>
   10138:	f6018513          	add	a0,gp,-160 # 11780 <completed.1>
   1013c:	f9818613          	add	a2,gp,-104 # 117b8 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	618000ef          	jal	10760 <memset>
   1014c:	00001517          	auipc	a0,0x1
   10150:	87450513          	add	a0,a0,-1932 # 109c0 <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00001517          	auipc	a0,0x1
   1015c:	80c50513          	add	a0,a0,-2036 # 10964 <__libc_fini_array>
   10160:	061000ef          	jal	109c0 <atexit>
   10164:	560000ef          	jal	106c4 <__libc_init_array>
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
   101e0:	fd010113          	add	sp,sp,-48
   101e4:	02113423          	sd	ra,40(sp)
   101e8:	02813023          	sd	s0,32(sp)
   101ec:	03010413          	add	s0,sp,48
   101f0:	000117b7          	lui	a5,0x11
   101f4:	ab47a787          	flw	fa5,-1356(a5) # 10ab4 <__errno+0x8>
   101f8:	fef42627          	fsw	fa5,-20(s0)
   101fc:	000117b7          	lui	a5,0x11
   10200:	ab87a787          	flw	fa5,-1352(a5) # 10ab8 <__errno+0xc>
   10204:	fef42427          	fsw	fa5,-24(s0)
   10208:	fec42707          	flw	fa4,-20(s0)
   1020c:	fe842787          	flw	fa5,-24(s0)
   10210:	00f777d3          	fadd.s	fa5,fa4,fa5
   10214:	fef42227          	fsw	fa5,-28(s0)
   10218:	fe442507          	flw	fa0,-28(s0)
   1021c:	274000ef          	jal	10490 <print_f>
   10220:	00a00513          	li	a0,10
   10224:	1bc000ef          	jal	103e0 <print_c>
   10228:	fec42707          	flw	fa4,-20(s0)
   1022c:	fe842787          	flw	fa5,-24(s0)
   10230:	08f777d3          	fsub.s	fa5,fa4,fa5
   10234:	fef42227          	fsw	fa5,-28(s0)
   10238:	fe442507          	flw	fa0,-28(s0)
   1023c:	254000ef          	jal	10490 <print_f>
   10240:	00a00513          	li	a0,10
   10244:	19c000ef          	jal	103e0 <print_c>
   10248:	000117b7          	lui	a5,0x11
   1024c:	abc7a787          	flw	fa5,-1348(a5) # 10abc <__errno+0x10>
   10250:	fef42627          	fsw	fa5,-20(s0)
   10254:	000117b7          	lui	a5,0x11
   10258:	ac07a787          	flw	fa5,-1344(a5) # 10ac0 <__errno+0x14>
   1025c:	fef42427          	fsw	fa5,-24(s0)
   10260:	fec42707          	flw	fa4,-20(s0)
   10264:	fe842787          	flw	fa5,-24(s0)
   10268:	10f777d3          	fmul.s	fa5,fa4,fa5
   1026c:	fef42227          	fsw	fa5,-28(s0)
   10270:	fe442507          	flw	fa0,-28(s0)
   10274:	21c000ef          	jal	10490 <print_f>
   10278:	00a00513          	li	a0,10
   1027c:	164000ef          	jal	103e0 <print_c>
   10280:	fe842707          	flw	fa4,-24(s0)
   10284:	fec42787          	flw	fa5,-20(s0)
   10288:	18f777d3          	fdiv.s	fa5,fa4,fa5
   1028c:	fef42227          	fsw	fa5,-28(s0)
   10290:	fe442507          	flw	fa0,-28(s0)
   10294:	1fc000ef          	jal	10490 <print_f>
   10298:	00a00513          	li	a0,10
   1029c:	144000ef          	jal	103e0 <print_c>
   102a0:	000117b7          	lui	a5,0x11
   102a4:	ac47a787          	flw	fa5,-1340(a5) # 10ac4 <__errno+0x18>
   102a8:	fef42627          	fsw	fa5,-20(s0)
   102ac:	fec42507          	flw	fa0,-20(s0)
   102b0:	208000ef          	jal	104b8 <fsqrt>
   102b4:	000117b7          	lui	a5,0x11
   102b8:	ac87a787          	flw	fa5,-1336(a5) # 10ac8 <__errno+0x1c>
   102bc:	fef42627          	fsw	fa5,-20(s0)
   102c0:	fec42507          	flw	fa0,-20(s0)
   102c4:	238000ef          	jal	104fc <fmvxw>
   102c8:	404917b7          	lui	a5,0x40491
   102cc:	fd078793          	add	a5,a5,-48 # 40490fd0 <__global_pointer$+0x4047f7b0>
   102d0:	fef42023          	sw	a5,-32(s0)
   102d4:	fe042783          	lw	a5,-32(s0)
   102d8:	00078513          	mv	a0,a5
   102dc:	268000ef          	jal	10544 <fmvwx>
   102e0:	05f00793          	li	a5,95
   102e4:	fef42023          	sw	a5,-32(s0)
   102e8:	fe042783          	lw	a5,-32(s0)
   102ec:	00078513          	mv	a0,a5
   102f0:	2e4000ef          	jal	105d4 <fcvtsw>
   102f4:	000117b7          	lui	a5,0x11
   102f8:	acc7a787          	flw	fa5,-1332(a5) # 10acc <__errno+0x20>
   102fc:	fef42627          	fsw	fa5,-20(s0)
   10300:	fec42507          	flw	fa0,-20(s0)
   10304:	288000ef          	jal	1058c <fcvtws>
   10308:	000117b7          	lui	a5,0x11
   1030c:	ad07a787          	flw	fa5,-1328(a5) # 10ad0 <__errno+0x24>
   10310:	fef42627          	fsw	fa5,-20(s0)
   10314:	000117b7          	lui	a5,0x11
   10318:	ad47a787          	flw	fa5,-1324(a5) # 10ad4 <__errno+0x28>
   1031c:	fef42427          	fsw	fa5,-24(s0)
   10320:	000117b7          	lui	a5,0x11
   10324:	ad87a787          	flw	fa5,-1320(a5) # 10ad8 <__errno+0x2c>
   10328:	fcf42e27          	fsw	fa5,-36(s0)
   1032c:	fdc42607          	flw	fa2,-36(s0)
   10330:	fe842587          	flw	fa1,-24(s0)
   10334:	fec42507          	flw	fa0,-20(s0)
   10338:	2e4000ef          	jal	1061c <fmadds>
   1033c:	000117b7          	lui	a5,0x11
   10340:	ad07a787          	flw	fa5,-1328(a5) # 10ad0 <__errno+0x24>
   10344:	fef42627          	fsw	fa5,-20(s0)
   10348:	000117b7          	lui	a5,0x11
   1034c:	ad47a787          	flw	fa5,-1324(a5) # 10ad4 <__errno+0x28>
   10350:	fef42427          	fsw	fa5,-24(s0)
   10354:	000117b7          	lui	a5,0x11
   10358:	ad87a787          	flw	fa5,-1320(a5) # 10ad8 <__errno+0x2c>
   1035c:	fcf42e27          	fsw	fa5,-36(s0)
   10360:	fdc42607          	flw	fa2,-36(s0)
   10364:	fe842587          	flw	fa1,-24(s0)
   10368:	fec42507          	flw	fa0,-20(s0)
   1036c:	304000ef          	jal	10670 <fmsubs>
   10370:	09c000ef          	jal	1040c <exit_proc>
   10374:	00000793          	li	a5,0
   10378:	00078513          	mv	a0,a5
   1037c:	02813083          	ld	ra,40(sp)
   10380:	02013403          	ld	s0,32(sp)
   10384:	03010113          	add	sp,sp,48
   10388:	00008067          	ret

000000000001038c <print_d>:
   1038c:	fe010113          	add	sp,sp,-32
   10390:	00813c23          	sd	s0,24(sp)
   10394:	02010413          	add	s0,sp,32
   10398:	00050793          	mv	a5,a0
   1039c:	fef42623          	sw	a5,-20(s0)
   103a0:	00200893          	li	a7,2
   103a4:	00000073          	ecall
   103a8:	00000013          	nop
   103ac:	01813403          	ld	s0,24(sp)
   103b0:	02010113          	add	sp,sp,32
   103b4:	00008067          	ret

00000000000103b8 <print_s>:
   103b8:	fe010113          	add	sp,sp,-32
   103bc:	00813c23          	sd	s0,24(sp)
   103c0:	02010413          	add	s0,sp,32
   103c4:	fea43423          	sd	a0,-24(s0)
   103c8:	00000893          	li	a7,0
   103cc:	00000073          	ecall
   103d0:	00000013          	nop
   103d4:	01813403          	ld	s0,24(sp)
   103d8:	02010113          	add	sp,sp,32
   103dc:	00008067          	ret

00000000000103e0 <print_c>:
   103e0:	fe010113          	add	sp,sp,-32
   103e4:	00813c23          	sd	s0,24(sp)
   103e8:	02010413          	add	s0,sp,32
   103ec:	00050793          	mv	a5,a0
   103f0:	fef407a3          	sb	a5,-17(s0)
   103f4:	00100893          	li	a7,1
   103f8:	00000073          	ecall
   103fc:	00000013          	nop
   10400:	01813403          	ld	s0,24(sp)
   10404:	02010113          	add	sp,sp,32
   10408:	00008067          	ret

000000000001040c <exit_proc>:
   1040c:	ff010113          	add	sp,sp,-16
   10410:	00813423          	sd	s0,8(sp)
   10414:	01010413          	add	s0,sp,16
   10418:	00300893          	li	a7,3
   1041c:	00000073          	ecall
   10420:	00000013          	nop
   10424:	00813403          	ld	s0,8(sp)
   10428:	01010113          	add	sp,sp,16
   1042c:	00008067          	ret

0000000000010430 <read_char>:
   10430:	fe010113          	add	sp,sp,-32
   10434:	00813c23          	sd	s0,24(sp)
   10438:	02010413          	add	s0,sp,32
   1043c:	00400893          	li	a7,4
   10440:	00000073          	ecall
   10444:	00050793          	mv	a5,a0
   10448:	fef407a3          	sb	a5,-17(s0)
   1044c:	fef44783          	lbu	a5,-17(s0)
   10450:	00078513          	mv	a0,a5
   10454:	01813403          	ld	s0,24(sp)
   10458:	02010113          	add	sp,sp,32
   1045c:	00008067          	ret

0000000000010460 <read_num>:
   10460:	fe010113          	add	sp,sp,-32
   10464:	00813c23          	sd	s0,24(sp)
   10468:	02010413          	add	s0,sp,32
   1046c:	00500893          	li	a7,5
   10470:	00000073          	ecall
   10474:	00050793          	mv	a5,a0
   10478:	fef43423          	sd	a5,-24(s0)
   1047c:	fe843783          	ld	a5,-24(s0)
   10480:	00078513          	mv	a0,a5
   10484:	01813403          	ld	s0,24(sp)
   10488:	02010113          	add	sp,sp,32
   1048c:	00008067          	ret

0000000000010490 <print_f>:
   10490:	fe010113          	add	sp,sp,-32
   10494:	00813c23          	sd	s0,24(sp)
   10498:	02010413          	add	s0,sp,32
   1049c:	fea42627          	fsw	fa0,-20(s0)
   104a0:	00600893          	li	a7,6
   104a4:	00000073          	ecall
   104a8:	00000013          	nop
   104ac:	01813403          	ld	s0,24(sp)
   104b0:	02010113          	add	sp,sp,32
   104b4:	00008067          	ret

00000000000104b8 <fsqrt>:
   104b8:	fd010113          	add	sp,sp,-48
   104bc:	02113423          	sd	ra,40(sp)
   104c0:	02813023          	sd	s0,32(sp)
   104c4:	03010413          	add	s0,sp,48
   104c8:	fca42e27          	fsw	fa0,-36(s0)
   104cc:	fdc42787          	flw	fa5,-36(s0)
   104d0:	5807f7d3          	fsqrt.s	fa5,fa5
   104d4:	fef42627          	fsw	fa5,-20(s0)
   104d8:	fec42507          	flw	fa0,-20(s0)
   104dc:	fb5ff0ef          	jal	10490 <print_f>
   104e0:	00a00513          	li	a0,10
   104e4:	efdff0ef          	jal	103e0 <print_c>
   104e8:	00000013          	nop
   104ec:	02813083          	ld	ra,40(sp)
   104f0:	02013403          	ld	s0,32(sp)
   104f4:	03010113          	add	sp,sp,48
   104f8:	00008067          	ret

00000000000104fc <fmvxw>:
   104fc:	fd010113          	add	sp,sp,-48
   10500:	02113423          	sd	ra,40(sp)
   10504:	02813023          	sd	s0,32(sp)
   10508:	03010413          	add	s0,sp,48
   1050c:	fca42e27          	fsw	fa0,-36(s0)
   10510:	fdc42787          	flw	fa5,-36(s0)
   10514:	e00787d3          	fmv.x.w	a5,fa5
   10518:	fef42623          	sw	a5,-20(s0)
   1051c:	fec42783          	lw	a5,-20(s0)
   10520:	00078513          	mv	a0,a5
   10524:	e69ff0ef          	jal	1038c <print_d>
   10528:	00a00513          	li	a0,10
   1052c:	eb5ff0ef          	jal	103e0 <print_c>
   10530:	00000013          	nop
   10534:	02813083          	ld	ra,40(sp)
   10538:	02013403          	ld	s0,32(sp)
   1053c:	03010113          	add	sp,sp,48
   10540:	00008067          	ret

0000000000010544 <fmvwx>:
   10544:	fd010113          	add	sp,sp,-48
   10548:	02113423          	sd	ra,40(sp)
   1054c:	02813023          	sd	s0,32(sp)
   10550:	03010413          	add	s0,sp,48
   10554:	00050793          	mv	a5,a0
   10558:	fcf42e23          	sw	a5,-36(s0)
   1055c:	fdc42783          	lw	a5,-36(s0)
   10560:	f00787d3          	fmv.w.x	fa5,a5
   10564:	fef42627          	fsw	fa5,-20(s0)
   10568:	fec42507          	flw	fa0,-20(s0)
   1056c:	f25ff0ef          	jal	10490 <print_f>
   10570:	00a00513          	li	a0,10
   10574:	e6dff0ef          	jal	103e0 <print_c>
   10578:	00000013          	nop
   1057c:	02813083          	ld	ra,40(sp)
   10580:	02013403          	ld	s0,32(sp)
   10584:	03010113          	add	sp,sp,48
   10588:	00008067          	ret

000000000001058c <fcvtws>:
   1058c:	fd010113          	add	sp,sp,-48
   10590:	02113423          	sd	ra,40(sp)
   10594:	02813023          	sd	s0,32(sp)
   10598:	03010413          	add	s0,sp,48
   1059c:	fca42e27          	fsw	fa0,-36(s0)
   105a0:	fdc42787          	flw	fa5,-36(s0)
   105a4:	c007f7d3          	fcvt.w.s	a5,fa5
   105a8:	fef42623          	sw	a5,-20(s0)
   105ac:	fec42783          	lw	a5,-20(s0)
   105b0:	00078513          	mv	a0,a5
   105b4:	dd9ff0ef          	jal	1038c <print_d>
   105b8:	00a00513          	li	a0,10
   105bc:	e25ff0ef          	jal	103e0 <print_c>
   105c0:	00000013          	nop
   105c4:	02813083          	ld	ra,40(sp)
   105c8:	02013403          	ld	s0,32(sp)
   105cc:	03010113          	add	sp,sp,48
   105d0:	00008067          	ret

00000000000105d4 <fcvtsw>:
   105d4:	fd010113          	add	sp,sp,-48
   105d8:	02113423          	sd	ra,40(sp)
   105dc:	02813023          	sd	s0,32(sp)
   105e0:	03010413          	add	s0,sp,48
   105e4:	00050793          	mv	a5,a0
   105e8:	fcf42e23          	sw	a5,-36(s0)
   105ec:	fdc42783          	lw	a5,-36(s0)
   105f0:	d007f7d3          	fcvt.s.w	fa5,a5
   105f4:	fef42627          	fsw	fa5,-20(s0)
   105f8:	fec42507          	flw	fa0,-20(s0)
   105fc:	e95ff0ef          	jal	10490 <print_f>
   10600:	00a00513          	li	a0,10
   10604:	dddff0ef          	jal	103e0 <print_c>
   10608:	00000013          	nop
   1060c:	02813083          	ld	ra,40(sp)
   10610:	02013403          	ld	s0,32(sp)
   10614:	03010113          	add	sp,sp,48
   10618:	00008067          	ret

000000000001061c <fmadds>:
   1061c:	fd010113          	add	sp,sp,-48
   10620:	02113423          	sd	ra,40(sp)
   10624:	02813023          	sd	s0,32(sp)
   10628:	03010413          	add	s0,sp,48
   1062c:	fca42e27          	fsw	fa0,-36(s0)
   10630:	fcb42c27          	fsw	fa1,-40(s0)
   10634:	fcc42a27          	fsw	fa2,-44(s0)
   10638:	fdc42787          	flw	fa5,-36(s0)
   1063c:	fd842707          	flw	fa4,-40(s0)
   10640:	fd442687          	flw	fa3,-44(s0)
   10644:	68e7f7c3          	fmadd.s	fa5,fa5,fa4,fa3
   10648:	fef42627          	fsw	fa5,-20(s0)
   1064c:	fec42507          	flw	fa0,-20(s0)
   10650:	e41ff0ef          	jal	10490 <print_f>
   10654:	00a00513          	li	a0,10
   10658:	d89ff0ef          	jal	103e0 <print_c>
   1065c:	00000013          	nop
   10660:	02813083          	ld	ra,40(sp)
   10664:	02013403          	ld	s0,32(sp)
   10668:	03010113          	add	sp,sp,48
   1066c:	00008067          	ret

0000000000010670 <fmsubs>:
   10670:	fd010113          	add	sp,sp,-48
   10674:	02113423          	sd	ra,40(sp)
   10678:	02813023          	sd	s0,32(sp)
   1067c:	03010413          	add	s0,sp,48
   10680:	fca42e27          	fsw	fa0,-36(s0)
   10684:	fcb42c27          	fsw	fa1,-40(s0)
   10688:	fcc42a27          	fsw	fa2,-44(s0)
   1068c:	fdc42787          	flw	fa5,-36(s0)
   10690:	fd842707          	flw	fa4,-40(s0)
   10694:	fd442687          	flw	fa3,-44(s0)
   10698:	68e7f7c7          	fmsub.s	fa5,fa5,fa4,fa3
   1069c:	fef42627          	fsw	fa5,-20(s0)
   106a0:	fec42507          	flw	fa0,-20(s0)
   106a4:	dedff0ef          	jal	10490 <print_f>
   106a8:	00a00513          	li	a0,10
   106ac:	d35ff0ef          	jal	103e0 <print_c>
   106b0:	00000013          	nop
   106b4:	02813083          	ld	ra,40(sp)
   106b8:	02013403          	ld	s0,32(sp)
   106bc:	03010113          	add	sp,sp,48
   106c0:	00008067          	ret

00000000000106c4 <__libc_init_array>:
   106c4:	fe010113          	add	sp,sp,-32
   106c8:	00813823          	sd	s0,16(sp)
   106cc:	000117b7          	lui	a5,0x11
   106d0:	00011437          	lui	s0,0x11
   106d4:	01213023          	sd	s2,0(sp)
   106d8:	00478793          	add	a5,a5,4 # 11004 <__preinit_array_end>
   106dc:	00440713          	add	a4,s0,4 # 11004 <__preinit_array_end>
   106e0:	00113c23          	sd	ra,24(sp)
   106e4:	00913423          	sd	s1,8(sp)
   106e8:	40e78933          	sub	s2,a5,a4
   106ec:	02e78263          	beq	a5,a4,10710 <__libc_init_array+0x4c>
   106f0:	40395913          	sra	s2,s2,0x3
   106f4:	00440413          	add	s0,s0,4
   106f8:	00000493          	li	s1,0
   106fc:	00043783          	ld	a5,0(s0)
   10700:	00148493          	add	s1,s1,1
   10704:	00840413          	add	s0,s0,8
   10708:	000780e7          	jalr	a5
   1070c:	ff24e8e3          	bltu	s1,s2,106fc <__libc_init_array+0x38>
   10710:	00011437          	lui	s0,0x11
   10714:	000117b7          	lui	a5,0x11
   10718:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   1071c:	00840713          	add	a4,s0,8 # 11008 <__init_array_start>
   10720:	40e78933          	sub	s2,a5,a4
   10724:	40395913          	sra	s2,s2,0x3
   10728:	02e78063          	beq	a5,a4,10748 <__libc_init_array+0x84>
   1072c:	00840413          	add	s0,s0,8
   10730:	00000493          	li	s1,0
   10734:	00043783          	ld	a5,0(s0)
   10738:	00148493          	add	s1,s1,1
   1073c:	00840413          	add	s0,s0,8
   10740:	000780e7          	jalr	a5
   10744:	ff24e8e3          	bltu	s1,s2,10734 <__libc_init_array+0x70>
   10748:	01813083          	ld	ra,24(sp)
   1074c:	01013403          	ld	s0,16(sp)
   10750:	00813483          	ld	s1,8(sp)
   10754:	00013903          	ld	s2,0(sp)
   10758:	02010113          	add	sp,sp,32
   1075c:	00008067          	ret

0000000000010760 <memset>:
   10760:	00f00313          	li	t1,15
   10764:	00050713          	mv	a4,a0
   10768:	02c37a63          	bgeu	t1,a2,1079c <memset+0x3c>
   1076c:	00f77793          	and	a5,a4,15
   10770:	0a079063          	bnez	a5,10810 <memset+0xb0>
   10774:	06059e63          	bnez	a1,107f0 <memset+0x90>
   10778:	ff067693          	and	a3,a2,-16
   1077c:	00f67613          	and	a2,a2,15
   10780:	00e686b3          	add	a3,a3,a4
   10784:	00b73023          	sd	a1,0(a4)
   10788:	00b73423          	sd	a1,8(a4)
   1078c:	01070713          	add	a4,a4,16
   10790:	fed76ae3          	bltu	a4,a3,10784 <memset+0x24>
   10794:	00061463          	bnez	a2,1079c <memset+0x3c>
   10798:	00008067          	ret
   1079c:	40c306b3          	sub	a3,t1,a2
   107a0:	00269693          	sll	a3,a3,0x2
   107a4:	00000297          	auipc	t0,0x0
   107a8:	005686b3          	add	a3,a3,t0
   107ac:	00c68067          	jr	12(a3)
   107b0:	00b70723          	sb	a1,14(a4)
   107b4:	00b706a3          	sb	a1,13(a4)
   107b8:	00b70623          	sb	a1,12(a4)
   107bc:	00b705a3          	sb	a1,11(a4)
   107c0:	00b70523          	sb	a1,10(a4)
   107c4:	00b704a3          	sb	a1,9(a4)
   107c8:	00b70423          	sb	a1,8(a4)
   107cc:	00b703a3          	sb	a1,7(a4)
   107d0:	00b70323          	sb	a1,6(a4)
   107d4:	00b702a3          	sb	a1,5(a4)
   107d8:	00b70223          	sb	a1,4(a4)
   107dc:	00b701a3          	sb	a1,3(a4)
   107e0:	00b70123          	sb	a1,2(a4)
   107e4:	00b700a3          	sb	a1,1(a4)
   107e8:	00b70023          	sb	a1,0(a4)
   107ec:	00008067          	ret
   107f0:	0ff5f593          	zext.b	a1,a1
   107f4:	00859693          	sll	a3,a1,0x8
   107f8:	00d5e5b3          	or	a1,a1,a3
   107fc:	01059693          	sll	a3,a1,0x10
   10800:	00d5e5b3          	or	a1,a1,a3
   10804:	02059693          	sll	a3,a1,0x20
   10808:	00d5e5b3          	or	a1,a1,a3
   1080c:	f6dff06f          	j	10778 <memset+0x18>
   10810:	00279693          	sll	a3,a5,0x2
   10814:	00000297          	auipc	t0,0x0
   10818:	005686b3          	add	a3,a3,t0
   1081c:	00008293          	mv	t0,ra
   10820:	f98680e7          	jalr	-104(a3)
   10824:	00028093          	mv	ra,t0
   10828:	ff078793          	add	a5,a5,-16
   1082c:	40f70733          	sub	a4,a4,a5
   10830:	00f60633          	add	a2,a2,a5
   10834:	f6c374e3          	bgeu	t1,a2,1079c <memset+0x3c>
   10838:	f3dff06f          	j	10774 <memset+0x14>

000000000001083c <__call_exitprocs>:
   1083c:	fb010113          	add	sp,sp,-80
   10840:	03413023          	sd	s4,32(sp)
   10844:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   10848:	03213823          	sd	s2,48(sp)
   1084c:	04113423          	sd	ra,72(sp)
   10850:	1f8a3903          	ld	s2,504(s4)
   10854:	04813023          	sd	s0,64(sp)
   10858:	02913c23          	sd	s1,56(sp)
   1085c:	03313423          	sd	s3,40(sp)
   10860:	01513c23          	sd	s5,24(sp)
   10864:	01613823          	sd	s6,16(sp)
   10868:	01713423          	sd	s7,8(sp)
   1086c:	01813023          	sd	s8,0(sp)
   10870:	04090063          	beqz	s2,108b0 <__call_exitprocs+0x74>
   10874:	00050b13          	mv	s6,a0
   10878:	00058b93          	mv	s7,a1
   1087c:	00100a93          	li	s5,1
   10880:	fff00993          	li	s3,-1
   10884:	00892483          	lw	s1,8(s2)
   10888:	fff4841b          	addw	s0,s1,-1
   1088c:	02044263          	bltz	s0,108b0 <__call_exitprocs+0x74>
   10890:	00349493          	sll	s1,s1,0x3
   10894:	009904b3          	add	s1,s2,s1
   10898:	040b8463          	beqz	s7,108e0 <__call_exitprocs+0xa4>
   1089c:	2084b783          	ld	a5,520(s1)
   108a0:	05778063          	beq	a5,s7,108e0 <__call_exitprocs+0xa4>
   108a4:	fff4041b          	addw	s0,s0,-1
   108a8:	ff848493          	add	s1,s1,-8
   108ac:	ff3416e3          	bne	s0,s3,10898 <__call_exitprocs+0x5c>
   108b0:	04813083          	ld	ra,72(sp)
   108b4:	04013403          	ld	s0,64(sp)
   108b8:	03813483          	ld	s1,56(sp)
   108bc:	03013903          	ld	s2,48(sp)
   108c0:	02813983          	ld	s3,40(sp)
   108c4:	02013a03          	ld	s4,32(sp)
   108c8:	01813a83          	ld	s5,24(sp)
   108cc:	01013b03          	ld	s6,16(sp)
   108d0:	00813b83          	ld	s7,8(sp)
   108d4:	00013c03          	ld	s8,0(sp)
   108d8:	05010113          	add	sp,sp,80
   108dc:	00008067          	ret
   108e0:	00892783          	lw	a5,8(s2)
   108e4:	0084b703          	ld	a4,8(s1)
   108e8:	fff7879b          	addw	a5,a5,-1
   108ec:	06878263          	beq	a5,s0,10950 <__call_exitprocs+0x114>
   108f0:	0004b423          	sd	zero,8(s1)
   108f4:	fa0708e3          	beqz	a4,108a4 <__call_exitprocs+0x68>
   108f8:	31092783          	lw	a5,784(s2)
   108fc:	008a96bb          	sllw	a3,s5,s0
   10900:	00892c03          	lw	s8,8(s2)
   10904:	00d7f7b3          	and	a5,a5,a3
   10908:	0007879b          	sext.w	a5,a5
   1090c:	02079263          	bnez	a5,10930 <__call_exitprocs+0xf4>
   10910:	000700e7          	jalr	a4
   10914:	00892703          	lw	a4,8(s2)
   10918:	1f8a3783          	ld	a5,504(s4)
   1091c:	01871463          	bne	a4,s8,10924 <__call_exitprocs+0xe8>
   10920:	f92782e3          	beq	a5,s2,108a4 <__call_exitprocs+0x68>
   10924:	f80786e3          	beqz	a5,108b0 <__call_exitprocs+0x74>
   10928:	00078913          	mv	s2,a5
   1092c:	f59ff06f          	j	10884 <__call_exitprocs+0x48>
   10930:	31492783          	lw	a5,788(s2)
   10934:	1084b583          	ld	a1,264(s1)
   10938:	00d7f7b3          	and	a5,a5,a3
   1093c:	0007879b          	sext.w	a5,a5
   10940:	00079c63          	bnez	a5,10958 <__call_exitprocs+0x11c>
   10944:	000b0513          	mv	a0,s6
   10948:	000700e7          	jalr	a4
   1094c:	fc9ff06f          	j	10914 <__call_exitprocs+0xd8>
   10950:	00892423          	sw	s0,8(s2)
   10954:	fa1ff06f          	j	108f4 <__call_exitprocs+0xb8>
   10958:	00058513          	mv	a0,a1
   1095c:	000700e7          	jalr	a4
   10960:	fb5ff06f          	j	10914 <__call_exitprocs+0xd8>

0000000000010964 <__libc_fini_array>:
   10964:	fe010113          	add	sp,sp,-32
   10968:	00813823          	sd	s0,16(sp)
   1096c:	000117b7          	lui	a5,0x11
   10970:	00011437          	lui	s0,0x11
   10974:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   10978:	02040413          	add	s0,s0,32 # 11020 <impure_data>
   1097c:	40f40433          	sub	s0,s0,a5
   10980:	00913423          	sd	s1,8(sp)
   10984:	00113c23          	sd	ra,24(sp)
   10988:	40345493          	sra	s1,s0,0x3
   1098c:	02048063          	beqz	s1,109ac <__libc_fini_array+0x48>
   10990:	ff840413          	add	s0,s0,-8
   10994:	00f40433          	add	s0,s0,a5
   10998:	00043783          	ld	a5,0(s0)
   1099c:	fff48493          	add	s1,s1,-1
   109a0:	ff840413          	add	s0,s0,-8
   109a4:	000780e7          	jalr	a5
   109a8:	fe0498e3          	bnez	s1,10998 <__libc_fini_array+0x34>
   109ac:	01813083          	ld	ra,24(sp)
   109b0:	01013403          	ld	s0,16(sp)
   109b4:	00813483          	ld	s1,8(sp)
   109b8:	02010113          	add	sp,sp,32
   109bc:	00008067          	ret

00000000000109c0 <atexit>:
   109c0:	00050593          	mv	a1,a0
   109c4:	00000693          	li	a3,0
   109c8:	00000613          	li	a2,0
   109cc:	00000513          	li	a0,0
   109d0:	0040006f          	j	109d4 <__register_exitproc>

00000000000109d4 <__register_exitproc>:
   109d4:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   109d8:	1f873783          	ld	a5,504(a4)
   109dc:	06078063          	beqz	a5,10a3c <__register_exitproc+0x68>
   109e0:	0087a703          	lw	a4,8(a5)
   109e4:	01f00813          	li	a6,31
   109e8:	08e84663          	blt	a6,a4,10a74 <__register_exitproc+0xa0>
   109ec:	02050863          	beqz	a0,10a1c <__register_exitproc+0x48>
   109f0:	00371813          	sll	a6,a4,0x3
   109f4:	01078833          	add	a6,a5,a6
   109f8:	10c83823          	sd	a2,272(a6)
   109fc:	3107a883          	lw	a7,784(a5)
   10a00:	00100613          	li	a2,1
   10a04:	00e6163b          	sllw	a2,a2,a4
   10a08:	00c8e8b3          	or	a7,a7,a2
   10a0c:	3117a823          	sw	a7,784(a5)
   10a10:	20d83823          	sd	a3,528(a6)
   10a14:	00200693          	li	a3,2
   10a18:	02d50863          	beq	a0,a3,10a48 <__register_exitproc+0x74>
   10a1c:	00270693          	add	a3,a4,2
   10a20:	00369693          	sll	a3,a3,0x3
   10a24:	0017071b          	addw	a4,a4,1
   10a28:	00e7a423          	sw	a4,8(a5)
   10a2c:	00d787b3          	add	a5,a5,a3
   10a30:	00b7b023          	sd	a1,0(a5)
   10a34:	00000513          	li	a0,0
   10a38:	00008067          	ret
   10a3c:	20070793          	add	a5,a4,512
   10a40:	1ef73c23          	sd	a5,504(a4)
   10a44:	f9dff06f          	j	109e0 <__register_exitproc+0xc>
   10a48:	3147a683          	lw	a3,788(a5)
   10a4c:	00000513          	li	a0,0
   10a50:	00c6e6b3          	or	a3,a3,a2
   10a54:	30d7aa23          	sw	a3,788(a5)
   10a58:	00270693          	add	a3,a4,2
   10a5c:	00369693          	sll	a3,a3,0x3
   10a60:	0017071b          	addw	a4,a4,1
   10a64:	00e7a423          	sw	a4,8(a5)
   10a68:	00d787b3          	add	a5,a5,a3
   10a6c:	00b7b023          	sd	a1,0(a5)
   10a70:	00008067          	ret
   10a74:	fff00513          	li	a0,-1
   10a78:	00008067          	ret

0000000000010a7c <_exit>:
   10a7c:	05d00893          	li	a7,93
   10a80:	00000073          	ecall
   10a84:	00054463          	bltz	a0,10a8c <_exit+0x10>
   10a88:	0000006f          	j	10a88 <_exit+0xc>
   10a8c:	ff010113          	add	sp,sp,-16
   10a90:	00813023          	sd	s0,0(sp)
   10a94:	00050413          	mv	s0,a0
   10a98:	00113423          	sd	ra,8(sp)
   10a9c:	4080043b          	negw	s0,s0
   10aa0:	00c000ef          	jal	10aac <__errno>
   10aa4:	00852023          	sw	s0,0(a0) # 11000 <__EH_FRAME_BEGIN__>
   10aa8:	0000006f          	j	10aa8 <_exit+0x2c>

0000000000010aac <__errno>:
   10aac:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10ab0:	00008067          	ret
