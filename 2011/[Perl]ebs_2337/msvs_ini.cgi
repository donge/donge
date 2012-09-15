#------------------------------------------------------##------------------------------------------------------#
#------------------------------------------------------#
#　初期設定用ファイル　ffadventure.ini
#　programed by D.Takamiya(CUMRO)
#
#　http://cgi.members.interq.or.jp/sun/cumro/
#　cumro@sun.interq.or.jp
#
#　改変後初期設定用ファイル　msvs.ini
#　programed by 斉木　雅人
#  VERSION 0.504
#  http://www.interq.or.jp/ruby/psyche
#　psyche@deneb.freemail.ne.jp
#
#　改々変後初期設定用ファイル　msvs_ini.cgi
#　programed by zero-works
#  VERSION 1.08
#  http://www.zero-works.com
#　webmaster@zero-works.com
#
#　改々々変後初期設定用ファイル　msvs_ini.cgi
#　programed by LAK
#  VERSION β
#  http://www.cacgrp.co.jp/~laggard/
#　laggard@cacgrp.co.jp
#
$ver = 'FF ADVENTURE v0.45';        # 現在的版本(変更不可)
$msvsver = 'MSVS OLD v0.504';
$eomver = 'Eternity of Msvs v1.08';
$mstver = 'MS Tactics β2';
$mstgbver = 'MS Tactics β2 GB2312-中文改造';
#------------------------------------------------------#
 
#--- [注意事項] ------------------------------------------------#
# 1. このスクリプトはフリーソフトです。このスクリプトを使用した #
#    いかなる損害に対して作者は一切の責任を負いません。         #
# 2. 設置に関する質問はサポート掲示板にお願いいたします。       #
#    直接メールによる質問は一切お受けいたしておりません。       #
# 3. 設置したら皆さんに楽しんでもらう為にも、Webリングへぜひ参加#
#    してくださいm(__)m                                         #
#    http://cgi.members.interq.or.jp/sun/cumro/ff_adventure/    #
# 4. もしよろしければ、当サイトへのリンクを張ってくださいm(__)m #
#   「ASVY WEB -総合アクセス支援-」                             #
#    http://cgi.members.interq.or.jp/sun/cumro/                 #
# 5.ＭＩＤＩファイルは付属していません。                        #
#---------------------------------------------------------------#
 
#管理用モードのパスワード
#必ず変更して下さい
$admin_pass = 'miulermstcool';
 
#┏━━━━━━━━━━┓#
#┃1. ファイル名の設定 ┃#
#┗━━━━━━━━━━┛#
 
# メインスクリプト名
$script = "msvs.cgi";
# トップページスクリプト名
$script_index = "index.cgi";
# ランキング一覧スクリプト名
$script_rank = "ranking.cgi";
# ランキング詳細スクリプト名
$script_info = "info.cgi";
# 武装&#12539;装備スクリプト名
$script_item = "item.cgi";
# 優勝者に挑戦スクリプト名
$script_battle = "battle.cgi";
# シュミレータースクリプト名
$script_simu = "simulator.cgi";
# キャラシュミレータースクリプト名
$script_vsc = "vschar.cgi";
# 機体変更スクリプト名
$script_job = "job.cgi";
# 訓練&#12539;強化スクリプト名
$script_tra = "training.cgi";
# アナハイムスクリプト名
$script_ana = "anaheim.cgi";
# 管理用スクリプト名
$script_admin = "admin.cgi";
# その他のスクリプト名
$script_act = "action.cgi";
# 説明書ページ
$script_rule = "manual.cgi";
 
# MSVSメッセージャー
$message1 = "message.cgi";
# ユニット一覧
$unitinfo = "unitinfo.cgi";
# プロフィール変更
$script_prof = "profile.cgi";
# パイロット一覧
$pilotinfo = "pilotinfo.cgi";
# トーナメントスクリプト名
$script_trmnt = "tornament.cgi";
# トーナメント実行スクリプト名
$script_trmntbtle = "trmnt_trmnt.cgi";
# 戦術スクリプト名
$script_tac = "tactics.cgi";
 
 
 
 
 
