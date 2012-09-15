#设定
#请自己设置有关数值

### xiaoyuyu add one
$NAIRAN_MONEY 	= '50000';	# 内乱组织费
$LOGIN_H	= '500';	#登陆历史记录条数
$REGTIMELIM	= '60';	#同ip注册时间间隔（秒）
### add end

#(0)管理人名称
$OWNER_NAME	='donge';				#输入自己名字
$OWNER_EMAIL	='donge@donge.org';      #E-Mail

#(1)管理者密码
$MASTER_PWD = '23372337';			#可以在master.cgi 或 ./ebs.cgi?MAINTE里进行管理设置
#(2)最大图标数
#0.gif连续图片的名称，输入最後一个图标的数字。例如90。GIF输入90
$ICON = '223';  #机器人图片
$ICON2 = '341'; #表情图片

#(3)LOG文件目录名称
$LOG_FOLDER = 'logmiulerebeb'; #Windows NT 设置真实路径
# $LOG_FOLDER = 'logmiulereb';             #Unix设置

#(4)各种文件名称（一般不用改变）Unix 和 WindowsNT都不需要修改
$DB_ID1 = 'logdata';
$DB_ID2 = 'country_data';
$DB_ID3 = 'history_data';
$DB_ID4 = 'loginlist';

#(5)图标目录（一般不需要改变）Unix 和 WindowsNT都不需要修改
$IMG_FOLDER1 = 'http://ebs.donge.org/images/img1';	#系统图标目录
$IMG_FOLDER2 = 'http://ebs.donge.org/images/img2';	#机体图标目录
$IMG_FOLDER3 = 'http://ebs.donge.org/images/img3';	#表情图片目录
$IMG_FOLDER4 = 'http://ebs.donge.org/images';	#其他图片目录

#(6)网页浏览所在目录
$YOUR_HOME      = '.';    #终了退出的网页
$BBS_DIR	= 'http://donge.org';      #例如：'http://www.verytown.com/bbs'
$THIS_Title     = '无尽的战斗 - ENDLESS BATTLE - 还念永不逝去的2337';      #网页标题 <title>$THIS_Title</title> 请自己修改相关CGI

#(7)主程式所在网址
$THIS_DIR	= 'http://ebs.donge.org/';          #例如：'http://ebs1.7ing.net'

#(8)各种设置
$COOKIE_KEEP	= '500';	#存档保留时间，超过时间帐号自动删除
$HP_REPAIR	= '40';		#1秒时间内HP恢复量--强烈建议不要超过20
$EN_REPAIR	= '2';		#1秒时间内EN恢复量--强烈建议不要超过2
$HISTORY_MAX	= '50';		#历史事件数目
$COUNTRY_MAX	= '20';		#最大国家数目（不包括流浪者的）
$ENTRY_MAX	= '500';		#最大登录数《〈强烈建议低於200〉除非你的服务器是专用的》
$MAKE_COUNTRY	= '500000';	#建国费用
$MAKE_TEAM	= '100000';	#部队作成费用
$YOUSAI_HP	= '100000';	#建国时初期要塞HP
$WEAPON_RANKUP	= '10';		#武器转型需要段位
$WEAPON_LVUP	= '100';	#武器升级需要经验值
$MAX_WEAPONLV	= '100';		#武器最高段位
$GET_MONEY	= '5';		#战斗後收入（1-20选择）
$GET_RANK	= '0.2';		#工资比率
$GET_WEAPON	= '0';		#得到武器机率（不推荐得到）
$MAX_HP		= '200000';	#HP上限
$MAX_EN		= '10000';	#EN上限
$SATELLITE_FLAG	= '0';		#DataImport/DateExport是否允许（1允许/0禁止）
$MAX_MONEY='30000000';		#最大金钱

#(9)游戏暂停时间
@MAINTE_TIME = ('23','0','1');

#(10)颜色选择
@COLOR=('adeaea','00ffff','38b0de','3299cc','007fff','4d4dff','007fff','00ff00','32cd32','70db93','32cd99','99cc32','8fbc8f','6b8e23','a68064','b87333','e47833','ff7f00','e9c2a6','9f9f5f','cfb53b','cfb53b','ffff00','a8a8a8','c0d9d9','cdcdcd','e6e8fa','d8d8bf','d9d9f3','ffffff','d8bfd8','d8bfd8','ff2400','ff0000','dc143c','cc3299','ff1cae','ff00ff','ff00ff','ff6ec7','eaadea');

