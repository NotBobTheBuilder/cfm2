function initCFM() {
    switch($('#pageIdentifier')[0].getAttribute('page')) {
        case 'thegrid':
            initTheGrid();
            break;
    }
}
window.onload=initCFM;

function initTheGrid() {
    updateTimetable();
}

function drawTheGrid(campfireData) {
    if(campfireData!=false) {
        gridHTML = renderListView(campfireData);
        localStorage.setItem("CFM", gridHTML);
    } else {
        gridHTML = localStorage.getItem("CFM");
    }
    $('#thegrid').html(gridHTML);
    $('#thegrid').listview();
}

function renderListView(CFM) {
    var list = "";
    $.each(CFM.Collection_Timetable, function(intTimetableID, arrTimetableData){
        list+=renderSession(intTimetableID, arrTimetableData);
    });
    return list;
}

function renderSession(intTimetableID, arrTimetableData) {
    var list = "";
    $.each(arrTimetableData.arrTimetable, function (key, session) {
        list+='<li data-role="list-divider">';
        list+=eval("arrTimetableData.arrSlots."+key+".timeStart");
        list+=' - ';
        list+=eval("arrTimetableData.arrSlots."+key+".timeEnd");
        list+='</li>';
        var c = 0;
        $.each(session, function (key, talk) {
            var r = renderTalk(key, talk, c);
            list+=r[0];
            c=r[1];
        });
    });
    return list;
}

function renderTalk(k, t, c) {
    var talkdata = "";
    if (!!t.intUserID) {
        talkdata+='<li><a href="talk.html"><h3>'+t.strTalk+'</h3>';
        if (!!t.intUserID) {
            talkdata+='<p>';
            $.each(t.arrPresenters, function (intPresenterID, arrPresenter) {
                talkdata+='<strong>'+arrPresenter.strUser+'</strong>';
            });
            talkdata+='</p>';
        }

        talkdata+='<p>'+t.strTalkSummary+'</p>';
        talkdata+='<span class="ui-li-count">'+t.intAttendees;
        talkdata+=' / '+t.arrRoom.intCapacity+' Attendees</span>';
        talkdata+='<p class="ui-li-aside">'+'</p>';
        talkdata+='</a></li>';
    } else {
        if (c<1) {
            talkdata+='<li data-theme="a">';
            switch (t.isLocked) {
                case 'hardlock':
                    talkdata+='<h3>All other rooms in this slot unavailable due to: '+t.strTalkTitle+'</h3>';
                    break;
                case 'softlock':
                    talkdata+='<a href="talk.html">';
                    talkdata+='<h3>Empty during: '+t.strTalk+'</h3>';
                    talkdata+='<p><strong>Click to arrange a talk here!</strong></p>';
                    talkdata+='<p class="ui-li-aside">'+'</p>';
                    talkdata+='</a>';
                    break;
                default:
                    talkdata+='<a href="talk.html">';
                    talkdata+='<h3>Empty</h3>';
                    talkdata+='<p><strong>Click to arrange a talk here!</strong></p>';
                    talkdata+='<p class="ui-li-aside">'+'</p>';
                    talkdata+='</a>';
                    break;
            }
            talkdata+='</li>';
        }
        c++;
    }
    return [talkdata, c];
}

function updateTimetable() {
    $.mobile.showPageLoadingMsg()
    $.ajax({
        type: 'GET',
        url: localStorage.getItem('CFMurl')+"timetable",
        dataType: 'json',
        cache: false,
        success: function(campfireData) {
            drawTheGrid(campfireData);
        },
        error: function() {
            drawTheGrid(false);
        }
    });
    $.mobile.hidePageLoadingMsg();
}

function parseJSON(json) {
	/** this code adapted from http://www.json.org/js.html **/
	return JSON.parse(json, function (k, v) {
		var type;
		if (v && typeof v === 'object') {
			type = v.type;
			if (typeof type === 'string' && typeof window[type] === 'function') {
				return new (window[type])(v);
			}
		}
		return v;
		});
	/** end of "recycled" code **/
}