# CGI文件所再的絕對路徑（http://）
$script_url = "http://web.7ing.net/msvs/";
# キャラクターデータパス
$chara_path  = "./data_chara/";
# キャラクターファイル名
$chara_file  = "chara";
# キャラクターメッセージファイル名
$charmsg_file  = "msg";
# ＭＳストックファイル名
$msstock_file  = "msstock";
# キャラクター人数ファイル
$nofile  = './data/count.dat';
 
# バックアップファイルパス
$back_path  = "./data_bak/";
 
 
# データ保存パス
$data_path  = "./data/";
# レコード(連勝記録用データファイル)
$recode_file= './data/recode.cgi';
# 勝利者データ
$winner_file= "./data/winner.cgi";
# メッセージログファイル
$message_file = "./data/mes_log.cgi";
# 参戦者ログファイル
$member_file  = "./data/member.cgi";
# アクセスカウンタログファイル
$cnt_logfile = "./data/cnt.log";
# アクセスログファイル
$opp_logfile = "./data/usermem.cgi";
 
 
# バックアップ時間判断用ファイル
$backtime_file = "./data/baktime.cgi";
# 売り出し機体保存ファイル名
$sale_file = "./data/saledat.cgi";
# 戦闘結果保存ファイル名
$battlemem_file = "battlemem";
# 近況保存ファイル名
$kinkyo_file = "kinkyo";
# 大会保存パス
$trmnt_path = "./trmnt";
# 大会設定保存ファイル名
$trmnt_setei_file = "setei";
# 大会参加者保存ファイル名
$trmnt_sanka_file = "sanka";
# 大会結果保存ファイル名
$trmnt_keka_file = "keka";
# 大会保存ファイル名
$trmnt_back_file = "back";
 
 
 
# ユニットデータファイル
$unit_file= "./data_ini/unit_ini.cgi";
# 敵ユニットデータファイル
$enemy_file= "./data_ini/enemy_ini.cgi";
# 装備データファイル
$item_file = "./data_ini/item_ini.cgi";
 
 
# 攻略方法
$info_html = "./html/info.html";
# タイトル画像
$title_img = "./img/title.gif";
# 連勝記録サイトの横に表示するマーク画像
$mark = "./img/prize.gif";
 
############################################################################################
#戦闘結果をHTML形式で保存する場合、以下のパスは絶対パスで記述してください（http://から）－＞
# ※NIFTYのような環境の場合、戦闘結果をHTML形式では保存できません
 
# 圖片資料路徑
$imgfile_path   ="http://web.7ing.net/msvs/img";
# midi路徑 ※MIDI文件不附屬
$mid_path   ="http://web.7ing.net/msvs/img/mid";
# 機體資料圖片路徑 ※機體GIF文件請自行添加。
$img_path   ="http://web.7ing.net/msvs/img/unit";
# 人物頭像路徑 ※人物頭像GIF不附屬。
$pilot_path   ="http://web.7ing.net/msvs/img/pilot";
# bar用圖片
$bar = "http://web.7ing.net/msvs/img/bar.gif";
$bar2 = "http://web.7ing.net/msvs/img/bar2.gif";
# 控制用java scripts
$java_script = "http://web.7ing.net/msvs/data_ini/control.js";
 
#＜－ここまで
############################################################################################
# パイロットデータパス２（NIFTYのような環境の際のファイル名の参照だけに使用する。）
#                       （通常はパイロットデータパス１と同じ場所で大丈夫です。   ）
#                       （通常は相対パスで大丈夫です。                           ）
$pilot_path_l ="./img/pilot";
 
 
# グラフ用画像の幅と長さ設定
$bw = "10";
$bk = "10";
$bh = "5";
# ファイルロック形式(KENT WEBさんのスクリプトより抜粋させて頂きました)
#  --> 0=no 1=symlink関数 2=open関数 3=rename関数
#  --> 1 or 2 を設定する場合は、ロックファイルを生成するディレクトリ
#      のパーミッションは 777 に設定する。
$lockkey = 3;
# ロックファイル
$lockfile = "file.lock";
#ロックリトライの回数（秒）
$lock_limit=60;
#ロック中フラグ（変更しないでください）
$now_lock = 0;
# 書き込みバッファリングをしない（変更しないでください）
$| = 1;
 
 
#┏━━━━━━━━━━┓#
#┃2. 管理人関連の設定 ┃#
#┗━━━━━━━━━━┛#
 
