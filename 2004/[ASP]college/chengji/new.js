function movstar(a,time){
	movx=setInterval("mov("+a+")",time)
	}
function movover(){
	clearInterval(movx)
	}
function mov(a){
	scrollx=new_date.document.body.scrollLeft
	scrolly=new_date.document.body.scrollTop
	scrolly=scrolly+a
	new_date.window.scroll(scrollx,scrolly)
	}
function o_down(theobject){
object=theobject
	while(object.filters.alpha.opacity>60){
		object.filters.alpha.opacity+=-10}
		}
function o_up(theobject){
object=theobject
	while(object.filters.alpha.opacity<100){
		object.filters.alpha.opacity+=10}
		}
function wback(){
	if(new_date.history.length==0){window.history.back()}
	else{new_date.history.back()}
	}