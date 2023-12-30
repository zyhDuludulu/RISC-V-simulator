
../../../Desktop/CS211/lab0/cs211_23f_lab_sim_framework/riscv-elf/fmvwx.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	add	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	608000ef          	jal	10704 <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	031000ef          	jal	10944 <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00011537          	lui	a0,0x11
   10124:	82c50513          	add	a0,a0,-2004 # 1082c <__libc_fini_array>
   10128:	7600006f          	j	10888 <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00001197          	auipc	gp,0x1
   10134:	6f018193          	add	gp,gp,1776 # 11820 <__global_pointer$>
   10138:	f6018513          	add	a0,gp,-160 # 11780 <completed.1>
   1013c:	f9818613          	add	a2,gp,-104 # 117b8 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	4e0000ef          	jal	10628 <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	73c50513          	add	a0,a0,1852 # 10888 <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	6d450513          	add	a0,a0,1748 # 1082c <__libc_fini_array>
   10160:	728000ef          	jal	10888 <atexit>
   10164:	428000ef          	jal	1058c <__libc_init_array>
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
   101f0:	50de37b7          	lui	a5,0x50de3
   101f4:	8cb78793          	add	a5,a5,-1845 # 50de28cb <__global_pointer$+0x50dd10ab>
   101f8:	fef42623          	sw	a5,-20(s0)
   101fc:	fec42783          	lw	a5,-20(s0)
   10200:	00078513          	mv	a0,a5
   10204:	208000ef          	jal	1040c <fmvwx>
   10208:	3eca47b7          	lui	a5,0x3eca4
   1020c:	43378793          	add	a5,a5,1075 # 3eca4433 <__global_pointer$+0x3ec92c13>
   10210:	fef42623          	sw	a5,-20(s0)
   10214:	fec42783          	lw	a5,-20(s0)
   10218:	00078513          	mv	a0,a5
   1021c:	1f0000ef          	jal	1040c <fmvwx>
   10220:	404917b7          	lui	a5,0x40491
   10224:	fd078793          	add	a5,a5,-48 # 40490fd0 <__global_pointer$+0x4047f7b0>
   10228:	fef42623          	sw	a5,-20(s0)
   1022c:	fec42783          	lw	a5,-20(s0)
   10230:	00078513          	mv	a0,a5
   10234:	1d8000ef          	jal	1040c <fmvwx>
   10238:	09c000ef          	jal	102d4 <exit_proc>
   1023c:	00000793          	li	a5,0
   10240:	00078513          	mv	a0,a5
   10244:	01813083          	ld	ra,24(sp)
   10248:	01013403          	ld	s0,16(sp)
   1024c:	02010113          	add	sp,sp,32
   10250:	00008067          	ret

0000000000010254 <print_d>:
   10254:	fe010113          	add	sp,sp,-32
   10258:	00813c23          	sd	s0,24(sp)
   1025c:	02010413          	add	s0,sp,32
   10260:	00050793          	mv	a5,a0
   10264:	fef42623          	sw	a5,-20(s0)
   10268:	00200893          	li	a7,2
   1026c:	00000073          	ecall
   10270:	00000013          	nop
   10274:	01813403          	ld	s0,24(sp)
   10278:	02010113          	add	sp,sp,32
   1027c:	00008067          	ret

0000000000010280 <print_s>:
   10280:	fe010113          	add	sp,sp,-32
   10284:	00813c23          	sd	s0,24(sp)
   10288:	02010413          	add	s0,sp,32
   1028c:	fea43423          	sd	a0,-24(s0)
   10290:	00000893          	li	a7,0
   10294:	00000073          	ecall
   10298:	00000013          	nop
   1029c:	01813403          	ld	s0,24(sp)
   102a0:	02010113          	add	sp,sp,32
   102a4:	00008067          	ret

00000000000102a8 <print_c>:
   102a8:	fe010113          	add	sp,sp,-32
   102ac:	00813c23          	sd	s0,24(sp)
   102b0:	02010413          	add	s0,sp,32
   102b4:	00050793          	mv	a5,a0
   102b8:	fef407a3          	sb	a5,-17(s0)
   102bc:	00100893          	li	a7,1
   102c0:	00000073          	ecall
   102c4:	00000013          	nop
   102c8:	01813403          	ld	s0,24(sp)
   102cc:	02010113          	add	sp,sp,32
   102d0:	00008067          	ret