# ホームページのタイトル(又はホームページに戻る時の名前)
$home_title = "高達在線";
# ホームページのURL(http://から)
$homepage = "http://www.verytown.com";
# BBSのタイトル
$bbs_title = "MS Tactics BBS";
# BBSのURL(http://から)
$bbspage = "http://web.7ing.net/vbb";
 
 
 
# 人物登録制御
# 1にするとキャラクターの作成ができなくなります。
$chara_stop = 0;
# 最大人数
$max_player = 200;
# 最大login人数（一度にログイン出来る人数）
$in_maxcnt = 15;
# 強制ログアウトまでの制限時間（秒数で指定）
# この時間、何もしていないと強制ログアウト
$logout_time = 600;
# 連続投稿までの制限時間（秒数で指定）
# 一度戦闘するとここで指定した秒数以上経過しないと戦えません
$b_time = 60;
# 敵ユニットとの連続戦闘制限（秒数で指定）
# 一度戦闘するとここで指定した秒数以上経過しないと戦えません
$m_time = 60;
# 管理者mode
# 表示する：1　表示しない：0
$admin_mode = 1;
# プレイヤーのホスト名表示
# 使用する：1　使用しない：0
$host_name = 0;
# アクセス制限（ホスト名、IPアドレスを記述）
# 不正行為、イタズラがあった場合のみを推奨
@deny = (
    "cfk*.katch.ne.jp",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
    );
# 過期不Del的ID
# 供嘗試用推薦
@notdelete = (
    "guest"
    );
 
# メッセージウインドウを使用するかどうか（0：使用しない 1：使用する 2：他のチャット等を呼ぶ）
$meswin_use=1;
# 他のチャット等を呼ぶ際の呼び出し先URL(http://から)
$meswin_other="http://";
# メッセージウインドウで顔を表示するか（0：表示しない 1：表示する）
$meswin_chrdsp=1;
# メッセージウインドウ初期リロード秒数（30、60、90、120、150、180、210のいづれか）
$r_time=180;
# キャラクターバックアップの間隔（時間）
$bakup_time=6;
# 機体乗換履歴の保存数（0で履歴を取らない）
$stock_bakmem=3;
# 戦闘結果保存数
$bakup_battle=5;
#戦闘結果をHTML形式で保存するか？（0:HTMLで保存しない 1:HTMLで保存する）
# ※戦闘結果をHTML形式で保存する場合、画像系のパスは絶対パスで記述してください
# ※NIFTYのような環境の場合、戦闘結果をHTML形式では保存できません
$battle_mem_html=1;
 
#アクセスログを取るかどうか？（0：取らない　1:取る）
$opp_log_get=1;
#アクセスログの保存件数
$opp_log_max=1000;
 
#┏━━━━━━━━━━━┓#
#┃3. キャラクターの設定 ┃#
#┗━━━━━━━━━━━┛#
 
# ※変更するとCGIが正常に動作しなくなる場合があります
 
# 画像なし機体時表示GIF
$unkown = "Unknown.gif";
# 脱出機GIF
$unit_img[0]="FF-X7.gif";
$unit_img[1]="FF-XII.gif";
$unit_img[2]="FF-XII-Fb.gif";
$unit_img[3]="ZIONGHEAD.gif";
$unit_img[4]="XXXG-00W0(boso).gif";
$unit_img[5]="RXF-91(image).gif";
$unit_img[6]="MSZ-006(AURA).gif";
$unit_img[7]="MAGELLA-TOP.gif";
$unit_img[8]="FXA-05D.gif";
$unit_img[9]="FXA-07GB.gif";
$unit_img[10]="LM314V21(CF).gif";
$unit_img[11]="GF13-017NJII(AURA).gif";
$unit_img[12]="DODAI.gif";
$unit_img[13]="RX-78GP03S.gif";
$unit_img[14]="RGZ-91.gif";
$unit_img[15]="RX-78-2.gif";
$unit_img[16]="CenterModule.gif";
$unit_img[17]="GF13-017J(hyper).gif";
$unit_img[18]="GF13-050NSW(boso).gif";
$unit_img[19]="GF13-001(hyper).gif";
$unit_img[20]="GUNGAR(ikari).gif";
$unit_img[21]="RX-78NT-1.gif";
$unit_img[22]="co-musai.gif";
$unit_img[23]="co-musai(end).gif";
$unit_img[24]="co-musaiII.gif";
$unit_img[25]="cargo.gif";
$unit_img[26]="RGZ-91B.gif";
$unit_img[27]="FF-X7(CA).gif";
 
