// It used in profile.jsp page
document.addEventListener("DOMContentLoaded", () => {
    let editStatus = false;
    $('#update-profile-button').click(function () {
        if (editStatus == false) {
            $("#profile-details").hide();
            $("#profile-update").show();
            editStatus = true;
            $(this).text("Back");
        } else {
            $("#profile-details").show();
            $("#profile-update").hide();
            editStatus = false;
            $(this).text("Edit");
        }

    });
});