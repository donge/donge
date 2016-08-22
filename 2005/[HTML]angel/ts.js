f=1
n=m=0
k=5	//天使移动速度
No=5	//天使个数注意不要太大
t=new Image();t.src="ts.gif"	//这里换成你的图片
function ner(){return true}
window.onerror=ner
function DM(){if(m){m=0}else{m=1}}
function M(){
	if(n){
		ts[0].style.left=x=document.body.scrollLeft+event.clientX-xx
		ts[0].style.top=y=document.body.scrollTop+event.clientY-yx
		event.returnValue=false
	}else{
		xm=document.body.scrollLeft+event.clientX
		ym=document.body.scrollTop+event.clientY
	}
}
function dd(){
	for(i=No-1;i>0;i--){
		ts[i].style.left=ts[i-1].style.left
		ts[i].style.top=ts[i-1].style.top
	}
	if(!n){
		st=xm-x;
		if(st>60&&f<0){
			f=1
			for(i=0;i<No;i++)ts[i].filters.FlipH.enabled=false
		}
		if(st<40&&f>0){
			f=-1
			for(i=0;i<No;i++)ts[i].filters.FlipH.enabled=true
		}
		if(!m){
			i=0
			if((st>120)||(st<-20)){
				ts[0].style.left=x+=parseInt(st/k)
				i++
			}
			st=ym-y
			if((st>85)||(st<-5)){
				ts[0].style.top=y+=parseInt(st/k)
				i++
			}
			if(i<1&&d){
				d=0
				setTimeout("rno()",1000)
			}
		}
	}
}
function MD(){
	xx=document.body.scrollLeft+event.clientX
	yx=document.body.scrollTop+event.clientY
	if(xx<x+80&&xx>x+10&&yx<y+70&&yx>y+10){
		n=1
		xx=xx-x
		yx=yx-y
	}
}
function MU(){
	if(n){
		n=0
		xm=xx+x
		ym=yx+y
	}
}
function rno(){
	xm=parseInt(Math.random()*screen.availWidth)
	ym=parseInt(Math.random()*500+document.body.scrollTop)
	d=1
}
x=parseInt(Math.random()*screen.availWidth-100)
y=parseInt(Math.random()*500-100)
rno()
document.onmousemove=M
document.onmouseup=MU
document.onmousedown=MD
document.ondblclick=DM
var ts=new Array()
for(i=No-1;i>=0;i--){
	document.write("<img name=ts"+i+" src="+t.src+" style=\"position:absolute;left:"+x+";top:"+y+";filter:alpha(opacity="+(100/(i+1))+") FlipH\">")
	ts[i]=document["ts"+i]
}
dd()
setInterval("dd()",100)