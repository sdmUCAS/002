function addOrderTime(e)
{
	//var orderTd = e;
	var orderTd = e.parentNode;
	var rowindex = orderTd.parentNode.rowIndex;
	var cellindex = orderTd.cellIndex;
	var text_area = document.getElementById("order_time");
	
	
	
	var days = ["周一","周二","周三","周四","周五","周六","周日"];
	var hours=new Array();
	for(var i=0;i<16;i++)
	{
		var start = i+6;
		var end = i+7;
		hours[i] = start+":00-"+end+":00";
	}
	
	var timeunit = days[cellindex-1]+" "+hours[rowindex-1];
	
	var text = text_area.innerHTML;
	
	if(e.checked==false)
	{
		text=text.replace(timeunit+"\n","");
		
	}
	else{
		text = text+timeunit+"\n";
	}
	
	text_area.innerHTML = text.replace(/(^\n*)/g,"");
	
	
}