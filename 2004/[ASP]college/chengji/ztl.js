var hellotext="��ӭ���ٱ�վ����ʹ��1024*678�ֱ������������������ƣ��Ƽ���"
    var thetext=""
    var started=false
    var step=0
    var times=1

    function welcometext()
    {
      times--
      if (times==0)
      { 
        if (started==false)
        {
          started = true;
          window.status = hellotext;
          setTimeout("anim()",1); 
        }
        thetext = hellotext;
      }
    }

    function showstatustext(txt)
    {
      thetext = txt;
      setTimeout("welcometext()",4000)
      times++
    }

    function anim()
    {
      step++
      if (step==7) {step=1}
      if (step==1) 
{window.status='>==='+thetext+'===<'}
      if (step==2) 
{window.status='=>=='+thetext+'==<='}
      if (step==3) 
{window.status='>=>='+thetext+'=<=<'}
      if (step==4) 
{window.status='=>=>'+thetext+'<=<='}
      if (step==5) 
{window.status='==>='+thetext+'=<=='}
      if (step==6) 
{window.status='===>'+thetext+'<==='}
      setTimeout("anim()",200);
    }
  // -->
welcometext();