# 脱出機メッセージ
$unit_msg[0] = "<font size=4><b>乘核心戰機脫出！</b></font><p>";
$unit_msg[1] = "<font size=4><b>乘核心戰機II脫出！</b></font><p>";
$unit_msg[2] = "<font size=4><b>乘核心戰機II-Fb脫出！</b></font><p>";
$unit_msg[3] = "<font size=4><b>乘 JIONGU head 脫出！</b></font><p>";
$unit_msg[4] = "<font size=4><b>開始失控（暴走？）</b></font><p>";
$unit_msg[5] = "<font size=4><b>的機體出現金屬粒子剝離現象，分身發動！</b></font><p>";
$unit_msg[6] = "<font size=4><b>的機體被一團氣包圍著！</b></font><p>";
$unit_msg[7] = "<font size=4><b>乘 MAZERA top 脫出！</b></font><p>";
$unit_msg[8] = "<font size=4><b>乘 G-Defencer 脫出！</b></font><p>";
$unit_msg[9] = "<font size=4><b>乘核心戰機脫出！</b></font><p>";
$unit_msg[10]= "<font size=4><b>乘核心戰機脫出！</b></font><p>";
$unit_msg[11]= "<font size=4><b>的機體開始發光！</b></font><p>";
$unit_msg[12]= "<font size=4><b>乘 Dodai 脫出！</b></font><p>";
$unit_msg[13]= "<font size=4><b>與 AMUDO base OKISU 分離！</b></font><p>";
$unit_msg[14]= "<font size=4><b>與 Back weapon system 分離！</b></font><p>";
$unit_msg[15]= "<font size=4><b>與 Ｇ战机 分離！</b></font><p>";
$unit_msg[16]= "<font size=4><b>中央系統脫出！</b></font><p>";
$unit_msg[17]= "<font size=4><b>Hi-Mode 發動！</b></font><p>";
$unit_msg[18]= "<font size=4><b>Hi-mega-Mode 發動！</b></font><p>";
$unit_msg[19]= "<font size=4><b>的機體開始發光！</b></font><p>";
$unit_msg[20]= "<font size=4><b>在憤怒情況下（僞裝），開始變身（僞裝）！</b></font><p>";
$unit_msg[21]= "<font size=4><b>抛棄チョバムアーマー！</b></font><p>";
$unit_msg[22]= "<font size=4><b>乘 Gom-sai 脫出！</b></font><p>";
$unit_msg[23]= "<font size=4><b>乘 Gom-sai 脫出！</b></font><p>";
$unit_msg[24]= "<font size=4><b>乘 Gom-sai ２ 脫出！</b></font><p>";
$unit_msg[25]= "<font size=4><b>僞裝！</b></font><p>";
$unit_msg[26]= "<font size=4><b>與 Back weapon system 分離！</b></font><p>";
$unit_msg[27] = "<font size=4><b>乘核心戰機脫出！</b></font><p>";
 
 
# 脱出機増加体力
$uint_hp[0] = 100;
$uint_hp[1] = 150;
$uint_hp[2] = 150;
$uint_hp[3] = 100;
$uint_hp[4] = 150;
$uint_hp[5] = 200;
$uint_hp[6] = 200;
$uint_hp[7] = 100;
$uint_hp[8] = 150;
$uint_hp[9] = 150;
$uint_hp[10]= 150;
$uint_hp[11]= 200;
$uint_hp[12]= 150;
$uint_hp[13]= 200;
$uint_hp[14]= 300;
$uint_hp[15]= 300;
$uint_hp[16]= 150;
$uint_hp[17]= 250;
$uint_hp[18]= 300;
$uint_hp[19]= 300;
$uint_hp[20]= 150;
$uint_hp[21]= 200;
$uint_hp[22]= 150;
$uint_hp[23]= 150;
$uint_hp[24]= 150;
$uint_hp[25]= 100;
$uint_hp[26]= 300;
$uint_hp[27]= 100;
 
 
# スキル
$skill_max=12;      #所持できるスキルのＭＡＸ（特殊、ＮＴ除く）
 
