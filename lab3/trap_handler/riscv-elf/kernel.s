
../../../Desktop/CS211/cs211-lab/lab3/trap_handler/riscv-elf/kernel.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	add	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	408000ef          	jal	10504 <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11ee0 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	630000ef          	jal	10744 <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00010537          	lui	a0,0x10
   10124:	62c50513          	add	a0,a0,1580 # 1062c <__libc_fini_array>
   10128:	5600006f          	j	10688 <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00002197          	auipc	gp,0x2
   10134:	e6818193          	add	gp,gp,-408 # 11f98 <__global_pointer$>
   10138:	f6018513          	add	a0,gp,-160 # 11ef8 <completed.1>
   1013c:	f9818613          	add	a2,gp,-104 # 11f30 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	2e0000ef          	jal	10428 <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	53c50513          	add	a0,a0,1340 # 10688 <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	4d450513          	add	a0,a0,1236 # 1062c <__libc_fini_array>
   10160:	528000ef          	jal	10688 <atexit>
   10164:	228000ef          	jal	1038c <__libc_init_array>
   10168:	00012503          	lw	a0,0(sp)
   1016c:	00810593          	add	a1,sp,8
   10170:	00000613          	li	a2,0
   10174:	06c000ef          	jal	101e0 <main>
   10178:	f71ff06f          	j	100e8 <exit>

000000000001017c <__do_global_dtors_aux>:
   1017c:	ff010113          	add	sp,sp,-16
   10180:	00813023          	sd	s0,0(sp)
   10184:	f601c783          	lbu	a5,-160(gp) # 11ef8 <completed.1>
   10188:	00113423          	sd	ra,8(sp)
   1018c:	02079263          	bnez	a5,101b0 <__do_global_dtors_aux+0x34>
   10190:	00000793          	li	a5,0
   10194:	00078a63          	beqz	a5,101a8 <__do_global_dtors_aux+0x2c>
   10198:	00011537          	lui	a0,0x11
   1019c:	77c50513          	add	a0,a0,1916 # 1177c <__EH_FRAME_BEGIN__>
   101a0:	00000097          	auipc	ra,0x0
   101a4:	000000e7          	jalr	zero # 0 <exit-0x100e8>
   101a8:	00100793          	li	a5,1
   101ac:	f6f18023          	sb	a5,-160(gp) # 11ef8 <completed.1>
   101b0:	00813083          	ld	ra,8(sp)
   101b4:	00013403          	ld	s0,0(sp)
   101b8:	01010113          	add	sp,sp,16
   101bc:	00008067          	ret

00000000000101c0 <frame_dummy>:
   101c0:	00000793          	li	a5,0
   101c4:	00078c63          	beqz	a5,101dc <frame_dummy+0x1c>
   101c8:	00011537          	lui	a0,0x11
   101cc:	f6818593          	add	a1,gp,-152 # 11f00 <object.0>
   101d0:	77c50513          	add	a0,a0,1916 # 1177c <__EH_FRAME_BEGIN__>
   101d4:	00000317          	auipc	t1,0x0
   101d8:	00000067          	jr	zero # 0 <exit-0x100e8>
   101dc:	00008067          	ret

00000000000101e0 <main>:
   101e0:	fa010113          	add	sp,sp,-96
   101e4:	04813c23          	sd	s0,88(sp)
   101e8:	06010413          	add	s0,sp,96
   101ec:	fa042023          	sw	zero,-96(s0)
   101f0:	02800793          	li	a5,40
   101f4:	faf42823          	sw	a5,-80(s0)
   101f8:	03c00793          	li	a5,60
   101fc:	faf42c23          	sw	a5,-72(s0)
   10200:	06400793          	li	a5,100
   10204:	fcf42423          	sw	a5,-56(s0)
   10208:	06e00793          	li	a5,110
   1020c:	fcf42623          	sw	a5,-52(s0)
   10210:	08200793          	li	a5,130
   10214:	fcf42a23          	sw	a5,-44(s0)
   10218:	09600793          	li	a5,150
   1021c:	fcf42e23          	sw	a5,-36(s0)
   10220:	0b400793          	li	a5,180
   10224:	fef42423          	sw	a5,-24(s0)
   10228:	00000793          	li	a5,0
   1022c:	00078513          	mv	a0,a5
   10230:	05813403          	ld	s0,88(sp)
   10234:	06010113          	add	sp,sp,96
   10238:	00008067          	ret