00000000000102d4 <exit_proc>:
   102d4:	ff010113          	add	sp,sp,-16
   102d8:	00813423          	sd	s0,8(sp)
   102dc:	01010413          	add	s0,sp,16
   102e0:	00300893          	li	a7,3
   102e4:	00000073          	ecall
   102e8:	00000013          	nop
   102ec:	00813403          	ld	s0,8(sp)
   102f0:	01010113          	add	sp,sp,16
   102f4:	00008067          	ret

00000000000102f8 <read_char>:
   102f8:	fe010113          	add	sp,sp,-32
   102fc:	00813c23          	sd	s0,24(sp)
   10300:	02010413          	add	s0,sp,32
   10304:	00400893          	li	a7,4
   10308:	00000073          	ecall
   1030c:	00050793          	mv	a5,a0
   10310:	fef407a3          	sb	a5,-17(s0)
   10314:	fef44783          	lbu	a5,-17(s0)
   10318:	00078513          	mv	a0,a5
   1031c:	01813403          	ld	s0,24(sp)
   10320:	02010113          	add	sp,sp,32
   10324:	00008067          	ret

0000000000010328 <read_num>:
   10328:	fe010113          	add	sp,sp,-32
   1032c:	00813c23          	sd	s0,24(sp)
   10330:	02010413          	add	s0,sp,32
   10334:	00500893          	li	a7,5
   10338:	00000073          	ecall
   1033c:	00050793          	mv	a5,a0
   10340:	fef43423          	sd	a5,-24(s0)
   10344:	fe843783          	ld	a5,-24(s0)
   10348:	00078513          	mv	a0,a5
   1034c:	01813403          	ld	s0,24(sp)
   10350:	02010113          	add	sp,sp,32
   10354:	00008067          	ret

0000000000010358 <print_f>:
   10358:	fe010113          	add	sp,sp,-32
   1035c:	00813c23          	sd	s0,24(sp)
   10360:	02010413          	add	s0,sp,32
   10364:	fea42627          	fsw	fa0,-20(s0)
   10368:	00600893          	li	a7,6
   1036c:	00000073          	ecall
   10370:	00000013          	nop
   10374:	01813403          	ld	s0,24(sp)
   10378:	02010113          	add	sp,sp,32
   1037c:	00008067          	ret

0000000000010380 <fsqrt>:
   10380:	fd010113          	add	sp,sp,-48
   10384:	02113423          	sd	ra,40(sp)
   10388:	02813023          	sd	s0,32(sp)
   1038c:	03010413          	add	s0,sp,48
   10390:	fca42e27          	fsw	fa0,-36(s0)
   10394:	fdc42787          	flw	fa5,-36(s0)
   10398:	5807f7d3          	fsqrt.s	fa5,fa5
   1039c:	fef42627          	fsw	fa5,-20(s0)
   103a0:	fec42507          	flw	fa0,-20(s0)
   103a4:	fb5ff0ef          	jal	10358 <print_f>
   103a8:	00a00513          	li	a0,10
   103ac:	efdff0ef          	jal	102a8 <print_c>
   103b0:	00000013          	nop
   103b4:	02813083          	ld	ra,40(sp)
   103b8:	02013403          	ld	s0,32(sp)
   103bc:	03010113          	add	sp,sp,48
   103c0:	00008067          	ret

00000000000103c4 <fmvxw>:
   103c4:	fd010113          	add	sp,sp,-48
   103c8:	02113423          	sd	ra,40(sp)
   103cc:	02813023          	sd	s0,32(sp)
   103d0:	03010413          	add	s0,sp,48
   103d4:	fca42e27          	fsw	fa0,-36(s0)
   103d8:	fdc42787          	flw	fa5,-36(s0)
   103dc:	e00787d3          	fmv.x.w	a5,fa5
   103e0:	fef42623          	sw	a5,-20(s0)
   103e4:	fec42783          	lw	a5,-20(s0)
   103e8:	00078513          	mv	a0,a5
   103ec:	e69ff0ef          	jal	10254 <print_d>
   103f0:	00a00513          	li	a0,10
   103f4:	eb5ff0ef          	jal	102a8 <print_c>
   103f8:	00000013          	nop
   103fc:	02813083          	ld	ra,40(sp)
   10400:	02013403          	ld	s0,32(sp)
   10404:	03010113          	add	sp,sp,48
   10408:	00008067          	ret

