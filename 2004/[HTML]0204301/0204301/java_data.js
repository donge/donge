        var key = "";
        function makeEntry (){
                this.Name="";
                this.URL = "";
                this.Desc = "";
                this.Category = "";
                this.Target = "";
                return this;
        }

 function makeArray(n) {
                this.length = n;
                for (var k = 1; k <= n; k++) {
                                this[k] = "";
                }
                return this;
        }               

        function makeLinks(size) {
                                this.length = size;
                                for (var r=1; r<= size; r++) {
                                                        this[r] = new makeEntry();
                                                        this[r].Name = namesArray[r];
                                                        this[r].URL = urlsArray[r];
                                                        this[r].Desc = descArray[r];
                                                        this[r].Category = categoryArray[r];
                                                        this[r].Target = targetArray[r];
                                                        }
                                        return this;
                        }


var linksize=0 

datesArray = new makeArray(linksize);
namesArray = new makeArray(linksize);
urlsArray = new makeArray(linksize);
descArray = new makeArray(linksize);
categoryArray = new makeArray(linksize);
targetArray = new makeArray(linksize);


var arraycount=0

<!-- 数据库部分由此开始 -->
arraycount += 1 
urlsArray[arraycount] = "http://www.1stbook.net/cgi-bin/bbs.cgi?user=aenny"
namesArray[arraycount] = "水晶之恋论坛"
descArray[arraycount] = "bbs,yueying"
categoryArray[arraycount] = "流星月影的论坛,可以在此发表你的文章,格式不限,关于电脑,网络,情感等文章均可在此发表,欢迎你在此一试身手,还不快来试试!!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "ipage17.htm"
namesArray[arraycount] = "我的朋友"
descArray[arraycount] = "friend,friends,yueying"
categoryArray[arraycount] = "有关流星月影朋友的一些站点!"

arraycount += 1 
urlsArray[arraycount] = "ipage19.htm"
namesArray[arraycount] = "本站游戏"
descArray[arraycount] = "game,play,games"
categoryArray[arraycount] = "收集的一些小游戏!想玩吗?"

arraycount += 1 
urlsArray[arraycount] = "andymusic.htm"
namesArray[arraycount] = "精典音乐欣赏"
descArray[arraycount] = "midi,mp3,realpaly,rm,music"
categoryArray[arraycount] = "有很好的音乐搜索,想听什么音乐,快来找吧!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "ipage16.htm"
namesArray[arraycount] = "门户网址"
descArray[arraycount] = " news,play,game,work,html,htm,music"
categoryArray[arraycount] = "有些关于软件认证,学习,娱乐等方面的一些链接!使访问更方便!"

arraycount += 1 
urlsArray[arraycount] = "http://the.animearchive.org/"
namesArray[arraycount] = "我的FLASH收藏"
descArray[arraycount] = "flash,yueying"
categoryArray[arraycount] = "有月影自己做的FLASH,并且还有来自闪客帝国的闪客作品欣赏! 可以上传自己的作品到闪客帝国哟!"

arraycount += 1 
urlsArray[arraycount] = "ipage38.htm"
namesArray[arraycount] = "测试健康值"
descArray[arraycount] = "health,play,game"
categoryArray[arraycount] = "看看你的身体是不是很好!在线测试!!"

arraycount += 1 
urlsArray[arraycount] = "ipage30.htm"
namesArray[arraycount] = "输入文字倒置"
descArray[arraycount] = "word,play,game"
categoryArray[arraycount] = "输入文字倒置!"

arraycount += 1 
urlsArray[arraycount] = "http://www.guanzhu.com/club/"
namesArray[arraycount] = "网友社区"
descArray[arraycount] = " community,htm"
categoryArray[arraycount] = "一个互动性的网友俱乐部!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.163.com"
namesArray[arraycount] = "网易通行证"
descArray[arraycount] = "link,163,chat,yueying"
categoryArray[arraycount] = "网易通行证包括聊天室,个人日历,邮件等!你申请了吗?"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.wenzhai.com/union/"
namesArray[arraycount] = "月影文集"
descArray[arraycount] = "essay,words,yueying"
categoryArray[arraycount] = "一个互动性的个人文集网站,你可以建自己的文集,有美文欣赏的!"

arraycount += 1 
urlsArray[arraycount] = "b_sequ.htm"
namesArray[arraycount] = "意见反馈表"
descArray[arraycount] = "yueying"
categoryArray[arraycount] = "请将您对本站的宝贵意见发给我,多谢了!"