$skill_5[0] = "";
$skill_5[1] = "　格闘";
$skill_5[2] = "　※格闘";
$skill_6[0] = "";
$skill_6[1] = "　連続射撃";
$skill_6[2] = "　※連続射撃";
$skill_7[0] = "";
$skill_7[1] = "　精密射撃";
$skill_7[2] = "　※精密射撃";
$skill_8[0] = "";
$skill_8[1] = "　操縦（地上）";
$skill_8[2] = "　※操縦（地上）";
$skill_8[3] = "　※※操縦（地上）";
$skill_8[4] = "　ＸＸ操縦（地上）";
$skill_8[5] = "　Ｘ操縦（地上）";
$skill_9[0] = "";
$skill_9[1] = "　操縦（水中）";
$skill_9[2] = "　※操縦（水中）";
$skill_9[3] = "　※※操縦（水中）";
$skill_9[4] = "　ＸＸ操縦（水中）";
$skill_9[5] = "　Ｘ操縦（水中）";
$skill_10[0] = "";
$skill_10[1] = "　操縦（宇宙）";
$skill_10[2] = "　※操縦（宇宙）";
$skill_10[3] = "　※※操縦（宇宙）";
$skill_10[4] = "　ＸＸ操縦（宇宙）";
$skill_10[5] = "　Ｘ操縦（宇宙）";
$skill_11[0] = "";
$skill_11[1] = "　操縦（空中）";
$skill_11[2] = "　※操縦（空中）";
$skill_11[3] = "　※※操縦（空中）";
$skill_11[4] = "　ＸＸ操縦（空中）";
$skill_11[5] = "　Ｘ操縦（空中）";
$skill_12[0] = "";
$skill_12[1] = "　特攻";
$skill_12[2] = "　回復";
$skill_12[3] = "　挑発";
$skill_12[4] = "　集中";
$skill_13[0] = "  未觉醒";
$skill_13[1]  = "  強化人類";
$skill_13[2]  = "□□□□□□□□□□";
$skill_13[3]  = "<font color=#6699FF>■</font>□□□□□□□□□";
$skill_13[4]  = "<font color=#6699FF>■■</font>□□□□□□□□";
$skill_13[5]  = "<font color=#6699FF>■■■</font>□□□□□□□";
$skill_13[6]  = "<font color=#6699FF>■■■</font><font color=#FFFF33>■</font>□□□□□□";
$skill_13[7]  = "<font color=#6699FF>■■■</font><font color=#FFFF33>■■</font>□□□□□";
$skill_13[8]  = "<font color=#6699FF>■■■</font><font color=#FFFF33>■■■</font>□□□□";
$skill_13[9]  = "<font color=#6699FF>■■■</font><font color=#FFFF33>■■■</font><font color=#FF3333>■</font>□□□";
$skill_13[10] = "<font color=#6699FF>■■■</font><font color=#FFFF33>■■■</font><font color=#FF3333>■■</font>□□";
$skill_13[11] = "<font color=#6699FF>■■■</font><font color=#FFFF33>■■■</font><font color=#FF3333>■■■</font>□";
$skill_13[12] = "<font color=#FF3333>■■■ <b>ＭＡＸ</b> ■■■</font>";
 
#地形情報
$tikei_gif[0] = "nasi.gif";     #假想空間
$tikei_gif[1] = "tuti.gif";     #地上
$tikei_gif[2] = "mizu.gif";     #水中
$tikei_gif[3] = "utyu.gif";     #宇宙
$tikei_gif[4] = "sora.gif";     #空中
 
$tikei_mei[0] = '假想空間';
$tikei_mei[1] = '地上';
$tikei_mei[2] = '水中';
$tikei_mei[3] = '宇宙';
$tikei_mei[4] = '空中';
$tikei_mei[5] = '隨機';
 