000000000001040c <fmvwx>:
   1040c:	fd010113          	add	sp,sp,-48
   10410:	02113423          	sd	ra,40(sp)
   10414:	02813023          	sd	s0,32(sp)
   10418:	03010413          	add	s0,sp,48
   1041c:	00050793          	mv	a5,a0
   10420:	fcf42e23          	sw	a5,-36(s0)
   10424:	fdc42783          	lw	a5,-36(s0)
   10428:	f00787d3          	fmv.w.x	fa5,a5
   1042c:	fef42627          	fsw	fa5,-20(s0)
   10430:	fec42507          	flw	fa0,-20(s0)
   10434:	f25ff0ef          	jal	10358 <print_f>
   10438:	00a00513          	li	a0,10
   1043c:	e6dff0ef          	jal	102a8 <print_c>
   10440:	00000013          	nop
   10444:	02813083          	ld	ra,40(sp)
   10448:	02013403          	ld	s0,32(sp)
   1044c:	03010113          	add	sp,sp,48
   10450:	00008067          	ret

0000000000010454 <fcvtws>:
   10454:	fd010113          	add	sp,sp,-48
   10458:	02113423          	sd	ra,40(sp)
   1045c:	02813023          	sd	s0,32(sp)
   10460:	03010413          	add	s0,sp,48
   10464:	fca42e27          	fsw	fa0,-36(s0)
   10468:	fdc42787          	flw	fa5,-36(s0)
   1046c:	c007f7d3          	fcvt.w.s	a5,fa5
   10470:	fef42623          	sw	a5,-20(s0)
   10474:	fec42783          	lw	a5,-20(s0)
   10478:	00078513          	mv	a0,a5
   1047c:	dd9ff0ef          	jal	10254 <print_d>
   10480:	00a00513          	li	a0,10
   10484:	e25ff0ef          	jal	102a8 <print_c>
   10488:	00000013          	nop
   1048c:	02813083          	ld	ra,40(sp)
   10490:	02013403          	ld	s0,32(sp)
   10494:	03010113          	add	sp,sp,48
   10498:	00008067          	ret

000000000001049c <fcvtsw>:
   1049c:	fd010113          	add	sp,sp,-48
   104a0:	02113423          	sd	ra,40(sp)
   104a4:	02813023          	sd	s0,32(sp)
   104a8:	03010413          	add	s0,sp,48
   104ac:	00050793          	mv	a5,a0
   104b0:	fcf42e23          	sw	a5,-36(s0)
   104b4:	fdc42783          	lw	a5,-36(s0)
   104b8:	d007f7d3          	fcvt.s.w	fa5,a5
   104bc:	fef42627          	fsw	fa5,-20(s0)
   104c0:	fec42507          	flw	fa0,-20(s0)
   104c4:	e95ff0ef          	jal	10358 <print_f>
   104c8:	00a00513          	li	a0,10
   104cc:	dddff0ef          	jal	102a8 <print_c>
   104d0:	00000013          	nop
   104d4:	02813083          	ld	ra,40(sp)
   104d8:	02013403          	ld	s0,32(sp)
   104dc:	03010113          	add	sp,sp,48
   104e0:	00008067          	ret

00000000000104e4 <fmadds>:
   104e4:	fd010113          	add	sp,sp,-48
   104e8:	02113423          	sd	ra,40(sp)
   104ec:	02813023          	sd	s0,32(sp)
   104f0:	03010413          	add	s0,sp,48
   104f4:	fca42e27          	fsw	fa0,-36(s0)
   104f8:	fcb42c27          	fsw	fa1,-40(s0)
   104fc:	fcc42a27          	fsw	fa2,-44(s0)
   10500:	fdc42787          	flw	fa5,-36(s0)
   10504:	fd842707          	flw	fa4,-40(s0)
   10508:	fd442687          	flw	fa3,-44(s0)
   1050c:	68e7f7c3          	fmadd.s	fa5,fa5,fa4,fa3
   10510:	fef42627          	fsw	fa5,-20(s0)
   10514:	fec42507          	flw	fa0,-20(s0)
   10518:	e41ff0ef          	jal	10358 <print_f>
   1051c:	00a00513          	li	a0,10
   10520:	d89ff0ef          	jal	102a8 <print_c>
   10524:	00000013          	nop
   10528:	02813083          	ld	ra,40(sp)
   1052c:	02013403          	ld	s0,32(sp)
   10530:	03010113          	add	sp,sp,48
   10534:	00008067          	ret

