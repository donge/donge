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

<!-- ���ݿⲿ���ɴ˿�ʼ -->
arraycount += 1 
urlsArray[arraycount] = "http://www.1stbook.net/cgi-bin/bbs.cgi?user=aenny"
namesArray[arraycount] = "ˮ��֮����̳"
descArray[arraycount] = "bbs,yueying"
categoryArray[arraycount] = "������Ӱ����̳,�����ڴ˷����������,��ʽ����,���ڵ���,����,��е����¾����ڴ˷���,��ӭ���ڴ�һ������,������������!!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "ipage17.htm"
namesArray[arraycount] = "�ҵ�����"
descArray[arraycount] = "friend,friends,yueying"
categoryArray[arraycount] = "�й�������Ӱ���ѵ�һЩվ��!"

arraycount += 1 
urlsArray[arraycount] = "ipage19.htm"
namesArray[arraycount] = "��վ��Ϸ"
descArray[arraycount] = "game,play,games"
categoryArray[arraycount] = "�ռ���һЩС��Ϸ!������?"

arraycount += 1 
urlsArray[arraycount] = "andymusic.htm"
namesArray[arraycount] = "������������"
descArray[arraycount] = "midi,mp3,realpaly,rm,music"
categoryArray[arraycount] = "�кܺõ���������,����ʲô����,�����Ұ�!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "ipage16.htm"
namesArray[arraycount] = "�Ż���ַ"
descArray[arraycount] = " news,play,game,work,html,htm,music"
categoryArray[arraycount] = "��Щ���������֤,ѧϰ,���ֵȷ����һЩ����!ʹ���ʸ�����!"

arraycount += 1 
urlsArray[arraycount] = "http://the.animearchive.org/"
namesArray[arraycount] = "�ҵ�FLASH�ղ�"
descArray[arraycount] = "flash,yueying"
categoryArray[arraycount] = "����Ӱ�Լ�����FLASH,���һ����������͵۹���������Ʒ����! �����ϴ��Լ�����Ʒ�����͵۹�Ӵ!"

arraycount += 1 
urlsArray[arraycount] = "ipage38.htm"
namesArray[arraycount] = "���Խ���ֵ"
descArray[arraycount] = "health,play,game"
categoryArray[arraycount] = "������������ǲ��Ǻܺ�!���߲���!!"

arraycount += 1 
urlsArray[arraycount] = "ipage30.htm"
namesArray[arraycount] = "�������ֵ���"
descArray[arraycount] = "word,play,game"
categoryArray[arraycount] = "�������ֵ���!"

arraycount += 1 
urlsArray[arraycount] = "http://www.guanzhu.com/club/"
namesArray[arraycount] = "��������"
descArray[arraycount] = " community,htm"
categoryArray[arraycount] = "һ�������Ե����Ѿ��ֲ�!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.163.com"
namesArray[arraycount] = "����ͨ��֤"
descArray[arraycount] = "link,163,chat,yueying"
categoryArray[arraycount] = "����ͨ��֤����������,��������,�ʼ���!����������?"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.wenzhai.com/union/"
namesArray[arraycount] = "��Ӱ�ļ�"
descArray[arraycount] = "essay,words,yueying"
categoryArray[arraycount] = "һ�������Եĸ����ļ���վ,����Խ��Լ����ļ�,���������͵�!"

arraycount += 1 
urlsArray[arraycount] = "b_sequ.htm"
namesArray[arraycount] = "���������"
descArray[arraycount] = "yueying"
categoryArray[arraycount] = "�뽫���Ա�վ�ı������������,��л��!"

arraycount += 1 
urlsArray[arraycount] = "ipage11.htm"
namesArray[arraycount] = "��Ӱ���"
descArray[arraycount] = "yueying,aenny,host"
categoryArray[arraycount] = "�йر�վվ����һЩ����!"