#地形属性形容詞
$tikei_keiyo[0] = '似乎有點';
$tikei_keiyo[1] = '較';
$tikei_keiyo[2] = '明顯';
$tikei_keiyo[3] = '相當';
$tikei_keiyo[4] = '非常';
$tikei_keiyo[5] = '相當突出的';
$tikei_keiyo[6] = '非常突出的';
$tikei_keiyo[7] = '令人無法相信的';
$tikei_keiyo[8] = '超級';
 
 
 
 
#戦術
$senjutu[0]  = "無特別";

$senjutu[1]  = "限制敵方行動";
$senjutu[2]  = "加強移動意識";
$senjutu[3]  = "不考慮移動";

$senjutu[4]  = "攻擊重視";
$senjutu[5]  = "回避重視";
$senjutu[6]  = "擾亂重視";
$senjutu[7]  = "操縱重視";

$senjutu[8]  = "隨機";


$sen_mes[0] = "";
$sen_mes[1] = "，開始阻礙對手的行動的同時，";
$sen_mes[2] = "，開始有計劃地移動的同時，";
$sen_mes[3] = "，放棄移動，同時";

$sen_mes[4] = "激烈地";
$sen_mes[5] = "以回避態勢來";
$sen_mes[6] = "一邊迷惑敵人，一邊";
$sen_mes[7] = "發揮操作的優點來";
 
 
 
# 演奏フラグ（1で開始&#12539;0で停止)
$midi_play = 1;
 
# 音楽を定義（上下は必ずペアで）
@midi_title = ( '【沒有】',
                '机动战士高达0079-哀·戦士',
                '机动战士高达0079-永遠にアムロ',
                '机动战士高达0079-ビギニング',
                '机动战士高达0079-シャアが来る',
                '机动战士高达0079-風に吹かれて',
                '机动战士高达0079-戦いへの恐怖',
                '机动战士高达0079-窮地に立つガンダム',
                '机动战士高达0079-めぐりあい',
                '机动战士高达0079-いまはおやすみ',
                '机动战士高达0079-颯爽たるシャア',
                '机动战士高达0079-翔べ！ガンダム',
                '机动战士高达0079-砂の十字架',
                '机动战士高达-第08MS小队-戦士',
                '机动战士高达-第08MS小队-永遠の扉',
                '机动战士高达-第08MS小队-10 Years After',
                '机动战士高达-第08MS小队-嵐の中で輝いて1',
                '机动战士高达0080-口袋中的战争-いつか空に届いて',
                '机动战士高达0080-口袋中的战争-遠い記憶',
                '机动战士高达0083-星辰的记忆-THE WINNER 1',
                '机动战士高达0083-星辰的记忆-FULL BURNER',
                '机动战士高达0083-星辰的记忆-MEN OF DESTINY',
                '机动战士高达0083-星辰的记忆-FEINT OPERATION',
                '机动战士Z高达-水の星に愛を込めて1',
                '机动战士Z高达-銀色ドレス',
                '机动战士Z高达-Z·刻をこえて2',
                '机动战士Z高达-ZガンダムBGM1',
                '机动战士Z高达-ラストバトル',
                '机动战士Z高达-星空のBelieve',
                '机动战士ZZ高达-一千万年銀河',
                '机动战士ZZ高达-アニメじゃない～夢を忘れた古い地球人よ～',
                '机动战士ZZ高达-Silent Voice',
                '机动战士0093-夏亚的反击-メインテーマ',
                '机动战士0093-夏亚的反击-宿命',
                '机动战士0093-夏亚的反击-Beyond the Time',
                '机动战士高达F91-Eternal Wind',
                '机动战士V高达-いくつもの愛を重ねて',
                '机动战士V高达-もう一度TENDERNESS',
                '机动战士V高达-Winners forever',
                '机动战士V高达-Flyaway',
                '机动武斗传G高达-Flying in the sky',
                '机动武斗传G高达-Trust You Forever',
                '机动武斗传G高达-胜利者们的挽歌',
                '新机动战记高达W-思春期を殺した少年の翼1',
                '新机动战记高达W-オリジナルキャラのテーマ',
                '新机动战记高达W-Just communication',
                '新机动战记高达W-White Reflection',
                '新机动战记高达W-Last Impression',
                '机动战士逆A高达-AURA',
                '机动战士逆A高达-ターンエーターン',
                '机动战士逆A高达-逆AガンダムＢＧＭ1',
                '机动战士逆A高达-逆AガンダムＢＧＭ2',
                '机动战士逆A高达-逆AガンダムＢＧＭ3',);
                                