arraycount += 1 
urlsArray[arraycount] = "ipage11.htm"
namesArray[arraycount] = "月影简介"
descArray[arraycount] = "yueying,aenny,host"
categoryArray[arraycount] = "有关本站站长的一些资料!"

arraycount += 1 
urlsArray[arraycount] = "ipage8.htm"
namesArray[arraycount] = "漫  画"
descArray[arraycount] = "picture,yueying,cartoon"
categoryArray[arraycount] = "这里的一些画是我用钢笔画的,画的不好,请多多指教!诚交喜欢漫画的朋友!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "ipage12.htm"
namesArray[arraycount] = "月影影集"
descArray[arraycount] = "photo, yueying"
categoryArray[arraycount] = "照片不多,不过以后会增加一些的!反正不是很漂亮啦!以后再说了!"

arraycount += 1 
urlsArray[arraycount] = "ipage15.htm"
namesArray[arraycount] = "月影随笔"
descArray[arraycount] = "essay,yueying"
categoryArray[arraycount] = "随便乱写的,想看吗?是有关月影的一些情况!"

arraycount += 1 
urlsArray[arraycount] = "mymusic.htm"
namesArray[arraycount] = "听我的歌"
descArray[arraycount] = "mymusic,music,yueying"
categoryArray[arraycount] = "有我自己唱的歌,想听我声音的网友请点击!本人唱歌五音不全,难听点不要紧吧:-)"

arraycount += 1 
urlsArray[arraycount] = "ipage10.htm"
namesArray[arraycount] = "3D造型"
descArray[arraycount] = "3d,3dmax,yueying"
categoryArray[arraycount] = "请将您的宝贵意见发给我,多谢了!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://bjap1.cn.tom.com/campus/diary/"
namesArray[arraycount] = "站长日记"
descArray[arraycount] = "diary,yueying"
categoryArray[arraycount] = "这可是我写日记的地方呀,不过没什么时间,没怎么写,有空会写一写的,你也来申请一个日记本吧."

arraycount += 1 
urlsArray[arraycount] = "ipage21.htm"
namesArray[arraycount] = "本站访客信息"
descArray[arraycount] = "guest,infomation"
categoryArray[arraycount] = "可以获取来访者的IP地址,和有关电脑的一些配置信息."
targetArray[arraycount] = "target=_blank"
arraycount += 1 
urlsArray[arraycount] = "http://www.guanzhu.com/guestbook/mail.php?email=aenny@etang.com"
namesArray[arraycount] = "在线邮件"
descArray[arraycount] = "email,yueying"
categoryArray[arraycount] = "在线给月影来封信吧,很方便的!不信你试试!"

