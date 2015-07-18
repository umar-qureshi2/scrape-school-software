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