000000000001023c <print_d>:
   1023c:	fe010113          	add	sp,sp,-32
   10240:	00813c23          	sd	s0,24(sp)
   10244:	02010413          	add	s0,sp,32
   10248:	00050793          	mv	a5,a0
   1024c:	fef42623          	sw	a5,-20(s0)
   10250:	00200893          	li	a7,2
   10254:	00000073          	ecall
   10258:	00000013          	nop
   1025c:	01813403          	ld	s0,24(sp)
   10260:	02010113          	add	sp,sp,32
   10264:	00008067          	ret

0000000000010268 <print_s>:
   10268:	fe010113          	add	sp,sp,-32
   1026c:	00813c23          	sd	s0,24(sp)
   10270:	02010413          	add	s0,sp,32
   10274:	fea43423          	sd	a0,-24(s0)
   10278:	00000893          	li	a7,0
   1027c:	00000073          	ecall
   10280:	00000013          	nop
   10284:	01813403          	ld	s0,24(sp)
   10288:	02010113          	add	sp,sp,32
   1028c:	00008067          	ret

0000000000010290 <print_c>:
   10290:	fe010113          	add	sp,sp,-32
   10294:	00813c23          	sd	s0,24(sp)
   10298:	02010413          	add	s0,sp,32
   1029c:	00050793          	mv	a5,a0
   102a0:	fef407a3          	sb	a5,-17(s0)
   102a4:	00100893          	li	a7,1
   102a8:	00000073          	ecall
   102ac:	00000013          	nop
   102b0:	01813403          	ld	s0,24(sp)
   102b4:	02010113          	add	sp,sp,32
   102b8:	00008067          	ret

00000000000102bc <exit_proc>:
   102bc:	ff010113          	add	sp,sp,-16
   102c0:	00813423          	sd	s0,8(sp)
   102c4:	01010413          	add	s0,sp,16
   102c8:	00300893          	li	a7,3
   102cc:	00000073          	ecall
   102d0:	00000013          	nop
   102d4:	00813403          	ld	s0,8(sp)
   102d8:	01010113          	add	sp,sp,16
   102dc:	00008067          	ret

00000000000102e0 <read_char>:
   102e0:	fe010113          	add	sp,sp,-32
   102e4:	00813c23          	sd	s0,24(sp)
   102e8:	02010413          	add	s0,sp,32
   102ec:	00400893          	li	a7,4
   102f0:	00000073          	ecall
   102f4:	00050793          	mv	a5,a0
   102f8:	fef407a3          	sb	a5,-17(s0)
   102fc:	fef44783          	lbu	a5,-17(s0)
   10300:	00078513          	mv	a0,a5
   10304:	01813403          	ld	s0,24(sp)
   10308:	02010113          	add	sp,sp,32
   1030c:	00008067          	ret

0000000000010310 <read_num>:
   10310:	fe010113          	add	sp,sp,-32
   10314:	00813c23          	sd	s0,24(sp)
   10318:	02010413          	add	s0,sp,32
   1031c:	00500893          	li	a7,5
   10320:	00000073          	ecall
   10324:	00050793          	mv	a5,a0
   10328:	fef43423          	sd	a5,-24(s0)
   1032c:	fe843783          	ld	a5,-24(s0)
   10330:	00078513          	mv	a0,a5
   10334:	01813403          	ld	s0,24(sp)
   10338:	02010113          	add	sp,sp,32
   1033c:	00008067          	ret

0000000000010340 <print_f>:
   10340:	fe010113          	add	sp,sp,-32
   10344:	00813c23          	sd	s0,24(sp)
   10348:	02010413          	add	s0,sp,32
   1034c:	fea42627          	fsw	fa0,-20(s0)
   10350:	00600893          	li	a7,6
   10354:	00000073          	ecall
   10358:	00000013          	nop
   1035c:	01813403          	ld	s0,24(sp)
   10360:	02010113          	add	sp,sp,32
   10364:	00008067          	ret