0000000000010538 <fmsubs>:
   10538:	fd010113          	add	sp,sp,-48
   1053c:	02113423          	sd	ra,40(sp)
   10540:	02813023          	sd	s0,32(sp)
   10544:	03010413          	add	s0,sp,48
   10548:	fca42e27          	fsw	fa0,-36(s0)
   1054c:	fcb42c27          	fsw	fa1,-40(s0)
   10550:	fcc42a27          	fsw	fa2,-44(s0)
   10554:	fdc42787          	flw	fa5,-36(s0)
   10558:	fd842707          	flw	fa4,-40(s0)
   1055c:	fd442687          	flw	fa3,-44(s0)
   10560:	68e7f7c7          	fmsub.s	fa5,fa5,fa4,fa3
   10564:	fef42627          	fsw	fa5,-20(s0)
   10568:	fec42507          	flw	fa0,-20(s0)
   1056c:	dedff0ef          	jal	10358 <print_f>
   10570:	00a00513          	li	a0,10
   10574:	d35ff0ef          	jal	102a8 <print_c>
   10578:	00000013          	nop
   1057c:	02813083          	ld	ra,40(sp)
   10580:	02013403          	ld	s0,32(sp)
   10584:	03010113          	add	sp,sp,48
   10588:	00008067          	ret

000000000001058c <__libc_init_array>:
   1058c:	fe010113          	add	sp,sp,-32
   10590:	00813823          	sd	s0,16(sp)
   10594:	000117b7          	lui	a5,0x11
   10598:	00011437          	lui	s0,0x11
   1059c:	01213023          	sd	s2,0(sp)
   105a0:	00478793          	add	a5,a5,4 # 11004 <__preinit_array_end>
   105a4:	00440713          	add	a4,s0,4 # 11004 <__preinit_array_end>
   105a8:	00113c23          	sd	ra,24(sp)
   105ac:	00913423          	sd	s1,8(sp)
   105b0:	40e78933          	sub	s2,a5,a4
   105b4:	02e78263          	beq	a5,a4,105d8 <__libc_init_array+0x4c>
   105b8:	40395913          	sra	s2,s2,0x3
   105bc:	00440413          	add	s0,s0,4
   105c0:	00000493          	li	s1,0
   105c4:	00043783          	ld	a5,0(s0)
   105c8:	00148493          	add	s1,s1,1
   105cc:	00840413          	add	s0,s0,8
   105d0:	000780e7          	jalr	a5
   105d4:	ff24e8e3          	bltu	s1,s2,105c4 <__libc_init_array+0x38>
   105d8:	00011437          	lui	s0,0x11
   105dc:	000117b7          	lui	a5,0x11
   105e0:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   105e4:	00840713          	add	a4,s0,8 # 11008 <__init_array_start>
   105e8:	40e78933          	sub	s2,a5,a4
   105ec:	40395913          	sra	s2,s2,0x3
   105f0:	02e78063          	beq	a5,a4,10610 <__libc_init_array+0x84>
   105f4:	00840413          	add	s0,s0,8
   105f8:	00000493          	li	s1,0
   105fc:	00043783          	ld	a5,0(s0)
   10600:	00148493          	add	s1,s1,1
   10604:	00840413          	add	s0,s0,8
   10608:	000780e7          	jalr	a5
   1060c:	ff24e8e3          	bltu	s1,s2,105fc <__libc_init_array+0x70>
   10610:	01813083          	ld	ra,24(sp)
   10614:	01013403          	ld	s0,16(sp)
   10618:	00813483          	ld	s1,8(sp)
   1061c:	00013903          	ld	s2,0(sp)
   10620:	02010113          	add	sp,sp,32
   10624:	00008067          	ret

