#设定
######必须修改
$HTTP_REF		=	'http://sex.rtv.com.tw/ebs/';	#程序的URL目录
$RETURN_URL		=	'http://sex.rtv.com.tw/ebs/';				#终了时的转向

######共同设定
$SCRIPT			=	'e_casino.cgi';	#主程序文件名
$LOG_FOLDER		=	'/www/0204/ebs/log';			#排名数据文件存放目录
$DBM_NAME_1 	=	'savedata1';	#比大小排名数据文件（不要加扩展名）
$DBM_NAME_2 	=	'savedata2';	#九张牌排名数据文件（不要加扩展名）
$IMG_URL		=	'img';		#图片URL地址
$CONTEXT_MENU	=	'1';			#0=禁止 1=使用
$RANK_IN		=	'20';			#排名总位数
$TITLE_BAR		=	'机器人的牌戏';	#窗口标题名
$START_MEDAL	=	'100';			#初始筹码数

######比大小设定
$GAME1_RANKIN	=	'5';			#比大小排名条件（翻倍回数）

######九张牌设定
$GAME2_1LINE		=	'5';		#1级押筹数
$GAME2_2LINE		=	'10';		#2级押筹数
$GAME2_3LINE		=	'20';		#3级押筹数
$GAME2_4LINE		=	'40';		#4级押筹数
$GAME2_5LINE		=	'60';		#5级押筹数
$GAME2_6LINE		=	'80';		#6级押筹数
$GAME2_7LINE		=	'120';		#7级押筹数

$GAME2_GETMEDAL_1	=	'10000';	#同牌叁7赢筹数
$GAME2_GETMEDAL_2	=	'5000';		#叁同牌赢筹数
$GAME2_GETMEDAL_3	=	'1000';		#叁张7赢筹数
$GAME2_GETMEDAL_4	=	'500';		#叁同数赢筹数
$GAME2_GETMEDAL_5	=	'100';		#叁同花赢筹数
$GAME2_GETMEDAL_6	=	'2';		#心牌赢筹数