0000000000010368 <syscall>:
   10368:	ff010113          	add	sp,sp,-16
   1036c:	00813423          	sd	s0,8(sp)
   10370:	01010413          	add	s0,sp,16
   10374:	00700893          	li	a7,7
   10378:	00000073          	ecall
   1037c:	00000013          	nop
   10380:	00813403          	ld	s0,8(sp)
   10384:	01010113          	add	sp,sp,16
   10388:	00008067          	ret

000000000001038c <__libc_init_array>:
   1038c:	fe010113          	add	sp,sp,-32
   10390:	00813823          	sd	s0,16(sp)
   10394:	000117b7          	lui	a5,0x11
   10398:	00011437          	lui	s0,0x11
   1039c:	01213023          	sd	s2,0(sp)
   103a0:	78078793          	add	a5,a5,1920 # 11780 <__init_array_start>
   103a4:	78040713          	add	a4,s0,1920 # 11780 <__init_array_start>
   103a8:	00113c23          	sd	ra,24(sp)
   103ac:	00913423          	sd	s1,8(sp)
   103b0:	40e78933          	sub	s2,a5,a4
   103b4:	02e78263          	beq	a5,a4,103d8 <__libc_init_array+0x4c>
   103b8:	40395913          	sra	s2,s2,0x3
   103bc:	78040413          	add	s0,s0,1920
   103c0:	00000493          	li	s1,0
   103c4:	00043783          	ld	a5,0(s0)
   103c8:	00148493          	add	s1,s1,1
   103cc:	00840413          	add	s0,s0,8
   103d0:	000780e7          	jalr	a5
   103d4:	ff24e8e3          	bltu	s1,s2,103c4 <__libc_init_array+0x38>
   103d8:	00011437          	lui	s0,0x11
   103dc:	000117b7          	lui	a5,0x11
   103e0:	79078793          	add	a5,a5,1936 # 11790 <__do_global_dtors_aux_fini_array_entry>
   103e4:	78040713          	add	a4,s0,1920 # 11780 <__init_array_start>
   103e8:	40e78933          	sub	s2,a5,a4
   103ec:	40395913          	sra	s2,s2,0x3
   103f0:	02e78063          	beq	a5,a4,10410 <__libc_init_array+0x84>
   103f4:	78040413          	add	s0,s0,1920
   103f8:	00000493          	li	s1,0
   103fc:	00043783          	ld	a5,0(s0)
   10400:	00148493          	add	s1,s1,1
   10404:	00840413          	add	s0,s0,8
   10408:	000780e7          	jalr	a5
   1040c:	ff24e8e3          	bltu	s1,s2,103fc <__libc_init_array+0x70>
   10410:	01813083          	ld	ra,24(sp)
   10414:	01013403          	ld	s0,16(sp)
   10418:	00813483          	ld	s1,8(sp)
   1041c:	00013903          	ld	s2,0(sp)
   10420:	02010113          	add	sp,sp,32
   10424:	00008067          	ret

