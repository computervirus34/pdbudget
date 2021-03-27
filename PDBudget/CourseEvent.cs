using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PDBudget
{
    public class CourseEvent
    {
        public int id { get; set; }
        public string courseCode { get; set; }
        public string courseName { get; set; }
        public string aptifyId { get; set; }
        public string courseStatus { get; set; }
        public string group_ { get; set; }
        public decimal CPDHours { get; set; }
        public string CourseLevel { get; set; }
        public string co_host { get; set; }
        public decimal CourseDurationDays { get; set; }
        public string coordinator { get; set; }
        public string Additional_group { get; set; }
        public string country { get; set; }
        public string state_ { get; set; }
        public string reg_metro_int { get; set; }
        public string venue { get; set; }
        public string suburb_city { get; set; }
        public string zipcode { get; set; }
        public string courseDate { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string cretedby { get; set; }
        public string createdon { get; set; }
        public string modifiedby { get; set; }
        public string modifiedon { get; set; }
        public string forecastapprovedby { get; set; }
        public string forecastapprovedate { get; set; }
        public string signedoffby { get; set; }
        public string signedoffon { get; set; }
        public decimal NoPresenters { get; set; }
        public decimal totalConsultantIncPresenter { get; set; }
        public decimal numberofFreePlace { get; set; }
        public decimal minimumParticipant { get; set; }
        public decimal averageParticipant { get; set; }
        public decimal minimumAchieve40PerMargin { get; set; }
        public decimal maximumAvailable { get; set; }
        public decimal contributionOverheadPercent { get; set; }
        public decimal participantFeeEBDistantMin { get; set; }
        public decimal diffBWEBSP { get; set; }
        public decimal participantPerEBDistant { get; set; }
        public decimal participantPerEBApa { get; set; }
        public decimal participantPerEBNonMember { get; set; }
        public decimal participantPerNonDistant { get; set; }
        public decimal participantPerNonApa { get; set; }
        public decimal participantPerNonMember { get; set; }
        public decimal actparticipantEBDistant { get; set; }
        public decimal actparticipantEBApa { get; set; }
        public decimal actparticipantEBNonMember { get; set; }
        public decimal actparticipantNonDistant { get; set; }
        public decimal actparticipantNonApa { get; set; }
        public decimal actparticipantNonMember { get; set; }
        public decimal sponsorshipMin { get; set; }
        public int morningTeaDays { get; set; }
        public decimal morningTeaRate { get; set; }
        public string teaInvNo { get; set; }
        public decimal teaInvAMount { get; set; }
        public string teaInvDate { get; set; }
        public string teaInvCode { get; set; }
        public int lunchDays { get; set; }
        public decimal lunchRate { get; set; }
        public string lunchInvNo { get; set; }
        public decimal lunchInvAMount { get; set; }
        public string lunchInvDate { get; set; }
        public string lunchInvCode { get; set; }
        public int afternoonTeaDays { get; set; }
        public decimal afternoonTeaRate { get; set; }
        public string aTeaInvNo { get; set; }
        public decimal aTeaInvAMount { get; set; }
        public string aTeaInvDate { get; set; }
        public string aTeaInvCode { get; set; }
        public int venueHireDays { get; set; }
        public decimal venueHireRate { get; set; }
        public string venueInvNo { get; set; }
        public decimal venueInvAMount { get; set; }
        public string venueInvDate { get; set; }
        public string venueInvCode { get; set; }
        public int poolHireDays { get; set; }
        public decimal poolHireRate { get; set; }
        public string poolInvNo { get; set; }
        public decimal poolInvAMount { get; set; }
        public string poolInvDate { get; set; }
        public string poolInvCode { get; set; }
        public int avHireDays { get; set; }
        public decimal avHireRate { get; set; }
        public string avInvNo { get; set; }
        public decimal avInvAMount { get; set; }
        public string avInvDate { get; set; }
        public string avInvCode { get; set; }
        public decimal manualFeePerparticipant { get; set; }
        public string manualInvNo { get; set; }
        public decimal manualInvAMount { get; set; }
        public string manualInvDate { get; set; }
        public string manualInvCode { get; set; }
        public decimal sundrySupplies { get; set; }
        public string sundryInvNo { get; set; }
        public decimal sundryInvAMount { get; set; }
        public string sundryInvDate { get; set; }
        public string sundryInvCode { get; set; }
        public string isModified { get; set; }
        public string isForeCastApproved { get; set; }
        public string isSignedOff { get; set; }

    }

    public class ResourcePerson
    {
        public int id { get; set; }
        public string courseCode { get; set; }
        public string rtype { get; set; }
        public int resource_person_id { get; set; }
        public string session_ { get; set; }
        public string hours_ { get; set; }
        public decimal rate { get; set; }
        public decimal accomadation { get; set; }
        public decimal travelEx { get; set; }
        public decimal meal { get; set; }
        public decimal taxi { get; set; }
        public string expenseCode { get; set; }
        public string invNumber { get; set; }
        public string datePaid { get; set; }
        public decimal amount { get; set; }

    }

    public class OtherExpenses
    {
        public int id { get; set; }
        public string courseCode { get; set; }
        public string otherExpenseName { get; set; }
        public string expenseCode { get; set; }
        public decimal exPer { get; set; }
        public decimal amount { get; set; }
        public string invNumber { get; set; }
        public decimal invAmount { get; set; }
        public string datePaid { get; set; }
        public string invExpCode { get; set; }

    }

    public class CourseEventResourceExpenses
    {
        public CourseEvent courseEvent { get; set; }
        public List<ResourcePerson> ResourcePersons { get; set; }
        public List<OtherExpenses> OtherExpenses { get; set; }
    }
}