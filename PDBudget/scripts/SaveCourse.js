$(document).ready(function () {

    $("#btnSave").click(function () {
        debugger;
        var courseInfoes = JSON.stringify(getCourseInfo());

        var resourcePerson = JSON.stringify(getPresenterTutorConvenorInfo());
        //console.log(data);
        var otherExpenses = JSON.stringify(getOtherExpenses());

        var message = validateInput();
        if (message == "true") {
            $.ajax({
                url: 'PDBudgetEntry.aspx/SaveCourseInfo',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ 'courseInfoes': courseInfoes, 'resource': resourcePerson, 'otherExpenses': otherExpenses }),
                success: function (response) {
                    if (response.d == "-1") {
                        alert("Error while Adding course information.");
                    }
                    else {
                        alert("Data Added Successfully");
                        window.location.reload();
                    }
                },
                error: function () {
                    alert("Error while inserting course Information.");
                }
            });
        } else {
            alert(message);
        }
        return false;
    });

    $("#ddlSuburb").change(function () {
        debugger;
        //var myDropDownList = $("#ddlSuburb");
        var suburb = $("#ddlSuburb").val();
        $.ajax({
            url: 'PDBudgetEntry.aspx/GetZipCode',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: "{'suburb':" + JSON.stringify(suburb) + "}",
            success: function (response) {
                if (response.d != "") {
                    $("#txtZip").val(response.d);
                }
                else {
                    $("#txtZip").val("");
                    $("#txtZip").focus();
                }
            },
            error: function () {
                $("#txtZip").val("");
                $("#txtZip").focus();
            }
        });
    });

});

