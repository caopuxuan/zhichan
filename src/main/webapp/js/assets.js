mini_debugger=false;
//转化时间
function ChangeDateFormat(val) {
	if(val==""||val==null){
		return val;
	}else{
    var date = new Date(parseInt(val, 10));
    //月份为0-11，所以+1，月份小于10时补个0
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    return year + "-" + month + "-" + day ; 
	}
}

//转化时间--日历选择控件转化
function ChangeDateFormat2(val) {
if(val==""||val==null){
	return val;
}else{
    var date = new Date(val);
    //月份为0-11，所以+1，月份小于10时补个0
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    return year + "-" + month + "-" + day ; 
    }
}

//自定义验证
//原值
function isNums(v) {
	var re = new RegExp("^[0-9]+(.[0-9]{2})?$");
	if (re.test(v)) {
		if (v != 0) {
			return true;
		} else {
			return false;
		}
	} else {
		return false;
	}
}

function greaterzero(e) {
	if (e.isValid) {
		if (isNums(e.value) == false) {
			e.errorText = "请输入非零的正数！";
			e.isValid = false;
		}
	}
}