@midi_data = (  '',
                '0079-aisenshi.mid',
                '0079-amuro.mid',
                '0079-begining.mid',
                '0079-chargakuru.mid',
                '0079-kaze.mid',
                '0079-kyoufu.mid',
                '0079-kyu-chi.mid',
                '0079-meguriai.mid',
                '0079-oyasumi.mid',
                '0079_c.mid',
                '0079-tobe.mid',
                '0079-s.mid',
                '08ms-soldier.mid',
                '08ms-forever_with_door.mid',
                '08ms_10.mid',
                '08ms-1.mid',
                '0080-op.mid',
                '0080-1.mid',
                '0083-The_Winner1.mid',                      
                '0083-1.mid',
                '0083_2.mid',
                '0083-2.mid',
                'Z-mizu.mid',
                '0087_6.mid',
                'Z-tokikoe2.mid',
                'zbgm1.mid',
                'Z-g1.mid',
                'Z-Believe.mid',
                'ZZ-ginga.mid',
                '0088_2.mid',
                'ZZ-Silent_Voice.mid',
                '0093-gyakuchar.mid',
                '0093-ccabgm1.mid',
                '0093-Beyond_the_Time.mid',
                'F91-Eternal_Wind.mid',
                'V-ai.mid',
                'V-TENDERNESS.mid',
                'V-Winners_forever.mid',
                'V-flyaway.mid',
                'G-Flying_in_the_sky.mid',
                'G-Trust_You_Forever.mid',
                'G-winners.mid',
                'W-ATTACK1.mid',
                'WGGZO.mid',
                'W-JustCommunacation.mid',
                'W-WHITE_REFLECTION1.mid',
                'W-LastImpression.mid',
                'turnA-aura.mid',
                'turnA.mid',
                'turnbgm1.mid',
                'turnbgm2.mid',
                'turnbgm3.mid',);
                                                
                
                
# 音楽数の定義
$midi_num=53;
 
# アクセスカウンターの設置
# 使用する：1　使用しない：0
$mini_cnt = 1;
# 震動画面効果
# 使用する：1　使用しない：0
$quake_effect = 0;
# 階級
@kaikyu = ('訓練兵','二等兵','一等兵','伍長','軍曹','曹長','准尉','少尉','中尉','大尉','准佐','少佐','中佐','大佐','准将','少将','中将','大将','元帥','総帥');
 
#┏━━━━━━━━━━━┓#
#┃4. デザイン関連の設定 ┃#
#┗━━━━━━━━━━━┛#
 
# タイトル
$main_title = 'MS Tactics';
# 本文の文字大きさ（ポイント数:スタイルシートで有効）
$b_size = '10pt';
# 壁紙を指定する場合
$backgif = "bg.gif";
# 背景色を指定
$bgcolor = "#000000";
# 文字色を指定
$text = "#FFFFFF";
# テーブル背景色を指定
$tdcolor_b1  = "#a9a9a9";
$tdcolor_b2 = "#808080";
$tdcolor_b3 = "#dcdcdc";
# リンク色を指定
$link  = "#99CCFF"; # 未訪問
$vlink = "#FF6666"; # 訪問済
$alink = "#FFFF00"; # 訪問中
 
 
#戦闘終了後の画面ワイプ方式
$dsp_wipe = 12;
 
#画面ワイプ方式
#0 Box In
#1 Box Out
#2 Circle In
#3 Circle Out
#4 Wipe Up
#5 Wipe Down
#6 Wipe Right
#7 Wipe Left
#8 Vertical Blinds
#9 Horizontal Blinds
#10 Checker Board Across
#11 Checker Board Down
#12 Random Dissolve
#13 Split Vertical In
#14 Split Vertical Out
#15 Split Horizontal In
#16 Split Horizontal Out
#17 Strips Left Down
#18 Strips Left Up
#19 Strips Right Down
#20 Strips Right Up
#21 Random Bars Horizontal
#22 Random Bars Vertical
#23 Random
 
