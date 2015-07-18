function toggle_forms(id) {
    var thelist = document.getElementsByClassName("pure-form-stacked");
    for (var i = 0; i < thelist.length; i++) {

        thelist[i].style.display = 'none';

    }

    ee = document.getElementById(id);

    if (ee.style.display == 'block') {
        ee.style.display = 'none';
    } else {
        ee.style.display = 'block';
    }
    clearText();
    
   
}

function clearText() {
    var elements = document.getElementsByTagName("input");
    for (var i = 0; i < elements.length; i++) {
        if (elements[i].type == "text") {
            elements[i].value = "";
        }
    }
}


function toggle_visibility(id) {
    var e = document.getElementById(id);
    e.style.display = ((e.style.display != 'none') ? 'none' : 'block');
}


function UpdateCampuses() {

    document.getElementById('mask').style.display = 'block';
    document.getElementById('UpdateBranch').style.display = 'block';
}
function CloseCampuses() {
    document.getElementById('ShowBraches').style.display = 'block';
    document.getElementById('mask').style.display = 'none';
    document.getElementById('UpdateBranch').style.display = 'none';
}
function ConfirmDelete() {
    document.getElementById('mask').style.display = 'block';
    document.getElementById('DeleteConfirm').style.display = 'block';
}
function CloseDelete() {
    document.getElementById('ShowBraches').style.display = 'block';
    document.getElementById('mask').style.display = 'none';
    document.getElementById('DeleteConfirm').style.display = 'none';
}

function CloseTicket() {
    document.getElementById('NewTicket').style.display = 'block';
    document.getElementById('mask').style.display = 'none';
    document.getElementById('PopTicket').style.display = 'none';
}

function sCloseTicket() {
    document.getElementById('NewTicket').style.display = 'block';
    document.getElementById('mask').style.display = 'none';
    document.getElementById('sPopTicket').style.display = 'none';
}


function TicketPop() {

    document.getElementById('mask').style.display = 'block';
    document.getElementById('PopTicket').style.display = 'block';
}

function sTicketPop() {

    document.getElementById('mask').style.display = 'block';
    document.getElementById('sPopTicket').style.display = 'block';
}

function TicketReplyPop() {

    document.getElementById('mask').style.display = 'block';
    document.getElementById('TicketReply').style.display = 'block';
}
function sTicketReplyPop() {

    document.getElementById('mask').style.display = 'block';
    document.getElementById('sTicketReply').style.display = 'block';
}

function CloseTicketReply() {
    document.getElementById('PendingTickets').style.display = 'block';
    document.getElementById('mask').style.display = 'none';
    document.getElementById('TicketReply').style.display = 'none';
}

function sCloseTicketReply() {
    document.getElementById('PendingTickets').style.display = 'block';
    document.getElementById('mask').style.display = 'none';
    document.getElementById('sTicketReply').style.display = 'none';
}

function ShowSurveyPop() {

    document.getElementById('mask').style.display = 'block';
    document.getElementById('FillSurvey').style.display = 'block';
}

function sShowSurveyPop() {

    document.getElementById('mask').style.display = 'block';
    document.getElementById('sFillSurvey').style.display = 'block';
}
function CloseShowSurvey() {
    document.getElementById('ShowSurvey').style.display = 'block';
    document.getElementById('mask').style.display = 'none';
    document.getElementById('FillSurvey').style.display = 'none';
}
function sCloseShowSurvey() {
    document.getElementById('ShowSurvey').style.display = 'block';
    document.getElementById('mask').style.display = 'none';
    document.getElementById('sFillSurvey').style.display = 'none';
}


$(function () {
    $("#Check").datepicker();
});