0000000000010628 <memset>:
   10628:	00f00313          	li	t1,15
   1062c:	00050713          	mv	a4,a0
   10630:	02c37a63          	bgeu	t1,a2,10664 <memset+0x3c>
   10634:	00f77793          	and	a5,a4,15
   10638:	0a079063          	bnez	a5,106d8 <memset+0xb0>
   1063c:	06059e63          	bnez	a1,106b8 <memset+0x90>
   10640:	ff067693          	and	a3,a2,-16
   10644:	00f67613          	and	a2,a2,15
   10648:	00e686b3          	add	a3,a3,a4
   1064c:	00b73023          	sd	a1,0(a4)
   10650:	00b73423          	sd	a1,8(a4)
   10654:	01070713          	add	a4,a4,16
   10658:	fed76ae3          	bltu	a4,a3,1064c <memset+0x24>
   1065c:	00061463          	bnez	a2,10664 <memset+0x3c>
   10660:	00008067          	ret
   10664:	40c306b3          	sub	a3,t1,a2
   10668:	00269693          	sll	a3,a3,0x2
   1066c:	00000297          	auipc	t0,0x0
   10670:	005686b3          	add	a3,a3,t0
   10674:	00c68067          	jr	12(a3)
   10678:	00b70723          	sb	a1,14(a4)
   1067c:	00b706a3          	sb	a1,13(a4)
   10680:	00b70623          	sb	a1,12(a4)
   10684:	00b705a3          	sb	a1,11(a4)
   10688:	00b70523          	sb	a1,10(a4)
   1068c:	00b704a3          	sb	a1,9(a4)
   10690:	00b70423          	sb	a1,8(a4)
   10694:	00b703a3          	sb	a1,7(a4)
   10698:	00b70323          	sb	a1,6(a4)
   1069c:	00b702a3          	sb	a1,5(a4)
   106a0:	00b70223          	sb	a1,4(a4)
   106a4:	00b701a3          	sb	a1,3(a4)
   106a8:	00b70123          	sb	a1,2(a4)
   106ac:	00b700a3          	sb	a1,1(a4)
   106b0:	00b70023          	sb	a1,0(a4)
   106b4:	00008067          	ret
   106b8:	0ff5f593          	zext.b	a1,a1
   106bc:	00859693          	sll	a3,a1,0x8
   106c0:	00d5e5b3          	or	a1,a1,a3
   106c4:	01059693          	sll	a3,a1,0x10
   106c8:	00d5e5b3          	or	a1,a1,a3
   106cc:	02059693          	sll	a3,a1,0x20
   106d0:	00d5e5b3          	or	a1,a1,a3
   106d4:	f6dff06f          	j	10640 <memset+0x18>
   106d8:	00279693          	sll	a3,a5,0x2
   106dc:	00000297          	auipc	t0,0x0
   106e0:	005686b3          	add	a3,a3,t0
   106e4:	00008293          	mv	t0,ra
   106e8:	f98680e7          	jalr	-104(a3)
   106ec:	00028093          	mv	ra,t0
   106f0:	ff078793          	add	a5,a5,-16
   106f4:	40f70733          	sub	a4,a4,a5
   106f8:	00f60633          	add	a2,a2,a5
   106fc:	f6c374e3          	bgeu	t1,a2,10664 <memset+0x3c>
   10700:	f3dff06f          	j	1063c <memset+0x14>