#(11)v1.04版本以後追加
$DIRECT_LINK='0';  #单独跳出网页连结 (1=禁止/0=许可)
$UPPER_FRAME='360';  #顶部广告框架
$BANNER_DISPLAY='1';  #是否显示广告  (1=不显示/0=显示)
$CONFIG_DISPLAY='1';  #显示TOP最大玩家的登陆数 乮(1=公开/0=非公开)
$SPECIAL_ICON='1';		#隐藏机体激发条件
				#条件1=HP10000/2=觉醒/3=总帅/0=不使用）
$S_ICON_NUMBER='611';		#隐藏机体500。GIF到最後图片名称输入
				#例：500.gif 501.gif 502.gif 503.gif 最後输入 '503'
$NAIRAN_MODE = '1';  #内乱功能 (1=许可/0=禁止)
$NT_START	='1';  #觉醒条件 (1=/2=[低确率]/3=[超低确率])
$NT_END		='1';  #觉醒终了条件 (1=/2=[低确率]/3=[超低确率])

#(12)
$COMMENT_1='';
$COMMENT_2='';
$COMMENT_3='';
$COPYRIGHT_ICON	=''; #版权图案

#(13)HTML风格 (v1.05追加)
$LINK		= '#707070';  #连结
$HOVER		= '#dcdcdc';  #被连结
$BG_TOP		= '#000000';
$BG_MAIN	= '#000000';
$BG_STATUS	= '#000000';
$FONT_COLOR	= '#000000';
$TABLE_COLOR1 = '#202020';
$TABLE_COLOR2 = '#606060';
$TABLE_BORDER = '#404040';
$BG_BUTTON	= '#000000';
$FC_BUTTON	= '#ededed';
$BG_LIST	= '#000000';
$FC_LIST	= '#ededed';

#(14)世界观设定(v1.05移行增加)
#各种状况表示
#依照顺位 = 攻击力,防御力,速度,命中率,HP,EN,资金
@STATUS_NAME=('熟练度','击墜数','世代','国籍','機師等级','武器等級','性格','類型','資金','战斗纪录','必殺技','超必殺技','備武','战斗回数','胜利数','胜率');
# @STATUS_NAME=[0], [1], [2].....;

##(15)限定IP或指定网域能否加入游戏
$BLACKCHECK='1'; #限制机能　1=使用/0=不使用
# 网域、IP指定可。(可无限追加)
$DENYHOST[0] = 'xx.xx.xx.xx';
$DENYHOST[1] = 'www.xxxxxxxx.com';


#成长能力表示
@TYPE_MS=('攻击力重视','防御力重视','速度重视','命中率重视','平均型');

#改造表示名称
# $CUSTOM_NAME='改造';

#阶级名称
@CLASS_NAME=('平民','新兵','士兵','二等兵','一等兵','上等兵','特等兵','兵長','二等准尉','一等准尉','少尉','中尉','大尉','少校','中校','上校','准将','少将','中将','上将','一級上将','元帅','皇帝');

#无国籍名称
$NONE_NATIONALITY	= '流浪者';

#(15) 自行增加
$left	='align=left';
$right	='align=right';
$center	='align=center';
$top	='valign=top';
$middle	='valign=middle';
$bottom	='valign=bottom';
$buttonl ='background=http://ebs.donge.org/images/l_star.gif width=135 height=30';
$buttonr ='background=http://ebs.donge.org/images/r_star.gif width=135 height=30';
$left_c ='<img src=http://ebs.donge.org/images/c.gif width=30 height=8>';
$left_b ='<img src=http://ebs.donge.org/images/c.gif width=30 height=8>';
$bg_top	='background=http://ebs.donge.org/images/t_star.gif width=200 height=40';
$bg_top2='background=http://ebs.donge.org/images/star_26_top.gif width=90 height=20';
$tb_stl	='border=2 bordercolor=#01A4B4 bordercolorlight=#002720 cellpadding=3 cellspacing=2 bordercolordark=#00A4B3';
$tb_kill ='style=filter:glow(color=#9898BA,direction=135)';

1;