0000000000010428 <memset>:
   10428:	00f00313          	li	t1,15
   1042c:	00050713          	mv	a4,a0
   10430:	02c37a63          	bgeu	t1,a2,10464 <memset+0x3c>
   10434:	00f77793          	and	a5,a4,15
   10438:	0a079063          	bnez	a5,104d8 <memset+0xb0>
   1043c:	06059e63          	bnez	a1,104b8 <memset+0x90>
   10440:	ff067693          	and	a3,a2,-16
   10444:	00f67613          	and	a2,a2,15
   10448:	00e686b3          	add	a3,a3,a4
   1044c:	00b73023          	sd	a1,0(a4)
   10450:	00b73423          	sd	a1,8(a4)
   10454:	01070713          	add	a4,a4,16
   10458:	fed76ae3          	bltu	a4,a3,1044c <memset+0x24>
   1045c:	00061463          	bnez	a2,10464 <memset+0x3c>
   10460:	00008067          	ret
   10464:	40c306b3          	sub	a3,t1,a2
   10468:	00269693          	sll	a3,a3,0x2
   1046c:	00000297          	auipc	t0,0x0
   10470:	005686b3          	add	a3,a3,t0
   10474:	00c68067          	jr	12(a3)
   10478:	00b70723          	sb	a1,14(a4)
   1047c:	00b706a3          	sb	a1,13(a4)
   10480:	00b70623          	sb	a1,12(a4)
   10484:	00b705a3          	sb	a1,11(a4)
   10488:	00b70523          	sb	a1,10(a4)
   1048c:	00b704a3          	sb	a1,9(a4)
   10490:	00b70423          	sb	a1,8(a4)
   10494:	00b703a3          	sb	a1,7(a4)
   10498:	00b70323          	sb	a1,6(a4)
   1049c:	00b702a3          	sb	a1,5(a4)
   104a0:	00b70223          	sb	a1,4(a4)
   104a4:	00b701a3          	sb	a1,3(a4)
   104a8:	00b70123          	sb	a1,2(a4)
   104ac:	00b700a3          	sb	a1,1(a4)
   104b0:	00b70023          	sb	a1,0(a4)
   104b4:	00008067          	ret
   104b8:	0ff5f593          	zext.b	a1,a1
   104bc:	00859693          	sll	a3,a1,0x8
   104c0:	00d5e5b3          	or	a1,a1,a3
   104c4:	01059693          	sll	a3,a1,0x10
   104c8:	00d5e5b3          	or	a1,a1,a3
   104cc:	02059693          	sll	a3,a1,0x20
   104d0:	00d5e5b3          	or	a1,a1,a3
   104d4:	f6dff06f          	j	10440 <memset+0x18>
   104d8:	00279693          	sll	a3,a5,0x2
   104dc:	00000297          	auipc	t0,0x0
   104e0:	005686b3          	add	a3,a3,t0
   104e4:	00008293          	mv	t0,ra
   104e8:	f98680e7          	jalr	-104(a3)
   104ec:	00028093          	mv	ra,t0
   104f0:	ff078793          	add	a5,a5,-16
   104f4:	40f70733          	sub	a4,a4,a5
   104f8:	00f60633          	add	a2,a2,a5
   104fc:	f6c374e3          	bgeu	t1,a2,10464 <memset+0x3c>
   10500:	f3dff06f          	j	1043c <memset+0x14>

