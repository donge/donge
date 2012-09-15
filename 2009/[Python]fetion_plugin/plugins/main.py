# !/usr/bin/python
#coding=utf-8
import string
import gp
import sys

if __name__ == '__main__':
    #init
    try:
        #func = sys.argv[1][0:2]
        #str = sys.argv[1][3:9]
        func = 'gp'
        str = sys.argv[1]

        code = string.atoi(str)

        # 股票代码
        if func.upper() == 'GP':
            if code >= 600000 and code < 602000:
                url = 'sh' + '%s'%str
            elif code >= 000001 and code < 002275:
                url = 'sz' + '%s'%str
            else:
                raise Exception

            #check ok
            s = gp.get_rtprice(url)

            #volume = "成交:%s".decode('utf-8')%s.volume
            name = s.name.decode('utf-8')
            now = "现价%s".decode('utf-8')%s.now
            open1 = "今开%s".decode('utf-8')%s.open
            yes = "昨收%s".decode('utf-8')%s.yes
            highest = "最高%s".decode('utf-8')%s.highest
            lowest = "最低%s".decode('utf-8')%s.lowest
            increase = (s.now - s.open) / s.open * 100
            incr = "涨幅%0.2f％".decode('utf-8')%increase
            #volume = "成交:%s".decode('utf-8')%s.volume
            msg = "%s %s %s %s %s %s %s %s".decode('utf-8')%\
                  (s.time, name, now, yes, open1, highest, lowest, incr)

        #Other Func
        else:
            url = ''
            
        f = open('/root/fetion/1.txt', 'w') # open for 'w'riting
        f.write(msg.encode('utf-8'))        # write text to file
        f.close()                           # close the file
        #print msg
        
    except Exception, e:
          msg = "错误代码(%s)-请编辑短信'股票代码',如'000001'到1252013521181894,目前支持A股的个股实时查询".decode('utf-8')%(sys.argv[1])
          f = open('/root/fetion/1.txt', 'w') # open for 'w'riting
          f.write(msg.encode('utf-8'))        # write text to file
          f.close()                           # close the file
          #print msg

else:
    print 'I am being imported from another module' 
