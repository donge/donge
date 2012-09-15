#coding=utf-8
import httplib2

class RTPrice(object): 
    '''实时价格(realtime price)'''    
    '''var hq_str_sh601006="
        大秦铁路, 27.55, 27.25, 26.91, 27.55, 26.20, 26.91, 26.92, 22114263, 589824680,
        4695, 26.91, 57590, 26.90, 14700, 26.89, 14300, 26.88, 15100, 26.87,
        3100, 26.92, 8900, 26.93, 14230, 26.94, 25150, 26.95, 15220, 26.96,
        2008-01-11, 15:05:32";'''
    
    def __init__(self, code = None):
        # 固定数据
        self.code = code
        self.name = ''      # var[0] 名字
        self.open = 0.0     # var[1] 今开
        self.yes = 0.0      # var[2] 昨收
        self.now = 0.0      # var[3] 现价
        self.highest = 0.0  # var[4] 最高
        self.lowest = 0.0   # var[5] 最低
        self.bid_buy = 0.0  # var[6] 买一
        self.bid_sale = 0.0 # var[7] 卖一        
        self.volume = 0     # var[8] 成交股票
        self.amount = 0     # var[9] 成交金额
        
        self.slot_buy=[]    # var[10-19] 买量, 报价
        self.slot_sale=[]   # var[20-29] 卖量, 报价
        
        self.date = '1970-01-01'    # var[30] 日期
        self.time = '00:00:00'      # var[31] 时间

        # 计算数据
        self.jump = 0.0 
        self.change = 0.0

    def __str__(self):
        return "%s %s %s %s %s"%(self.code, self.name, self.open, self.yes, self.now)

class NoWebPageError(Exception): 
    def __init__(self, url): 
        self.url = url 
    def __str__(self): 
        return "Cannot get the web page from %s."%self.url 

class NoPriceError(Exception): 
    def __init__(self, code, time_): 
        self.code = code 
        self.time = time_ 
    def __str__(self): 
        return "%s: no Price Data on %s"%(self.code, self.time)

url = "http://hq.sinajs.cn/list=%s"

def get_page(url, encoding = 'gb18030', try_times = 10, timeout = 10): 

    h = httplib2.Http(timeout = timeout) 

    for i in range(try_times): 
        try: 
            resp, content = h.request(url)            
        except Exception, e: 
            print e 
        else: 
            if resp.status != 200: 
                print 'status:',resp.status 
                continue 

            #if resp['content-type'] and not resp['content-type'].startswith('text'): 
            #    print 'content-type:',resp['content-type'] 
            #    continue 

            htmltext = content.decode(encoding, 'ignore').encode('u8') 
            #print htmltext
            return htmltext 

    raise NoWebPageError(url) 

def get_p_by_row(row): 
    import datetime as dt 
    now = dt.datetime.now().isoformat() 
    '''
    var hq_str_sh601006="大秦铁路,9.59,9.62,9.82,9.89,9.36,9.82,9.83,113782873,1102473790,
    40000,9.82,129800,9.81,298000,9.80,163600,9.79,96160,9.78,123216,9.83,287236,9.84,315215,9.85,227700,9.86,207184,9.87,2009-02-13,15:03:30";
    '''
    s = row
    i = s.find('=')

    code = s[i-6: i]
    rp = RTPrice(code)

    try:      
        start = s.find('"') + 1
        s = s[start:]
        end = s.find('"') 
        s = s[:end]
        
        data = s.split(',')
        
        rp.name = data[0]
        rp.open = float(data[1])
        rp.yes = float(data[2])        
        rp.now = float(data[3]) 
        rp.highest = float(data[4]) 
        rp.lowest = float(data[5])
        rp.bid_buy = float(data[6]) 
        rp.bid_sale = float(data[7]) 
        rp.volume = int(data[8] ) 
        rp.amount = int(float(data[9]))

        for i in range(0, 10, 2): 
            rp.slot_buy.append([ float(data[11+i]), int(data[10+i]) ]) 
            rp.slot_sale.append([ float(data[21+i]),int(data[20+i]) ])

        pre_close = float(data[2]) 
        rp.change = (rp.now - pre_close) / pre_close * 100 
        rp.jump = (rp.open - pre_close) / pre_close * 100 

        rp.date = data[-2] 
        rp.time = data[-1]

    except: 
        raise NoPriceError(code, now)

    return rp 


def get_rtprice(mcode): 
    u = url%mcode
    s = get_page(u) 

    try: 
        data = get_p_by_row(s) 
    except NoPriceError: 
        return None 
    return data 

def get_rtprices(mcodes): 
    n = len(mcodes)/100 + 1 
    rs = [] 


    for i in range(n): 
        cs = mcodes[i*100: (i+1)*100] 


        u = ','.join(cs) 
        u2 = url%u 
        #print u2 
        ss = get_page(u2).strip() 


        for s in ss.split(';')[:-1]: 
            s = s.strip() 
            try: 
                data = get_p_by_row(s) 
            except NoPriceError, e: 
                print e 
            else: 
                rs.append(data) 
    return rs 

if __name__ == '__main__':
    a = get_rtprice('sh600003');
    print a
    