function getPresenterTutorConvenorInfo() {
    var resourcePerson = [];
    var i = 0;
    $('tr.presenterList').each(function () {
        //var id = $(this).find('.presenterID').val();
        var courseCode = $('#txtCourseCode').val();
        var rtype = "P";
        if (i % 5 == 0) {
            var resource_person_id = $(this).find('.presenterID').val();
            var session_ = $(this).find('.session_').val();
            var hours_ = Number($(this).find('.hours_').val().replace(/[$,]+/g, "")) || Number(0);
            var rate = parseFloat($(this).find('.rate').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var accomadation = parseFloat($(this).find('.accomadation').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var travelEx = parseFloat($(this).find('.travelEx').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var meal = parseFloat($(this).find('.meal').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var taxi = parseFloat($(this).find('.taxi').val().replace(/[$,]+/g, "")) || parseFloat(0);
        } else {
            //var resource_person_id = $(this).find('.presenterID').val();
            var session_ = $(this).find('.session_').val();
            var hours_ = Number(0);
            var rate = parseFloat(0);
            var accomadation = parseFloat(0);
            var travelEx = parseFloat(0);
            var meal = parseFloat(0);
            var taxi = parseFloat(0);
        }
        var expenseCode = $(this).find('.expenseCode').val();
        var invNumber = $(this).find('.invNumber').val();
        var datePaid = $(this).find('.datePaid').val();
        var amount = parseFloat($(this).find('.amount').val().replace(/[$,]+/g, "")) || parseFloat(0);

        var person = {
            'courseCode': courseCode,
            'rtype': rtype,
            'resource_person_id': resource_person_id,
            'session_': session_,
            'hours_': hours_,
            'rate': rate,
            'accomadation': accomadation,
            'travelEx': travelEx,
            'meal': meal,
            'taxi': taxi,
            'expenseCode': expenseCode,
            'invNumber': invNumber,
            'datePaid': datePaid,
            'amount': amount
        };

        resourcePerson.push(person);
        //console.log(person);
        i++;
    });

    i = 0;
    $('tr.tutorList').each(function () {
        //var id = $(this).find('.presenterID').val();
        var courseCode = $('#txtCourseCode').val();
        var rtype = "T";
        var resource_person_id = $(this).find('.presenterID').val();
        var session_ = $(this).find('.session_').val();
        if (i % 5 == 0) {
            var hours_ = parseFloat($(this).find('.hours_').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var rate = parseFloat($(this).find('.rate').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var accomadation = parseFloat($(this).find('.accomadation').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var travelEx = parseFloat($(this).find('.travelEx').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var meal = parseFloat($(this).find('.meal').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var taxi = parseFloat($(this).find('.taxi').val().replace(/[$,]+/g, "")) || parseFloat(0);
        } else {
            //var resource_person_id = $(this).find('.presenterID').val();
            var session_ = $(this).find('.session_').val();
            var hours_ = Number(0);
            var rate = parseFloat(0);
            var accomadation = parseFloat(0);
            var travelEx = parseFloat(0);
            var meal = parseFloat(0);
            var taxi = parseFloat(0);
        }
        var expenseCode = $(this).find('.expenseCode').val();
        var invNumber = $(this).find('.invNumber').val();
        var datePaid = $(this).find('.datePaid').val();
        var amount = parseFloat($(this).find('.amount').val().replace(/[$,]+/g, "")) || parseFloat(0);

        var person = {
            'courseCode': courseCode,
            'rtype': rtype,
            'resource_person_id': resource_person_id,
            'session_': session_,
            'hours_': hours_,
            'rate': rate,
            'accomadation': accomadation,
            'travelEx': travelEx,
            'meal': meal,
            'taxi': taxi,
            'expenseCode': expenseCode,
            'invNumber': invNumber,
            'datePaid': datePaid,
            'amount': amount
        };
        resourcePerson.push(person);
        i++;
    });

    i = 0;
    $('tr.convenorList').each(function () {
        //var id = $(this).find('.presenterID').val();
        var courseCode = $('#txtCourseCode').val();
        var rtype = "C";
        var resource_person_id = $(this).find('.presenterID').val();
        var session_ = $(this).find('.session_').val();
        if (i % 5 == 0) {
            var hours_ = parseFloat($(this).find('.hours_').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var rate = parseFloat($(this).find('.rate').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var accomadation = parseFloat($(this).find('.accomadation').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var travelEx = parseFloat($(this).find('.travelEx').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var meal = parseFloat($(this).find('.meal').val().replace(/[$,]+/g, "")) || parseFloat(0);
            var taxi = parseFloat($(this).find('.taxi').val().replace(/[$,]+/g, "")) || parseFloat(0);
        } else {
            //var resource_person_id = $(this).find('.presenterID').val();
            var session_ = $(this).find('.session_').val();
            var hours_ = Number(0);
            var rate = parseFloat(0);
            var accomadation = parseFloat(0);
            var travelEx = parseFloat(0);
            var meal = parseFloat(0);
            var taxi = parseFloat(0);
        }
        var invNumber = $(this).find('.invNumber').val();
        var amount = parseFloat($(this).find('.amount').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var datePaid = $(this).find('.datePaid').val();
        var expenseCode = $(this).find('.expenseCode').val();
        var person = {
            'courseCode': courseCode,
            'rtype': rtype,
            'resource_person_id': resource_person_id,
            'session_': session_,
            'hours_': hours_,
            'rate': rate,
            'accomadation': accomadation,
            'travelEx': travelEx,
            'meal': meal,
            'taxi': taxi,
            'expenseCode': expenseCode,
            'invNumber': invNumber,
            'datePaid': datePaid,
            'amount': amount
        };
        resourcePerson.push(person);
        i++;
    });
    console.log(resourcePerson); //
    return resourcePerson;
}


function getOtherExpenses() {
    var otherExpenses = [];
    var i = 1;
    $('tr.otherExpenseListOut').each(function () {
        //var id = $(this).find('.presenterID').val();
        var courseCode = $('#txtCourseCode').val();
        var otherExpenseName = $(this).find('.othExName').val();
        var expenseCode = $(this).find('.othExCode').val();
        if (i == 1) {
            var exPer = parseFloat($(this).find('.othExPer').val().replace(/[$,]+/g, "")) || parseFloat(0);
        } else {
            var exPer = parseFloat(0);
        }
        var amount = parseFloat($(this).find('.othExAmt').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var invNumber = $(this).find('.othExInvNo').val();
        var invAmount = parseFloat($(this).find('.othExInvAmt').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var datePaid = $(this).find('.othExInvDate').val();
        var invExpCode = $(this).find('.othExInvCode').val();

        var expense = {
            'courseCode': courseCode,
            'otherExpenseName': otherExpenseName,
            'expenseCode': expenseCode,
            'exPer': exPer,
            'amount': amount,
            'invNumber': invNumber,
            'invAmount': invAmount,
            'datePaid': datePaid,
            'invExpCode': invExpCode
        };
        otherExpenses.push(expense);
        i++;
    });
    console.log(otherExpenses); //
    return otherExpenses;
}

function validateInput() {
    var message = "";
    if (($('#txtCourseCode').val()).length == 0) {
        message = message + "Please input course code.\n";
    }
    if ($('#ddlCourseName').val() == "-1") {
        message = message + "Please select course name.\n";
    }
    return message.length == 0 ? "true" : message;
}

function getCourseInfo() {
    var courseCode = $('#txtCourseCode').val();
    var courseName = $('#ddlCourseName').val();
    var aptifyId = $('#txtAptifyID').val();
    var courseStatus = $('#ddlStatus').val();
    var group_ = $('#ddlGroup').val();
    var CPDHours = $('#ddlCPDHours').val();
    var CourseLevel = $('#ddlCourseLevel').val();
    var co_host = $('#ddlCoHost').val();
    var CourseDurationDays = $('#ddlDurationDays').val();
    var coordinator = $('#txtCoordinator').val();
    var Additional_group = $('#ddlAdditionalGroup').val();
    var country = $('#ddlCountry').val();
    var state_ = $('#ddlState').val();
    var reg_metro_int = $('#ddlMetroRegionalLocation').val();
    var venue = $('#txtAddress').val();
    var suburb_city = $('#ddlSuburb').val() == "" ? $('#txtArea').val() : $('#ddlSuburb').val();
    var zipcode = $('#txtZip').val();
    var courseDate = $('#txtCourseDate').val();
    var StartDate = $('#txtIterationBeginDate').val();
    var EndDate = $('#txtIterationEndDate').val();
    var cretedby = '<%=Session["user"].ToString() %>'
    //var createdon = $('#A1').val();
    //var modifiedby = $('#A1').val();
    //var modifiedon = $('#A1').val();
    //var forecastapprovedby = $('#A1').val();
    //var forecastapprovedate = $('#A1').val();
    //var signedoffby = $('#A1').val();
    //var signedoffon = $('#A1').val();
    var NoPresenters = parseFloat($('#txtTotalNumberOfPresentersOnly').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var totalConsultantIncPresenter = parseFloat($('#txtTotalNoOfConsultantsInput').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var numberofFreePlace = parseFloat($('#txtNofOfFreePlaces').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var minimumParticipant = parseFloat($('#txtMinPayingParticipant').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var averageParticipant = parseFloat($('#txtAvgPayingPaticipant').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var minimumAchieve40PerMargin = parseFloat($('#txt40PerPayingParticipant').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var maximumAvailable = parseFloat($('#txtMaximumAvailable').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var contributionOverheadPercent = parseFloat($('#txtOverheadContribution').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var participantFeeEBDistantMin = parseFloat($('#txtParticipantFeeEBDistantMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var diffBWEBSP = parseFloat($('#txtDiffBWSPMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var participantPerEBDistant = parseFloat($('#txtParticipantPerEBDistantMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var participantPerEBApa = parseFloat($('#txtParticipantPerEBApaMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var participantPerEBNonMember = parseFloat($('#txtParticipantPerEBNonMemberMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var participantPerNonDistant = parseFloat($('#txtParticipantPerNonDistantMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var participantPerNonApa = parseFloat($('#txtParticipantPerNonApaMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var participantPerNonMember = parseFloat($('#txtParticipantPerNonMemberMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var actparticipantEBDistant = parseFloat($('#txtActParticipantEBDistantMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var actparticipantEBApa = parseFloat($('#txtActParticipantEBApaMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var actparticipantEBNonMember = parseFloat($('#txtActParticipantEBNonMemberMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var actparticipantNonDistant = parseFloat($('#txtActParticipantNonDistantMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var actparticipantNonApa = parseFloat($('#txtActParticipantNonApaMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var actparticipantNonMember = parseFloat($('#txtActParticipantNonMemberMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var sponsorshipMin = parseFloat($('#txtSponsorshipMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var morningTeaDays = parseInt($('#txtDaysMTMin').val().replace(/[$,]+/g, "")) || parseInt(0);
    var morningTeaRate = parseFloat($('#txtRateMTMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var teaInvNo = $('#txtMorningTeaInvNum').val();
    var teaInvAMount = parseFloat($('#txtMorningTeaInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var teaInvDate = $('#Date1').val();
    var teaInvCode = $('#ddlMTMinExpCode').val();
    var lunchDays = parseInt($('#txtDaysLMin').val().replace(/[$,]+/g, "")) || parseInt(0);
    var lunchRate = parseFloat($('#txtRateLMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var lunchInvNo = $('#Text9').val();
    var lunchInvAMount = parseFloat($('#txtLunchInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var lunchInvDate = $('#Date2').val();
    var lunchInvCode = $('#ddlLMinExpCode').val();
    var afternoonTeaDays = parseInt($('#txtDaysATMin').val().replace(/[$,]+/g, "")) || parseInt(0);
    var afternoonTeaRate = parseFloat($('#txtRateATMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var aTeaInvNo = $('#Text17').val();
    var aTeaInvAMount = parseFloat($('#txtAfternoonTeaInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var aTeaInvDate = $('#Date3').val();
    var aTeaInvCode = $('#ddlATMinExpCode').val();
    var venueHireDays = parseInt($('#txtVenueHireDays').val().replace(/[$,]+/g, "")) || parseInt(0);
    var venueHireRate = parseFloat($('#txtVenueHireRate').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var venueInvNo = $('#Text64').val();
    var venueInvAMount = parseFloat($('#txtVenueInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var venueInvDate = $('#Date12').val();
    var venueInvCode = $('#ddlVenueHireExpCode').val();
    var poolHireDays = parseInt($('#txtPoolHireDays').val().replace(/[$,]+/g, "")) || parseInt(0);
    var poolHireRate = parseFloat($('#txtPoolHireRate').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var poolInvNo = $('#Text79').val();
    var poolInvAMount = parseFloat($('#txtPoolInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var poolInvDate = $('#Date13').val();
    var poolInvCode = $('#ddlPoolHireExpCode').val();
    var avHireDays = parseInt($('#txtAVHireDays').val().replace(/[$,]+/g, "")) || parseInt(0);;
    var avHireRate = parseFloat($('#txtAVHireRate').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var avInvNo = $('#Text94').val();
    var avInvAMount = parseFloat($('#txtAvInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var avInvDate = $('#Date14').val();
    var avInvCode = $('#ddlAVHireExpCode').val();
    var manualFeePerparticipant = parseFloat($('#txtCourseManualFeeMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var manualInvNo = $('#txtManualInv').val();
    var manualInvAMount = parseFloat($('#txtManualInvAmount').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var manualInvDate = $('#manualInvDate').val();
    var manualInvCode = $('#ddlCourseManualsExpCode').val();
    var sundrySupplies = parseFloat($('#txtSundryAmount').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var sundryInvNo = $('#sundryInvTotal').val();
    var sundryInvAMount = parseFloat($('#txtSundryInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
    var sundryInvDate = $('#Date7').val();
    var sundryInvCode = $('#ddlSundaySuppliesExpCode').val();
    //var isModified = $('#A1').val();
    //var isForeCastApproved = $('#A1').val();
    //var isSignedOff = $('#A1').val();
    var courseInfo = [];
    var courseEvent = {
        'courseCode': courseCode,
        'courseName': courseName,
        'aptifyId': aptifyId,
        'courseStatus': courseStatus,
        'group_': group_,
        'CPDHours': CPDHours,
        'CourseLevel': CourseLevel,
        'co_host': co_host,
        'CourseDurationDays': CourseDurationDays,
        'coordinator': coordinator,
        'Additional_group': Additional_group,
        'country': country,
        'state_': state_,
        'reg_metro_int': reg_metro_int,
        'venue': venue,
        'suburb_city': suburb_city,
        'zipcode': zipcode,
        'courseDate': courseDate,
        'StartDate': StartDate,
        'EndDate': EndDate,
        'cretedby': cretedby,
        /*'createdon': createdon,
        'modifiedby': modifiedby,
        'modifiedon': modifiedon,
        'forecastapprovedby': forecastapprovedby,
        'forecastapprovedate': forecastapprovedate,
        'signedoffby': signedoffby,
        'signedoffon': signedoffon,*/
        'NoPresenters': NoPresenters,
        'totalConsultantIncPresenter': totalConsultantIncPresenter,
        'numberofFreePlace': numberofFreePlace,
        'minimumParticipant': minimumParticipant,
        'averageParticipant': averageParticipant,
        'minimumAchieve40PerMargin': minimumAchieve40PerMargin,
        'maximumAvailable': maximumAvailable,
        'contributionOverheadPercent': contributionOverheadPercent,
        'participantFeeEBDistantMin': participantFeeEBDistantMin,
        'diffBWEBSP': diffBWEBSP,
        'participantPerEBDistant': participantPerEBDistant,
        'participantPerEBApa': participantPerEBApa,
        'participantPerEBNonMember': participantPerEBNonMember,
        'participantPerNonDistant': participantPerNonDistant,
        'participantPerNonApa': participantPerNonApa,
        'participantPerNonMember': participantPerNonMember,
        'actparticipantEBDistant': actparticipantEBDistant,
        'actparticipantEBApa': actparticipantEBApa,
        'actparticipantEBNonMember': actparticipantEBNonMember,
        'actparticipantNonDistant': actparticipantNonDistant,
        'actparticipantNonApa': actparticipantNonApa,
        'actparticipantNonMember': actparticipantNonMember,
        'sponsorshipMin': sponsorshipMin,
        'morningTeaDays': morningTeaDays,
        'morningTeaRate': morningTeaRate,
        'teaInvNo': teaInvNo,
        'teaInvAMount': teaInvAMount,
        'teaInvDate': teaInvDate,
        'teaInvCode': teaInvCode,
        'lunchDays': lunchDays,
        'lunchRate': lunchRate,
        'lunchInvNo': lunchInvNo,
        'lunchInvAMount': lunchInvAMount,
        'lunchInvDate': lunchInvDate,
        'lunchInvCode': lunchInvCode,
        'afternoonTeaDays': afternoonTeaDays,
        'afternoonTeaRate': afternoonTeaRate,
        'aTeaInvNo': aTeaInvNo,
        'aTeaInvAMount': aTeaInvAMount,
        'aTeaInvDate': aTeaInvDate,
        'aTeaInvCode': aTeaInvCode,
        'venueHireDays': venueHireDays,
        'venueHireRate': venueHireRate,
        'venueInvNo': venueInvNo,
        'venueInvAMount': venueInvAMount,
        'venueInvDate': venueInvDate,
        'venueInvCode': venueInvCode,
        'poolHireDays': poolHireDays,
        'poolHireRate': poolHireRate,
        'poolInvNo': poolInvNo,
        'poolInvAMount': poolInvAMount,
        'poolInvDate': poolInvDate,
        'poolInvCode': poolInvCode,
        'avHireDays': avHireDays,
        'avHireRate': avHireRate,
        'avInvNo': avInvNo,
        'avInvAMount': avInvAMount,
        'avInvDate': avInvDate,
        'avInvCode': avInvCode,
        'manualFeePerparticipant': manualFeePerparticipant,
        'manualInvNo': manualInvNo,
        'manualInvAMount': manualInvAMount,
        'manualInvDate': manualInvDate,
        'manualInvCode': manualInvCode,
        'sundrySupplies': sundrySupplies,
        'sundryInvNo': sundryInvNo,
        'sundryInvAMount': sundryInvAMount,
        'sundryInvDate': sundryInvDate,
        'sundryInvCode': sundryInvCode
        //'isModified': isModified,
        //'isForeCastApproved': isForeCastApproved,
        //'isSignedOff': isSignedOff
    };
    courseInfo.push(courseEvent);
    console.log(courseInfo);
    return courseInfo;
}