0000000000010704 <__call_exitprocs>:
   10704:	fb010113          	add	sp,sp,-80
   10708:	03413023          	sd	s4,32(sp)
   1070c:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   10710:	03213823          	sd	s2,48(sp)
   10714:	04113423          	sd	ra,72(sp)
   10718:	1f8a3903          	ld	s2,504(s4)
   1071c:	04813023          	sd	s0,64(sp)
   10720:	02913c23          	sd	s1,56(sp)
   10724:	03313423          	sd	s3,40(sp)
   10728:	01513c23          	sd	s5,24(sp)
   1072c:	01613823          	sd	s6,16(sp)
   10730:	01713423          	sd	s7,8(sp)
   10734:	01813023          	sd	s8,0(sp)
   10738:	04090063          	beqz	s2,10778 <__call_exitprocs+0x74>
   1073c:	00050b13          	mv	s6,a0
   10740:	00058b93          	mv	s7,a1
   10744:	00100a93          	li	s5,1
   10748:	fff00993          	li	s3,-1
   1074c:	00892483          	lw	s1,8(s2)
   10750:	fff4841b          	addw	s0,s1,-1
   10754:	02044263          	bltz	s0,10778 <__call_exitprocs+0x74>
   10758:	00349493          	sll	s1,s1,0x3
   1075c:	009904b3          	add	s1,s2,s1
   10760:	040b8463          	beqz	s7,107a8 <__call_exitprocs+0xa4>
   10764:	2084b783          	ld	a5,520(s1)
   10768:	05778063          	beq	a5,s7,107a8 <__call_exitprocs+0xa4>
   1076c:	fff4041b          	addw	s0,s0,-1
   10770:	ff848493          	add	s1,s1,-8
   10774:	ff3416e3          	bne	s0,s3,10760 <__call_exitprocs+0x5c>
   10778:	04813083          	ld	ra,72(sp)
   1077c:	04013403          	ld	s0,64(sp)
   10780:	03813483          	ld	s1,56(sp)
   10784:	03013903          	ld	s2,48(sp)
   10788:	02813983          	ld	s3,40(sp)
   1078c:	02013a03          	ld	s4,32(sp)
   10790:	01813a83          	ld	s5,24(sp)
   10794:	01013b03          	ld	s6,16(sp)
   10798:	00813b83          	ld	s7,8(sp)
   1079c:	00013c03          	ld	s8,0(sp)
   107a0:	05010113          	add	sp,sp,80
   107a4:	00008067          	ret
   107a8:	00892783          	lw	a5,8(s2)
   107ac:	0084b703          	ld	a4,8(s1)
   107b0:	fff7879b          	addw	a5,a5,-1
   107b4:	06878263          	beq	a5,s0,10818 <__call_exitprocs+0x114>
   107b8:	0004b423          	sd	zero,8(s1)
   107bc:	fa0708e3          	beqz	a4,1076c <__call_exitprocs+0x68>
   107c0:	31092783          	lw	a5,784(s2)
   107c4:	008a96bb          	sllw	a3,s5,s0
   107c8:	00892c03          	lw	s8,8(s2)
   107cc:	00d7f7b3          	and	a5,a5,a3
   107d0:	0007879b          	sext.w	a5,a5
   107d4:	02079263          	bnez	a5,107f8 <__call_exitprocs+0xf4>
   107d8:	000700e7          	jalr	a4
   107dc:	00892703          	lw	a4,8(s2)
   107e0:	1f8a3783          	ld	a5,504(s4)
   107e4:	01871463          	bne	a4,s8,107ec <__call_exitprocs+0xe8>
   107e8:	f92782e3          	beq	a5,s2,1076c <__call_exitprocs+0x68>
   107ec:	f80786e3          	beqz	a5,10778 <__call_exitprocs+0x74>
   107f0:	00078913          	mv	s2,a5
   107f4:	f59ff06f          	j	1074c <__call_exitprocs+0x48>
   107f8:	31492783          	lw	a5,788(s2)
   107fc:	1084b583          	ld	a1,264(s1)
   10800:	00d7f7b3          	and	a5,a5,a3
   10804:	0007879b          	sext.w	a5,a5
   10808:	00079c63          	bnez	a5,10820 <__call_exitprocs+0x11c>
   1080c:	000b0513          	mv	a0,s6
   10810:	000700e7          	jalr	a4
   10814:	fc9ff06f          	j	107dc <__call_exitprocs+0xd8>
   10818:	00892423          	sw	s0,8(s2)
   1081c:	fa1ff06f          	j	107bc <__call_exitprocs+0xb8>
   10820:	00058513          	mv	a0,a1
   10824:	000700e7          	jalr	a4
   10828:	fb5ff06f          	j	107dc <__call_exitprocs+0xd8>

000000000001082c <__libc_fini_array>:
   1082c:	fe010113          	add	sp,sp,-32
   10830:	00813823          	sd	s0,16(sp)
   10834:	000117b7          	lui	a5,0x11
   10838:	00011437          	lui	s0,0x11
   1083c:	01878793          	add	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   10840:	02040413          	add	s0,s0,32 # 11020 <impure_data>
   10844:	40f40433          	sub	s0,s0,a5
   10848:	00913423          	sd	s1,8(sp)
   1084c:	00113c23          	sd	ra,24(sp)
   10850:	40345493          	sra	s1,s0,0x3
   10854:	02048063          	beqz	s1,10874 <__libc_fini_array+0x48>
   10858:	ff840413          	add	s0,s0,-8
   1085c:	00f40433          	add	s0,s0,a5
   10860:	00043783          	ld	a5,0(s0)
   10864:	fff48493          	add	s1,s1,-1
   10868:	ff840413          	add	s0,s0,-8
   1086c:	000780e7          	jalr	a5
   10870:	fe0498e3          	bnez	s1,10860 <__libc_fini_array+0x34>
   10874:	01813083          	ld	ra,24(sp)
   10878:	01013403          	ld	s0,16(sp)
   1087c:	00813483          	ld	s1,8(sp)
   10880:	02010113          	add	sp,sp,32
   10884:	00008067          	ret

