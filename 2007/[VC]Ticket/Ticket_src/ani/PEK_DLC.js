var arrPrice = new Array(180,180,180,180,180,180,180,180,180,280,180,180,180,180,300,180,280,180,180,180,180,140,280,140,180,140,180,140,140,280,260,280,280,280,280,260,280,280,280,280,280,280,330,280,250,250,250,280,250,280,280,280,210,280,360,210,210,280,280,180);
var arrFromCity = new Array("PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","PEK","NAY","PEK","NAY","PEK","NAY","PEK","NAY","NAY","PEK","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC");
var arrToCity = new Array("DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","DLC","PEK","PEK","PEK","PEK","PEK","PEK","NAY","NAY","PEK","PEK","PEK","NAY","PEK","NAY","PEK","PEK","PEK","PEK","PEK","PEK","NAY","NAY","PEK","NAY","PEK","PEK","PEK","PEK","NAY","PEK");
var arrSite = new Array("快乐e行","游易航空旅行网","中国国际航空公司","携程旅行网","中国国际航空公司","携程旅行网","携程旅行网","海南航空","游易航空旅行网","旅行如意网","游易航空旅行网","游易航空旅行网","游易航空旅行网","游易航空旅行网","中国国际航空公司","中国国际航空公司","旅行如意网","游易航空旅行网","游易航空旅行网","游易航空旅行网","游易航空旅行网","携程旅行网","中国南方航空","艺龙旅行网","中国国际航空公司","艺龙旅行网","海南航空","艺龙旅行网","携程旅行网","携程旅行网","中国国际航空公司","游易航空旅行网","快乐e行","快乐e行","游易航空旅行网","中国国际航空公司","携程旅行网","深航95080","快乐e行","快乐e行","快乐e行","游易航空旅行网","旅行如意网","深航95080","中国国际航空公司","中国国际航空公司","中国国际航空公司","快乐e行","中国国际航空公司","快乐e行","快乐e行","游易航空旅行网","中国国际航空公司","游易航空旅行网","艺龙旅行网","中国国际航空公司","中国国际航空公司","快乐e行","快乐e行","中国国际航空公司");
var arrAirCompany = new Array("海航","国航","国航","南航","国航","","南航","","","南航","","","","","国航","国航","南航","","","","","联合航空","南航","联合航空","国航","联合航空","","联合航空","联合航空","","国航","国航","国航","国航","国航","国航","联合航空","联合航空","国航","南航","南航","联合航空","东航","联合航空","国航","国航","国航","南航","国航","国航","联合航空","联合航空","国航","联合航空","国航","国航","国航","国航","上海航空","国航");
var arrAirSer = new Array("HU7183","CA923","CA153","CZ6130","CA923","CN7183","CZ6130","CN7183","CN7183","CZ6130","CN7183","CN7183","CN7183","CN7183","CA1641","CA923","CZ6130","CN7183","CN7183","CN7183","CN7183","KN2259","CZ6130","KN2259","CA153","KN2259","CN7183","KN2259","KN2259","CN7183","CA154","CA152","CA152","CA952","CA924","CA1642","KN2260","KN2260","CA152","CZ6125","CZ6125","KN2260","MU2014","KN2260","CA952","CA924","CA152","CZ6125","CA1642","CA152","KN2260","KN2260","CA924","KN2260","CA952","CA952","CA1642","CA952","FM2260","CA1608");
var arrPriceOff = new Array("2.5折","2.5折","2.5折","2.5折","2.5折","2.5折","2.5折","2.5折","2.5折","4折","2.5折","2.5折","2.5折","2.5折","4.3折","2.5折","4折","2.5折","2.5折","2.5折","2.5折","2折","4折","2折","2.5折","2折","2.5折","2折","2折","4折","3.7折","4折","4折","4折","4折","3.7折","4折","4折","4折","4折","4折","4折","4.7折","4折","3.5折","3.5折","3.5折","4折","3.5折","4折","4折","4折","3折","4折","5折","3折","3折","4折","4折","2.5折");
var arrFlyTime = new Array("07:25","07:35","08:10","07:20","07:35","07:25","07:20","07:25","07:25","07:20","07:25","07:25","07:25","07:25","11:50","07:35","07:20","07:25","07:25","07:25","07:25","08:10","07:20","08:10","08:10","08:10","07:25","08:10","08:10","07:25","16:25","16:00","16:00","16:20","17:35","18:35","09:40","09:40","16:00","08:00","08:00","09:40","16:30","09:40","16:20","17:35","16:00","08:00","18:35","16:00","09:40","09:40","17:35","09:40","16:20","16:20","18:35","16:20","09:40","15:55");
var arrLandTime = new Array("08:40","08:55","09:30","08:25","08:55","08:40","08:25","08:40","08:40","08:25","08:40","08:40","08:40","08:40","13:10","08:55","08:25","08:40","08:40","08:40","08:40","09:00","08:25","09:00","09:30","09:00","08:40","09:00","09:00","08:40","17:45","17:15","17:15","17:35","19:00","19:55","10:40","10:40","17:15","09:20","09:20","10:40","18:10","10:40","17:35","19:00","17:15","09:20","19:55","17:15","10:40","10:40","19:00","10:40","17:35","17:35","19:55","17:35","10:40","17:10");
var arrFlyDate = new Array("2007-12-03","2007-12-04","2007-12-05","2007-12-06","2007-12-07","2007-12-08","2007-12-09","2007-12-10","2007-12-11","2007-12-12","2007-12-13","2007-12-14","2007-12-15","2007-12-16","2007-12-17","2007-12-18","2007-12-19","2007-12-20","2007-12-21","2007-12-22","2007-12-23","2007-12-24","2007-12-25","2007-12-26","2007-12-27","2007-12-28","2007-12-29","2007-12-30","2007-12-31","2008-01-01","2007-12-03","2007-12-04","2007-12-05","2007-12-06","2007-12-07","2007-12-08","2007-12-09","2007-12-10","2007-12-11","2007-12-12","2007-12-13","2007-12-14","2007-12-15","2007-12-16","2007-12-17","2007-12-18","2007-12-19","2007-12-20","2007-12-21","2007-12-22","2007-12-23","2007-12-24","2007-12-25","2007-12-26","2007-12-27","2007-12-28","2007-12-29","2007-12-30","2007-12-31","2008-01-01");
var arrUpdateTime = new Array(1196579872,1196574690,1196565693,1196529904,1196569085,1196578360,1196515084,1196568225,1196558949,1196572085,1196520515,1196569629,1196569556,1196579245,1196578977,1196569619,1196570178,1196569436,1196572402,1196571421,1196578405,1196573915,1196566955,1196574351,1196570646,1196577085,1196577364,1196574267,1196579554,1196579559,1196576053,1196571144,1196571134,1196571125,1196552096,1196575098,1196573479,1196569583,1196503364,1196556020,1196558729,1196529480,1196522033,1196572482,1196555757,1196522210,1196558720,1196558564,1196566690,1196568758,1196563505,1196527323,1196517662,1196534469,1196492718,1196579095,1196498722,1196576219,1196525494,1196551837);

var strCityFromCN = "北京";
var strCityToCN = "大连";
var strCityFromEN = "PEK";
var strCityToEN = "DLC";
var strRecentUpdateTime = "2分钟前";

var nMaxPriceFrom = 300;
var nMaxPriceTo = 360;
var nMinPriceFrom = 140;
var nMinPriceTo = 180;
var nAvePriceFrom = 190;
var nAvePriceTo = 268;

var strMaxZKFrom = "4.3折";
var strMinZKFrom = "2折";
var strMaxZKTo = "5折";
var strMinZKTo = "2.5折";