#┏━━━━━━━━━━┓#
#┃5. データ関連の設定 ┃#
#┗━━━━━━━━━━┛#
 
# レベルアップまでの経験値の設定
# レベル×値($lv_up)＝次のレベルまでの経験値
$lv_up = 500;
# 戦闘ターンの設定
$turn = 30;
# キャラクターを削除するまでの期間(日)
# ここで設定した日にち以上、戦闘をしていないキャラクターを自動で削除します。
$limit = 7;
# 連闘制限(チャンプ)
# チャンピオンと戦う際に連闘制限を利用するかしないかの選択
# 制限する：1　制限しない：0
$chanp_limit = 0;
# rankin表示数
$rank_top = 30;
# 自動戻り(使用する場合秒数を設定。使用しない場合、0)
$refresh = 3;
# 逆転技設定(チャンプとのレベルさを設定します。ここで設定した数字よりも
# レベル差が大きいと発動します)
$level_sa = 5;
# 必殺技の出る確立
# ここで指定した 1/X の確立になります。
$waza_ritu = 15;
# 基礎経験値(ここで設定した数×相手のレベルとか色々の要素)
$kijun_exp = 1;
# メッセージ保存数(全員分の合計)
$max = 30;
# 表示メッセージ数
$max_gyo = 20;
# 全体近況保存数(合計)
$kinkyo_max = 30;
# レベル上限
$max_lv = 512;
# キャラリセット変数
$charareset = 9999;
 
 
#┏━━━━━━━━━┓#
#┃6. ハロレース設定   ┃#
#┗━━━━━━━━━┛#
#---------------------------------------------------------------#
# ハロレースはLaldarさんのチョコボレースを改造して作成されています。
# http://www8.big.or.jp/~k-kiku/ff/index.html
#---------------------------------------------------------------#
# ハロプログラム名
$script_halo = "./halo.cgi";
# ハロログファイル
$chocolog_file = "./data/halolog.cgi";
# レースレコード(連勝記録用データファイル)
$crecode_file= "./data/hrecode.cgi";
# ハロキングデータ
$cwinner_file= "./data/hwinner.cgi";
# ハロエネルギーファイル
$yasai_file = "./data_ini/haloen_ini.cgi";
# ハロ商品ファイル
$chocobo_file = "./data_ini/halo_ini.cgi";
# 遊び方ページ
$halo_manu = "./html/h_manu.html";
# ハロ特殊能力のページ
$halo_waza = "./html/h_waza.html";
# ハロ占いのページ
$halo_uranai = "./html/h_uranai.html";
 
# ハロ画像ファイル名
$choco_img[1]="halo1.gif";
$choco_img[2]="halo2.gif";
$choco_img[3]="halo3.gif";
$choco_img[4]="halo4.gif";
$choco_img[5]="halo5.gif";
$choco_img[6]="halo6.gif";
 
# ハロレース用画像ファイル名
# レース用に違う画像を使用する場合は変更して下さい。
$chocorace_img[1]="halo1.gif";
$chocorace_img[2]="halo2.gif";
$chocorace_img[3]="halo3.gif";
$chocorace_img[4]="halo4.gif";
$chocorace_img[5]="halo5.gif";
$chocorace_img[6]="halo6.gif";
 
# ハロ宿代金
$haloyado_dai = 5;
 
#┏━━━━━━━━┓#
#┃7. その他の設定   ┃#
#┗━━━━━━━━┛#
#---------------------------------------------------------------#
# G-SHOOTは「ホームページサンプルスクリプト集大全集
# (技術評論社 古籏一浩＋三津原 敏 著)」の「Xshoot」を改造しています。
#---------------------------------------------------------------#
# ミニゲーム
# 使用する：1　使用しない：0
$mini_game = 1;
# ミニゲームのパス
$minigame_path = "html/minigame/index.html";
 
# [設定はここまで]------------------------------------------------------------#
 
1;