arraycount += 1 
urlsArray[arraycount] = "http://game.online.ha.cn"
namesArray[arraycount] = "游戏G频道"
descArray[arraycount] = "game,games,play"
categoryArray[arraycount] = "游戏下载，攻略秘技，论坛等。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.gameslife.net"
namesArray[arraycount] = "游戏人生"
descArray[arraycount] = "game,games,play"
categoryArray[arraycount] = "每日更新的专业网站！"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://chinagamer.126.com"
namesArray[arraycount] = "中国游戏联盟"
descArray[arraycount] = "game,games,play"
categoryArray[arraycount] = "加盟游戏网站！电视游戏，游戏新闻等。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://game.online.ha.cn"
namesArray[arraycount] = "游戏G频道"
descArray[arraycount] = "game,games,play"
categoryArray[arraycount] = "请将您对本站的宝贵意见发给我,多谢了!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.cnshow.com"
namesArray[arraycount] = "CNSHOW聊天室"
descArray[arraycount] = "chat,chats,聊天"
categoryArray[arraycount] = "请和我交友，聊天，玩游戏。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.anguo.net"
namesArray[arraycount] = "百草园聊天室"
descArray[arraycount] = "chat,chats,聊天"
categoryArray[arraycount] = "很好玩的聊天室！"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.xxk8472.163.net"
namesArray[arraycount] = "风花雪月聊天室"
descArray[arraycount] = "chat,chats,聊天"
categoryArray[arraycount] = "人气很旺的，是您悠闲的好去处。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://xici.net.cn"
namesArray[arraycount] = "西祠胡同"
descArray[arraycount] = "chat,chats,聊天,xici"
categoryArray[arraycount] = "西祠胡同聊天."
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://heisky.163.net"
namesArray[arraycount] = "海天实时语音聊天室"
descArray[arraycount] = "chat,chats,聊天,heisky"
categoryArray[arraycount] = "海天实时语音聊天室!速度快捷，覆盖全国。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.haitian.net.cn"
namesArray[arraycount] = "海天分布式聊天室"
descArray[arraycount] = "chat,chats,聊天,heisky"
categoryArray[arraycount] = "速度快捷，覆盖全国。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www5.363.net"
namesArray[arraycount] = "江湖闲聊"
descArray[arraycount] = "chat,chats,聊天"
categoryArray[arraycount] = "萧剑江湖的聊天室。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.9foryou.com"
namesArray[arraycount] = "蓝色光聊天城"
descArray[arraycount] = "chat,chats,聊天"
categoryArray[arraycount] = "以聊天为主，结合模拟炒股等。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.lovewindow.com"
namesArray[arraycount] = "中国爱窗聊天中心"
descArray[arraycount] = "chat,chats,聊天,love"
categoryArray[arraycount] = "吸引很多男孩，女孩。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://211.90.192.36/starway/"
namesArray[arraycount] = "明月阁"
descArray[arraycount] = "chat,chats,聊天,tz,myg"
categoryArray[arraycount] = "聊天!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.mediacity.com.sg"
namesArray[arraycount] = "Mediacity 咖啡屋"
descArray[arraycount] = "chat,love,coffee,music,effection,mediacity"
categoryArray[arraycount] = "这里有视听娱乐，艺人动态，可在网上同你的偶像聊天。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://aam2000.126.com"
namesArray[arraycount] = "灰色轨迹"
descArray[arraycount] = "love,effection,story,romantic"
categoryArray[arraycount] = "网恋故事----请你静听！"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://9love.yeah.net"
namesArray[arraycount] = "9love爱情网"
descArray[arraycount] = "love,story,romantic"
categoryArray[arraycount] = "爱情故事，小说诗歌，快来享受爱情的浪漫。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://go.163.com"
namesArray[arraycount] = "爱之帆"
descArray[arraycount] = "love,story,romantic"
categoryArray[arraycount] = "问世间情为何物，直教人生死相许，在这儿，你会找到属于你的清纯之爱！"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.soyou.com/novell/index.html"
namesArray[arraycount] = "情感文学"
descArray[arraycount] = "love,story,romantic"
categoryArray[arraycount] = "情感文学!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.love100.net"
namesArray[arraycount] = "世纪情网"
descArray[arraycount] = "love,story,romantic"
categoryArray[arraycount] = "这里有视听娱乐，爱情故事,聊天。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.yn.cninfo.net"
namesArray[arraycount] = "环球影视"
descArray[arraycount] = "cinema"
categoryArray[arraycount] = "影视预告、全球排行榜、经典影片尽在环球影视"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.cstars.com"
namesArray[arraycount] = "灿烂星河"
descArray[arraycount] = "cinema"
categoryArray[arraycount] = "香港电影报导，明星追踪、在线观看请到灿烂星河!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.seedvd.com"
namesArray[arraycount] = "影视中心"
descArray[arraycount] = "cinema"
categoryArray[arraycount] = "影片实时播放，影音介绍，来影视中心看看。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://cine.yeah.net"
namesArray[arraycount] = "电影画廊"
descArray[arraycount] = "cinema,download,free"
categoryArray[arraycount] = "影视预告、有桌面壁纸下载。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://download.topcool.net"
namesArray[arraycount] = "电影下载超市"
descArray[arraycount] = "cinema,download,midi,mp3,music,picture"
categoryArray[arraycount] = "有最新屏保、壁纸，海报，音乐等你下载！！"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://best.163.com"
namesArray[arraycount] = "德国联赛网"
descArray[arraycount] = "football,news,info,sport"
categoryArray[arraycount] = "及时报道德甲比赛积分，新闻等。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://sports.sohu.com"
namesArray[arraycount] = "德国甲级联赛"
descArray[arraycount] = "football,news,info,sport"
categoryArray[arraycount] = "有最新的积分，射手榜，球队资料。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://best.163.com"
namesArray[arraycount] = "意大利联赛榜"
descArray[arraycount] = "football,news,info,sport,意大利足球"
categoryArray[arraycount] = "意大利足球天地，报道世界超级球队，重大赛事。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.newsite.com.cn"
namesArray[arraycount] = "英超中文资讯网"
descArray[arraycount] = "football,news,info,sport,英超"
categoryArray[arraycount] = "最新英超报道。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://bigrobber.soim.net"
namesArray[arraycount] = "AC米兰网站"
descArray[arraycount] = "football,news,info,sport,AC米兰"
categoryArray[arraycount] = "及时报道比赛积分，新闻等。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://footballspace.yeah.net"
namesArray[arraycount] = "UIN足球时空"
descArray[arraycount] = "football,news,info,sport"
categoryArray[arraycount] = "及时报道积分，足球新闻等。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://footballspace.yeah.net"
namesArray[arraycount] = "乔丹简介"
descArray[arraycount] = "basketball,news,info,sport"
categoryArray[arraycount] = "NBA 29支球队详细介绍。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://mycchess.yeah.net"
namesArray[arraycount] = "象棋在线"
descArray[arraycount] = "games,xiangqi"
categoryArray[arraycount] = "象棋在线详细介绍。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://wlu.topcool.net"
namesArray[arraycount] = "五子乐园"
descArray[arraycount] = "games,wuzhi"
categoryArray[arraycount] = "五子棋介绍。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.efeelings.net"
namesArray[arraycount] = "情网部落"
descArray[arraycount] = "computer,community,love,club"
categoryArray[arraycount] = "是一个虚拟社区类的部落。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.efeelings.net"
namesArray[arraycount] = "人人网站"
descArray[arraycount] = "computer,community,club"
categoryArray[arraycount] = "是一个综合门户网站。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://CyberFamily.yeah.net"
namesArray[arraycount] = "网友俱乐部"
descArray[arraycount] = "computer,community,club"
categoryArray[arraycount] = "综合服务网友社区。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.gamenow.net"
namesArray[arraycount] = "游戏之城"
descArray[arraycount] = "computer,game,club"
categoryArray[arraycount] = "是一个综合门户网站。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://neozoic.yeah.net"
namesArray[arraycount] = "新生代社区"
descArray[arraycount] = "computer,game,club,cinema,cartoon"
categoryArray[arraycount] = "含游戏，电影，动漫等。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://freelook.4u4me4us.com"
namesArray[arraycount] = "网上通讯录"
descArray[arraycount] = "computer,address"
categoryArray[arraycount] = "帮你记录你的朋友的通讯地址。 "
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.xilu.com"
namesArray[arraycount] = "娱乐网"
descArray[arraycount] = "chat,game,homepage"
categoryArray[arraycount] = "提供留言板，聊天室，主页聊天等。"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.chinaren.com"
namesArray[arraycount] = "中国人虚拟社区"
descArray[arraycount] = "community,club,chinaren"
categoryArray[arraycount] = "中国人虚拟社区"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.chinaren.net"
namesArray[arraycount] = "中国人网站"
descArray[arraycount] = "community,club,chinaren"
categoryArray[arraycount] = "中国人网站。"
targetArray[arraycount] = "target=_blank"