0000000000010888 <atexit>:
   10888:	00050593          	mv	a1,a0
   1088c:	00000693          	li	a3,0
   10890:	00000613          	li	a2,0
   10894:	00000513          	li	a0,0
   10898:	0040006f          	j	1089c <__register_exitproc>

000000000001089c <__register_exitproc>:
   1089c:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   108a0:	1f873783          	ld	a5,504(a4)
   108a4:	06078063          	beqz	a5,10904 <__register_exitproc+0x68>
   108a8:	0087a703          	lw	a4,8(a5)
   108ac:	01f00813          	li	a6,31
   108b0:	08e84663          	blt	a6,a4,1093c <__register_exitproc+0xa0>
   108b4:	02050863          	beqz	a0,108e4 <__register_exitproc+0x48>
   108b8:	00371813          	sll	a6,a4,0x3
   108bc:	01078833          	add	a6,a5,a6
   108c0:	10c83823          	sd	a2,272(a6)
   108c4:	3107a883          	lw	a7,784(a5)
   108c8:	00100613          	li	a2,1
   108cc:	00e6163b          	sllw	a2,a2,a4
   108d0:	00c8e8b3          	or	a7,a7,a2
   108d4:	3117a823          	sw	a7,784(a5)
   108d8:	20d83823          	sd	a3,528(a6)
   108dc:	00200693          	li	a3,2
   108e0:	02d50863          	beq	a0,a3,10910 <__register_exitproc+0x74>
   108e4:	00270693          	add	a3,a4,2
   108e8:	00369693          	sll	a3,a3,0x3
   108ec:	0017071b          	addw	a4,a4,1
   108f0:	00e7a423          	sw	a4,8(a5)
   108f4:	00d787b3          	add	a5,a5,a3
   108f8:	00b7b023          	sd	a1,0(a5)
   108fc:	00000513          	li	a0,0
   10900:	00008067          	ret
   10904:	20070793          	add	a5,a4,512
   10908:	1ef73c23          	sd	a5,504(a4)
   1090c:	f9dff06f          	j	108a8 <__register_exitproc+0xc>
   10910:	3147a683          	lw	a3,788(a5)
   10914:	00000513          	li	a0,0
   10918:	00c6e6b3          	or	a3,a3,a2
   1091c:	30d7aa23          	sw	a3,788(a5)
   10920:	00270693          	add	a3,a4,2
   10924:	00369693          	sll	a3,a3,0x3
   10928:	0017071b          	addw	a4,a4,1
   1092c:	00e7a423          	sw	a4,8(a5)
   10930:	00d787b3          	add	a5,a5,a3
   10934:	00b7b023          	sd	a1,0(a5)
   10938:	00008067          	ret
   1093c:	fff00513          	li	a0,-1
   10940:	00008067          	ret

0000000000010944 <_exit>:
   10944:	05d00893          	li	a7,93
   10948:	00000073          	ecall
   1094c:	00054463          	bltz	a0,10954 <_exit+0x10>
   10950:	0000006f          	j	10950 <_exit+0xc>
   10954:	ff010113          	add	sp,sp,-16
   10958:	00813023          	sd	s0,0(sp)
   1095c:	00050413          	mv	s0,a0
   10960:	00113423          	sd	ra,8(sp)
   10964:	4080043b          	negw	s0,s0
   10968:	00c000ef          	jal	10974 <__errno>
   1096c:	00852023          	sw	s0,0(a0) # 11000 <__EH_FRAME_BEGIN__>
   10970:	0000006f          	j	10970 <_exit+0x2c>

0000000000010974 <__errno>:
   10974:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10978:	00008067          	ret