0000000000010504 <__call_exitprocs>:
   10504:	fb010113          	add	sp,sp,-80
   10508:	03413023          	sd	s4,32(sp)
   1050c:	f481ba03          	ld	s4,-184(gp) # 11ee0 <_global_impure_ptr>
   10510:	03213823          	sd	s2,48(sp)
   10514:	04113423          	sd	ra,72(sp)
   10518:	1f8a3903          	ld	s2,504(s4)
   1051c:	04813023          	sd	s0,64(sp)
   10520:	02913c23          	sd	s1,56(sp)
   10524:	03313423          	sd	s3,40(sp)
   10528:	01513c23          	sd	s5,24(sp)
   1052c:	01613823          	sd	s6,16(sp)
   10530:	01713423          	sd	s7,8(sp)
   10534:	01813023          	sd	s8,0(sp)
   10538:	04090063          	beqz	s2,10578 <__call_exitprocs+0x74>
   1053c:	00050b13          	mv	s6,a0
   10540:	00058b93          	mv	s7,a1
   10544:	00100a93          	li	s5,1
   10548:	fff00993          	li	s3,-1
   1054c:	00892483          	lw	s1,8(s2)
   10550:	fff4841b          	addw	s0,s1,-1
   10554:	02044263          	bltz	s0,10578 <__call_exitprocs+0x74>
   10558:	00349493          	sll	s1,s1,0x3
   1055c:	009904b3          	add	s1,s2,s1
   10560:	040b8463          	beqz	s7,105a8 <__call_exitprocs+0xa4>
   10564:	2084b783          	ld	a5,520(s1)
   10568:	05778063          	beq	a5,s7,105a8 <__call_exitprocs+0xa4>
   1056c:	fff4041b          	addw	s0,s0,-1
   10570:	ff848493          	add	s1,s1,-8
   10574:	ff3416e3          	bne	s0,s3,10560 <__call_exitprocs+0x5c>
   10578:	04813083          	ld	ra,72(sp)
   1057c:	04013403          	ld	s0,64(sp)
   10580:	03813483          	ld	s1,56(sp)
   10584:	03013903          	ld	s2,48(sp)
   10588:	02813983          	ld	s3,40(sp)
   1058c:	02013a03          	ld	s4,32(sp)
   10590:	01813a83          	ld	s5,24(sp)
   10594:	01013b03          	ld	s6,16(sp)
   10598:	00813b83          	ld	s7,8(sp)
   1059c:	00013c03          	ld	s8,0(sp)
   105a0:	05010113          	add	sp,sp,80
   105a4:	00008067          	ret
   105a8:	00892783          	lw	a5,8(s2)
   105ac:	0084b703          	ld	a4,8(s1)
   105b0:	fff7879b          	addw	a5,a5,-1
   105b4:	06878263          	beq	a5,s0,10618 <__call_exitprocs+0x114>
   105b8:	0004b423          	sd	zero,8(s1)
   105bc:	fa0708e3          	beqz	a4,1056c <__call_exitprocs+0x68>
   105c0:	31092783          	lw	a5,784(s2)
   105c4:	008a96bb          	sllw	a3,s5,s0
   105c8:	00892c03          	lw	s8,8(s2)
   105cc:	00d7f7b3          	and	a5,a5,a3
   105d0:	0007879b          	sext.w	a5,a5
   105d4:	02079263          	bnez	a5,105f8 <__call_exitprocs+0xf4>
   105d8:	000700e7          	jalr	a4
   105dc:	00892703          	lw	a4,8(s2)
   105e0:	1f8a3783          	ld	a5,504(s4)
   105e4:	01871463          	bne	a4,s8,105ec <__call_exitprocs+0xe8>
   105e8:	f92782e3          	beq	a5,s2,1056c <__call_exitprocs+0x68>
   105ec:	f80786e3          	beqz	a5,10578 <__call_exitprocs+0x74>
   105f0:	00078913          	mv	s2,a5
   105f4:	f59ff06f          	j	1054c <__call_exitprocs+0x48>
   105f8:	31492783          	lw	a5,788(s2)
   105fc:	1084b583          	ld	a1,264(s1)
   10600:	00d7f7b3          	and	a5,a5,a3
   10604:	0007879b          	sext.w	a5,a5
   10608:	00079c63          	bnez	a5,10620 <__call_exitprocs+0x11c>
   1060c:	000b0513          	mv	a0,s6
   10610:	000700e7          	jalr	a4
   10614:	fc9ff06f          	j	105dc <__call_exitprocs+0xd8>
   10618:	00892423          	sw	s0,8(s2)
   1061c:	fa1ff06f          	j	105bc <__call_exitprocs+0xb8>
   10620:	00058513          	mv	a0,a1
   10624:	000700e7          	jalr	a4
   10628:	fb5ff06f          	j	105dc <__call_exitprocs+0xd8>

000000000001062c <__libc_fini_array>:
   1062c:	fe010113          	add	sp,sp,-32
   10630:	00813823          	sd	s0,16(sp)
   10634:	000117b7          	lui	a5,0x11
   10638:	00011437          	lui	s0,0x11
   1063c:	79078793          	add	a5,a5,1936 # 11790 <__do_global_dtors_aux_fini_array_entry>
   10640:	79840413          	add	s0,s0,1944 # 11798 <impure_data>
   10644:	40f40433          	sub	s0,s0,a5
   10648:	00913423          	sd	s1,8(sp)
   1064c:	00113c23          	sd	ra,24(sp)
   10650:	40345493          	sra	s1,s0,0x3
   10654:	02048063          	beqz	s1,10674 <__libc_fini_array+0x48>
   10658:	ff840413          	add	s0,s0,-8
   1065c:	00f40433          	add	s0,s0,a5
   10660:	00043783          	ld	a5,0(s0)
   10664:	fff48493          	add	s1,s1,-1
   10668:	ff840413          	add	s0,s0,-8
   1066c:	000780e7          	jalr	a5
   10670:	fe0498e3          	bnez	s1,10660 <__libc_fini_array+0x34>
   10674:	01813083          	ld	ra,24(sp)
   10678:	01013403          	ld	s0,16(sp)
   1067c:	00813483          	ld	s1,8(sp)
   10680:	02010113          	add	sp,sp,32
   10684:	00008067          	ret