arraycount += 1 
urlsArray[arraycount] = "ipage8.htm"
namesArray[arraycount] = "��  ��"
descArray[arraycount] = "picture,yueying,cartoon"
categoryArray[arraycount] = "�����һЩ�������øֱʻ���,���Ĳ���,����ָ��!�Ͻ�ϲ������������!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "ipage12.htm"
namesArray[arraycount] = "��ӰӰ��"
descArray[arraycount] = "photo, yueying"
categoryArray[arraycount] = "��Ƭ����,�����Ժ������һЩ��!�������Ǻ�Ư����!�Ժ���˵��!"

arraycount += 1 
urlsArray[arraycount] = "ipage15.htm"
namesArray[arraycount] = "��Ӱ���"
descArray[arraycount] = "essay,yueying"
categoryArray[arraycount] = "�����д��,�뿴��?���й���Ӱ��һЩ���!"

arraycount += 1 
urlsArray[arraycount] = "mymusic.htm"
namesArray[arraycount] = "���ҵĸ�"
descArray[arraycount] = "mymusic,music,yueying"
categoryArray[arraycount] = "�����Լ����ĸ�,��������������������!���˳���������ȫ,�����㲻Ҫ����:-)"

arraycount += 1 
urlsArray[arraycount] = "ipage10.htm"
namesArray[arraycount] = "3D����"
descArray[arraycount] = "3d,3dmax,yueying"
categoryArray[arraycount] = "�뽫���ı������������,��л��!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://bjap1.cn.tom.com/campus/diary/"
namesArray[arraycount] = "վ���ռ�"
descArray[arraycount] = "diary,yueying"
categoryArray[arraycount] = "�������д�ռǵĵط�ѽ,����ûʲôʱ��,û��ôд,�пջ�дһд��,��Ҳ������һ���ռǱ���."

arraycount += 1 
urlsArray[arraycount] = "ipage21.htm"
namesArray[arraycount] = "��վ�ÿ���Ϣ"
descArray[arraycount] = "guest,infomation"
categoryArray[arraycount] = "���Ի�ȡ�����ߵ�IP��ַ,���йص��Ե�һЩ������Ϣ."
targetArray[arraycount] = "target=_blank"
arraycount += 1 
urlsArray[arraycount] = "http://www.guanzhu.com/guestbook/mail.php?email=aenny@etang.com"
namesArray[arraycount] = "�����ʼ�"
descArray[arraycount] = "email,yueying"
categoryArray[arraycount] = "���߸���Ӱ�����Ű�,�ܷ����!����������!"