linksize = arraycount;

// ----数据库结束 ------
// ----以下是输出结果检索结果的页面代码 ----
 background="4.gif"
function searchLinks(links, keyword){
        document.write("<body  fontsize='11px' bgcolor='#000000'  text='#D4D4D4' LINK='#E4CFFC' VLINK='#E4CFFC'>")
        document.write("搜索关键字结果: <strong>" +keyword +"</strong><br><br>");
        for (var q=1; q<=links.length; q++) {

        if (links[q].URL.toLowerCase().indexOf(keyword) != -1){
          document.write("<a href=" + links[q].URL +" " + links[q].Target + ">" + links[q].Name + "</a> - ");
          
          document.write( links[q].Category + "<br><br>");
          continue;
         }
        if (links[q].Desc.toLowerCase().indexOf(keyword) != -1) {
          document.write("<a href=" + links[q].URL +" " + links[q].Target + ">" + links[q].Name + "</a> - ");
          
          document.write( links[q].Category + "<br><br>");
          continue;
         }
        if (links[q].Name.toLowerCase().indexOf(keyword) != -1) {
          document.write("<a href=" + links[q].URL +" " + links[q].Target + ">" + links[q].Name + "</a> - ");
          
          document.write( links[q].Category + "<br><br>");
          continue;
         }

     }                                       


}