0000000000010688 <atexit>:
   10688:	00050593          	mv	a1,a0
   1068c:	00000693          	li	a3,0
   10690:	00000613          	li	a2,0
   10694:	00000513          	li	a0,0
   10698:	0040006f          	j	1069c <__register_exitproc>

000000000001069c <__register_exitproc>:
   1069c:	f481b703          	ld	a4,-184(gp) # 11ee0 <_global_impure_ptr>
   106a0:	1f873783          	ld	a5,504(a4)
   106a4:	06078063          	beqz	a5,10704 <__register_exitproc+0x68>
   106a8:	0087a703          	lw	a4,8(a5)
   106ac:	01f00813          	li	a6,31
   106b0:	08e84663          	blt	a6,a4,1073c <__register_exitproc+0xa0>
   106b4:	02050863          	beqz	a0,106e4 <__register_exitproc+0x48>
   106b8:	00371813          	sll	a6,a4,0x3
   106bc:	01078833          	add	a6,a5,a6
   106c0:	10c83823          	sd	a2,272(a6)
   106c4:	3107a883          	lw	a7,784(a5)
   106c8:	00100613          	li	a2,1
   106cc:	00e6163b          	sllw	a2,a2,a4
   106d0:	00c8e8b3          	or	a7,a7,a2
   106d4:	3117a823          	sw	a7,784(a5)
   106d8:	20d83823          	sd	a3,528(a6)
   106dc:	00200693          	li	a3,2
   106e0:	02d50863          	beq	a0,a3,10710 <__register_exitproc+0x74>
   106e4:	00270693          	add	a3,a4,2
   106e8:	00369693          	sll	a3,a3,0x3
   106ec:	0017071b          	addw	a4,a4,1
   106f0:	00e7a423          	sw	a4,8(a5)
   106f4:	00d787b3          	add	a5,a5,a3
   106f8:	00b7b023          	sd	a1,0(a5)
   106fc:	00000513          	li	a0,0
   10700:	00008067          	ret
   10704:	20070793          	add	a5,a4,512
   10708:	1ef73c23          	sd	a5,504(a4)
   1070c:	f9dff06f          	j	106a8 <__register_exitproc+0xc>
   10710:	3147a683          	lw	a3,788(a5)
   10714:	00000513          	li	a0,0
   10718:	00c6e6b3          	or	a3,a3,a2
   1071c:	30d7aa23          	sw	a3,788(a5)
   10720:	00270693          	add	a3,a4,2
   10724:	00369693          	sll	a3,a3,0x3
   10728:	0017071b          	addw	a4,a4,1
   1072c:	00e7a423          	sw	a4,8(a5)
   10730:	00d787b3          	add	a5,a5,a3
   10734:	00b7b023          	sd	a1,0(a5)
   10738:	00008067          	ret
   1073c:	fff00513          	li	a0,-1
   10740:	00008067          	ret

0000000000010744 <_exit>:
   10744:	05d00893          	li	a7,93
   10748:	00000073          	ecall
   1074c:	00054463          	bltz	a0,10754 <_exit+0x10>
   10750:	0000006f          	j	10750 <_exit+0xc>
   10754:	ff010113          	add	sp,sp,-16
   10758:	00813023          	sd	s0,0(sp)
   1075c:	00050413          	mv	s0,a0
   10760:	00113423          	sd	ra,8(sp)
   10764:	4080043b          	negw	s0,s0
   10768:	00c000ef          	jal	10774 <__errno>
   1076c:	00852023          	sw	s0,0(a0)
   10770:	0000006f          	j	10770 <_exit+0x2c>

0000000000010774 <__errno>:
   10774:	f581b503          	ld	a0,-168(gp) # 11ef0 <_impure_ptr>
   10778:	00008067          	ret