arraycount += 1 
urlsArray[arraycount] = "http://game.online.ha.cn"
namesArray[arraycount] = "��ϷGƵ��"
descArray[arraycount] = "game,games,play"
categoryArray[arraycount] = "��Ϸ���أ������ؼ�����̳�ȡ�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.gameslife.net"
namesArray[arraycount] = "��Ϸ����"
descArray[arraycount] = "game,games,play"
categoryArray[arraycount] = "ÿ�ո��µ�רҵ��վ��"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://chinagamer.126.com"
namesArray[arraycount] = "�й���Ϸ����"
descArray[arraycount] = "game,games,play"
categoryArray[arraycount] = "������Ϸ��վ��������Ϸ����Ϸ���ŵȡ�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://game.online.ha.cn"
namesArray[arraycount] = "��ϷGƵ��"
descArray[arraycount] = "game,games,play"
categoryArray[arraycount] = "�뽫���Ա�վ�ı������������,��л��!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.cnshow.com"
namesArray[arraycount] = "CNSHOW������"
descArray[arraycount] = "chat,chats,����"
categoryArray[arraycount] = "����ҽ��ѣ����죬����Ϸ��"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.anguo.net"
namesArray[arraycount] = "�ٲ�԰������"
descArray[arraycount] = "chat,chats,����"
categoryArray[arraycount] = "�ܺ���������ң�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.xxk8472.163.net"
namesArray[arraycount] = "�绨ѩ��������"
descArray[arraycount] = "chat,chats,����"
categoryArray[arraycount] = "���������ģ��������еĺ�ȥ����"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://xici.net.cn"
namesArray[arraycount] = "������ͬ"
descArray[arraycount] = "chat,chats,����,xici"
categoryArray[arraycount] = "������ͬ����."
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://heisky.163.net"
namesArray[arraycount] = "����ʵʱ����������"
descArray[arraycount] = "chat,chats,����,heisky"
categoryArray[arraycount] = "����ʵʱ����������!�ٶȿ�ݣ�����ȫ����"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.haitian.net.cn"
namesArray[arraycount] = "����ֲ�ʽ������"
descArray[arraycount] = "chat,chats,����,heisky"
categoryArray[arraycount] = "�ٶȿ�ݣ�����ȫ����"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www5.363.net"
namesArray[arraycount] = "��������"
descArray[arraycount] = "chat,chats,����"
categoryArray[arraycount] = "���������������ҡ�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.9foryou.com"
namesArray[arraycount] = "��ɫ�������"
descArray[arraycount] = "chat,chats,����"
categoryArray[arraycount] = "������Ϊ�������ģ�⳴�ɵȡ�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.lovewindow.com"
namesArray[arraycount] = "�й�������������"
descArray[arraycount] = "chat,chats,����,love"
categoryArray[arraycount] = "�����ܶ��к���Ů����"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://211.90.192.36/starway/"
namesArray[arraycount] = "���¸�"
descArray[arraycount] = "chat,chats,����,tz,myg"
categoryArray[arraycount] = "����!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.mediacity.com.sg"
namesArray[arraycount] = "Mediacity ������"
descArray[arraycount] = "chat,love,coffee,music,effection,mediacity"
categoryArray[arraycount] = "�������������֣����˶�̬����������ͬ���ż�����졣"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://aam2000.126.com"
namesArray[arraycount] = "��ɫ�켣"
descArray[arraycount] = "love,effection,story,romantic"
categoryArray[arraycount] = "��������----���㾲����"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://9love.yeah.net"
namesArray[arraycount] = "9love������"
descArray[arraycount] = "love,story,romantic"
categoryArray[arraycount] = "������£�С˵ʫ�裬�������ܰ����������"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://go.163.com"
namesArray[arraycount] = "��֮��"
descArray[arraycount] = "love,story,romantic"
categoryArray[arraycount] = "��������Ϊ���ֱ�����������������������ҵ���������崿֮����"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.soyou.com/novell/index.html"
namesArray[arraycount] = "�����ѧ"
descArray[arraycount] = "love,story,romantic"
categoryArray[arraycount] = "�����ѧ!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.love100.net"
namesArray[arraycount] = "��������"
descArray[arraycount] = "love,story,romantic"
categoryArray[arraycount] = "�������������֣��������,���졣"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.yn.cninfo.net"
namesArray[arraycount] = "����Ӱ��"
descArray[arraycount] = "cinema"
categoryArray[arraycount] = "Ӱ��Ԥ�桢ȫ�����а񡢾���ӰƬ���ڻ���Ӱ��"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.cstars.com"
namesArray[arraycount] = "�����Ǻ�"
descArray[arraycount] = "cinema"
categoryArray[arraycount] = "��۵�Ӱ����������׷�١����߹ۿ��뵽�����Ǻ�!"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.seedvd.com"
namesArray[arraycount] = "Ӱ������"
descArray[arraycount] = "cinema"
categoryArray[arraycount] = "ӰƬʵʱ���ţ�Ӱ�����ܣ���Ӱ�����Ŀ�����"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://cine.yeah.net"
namesArray[arraycount] = "��Ӱ����"
descArray[arraycount] = "cinema,download,free"
categoryArray[arraycount] = "Ӱ��Ԥ�桢�������ֽ���ء�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://download.topcool.net"
namesArray[arraycount] = "��Ӱ���س���"
descArray[arraycount] = "cinema,download,midi,mp3,music,picture"
categoryArray[arraycount] = "��������������ֽ�����������ֵ������أ���"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://best.163.com"
namesArray[arraycount] = "�¹�������"
descArray[arraycount] = "football,news,info,sport"
categoryArray[arraycount] = "��ʱ�����¼ױ������֣����ŵȡ�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://sports.sohu.com"
namesArray[arraycount] = "�¹��׼�����"
descArray[arraycount] = "football,news,info,sport"
categoryArray[arraycount] = "�����µĻ��֣����ְ�������ϡ�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://best.163.com"
namesArray[arraycount] = "�����������"
descArray[arraycount] = "football,news,info,sport,���������"
categoryArray[arraycount] = "�����������أ��������糬����ӣ��ش����¡�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.newsite.com.cn"
namesArray[arraycount] = "Ӣ��������Ѷ��"
descArray[arraycount] = "football,news,info,sport,Ӣ��"
categoryArray[arraycount] = "����Ӣ��������"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://bigrobber.soim.net"
namesArray[arraycount] = "AC������վ"
descArray[arraycount] = "football,news,info,sport,AC����"
categoryArray[arraycount] = "��ʱ�����������֣����ŵȡ�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://footballspace.yeah.net"
namesArray[arraycount] = "UIN����ʱ��"
descArray[arraycount] = "football,news,info,sport"
categoryArray[arraycount] = "��ʱ�������֣��������ŵȡ�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://footballspace.yeah.net"
namesArray[arraycount] = "�ǵ����"
descArray[arraycount] = "basketball,news,info,sport"
categoryArray[arraycount] = "NBA 29֧�����ϸ���ܡ�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://mycchess.yeah.net"
namesArray[arraycount] = "��������"
descArray[arraycount] = "games,xiangqi"
categoryArray[arraycount] = "����������ϸ���ܡ�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://wlu.topcool.net"
namesArray[arraycount] = "������԰"
descArray[arraycount] = "games,wuzhi"
categoryArray[arraycount] = "��������ܡ�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.efeelings.net"
namesArray[arraycount] = "��������"
descArray[arraycount] = "computer,community,love,club"
categoryArray[arraycount] = "��һ������������Ĳ��䡣"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.efeelings.net"
namesArray[arraycount] = "������վ"
descArray[arraycount] = "computer,community,club"
categoryArray[arraycount] = "��һ���ۺ��Ż���վ��"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://CyberFamily.yeah.net"
namesArray[arraycount] = "���Ѿ��ֲ�"
descArray[arraycount] = "computer,community,club"
categoryArray[arraycount] = "�ۺϷ�������������"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.gamenow.net"
namesArray[arraycount] = "��Ϸ֮��"
descArray[arraycount] = "computer,game,club"
categoryArray[arraycount] = "��һ���ۺ��Ż���վ��"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://neozoic.yeah.net"
namesArray[arraycount] = "����������"
descArray[arraycount] = "computer,game,club,cinema,cartoon"
categoryArray[arraycount] = "����Ϸ����Ӱ�������ȡ�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://freelook.4u4me4us.com"
namesArray[arraycount] = "����ͨѶ¼"
descArray[arraycount] = "computer,address"
categoryArray[arraycount] = "�����¼������ѵ�ͨѶ��ַ�� "
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.xilu.com"
namesArray[arraycount] = "������"
descArray[arraycount] = "chat,game,homepage"
categoryArray[arraycount] = "�ṩ���԰壬�����ң���ҳ����ȡ�"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.chinaren.com"
namesArray[arraycount] = "�й�����������"
descArray[arraycount] = "community,club,chinaren"
categoryArray[arraycount] = "�й�����������"
targetArray[arraycount] = "target=_blank"

arraycount += 1 
urlsArray[arraycount] = "http://www.chinaren.net"
namesArray[arraycount] = "�й�����վ"
descArray[arraycount] = "community,club,chinaren"
categoryArray[arraycount] = "�й�����վ��"
targetArray[arraycount] = "target=_blank"

linksize = arraycount;

// ----���ݿ���� ------
// ----���������������������ҳ����� ----
 background="4.gif"
function searchLinks(links, keyword){
        document.write("<body  fontsize='11px' bgcolor='#000000'  text='#D4D4D4' LINK='#E4CFFC' VLINK='#E4CFFC'>")
        document.write("�����ؼ��ֽ��: <strong>" +keyword +"</strong><br><br>");
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


