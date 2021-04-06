using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Text;
using System.Web.Security;
using System.Web.Script.Services;
using MySql.Data.MySqlClient;
using System.Diagnostics;

namespace PDBudget
{
    public partial class PDBudgetEntry : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        DataReader dr = new DataReader();
        PopulateLists pl = new PopulateLists();
        FillList fl = new FillList();

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated || Session["user"]==null)
            {
                Session.RemoveAll();
                Session.Clear();
                Session.Abandon();
                FormsAuthentication.SignOut();
                Response.Redirect("~/Login");
            }
            else
            {
                if (!Session["userRole"].ToString().Equals("admin"))
                {
                    /*MenuItem item = Menu1.FindItem("Parameter");
                    item.Parent.ChildItems.Remove(item);*/
                    MenuItemCollection menuItems = Menu1.Items;
                    MenuItem adminItem = new MenuItem();
                    foreach (MenuItem menuItem in menuItems)
                    {
                        if (menuItem.Text == "Parameter")
                            adminItem = menuItem;
                    }
                    menuItems.Remove(adminItem);
                }
                if (!IsPostBack)
                {
                    PopulateDropdownData();
                }
            }
        }
        private void PopulateDropdownData()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = pl.GetPDBudgetCourseInfo();
                fl.PopulateDDL(dt, ddlCourseName, "ID", "courseTitle", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetParameter("Group");
                fl.PopulateDDL(dt, ddlGroup, "ID", "Name", true, "--Select--", "-1");


                dt = null;
                dt = pl.GetParameter("Group");
                fl.PopulateDDL(dt, ddlAdditionalGroup, "ID", "Name", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetParameter("Group");
                fl.PopulateDDL(dt, ddlCoHost, "ID", "Name", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetParameter("Status");
                fl.PopulateDDL(dt, ddlStatus, "ID", "Name", true, "Pending", "Pending");

                dt = null;
                dt = pl.GetParameter("State");
                fl.PopulateDDL(dt, ddlState, "ID", "Name", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetNumberParameter("Course Duration (days)");
                fl.PopulateDDL(dt, ddlDurationDays, "ID", "Name", true, "--Select--", "-1.00");

                dt = null;
                dt = pl.GetNumberParameter("CPD Hours");
                fl.PopulateDDL(dt, ddlCPDHours, "ID", "Name", true, "--Select--", "-1.00");

                dt = null;
                dt = pl.GetParameter("Country");
                fl.PopulateDDL(dt, ddlCountry, "ID", "Name", true, "AUSTRALIA", "AUSTRALIA");

                dt = null;
                dt = pl.GetParameter("Regional / Metro");
                fl.PopulateDDL(dt, ddlMetroRegionalLocation, "ID", "Name", true, "--Select--", "-1");

                //dt = null;
                //dt = pl.GetPDExpenseTypeInfo();
                //fl.PopulateDDL(dt, ddlExpenseType, "ID", "Name", true, "--Please Select--", "-1");

                dt = null;
                dt = pl.GetParameter("Level of Learning");
                fl.PopulateDDL(dt, ddlCourseLevel, "ID", "Name", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetResourceInfo("P");
                fl.PopulateDDL(dt, ddlPresenters, "ID", "Name", true, "--Select--", "-1");
                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlPresenterExpCode, "ID", "Name", true, "40492-Presenter", "40492");

                dt = null;
                dt = pl.GetResourceInfo("T");
                fl.PopulateDDL(dt, ddlTutors, "ID", "Name", true, "--Select--", "-1");


                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlTutorExpCode, "ID", "Name", true, "40492-Tutor", "40492");

                dt = null;
                dt = pl.GetResourceInfo("C");
                fl.PopulateDDL(dt, ddlConvenors, "ID", "Name", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlConvenorExpCode, "ID", "Name", true, "40492-Convenor", "40492");

                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlOtherExpenseCode, "ID", "Name", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlOtherExpCode, "ID", "Name", true, "--Select--", "-1");

                //dt = null;
                //dt = pl.GetPDOtherExpenseInfo();
                //fl.PopulateDDL(dt, ddlOtherExpense, "ID", "Name", true, "--Please Select--", "-1");

                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlMTMinExpCode, "ID", "Name", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlLMinExpCode, "ID", "Name", true, "--Select--", "-1");


                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlATMinExpCode, "ID", "Name", true, "--Select--", "-1");


                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlVenueHireExpCode, "ID", "Name", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlPoolHireExpCode, "ID", "Name", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlAVHireExpCode, "ID", "Name", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlAVHireExpCode, "ID", "Name", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlCourseManualsExpCode, "ID", "Name", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetExpenseType();
                fl.PopulateDDL(dt, ddlSundaySuppliesExpCode, "ID", "Name", true, "--Select--", "-1");

                dt = null;
                dt = pl.GetCourseEventCode();
                fl.PopulateDDL(dt, ddlCourseCode, "ID", "Name", true, "--Select--", "-1");
            }
            catch (Exception ex)
            {

            }
        }
        public class DropDownListAjax
        {
            public int ID { get; set; }
            public string Name { get; set; }
        }

        [WebMethod]
        public static string GetZipCode(string suburb)
        {
            string zip;
            try
            {
                int id = Convert.ToInt32(suburb);
                string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    using (MySqlCommand cmd = new MySqlCommand("select zip from suburb where id = @id"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Connection = con;
                        con.Open();
                        zip = (string)cmd.ExecuteScalar();
                        con.Close();
                    }
                }
                return zip;
            }
            catch (Exception ex)
            {
                return "";
            }
        }


        [WebMethod]
        public static string GetSuburb(string state)
        {
            try
            {
                PopulateLists pl = new PopulateLists();
                DataTable dt = new DataTable();
                List<ListItem> suburbs = new List<ListItem>();
                dt = null;
                dt = pl.GetPDBudgetSuburb(state);

                /*for(int i=0;i<dt.Rows.Count;i++)
                {
                    suburbs.Add(new ListItem
                     {
                        Value = dt.Rows[i]["id"].ToString(),
                        Text = dt.Rows[i]["name"].ToString()
                     });
                }*/
                var JSONString = new StringBuilder();
                if (dt.Rows.Count > 0)
                {
                    JSONString.Append("[");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        JSONString.Append("{");
                        for (int j = 0; j < dt.Columns.Count; j++)
                        {
                            if (j < dt.Columns.Count - 1)
                            {
                                JSONString.Append("\"" + dt.Columns[j].ColumnName.ToString() + "\":" + "\"" + dt.Rows[i][j].ToString() + "\",");
                            }
                            else if (j == dt.Columns.Count - 1)
                            {
                                JSONString.Append("\"" + dt.Columns[j].ColumnName.ToString() + "\":" + "\"" + dt.Rows[i][j].ToString() + "\"");
                            }
                        }
                        if (i == dt.Rows.Count - 1)
                        {
                            JSONString.Append("}");
                        }
                        else
                        {
                            JSONString.Append("},");
                        }
                    }
                    JSONString.Append("]");
                }
                return JSONString.ToString();

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [WebMethod]
        public static string ApproveForecast(string user,string courseCode)
        {
            //string zip;
            try
            {
                //int id = Convert.ToInt32(suburb);
                string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
                string query = @"update courseevent set forecastapprovedby = @forecastapprovedby, 
                                forecastapprovedate=@forecastapprovedate,courseStatus=@courseStatus,
                                isForeCastApproved=@isForeCastApproved where courseCode=@courseCode";
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@forecastapprovedby", user);
                        cmd.Parameters.AddWithValue("@forecastapprovedate", System.DateTime.Now);
                        cmd.Parameters.AddWithValue("@courseStatus", "Active");
                        cmd.Parameters.AddWithValue("@isForeCastApproved", "Y");
                        cmd.Parameters.AddWithValue("@courseCode", courseCode);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                return "1";
            }
            catch (Exception ex)
            {
                return "-1";
            }
        }


        [WebMethod]
        public static string CourseSignOff(string user, string courseCode)
        {
            string zip;
            try
            {
                //int id = Convert.ToInt32(suburb);
                string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
                string query = @"update courseevent set signedoffby = @signedoffby, 
                                signedoffon=@signedoffon,courseStatus=@courseStatus,
                                isSignedOff=@isSignedOff where courseCode=@courseCode";
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@signedoffby", user);
                        cmd.Parameters.AddWithValue("@signedoffon", System.DateTime.Now);
                        cmd.Parameters.AddWithValue("@courseStatus", "Complete");
                        cmd.Parameters.AddWithValue("@isSignedOff", "Y");
                        cmd.Parameters.AddWithValue("@courseCode", courseCode);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                return "1";
            }
            catch (Exception ex)
            {
                return "-1";
            }
        }



        [WebMethod]
        public static string SaveCourseInfo(string courseInfoes, string resource, string otherExpenses)
        {
            try
            {
                CourseEvent courseEvent = new CourseEvent();
                List<ResourcePerson> lRp = new List<ResourcePerson>();
                List<OtherExpenses> lOp = new List<OtherExpenses>();

                var courseInfo = JsonConvert.DeserializeObject<List<CourseEvent>>(courseInfoes);
                var resourceInfo = JsonConvert.DeserializeObject<List<ResourcePerson>>(resource);
                var otherExpense = JsonConvert.DeserializeObject<List<OtherExpenses>>(otherExpenses);

                foreach (var item in courseInfo)
                {
                    //courseEvent.id = item.id;
                    courseEvent.courseCode = item.courseCode;
                    courseEvent.courseName = item.courseName;
                    courseEvent.aptifyId = item.aptifyId;
                    courseEvent.courseStatus = item.courseStatus;
                    courseEvent.group_ = item.group_;
                    courseEvent.CPDHours = item.CPDHours;
                    courseEvent.CourseLevel = item.CourseLevel;
                    courseEvent.co_host = item.co_host;
                    courseEvent.CourseDurationDays = item.CourseDurationDays;
                    courseEvent.coordinator = item.coordinator;
                    courseEvent.Additional_group = item.Additional_group;
                    courseEvent.country = item.country;
                    courseEvent.state_ = item.state_;
                    courseEvent.reg_metro_int = item.reg_metro_int;
                    courseEvent.venue = item.venue;
                    courseEvent.suburb_city = item.suburb_city;
                    courseEvent.zipcode = item.zipcode;
                    courseEvent.courseDate = item.courseDate;
                    courseEvent.StartDate = item.StartDate;
                    courseEvent.EndDate = item.EndDate;
                    courseEvent.cretedby = item.cretedby;
                    courseEvent.createdon = String.IsNullOrEmpty(item.createdon) ? null : item.createdon;
                    /*courseEvent.modifiedby = item.modifiedby;
                    courseEvent.modifiedon = item.modifiedon;
                    courseEvent.forecastapprovedby = item.forecastapprovedby;
                    courseEvent.forecastapprovedate = item.forecastapprovedate;
                    courseEvent.signedoffby = item.signedoffby;
                    courseEvent.signedoffon = item.signedoffon;*/
                    courseEvent.NoPresenters = item.NoPresenters;
                    courseEvent.totalConsultantIncPresenter = item.totalConsultantIncPresenter;
                    courseEvent.numberofFreePlace = item.numberofFreePlace;
                    courseEvent.minimumParticipant = item.minimumParticipant;
                    courseEvent.averageParticipant = item.averageParticipant;
                    courseEvent.minimumAchieve40PerMargin = item.minimumAchieve40PerMargin;
                    courseEvent.maximumAvailable = item.maximumAvailable;
                    courseEvent.contributionOverheadPercent = item.contributionOverheadPercent;
                    courseEvent.participantFeeEBDistantMin = item.participantFeeEBDistantMin;
                    courseEvent.diffBWEBSP = item.diffBWEBSP;
                    courseEvent.participantPerEBDistant = item.participantPerEBDistant;
                    courseEvent.participantPerEBApa = item.participantPerEBApa;
                    courseEvent.participantPerEBNonMember = item.participantPerEBNonMember;
                    courseEvent.participantPerNonDistant = item.participantPerNonDistant;
                    courseEvent.participantPerNonApa = item.participantPerNonApa;
                    courseEvent.participantPerNonMember = item.participantPerNonMember;
                    courseEvent.actparticipantEBDistant = item.actparticipantEBDistant;
                    courseEvent.actparticipantEBApa = item.actparticipantEBApa;
                    courseEvent.actparticipantEBNonMember = item.actparticipantEBNonMember;
                    courseEvent.actparticipantNonDistant = item.actparticipantNonDistant;
                    courseEvent.actparticipantNonApa = item.actparticipantNonApa;
                    courseEvent.actparticipantNonMember = item.actparticipantNonMember;
                    courseEvent.sponsorshipMin = item.sponsorshipMin;
                    courseEvent.morningTeaDays = item.morningTeaDays;
                    courseEvent.morningTeaRate = item.morningTeaRate;
                    courseEvent.teaInvNo = item.teaInvNo;
                    courseEvent.teaInvAMount = item.teaInvAMount;
                    courseEvent.teaInvDate = item.teaInvDate;
                    courseEvent.teaInvCode = item.teaInvCode;
                    courseEvent.lunchDays = item.lunchDays;
                    courseEvent.lunchRate = item.lunchRate;
                    courseEvent.lunchInvNo = item.lunchInvNo;
                    courseEvent.lunchInvAMount = item.lunchInvAMount;
                    courseEvent.lunchInvDate = item.lunchInvDate;
                    courseEvent.lunchInvCode = item.lunchInvCode;
                    courseEvent.afternoonTeaDays = item.afternoonTeaDays;
                    courseEvent.afternoonTeaRate = item.afternoonTeaRate;
                    courseEvent.aTeaInvNo = item.aTeaInvNo;
                    courseEvent.aTeaInvAMount = item.aTeaInvAMount;
                    courseEvent.aTeaInvDate = item.aTeaInvDate;
                    courseEvent.aTeaInvCode = item.aTeaInvCode;
                    courseEvent.venueHireDays = item.venueHireDays;
                    courseEvent.venueHireRate = item.venueHireRate;
                    courseEvent.venueInvNo = item.venueInvNo;
                    courseEvent.venueInvAMount = item.venueInvAMount;
                    courseEvent.venueInvDate = item.venueInvDate;
                    courseEvent.venueInvCode = item.venueInvCode;
                    courseEvent.poolHireDays = item.poolHireDays;
                    courseEvent.poolHireRate = item.poolHireRate;
                    courseEvent.poolInvNo = item.poolInvNo;
                    courseEvent.poolInvAMount = item.poolInvAMount;
                    courseEvent.poolInvDate = item.poolInvDate;
                    courseEvent.poolInvCode = item.poolInvCode;
                    courseEvent.avHireDays = item.avHireDays;
                    courseEvent.avHireRate = item.avHireRate;
                    courseEvent.avInvNo = item.avInvNo;
                    courseEvent.avInvAMount = item.avInvAMount;
                    courseEvent.avInvDate = item.avInvDate;
                    courseEvent.avInvCode = item.avInvCode;
                    courseEvent.manualFeePerparticipant = item.manualFeePerparticipant;
                    courseEvent.manualInvNo = item.manualInvNo;
                    courseEvent.manualInvAMount = item.manualInvAMount;
                    courseEvent.manualInvDate = item.manualInvDate;
                    courseEvent.manualInvCode = item.manualInvCode;
                    courseEvent.sundrySupplies = item.sundrySupplies;
                    courseEvent.sundryInvNo = item.sundryInvNo;
                    courseEvent.sundryInvAMount = item.sundryInvAMount;
                    courseEvent.sundryInvDate = item.sundryInvDate;
                    courseEvent.sundryInvCode = item.sundryInvCode;
                    /*courseEvent.isModified = item.isModified;
                    courseEvent.isForeCastApproved = item.isForeCastApproved;
                    courseEvent.isSignedOff = item.isSignedOff;*/

                }


                foreach (var item in resourceInfo)
                {
                    ResourcePerson rp = new ResourcePerson();
                    rp.courseCode = item.courseCode;
                    rp.rtype = item.rtype;
                    rp.resource_person_id = item.resource_person_id;
                    rp.session_ = item.session_;
                    rp.hours_ = item.hours_;
                    rp.rate = item.rate;
                    rp.accomadation = item.accomadation;
                    rp.travelEx = item.travelEx;
                    rp.meal = item.meal;
                    rp.taxi = item.taxi;
                    rp.expenseCode = item.expenseCode;
                    rp.invNumber = item.invNumber;
                    rp.datePaid = item.datePaid;
                    rp.amount = item.amount;

                    lRp.Add(rp);
                }

                foreach (var item in otherExpense)
                {
                    OtherExpenses oe = new OtherExpenses();
                    oe.courseCode = item.courseCode;
                    oe.otherExpenseName = item.otherExpenseName;
                    oe.expenseCode = item.expenseCode;
                    oe.amount = item.amount;
                    oe.invNumber = item.invNumber;
                    oe.invAmount = item.invAmount;
                    oe.datePaid = item.datePaid;
                    oe.invExpCode = item.invExpCode;


                    lOp.Add(oe);
                }

                PDBudgetEntry pdb = new PDBudgetEntry();
                int pout = 0;
                pout = pdb.InsertCourseEvent(courseEvent, lRp, lOp);
                if (pout == 0)
                {
                    return "1";
                }
                else
                {
                    return "-1";
                }
            }
            catch (Exception ex)
            {
                return "-1";
            }
        }

        [WebMethod]
        public static string UpdateCourseInfo(string courseInfoes, string resource, string otherExpenses)
        {
            try
            {
                CourseEvent courseEvent = new CourseEvent();
                List<ResourcePerson> lRp = new List<ResourcePerson>();
                List<OtherExpenses> lOp = new List<OtherExpenses>();

                var courseInfo = JsonConvert.DeserializeObject<List<CourseEvent>>(courseInfoes);
                var resourceInfo = JsonConvert.DeserializeObject<List<ResourcePerson>>(resource);
                var otherExpense = JsonConvert.DeserializeObject<List<OtherExpenses>>(otherExpenses);

                foreach (var item in courseInfo)
                {
                    //courseEvent.id = item.id;
                    courseEvent.courseCode = item.courseCode;
                    courseEvent.courseName = item.courseName;
                    courseEvent.aptifyId = item.aptifyId;
                    courseEvent.courseStatus = item.courseStatus;
                    courseEvent.group_ = item.group_;
                    courseEvent.CPDHours = item.CPDHours;
                    courseEvent.CourseLevel = item.CourseLevel;
                    courseEvent.co_host = item.co_host;
                    courseEvent.CourseDurationDays = item.CourseDurationDays;
                    courseEvent.coordinator = item.coordinator;
                    courseEvent.Additional_group = item.Additional_group;
                    courseEvent.country = item.country;
                    courseEvent.state_ = item.state_;
                    courseEvent.reg_metro_int = item.reg_metro_int;
                    courseEvent.venue = item.venue;
                    courseEvent.suburb_city = item.suburb_city;
                    courseEvent.zipcode = item.zipcode;
                    courseEvent.courseDate = item.courseDate;
                    courseEvent.StartDate = item.StartDate;
                    courseEvent.EndDate = item.EndDate;
                    courseEvent.cretedby = item.cretedby;
                    courseEvent.createdon = String.IsNullOrEmpty(item.createdon) ? null : item.createdon;
                    courseEvent.modifiedby = item.modifiedby;
                    /*courseEvent.modifiedon = item.modifiedon;
                    courseEvent.forecastapprovedby = item.forecastapprovedby;
                    courseEvent.forecastapprovedate = item.forecastapprovedate;
                    courseEvent.signedoffby = item.signedoffby;
                    courseEvent.signedoffon = item.signedoffon;*/
                    courseEvent.NoPresenters = item.NoPresenters;
                    courseEvent.totalConsultantIncPresenter = item.totalConsultantIncPresenter;
                    courseEvent.numberofFreePlace = item.numberofFreePlace;
                    courseEvent.minimumParticipant = item.minimumParticipant;
                    courseEvent.averageParticipant = item.averageParticipant;
                    courseEvent.minimumAchieve40PerMargin = item.minimumAchieve40PerMargin;
                    courseEvent.maximumAvailable = item.maximumAvailable;
                    courseEvent.contributionOverheadPercent = item.contributionOverheadPercent;
                    courseEvent.participantFeeEBDistantMin = item.participantFeeEBDistantMin;
                    courseEvent.diffBWEBSP = item.diffBWEBSP;
                    courseEvent.participantPerEBDistant = item.participantPerEBDistant;
                    courseEvent.participantPerEBApa = item.participantPerEBApa;
                    courseEvent.participantPerEBNonMember = item.participantPerEBNonMember;
                    courseEvent.participantPerNonDistant = item.participantPerNonDistant;
                    courseEvent.participantPerNonApa = item.participantPerNonApa;
                    courseEvent.participantPerNonMember = item.participantPerNonMember;
                    courseEvent.actparticipantEBDistant = item.actparticipantEBDistant;
                    courseEvent.actparticipantEBApa = item.actparticipantEBApa;
                    courseEvent.actparticipantEBNonMember = item.actparticipantEBNonMember;
                    courseEvent.actparticipantNonDistant = item.actparticipantNonDistant;
                    courseEvent.actparticipantNonApa = item.actparticipantNonApa;
                    courseEvent.actparticipantNonMember = item.actparticipantNonMember;
                    courseEvent.sponsorshipMin = item.sponsorshipMin;
                    courseEvent.morningTeaDays = item.morningTeaDays;
                    courseEvent.morningTeaRate = item.morningTeaRate;
                    courseEvent.teaInvNo = item.teaInvNo;
                    courseEvent.teaInvAMount = item.teaInvAMount;
                    courseEvent.teaInvDate = item.teaInvDate;
                    courseEvent.teaInvCode = item.teaInvCode;
                    courseEvent.lunchDays = item.lunchDays;
                    courseEvent.lunchRate = item.lunchRate;
                    courseEvent.lunchInvNo = item.lunchInvNo;
                    courseEvent.lunchInvAMount = item.lunchInvAMount;
                    courseEvent.lunchInvDate = item.lunchInvDate;
                    courseEvent.lunchInvCode = item.lunchInvCode;
                    courseEvent.afternoonTeaDays = item.afternoonTeaDays;
                    courseEvent.afternoonTeaRate = item.afternoonTeaRate;
                    courseEvent.aTeaInvNo = item.aTeaInvNo;
                    courseEvent.aTeaInvAMount = item.aTeaInvAMount;
                    courseEvent.aTeaInvDate = item.aTeaInvDate;
                    courseEvent.aTeaInvCode = item.aTeaInvCode;
                    courseEvent.venueHireDays = item.venueHireDays;
                    courseEvent.venueHireRate = item.venueHireRate;
                    courseEvent.venueInvNo = item.venueInvNo;
                    courseEvent.venueInvAMount = item.venueInvAMount;
                    courseEvent.venueInvDate = item.venueInvDate;
                    courseEvent.venueInvCode = item.venueInvCode;
                    courseEvent.poolHireDays = item.poolHireDays;
                    courseEvent.poolHireRate = item.poolHireRate;
                    courseEvent.poolInvNo = item.poolInvNo;
                    courseEvent.poolInvAMount = item.poolInvAMount;
                    courseEvent.poolInvDate = item.poolInvDate;
                    courseEvent.poolInvCode = item.poolInvCode;
                    courseEvent.avHireDays = item.avHireDays;
                    courseEvent.avHireRate = item.avHireRate;
                    courseEvent.avInvNo = item.avInvNo;
                    courseEvent.avInvAMount = item.avInvAMount;
                    courseEvent.avInvDate = item.avInvDate;
                    courseEvent.avInvCode = item.avInvCode;
                    courseEvent.manualFeePerparticipant = item.manualFeePerparticipant;
                    courseEvent.manualInvNo = item.manualInvNo;
                    courseEvent.manualInvAMount = item.manualInvAMount;
                    courseEvent.manualInvDate = item.manualInvDate;
                    courseEvent.manualInvCode = item.manualInvCode;
                    courseEvent.sundrySupplies = item.sundrySupplies;
                    courseEvent.sundryInvNo = item.sundryInvNo;
                    courseEvent.sundryInvAMount = item.sundryInvAMount;
                    courseEvent.sundryInvDate = item.sundryInvDate;
                    courseEvent.sundryInvCode = item.sundryInvCode;
                    /*courseEvent.isModified = item.isModified;
                    courseEvent.isForeCastApproved = item.isForeCastApproved;
                    courseEvent.isSignedOff = item.isSignedOff;*/

                }


                foreach (var item in resourceInfo)
                {
                    ResourcePerson rp = new ResourcePerson();
                    rp.courseCode = item.courseCode;
                    rp.rtype = item.rtype;
                    rp.resource_person_id = item.resource_person_id;
                    rp.session_ = item.session_;
                    rp.hours_ = item.hours_;
                    rp.rate = item.rate;
                    rp.accomadation = item.accomadation;
                    rp.travelEx = item.travelEx;
                    rp.meal = item.meal;
                    rp.taxi = item.taxi;
                    rp.expenseCode = item.expenseCode;
                    rp.invNumber = item.invNumber;
                    rp.datePaid = item.datePaid;
                    rp.amount = item.amount;

                    lRp.Add(rp);
                }

                foreach (var item in otherExpense)
                {
                    OtherExpenses oe = new OtherExpenses();
                    oe.courseCode = item.courseCode;
                    oe.otherExpenseName = item.otherExpenseName;
                    oe.expenseCode = item.expenseCode;
                    oe.amount = item.amount;
                    oe.invNumber = item.invNumber;
                    oe.invAmount = item.invAmount;
                    oe.datePaid = item.datePaid;
                    oe.invExpCode = item.invExpCode;


                    lOp.Add(oe);
                }

                PDBudgetEntry pdb = new PDBudgetEntry();
                int pout = 0;
                pout = pdb.UpdateCourseEvent(courseEvent, lRp, lOp);
                if (pout == 0)
                {
                    return "1";
                }
                else
                {
                    return "-1";
                }
            }
            catch (Exception ex)
            {
                return "-1";
            }
        }

        private int UpdateCourseEvent(CourseEvent courseEvent, List<ResourcePerson> lRp, List<OtherExpenses> lOp)
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    MySqlTransaction txn;
                    string insQuery = getUpdateQuery();
                    using (MySqlCommand cmd = new MySqlCommand(insQuery))
                    {
                        cmd.CommandType = CommandType.Text;
                        //cmd.Parameters.AddWithValue("@id", courseInfoes.id);
                        cmd.Parameters.AddWithValue("@courseCode", courseEvent.courseCode);
                        cmd.Parameters.AddWithValue("@courseName", courseEvent.courseName);
                        cmd.Parameters.AddWithValue("@aptifyId", courseEvent.aptifyId);
                        cmd.Parameters.AddWithValue("@courseStatus", courseEvent.courseStatus);
                        cmd.Parameters.AddWithValue("@group_", courseEvent.group_);
                        cmd.Parameters.AddWithValue("@CPDHours", courseEvent.CPDHours);
                        cmd.Parameters.AddWithValue("@CourseLevel", courseEvent.CourseLevel);
                        cmd.Parameters.AddWithValue("@co_host", courseEvent.co_host);
                        cmd.Parameters.AddWithValue("@CourseDurationDays", courseEvent.CourseDurationDays);
                        cmd.Parameters.AddWithValue("@coordinator", courseEvent.coordinator);
                        cmd.Parameters.AddWithValue("@Additional_group", courseEvent.Additional_group);
                        cmd.Parameters.AddWithValue("@country", courseEvent.country);
                        cmd.Parameters.AddWithValue("@state_", courseEvent.state_);
                        cmd.Parameters.AddWithValue("@reg_metro_int", courseEvent.reg_metro_int);
                        cmd.Parameters.AddWithValue("@venue", courseEvent.venue);
                        cmd.Parameters.AddWithValue("@suburb_city", courseEvent.suburb_city);
                        cmd.Parameters.AddWithValue("@zipcode", courseEvent.zipcode);
                        cmd.Parameters.AddWithValue("@courseDate", courseEvent.courseDate);
                        cmd.Parameters.AddWithValue("@StartDate", courseEvent.StartDate);
                        cmd.Parameters.AddWithValue("@EndDate", courseEvent.EndDate);
                        cmd.Parameters.AddWithValue("@modifiedby", courseEvent.modifiedby);
                        cmd.Parameters.AddWithValue("@modifiedon", System.DateTime.Now);
                        cmd.Parameters.AddWithValue("@NoPresenters", courseEvent.NoPresenters);
                        cmd.Parameters.AddWithValue("@totalConsultantIncPresenter", courseEvent.totalConsultantIncPresenter);
                        cmd.Parameters.AddWithValue("@numberofFreePlace", courseEvent.numberofFreePlace);
                        cmd.Parameters.AddWithValue("@minimumParticipant", courseEvent.minimumParticipant);
                        cmd.Parameters.AddWithValue("@averageParticipant", courseEvent.averageParticipant);
                        cmd.Parameters.AddWithValue("@minimumAchieve40PerMargin", courseEvent.minimumAchieve40PerMargin);
                        cmd.Parameters.AddWithValue("@maximumAvailable", courseEvent.maximumAvailable);
                        cmd.Parameters.AddWithValue("@contributionOverheadPercent", courseEvent.contributionOverheadPercent);
                        cmd.Parameters.AddWithValue("@participantFeeEBDistantMin", courseEvent.participantFeeEBDistantMin);
                        cmd.Parameters.AddWithValue("@diffBWEBSP", courseEvent.diffBWEBSP);
                        cmd.Parameters.AddWithValue("@participantPerEBDistant", courseEvent.participantPerEBDistant);
                        cmd.Parameters.AddWithValue("@participantPerEBApa", courseEvent.participantPerEBApa);
                        cmd.Parameters.AddWithValue("@participantPerEBNonMember", courseEvent.participantPerEBNonMember);
                        cmd.Parameters.AddWithValue("@participantPerNonDistant", courseEvent.participantPerNonDistant);
                        cmd.Parameters.AddWithValue("@participantPerNonApa", courseEvent.participantPerNonApa);
                        cmd.Parameters.AddWithValue("@participantPerNonMember", courseEvent.participantPerNonMember);
                        cmd.Parameters.AddWithValue("@actparticipantEBDistant", courseEvent.actparticipantEBDistant);
                        cmd.Parameters.AddWithValue("@actparticipantEBApa", courseEvent.actparticipantEBApa);
                        cmd.Parameters.AddWithValue("@actparticipantEBNonMember", courseEvent.actparticipantEBNonMember);
                        cmd.Parameters.AddWithValue("@actparticipantNonDistant", courseEvent.actparticipantNonDistant);
                        cmd.Parameters.AddWithValue("@actparticipantNonApa", courseEvent.actparticipantNonApa);
                        cmd.Parameters.AddWithValue("@actparticipantNonMember", courseEvent.actparticipantNonMember);
                        cmd.Parameters.AddWithValue("@sponsorshipMin", courseEvent.sponsorshipMin);
                        cmd.Parameters.AddWithValue("@morningTeaDays", courseEvent.morningTeaDays);
                        cmd.Parameters.AddWithValue("@morningTeaRate", courseEvent.morningTeaRate);
                        cmd.Parameters.AddWithValue("@teaInvNo", courseEvent.teaInvNo);
                        cmd.Parameters.AddWithValue("@teaInvAMount", courseEvent.teaInvAMount);
                        cmd.Parameters.AddWithValue("@teaInvDate", courseEvent.teaInvDate);
                        cmd.Parameters.AddWithValue("@teaInvCode", courseEvent.teaInvCode);
                        cmd.Parameters.AddWithValue("@lunchDays", courseEvent.lunchDays);
                        cmd.Parameters.AddWithValue("@lunchRate", courseEvent.lunchRate);
                        cmd.Parameters.AddWithValue("@lunchInvNo", courseEvent.lunchInvNo);
                        cmd.Parameters.AddWithValue("@lunchInvAMount", courseEvent.lunchInvAMount);
                        cmd.Parameters.AddWithValue("@lunchInvDate", courseEvent.lunchInvDate);
                        cmd.Parameters.AddWithValue("@lunchInvCode", courseEvent.lunchInvCode);
                        cmd.Parameters.AddWithValue("@afternoonTeaDays", courseEvent.afternoonTeaDays);
                        cmd.Parameters.AddWithValue("@afternoonTeaRate", courseEvent.afternoonTeaRate);
                        cmd.Parameters.AddWithValue("@aTeaInvNo", courseEvent.aTeaInvNo);
                        cmd.Parameters.AddWithValue("@aTeaInvAMount", courseEvent.aTeaInvAMount);
                        cmd.Parameters.AddWithValue("@aTeaInvDate", courseEvent.aTeaInvDate);
                        cmd.Parameters.AddWithValue("@aTeaInvCode", courseEvent.aTeaInvCode);
                        cmd.Parameters.AddWithValue("@venueHireDays", courseEvent.venueHireDays);
                        cmd.Parameters.AddWithValue("@venueHireRate", courseEvent.venueHireRate);
                        cmd.Parameters.AddWithValue("@venueInvNo", courseEvent.venueInvNo);
                        cmd.Parameters.AddWithValue("@venueInvAMount", courseEvent.venueInvAMount);
                        cmd.Parameters.AddWithValue("@venueInvDate", courseEvent.venueInvDate);
                        cmd.Parameters.AddWithValue("@venueInvCode", courseEvent.venueInvCode);
                        cmd.Parameters.AddWithValue("@poolHireDays", courseEvent.poolHireDays);
                        cmd.Parameters.AddWithValue("@poolHireRate", courseEvent.poolHireRate);
                        cmd.Parameters.AddWithValue("@poolInvNo", courseEvent.poolInvNo);
                        cmd.Parameters.AddWithValue("@poolInvAMount", courseEvent.poolInvAMount);
                        cmd.Parameters.AddWithValue("@poolInvDate", courseEvent.poolInvDate);
                        cmd.Parameters.AddWithValue("@poolInvCode", courseEvent.poolInvCode);
                        cmd.Parameters.AddWithValue("@avHireDays", courseEvent.avHireDays);
                        cmd.Parameters.AddWithValue("@avHireRate", courseEvent.avHireRate);
                        cmd.Parameters.AddWithValue("@avInvNo", courseEvent.avInvNo);
                        cmd.Parameters.AddWithValue("@avInvAMount", courseEvent.avInvAMount);
                        cmd.Parameters.AddWithValue("@avInvDate", courseEvent.avInvDate);
                        cmd.Parameters.AddWithValue("@avInvCode", courseEvent.avInvCode);
                        cmd.Parameters.AddWithValue("@manualFeePerparticipant", courseEvent.manualFeePerparticipant);
                        cmd.Parameters.AddWithValue("@manualInvNo", courseEvent.manualInvNo);
                        cmd.Parameters.AddWithValue("@manualInvAMount", courseEvent.manualInvAMount);
                        cmd.Parameters.AddWithValue("@manualInvDate", courseEvent.manualInvDate);
                        cmd.Parameters.AddWithValue("@manualInvCode", courseEvent.manualInvCode);
                        cmd.Parameters.AddWithValue("@sundrySupplies", courseEvent.sundrySupplies);
                        cmd.Parameters.AddWithValue("@sundryInvNo", courseEvent.sundryInvNo);
                        cmd.Parameters.AddWithValue("@sundryInvAMount", courseEvent.sundryInvAMount);
                        cmd.Parameters.AddWithValue("@sundryInvDate", courseEvent.sundryInvDate);
                        cmd.Parameters.AddWithValue("@sundryInvCode", courseEvent.sundryInvCode);
                        /*cmd.Parameters.AddWithValue("@isModified", courseEvent.isModified);
                        cmd.Parameters.AddWithValue("@isForeCastApproved", courseEvent.isForeCastApproved);
                        cmd.Parameters.AddWithValue("@isSignedOff", courseEvent.isSignedOff);*/
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                    using (var cmd = con.CreateCommand())
                    {
                        con.Open();
                        cmd.CommandText = "DELETE FROM presenter_tutor_convener WHERE courseCode = @courseCode";
                        cmd.Parameters.AddWithValue("@courseCode", courseEvent.courseCode);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    using (var cmd = con.CreateCommand())
                    {
                        con.Open();
                        cmd.CommandText = "DELETE FROM other_expenses WHERE courseCode = @courseCode";
                        cmd.Parameters.AddWithValue("@courseCode", courseEvent.courseCode);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                    foreach (var item in lRp)
                    {
                        string resQuery = @"insert into presenter_tutor_convener(courseCode
                                            ,rtype
                                            ,resource_person_id
                                            ,session_
                                            ,hours_
                                            ,rate
                                            ,accomadation
                                            ,travelEx
                                            ,meal
                                            ,taxi
                                            ,expenseCode
                                            ,invNumber
                                            ,datePaid
                                            ,amount)
                                            values(
                                                 @courseCode
                                                ,@rtype
                                                ,@resource_person_id
                                                ,@session_
                                                ,@hours_
                                                ,@rate
                                                ,@accomadation
                                                ,@travelEx
                                                ,@meal
                                                ,@taxi
                                                ,@expenseCode
                                                ,@invNumber
                                                ,@datePaid
                                                ,@amount)";
                        using (MySqlCommand cmd = new MySqlCommand(resQuery))
                        {
                            cmd.CommandType = CommandType.Text;
                            //cmd.Parameters.AddWithValue("@id", courseInfoes.id);
                            cmd.Parameters.AddWithValue("@courseCode", item.courseCode);
                            cmd.Parameters.AddWithValue("@rtype", item.rtype);
                            cmd.Parameters.AddWithValue("@resource_person_id", item.resource_person_id);
                            cmd.Parameters.AddWithValue("@session_", item.session_);
                            cmd.Parameters.AddWithValue("@hours_", item.hours_);
                            cmd.Parameters.AddWithValue("@rate", item.rate);
                            cmd.Parameters.AddWithValue("@accomadation", item.accomadation);
                            cmd.Parameters.AddWithValue("@travelEx", item.travelEx);
                            cmd.Parameters.AddWithValue("@meal", item.meal);
                            cmd.Parameters.AddWithValue("@taxi", item.taxi);
                            cmd.Parameters.AddWithValue("@expenseCode", item.expenseCode);
                            cmd.Parameters.AddWithValue("@invNumber", item.invNumber);
                            cmd.Parameters.AddWithValue("@datePaid", item.datePaid);
                            cmd.Parameters.AddWithValue("@amount", item.amount);
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            //txn.Commit();
                        }
                    }

                    foreach (var item in lOp)
                    {
                        string resQuery = @"insert into other_expenses(courseCode
                                                    ,otherExpenseName
                                                    ,expenseCode
                                                    ,amount
                                                    ,invNumber
                                                    ,invAmount
                                                    ,datePaid
                                                    ,invExpCode
                                                    )
                                            values(
                                                 @courseCode
                                                ,@otherExpenseName
                                                ,@expenseCode
                                                ,@amount
                                                ,@invNumber
                                                ,@invAmount
                                                ,@datePaid
                                                ,@invExpCode)";
                        using (MySqlCommand cmd = new MySqlCommand(resQuery))
                        {
                            cmd.CommandType = CommandType.Text;
                            //cmd.Parameters.AddWithValue("@id", courseInfoes.id);
                            cmd.Parameters.AddWithValue("@courseCode", item.courseCode);
                            cmd.Parameters.AddWithValue("@otherExpenseName", item.otherExpenseName);
                            cmd.Parameters.AddWithValue("@expenseCode", item.expenseCode);
                            cmd.Parameters.AddWithValue("@amount", item.amount);
                            cmd.Parameters.AddWithValue("@invNumber", item.invNumber);
                            cmd.Parameters.AddWithValue("@invAmount", item.invAmount);
                            cmd.Parameters.AddWithValue("@datePaid", item.datePaid);
                            cmd.Parameters.AddWithValue("@invExpCode", item.invExpCode);
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
                return 0;
            }
            catch (Exception ex)
            {
                return 1;
            }
            finally
            {
                conn.Close();
            }
        }

        private int InsertCourseEvent(CourseEvent courseEvent, List<ResourcePerson> lRp, List<OtherExpenses> lOp)
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    MySqlTransaction txn;
                    string insQuery = getSaveQuery();
                    using (MySqlCommand cmd = new MySqlCommand(insQuery))
                    {
                        cmd.CommandType = CommandType.Text;
                        //cmd.Parameters.AddWithValue("@id", courseInfoes.id);
                        cmd.Parameters.AddWithValue("@courseCode", courseEvent.courseCode);
                        cmd.Parameters.AddWithValue("@courseName", courseEvent.courseName);
                        cmd.Parameters.AddWithValue("@aptifyId", courseEvent.aptifyId);
                        cmd.Parameters.AddWithValue("@courseStatus", courseEvent.courseStatus);
                        cmd.Parameters.AddWithValue("@group_", courseEvent.group_);
                        cmd.Parameters.AddWithValue("@CPDHours", courseEvent.CPDHours);
                        cmd.Parameters.AddWithValue("@CourseLevel", courseEvent.CourseLevel);
                        cmd.Parameters.AddWithValue("@co_host", courseEvent.co_host);
                        cmd.Parameters.AddWithValue("@CourseDurationDays", courseEvent.CourseDurationDays);
                        cmd.Parameters.AddWithValue("@coordinator", courseEvent.coordinator);
                        cmd.Parameters.AddWithValue("@Additional_group", courseEvent.Additional_group);
                        cmd.Parameters.AddWithValue("@country", courseEvent.country);
                        cmd.Parameters.AddWithValue("@state_", courseEvent.state_);
                        cmd.Parameters.AddWithValue("@reg_metro_int", courseEvent.reg_metro_int);
                        cmd.Parameters.AddWithValue("@venue", courseEvent.venue);
                        cmd.Parameters.AddWithValue("@suburb_city", courseEvent.suburb_city);
                        cmd.Parameters.AddWithValue("@zipcode", courseEvent.zipcode);
                        cmd.Parameters.AddWithValue("@courseDate", courseEvent.courseDate);
                        cmd.Parameters.AddWithValue("@StartDate", courseEvent.StartDate);
                        cmd.Parameters.AddWithValue("@EndDate", courseEvent.EndDate);
                        cmd.Parameters.AddWithValue("@cretedby", courseEvent.cretedby);
                        cmd.Parameters.AddWithValue("@createdon", System.DateTime.Now);
                        cmd.Parameters.AddWithValue("@NoPresenters", courseEvent.NoPresenters);
                        cmd.Parameters.AddWithValue("@totalConsultantIncPresenter", courseEvent.totalConsultantIncPresenter);
                        cmd.Parameters.AddWithValue("@numberofFreePlace", courseEvent.numberofFreePlace);
                        cmd.Parameters.AddWithValue("@minimumParticipant", courseEvent.minimumParticipant);
                        cmd.Parameters.AddWithValue("@averageParticipant", courseEvent.averageParticipant);
                        cmd.Parameters.AddWithValue("@minimumAchieve40PerMargin", courseEvent.minimumAchieve40PerMargin);
                        cmd.Parameters.AddWithValue("@maximumAvailable", courseEvent.maximumAvailable);
                        cmd.Parameters.AddWithValue("@contributionOverheadPercent", courseEvent.contributionOverheadPercent);
                        cmd.Parameters.AddWithValue("@participantFeeEBDistantMin", courseEvent.participantFeeEBDistantMin);
                        cmd.Parameters.AddWithValue("@diffBWEBSP", courseEvent.diffBWEBSP);
                        cmd.Parameters.AddWithValue("@participantPerEBDistant", courseEvent.participantPerEBDistant);
                        cmd.Parameters.AddWithValue("@participantPerEBApa", courseEvent.participantPerEBApa);
                        cmd.Parameters.AddWithValue("@participantPerEBNonMember", courseEvent.participantPerEBNonMember);
                        cmd.Parameters.AddWithValue("@participantPerNonDistant", courseEvent.participantPerNonDistant);
                        cmd.Parameters.AddWithValue("@participantPerNonApa", courseEvent.participantPerNonApa);
                        cmd.Parameters.AddWithValue("@participantPerNonMember", courseEvent.participantPerNonMember);
                        cmd.Parameters.AddWithValue("@actparticipantEBDistant", courseEvent.actparticipantEBDistant);
                        cmd.Parameters.AddWithValue("@actparticipantEBApa", courseEvent.actparticipantEBApa);
                        cmd.Parameters.AddWithValue("@actparticipantEBNonMember", courseEvent.actparticipantEBNonMember);
                        cmd.Parameters.AddWithValue("@actparticipantNonDistant", courseEvent.actparticipantNonDistant);
                        cmd.Parameters.AddWithValue("@actparticipantNonApa", courseEvent.actparticipantNonApa);
                        cmd.Parameters.AddWithValue("@actparticipantNonMember", courseEvent.actparticipantNonMember);
                        cmd.Parameters.AddWithValue("@sponsorshipMin", courseEvent.sponsorshipMin);
                        cmd.Parameters.AddWithValue("@morningTeaDays", courseEvent.morningTeaDays);
                        cmd.Parameters.AddWithValue("@morningTeaRate", courseEvent.morningTeaRate);
                        cmd.Parameters.AddWithValue("@teaInvNo", courseEvent.teaInvNo);
                        cmd.Parameters.AddWithValue("@teaInvAMount", courseEvent.teaInvAMount);
                        cmd.Parameters.AddWithValue("@teaInvDate", courseEvent.teaInvDate);
                        cmd.Parameters.AddWithValue("@teaInvCode", courseEvent.teaInvCode);
                        cmd.Parameters.AddWithValue("@lunchDays", courseEvent.lunchDays);
                        cmd.Parameters.AddWithValue("@lunchRate", courseEvent.lunchRate);
                        cmd.Parameters.AddWithValue("@lunchInvNo", courseEvent.lunchInvNo);
                        cmd.Parameters.AddWithValue("@lunchInvAMount", courseEvent.lunchInvAMount);
                        cmd.Parameters.AddWithValue("@lunchInvDate", courseEvent.lunchInvDate);
                        cmd.Parameters.AddWithValue("@lunchInvCode", courseEvent.lunchInvCode);
                        cmd.Parameters.AddWithValue("@afternoonTeaDays", courseEvent.afternoonTeaDays);
                        cmd.Parameters.AddWithValue("@afternoonTeaRate", courseEvent.afternoonTeaRate);
                        cmd.Parameters.AddWithValue("@aTeaInvNo", courseEvent.aTeaInvNo);
                        cmd.Parameters.AddWithValue("@aTeaInvAMount", courseEvent.aTeaInvAMount);
                        cmd.Parameters.AddWithValue("@aTeaInvDate", courseEvent.aTeaInvDate);
                        cmd.Parameters.AddWithValue("@aTeaInvCode", courseEvent.aTeaInvCode);
                        cmd.Parameters.AddWithValue("@venueHireDays", courseEvent.venueHireDays);
                        cmd.Parameters.AddWithValue("@venueHireRate", courseEvent.venueHireRate);
                        cmd.Parameters.AddWithValue("@venueInvNo", courseEvent.venueInvNo);
                        cmd.Parameters.AddWithValue("@venueInvAMount", courseEvent.venueInvAMount);
                        cmd.Parameters.AddWithValue("@venueInvDate", courseEvent.venueInvDate);
                        cmd.Parameters.AddWithValue("@venueInvCode", courseEvent.venueInvCode);
                        cmd.Parameters.AddWithValue("@poolHireDays", courseEvent.poolHireDays);
                        cmd.Parameters.AddWithValue("@poolHireRate", courseEvent.poolHireRate);
                        cmd.Parameters.AddWithValue("@poolInvNo", courseEvent.poolInvNo);
                        cmd.Parameters.AddWithValue("@poolInvAMount", courseEvent.poolInvAMount);
                        cmd.Parameters.AddWithValue("@poolInvDate", courseEvent.poolInvDate);
                        cmd.Parameters.AddWithValue("@poolInvCode", courseEvent.poolInvCode);
                        cmd.Parameters.AddWithValue("@avHireDays", courseEvent.avHireDays);
                        cmd.Parameters.AddWithValue("@avHireRate", courseEvent.avHireRate);
                        cmd.Parameters.AddWithValue("@avInvNo", courseEvent.avInvNo);
                        cmd.Parameters.AddWithValue("@avInvAMount", courseEvent.avInvAMount);
                        cmd.Parameters.AddWithValue("@avInvDate", courseEvent.avInvDate);
                        cmd.Parameters.AddWithValue("@avInvCode", courseEvent.avInvCode);
                        cmd.Parameters.AddWithValue("@manualFeePerparticipant", courseEvent.manualFeePerparticipant);
                        cmd.Parameters.AddWithValue("@manualInvNo", courseEvent.manualInvNo);
                        cmd.Parameters.AddWithValue("@manualInvAMount", courseEvent.manualInvAMount);
                        cmd.Parameters.AddWithValue("@manualInvDate", courseEvent.manualInvDate);
                        cmd.Parameters.AddWithValue("@manualInvCode", courseEvent.manualInvCode);
                        cmd.Parameters.AddWithValue("@sundrySupplies", courseEvent.sundrySupplies);
                        cmd.Parameters.AddWithValue("@sundryInvNo", courseEvent.sundryInvNo);
                        cmd.Parameters.AddWithValue("@sundryInvAMount", courseEvent.sundryInvAMount);
                        cmd.Parameters.AddWithValue("@sundryInvDate", courseEvent.sundryInvDate);
                        cmd.Parameters.AddWithValue("@sundryInvCode", courseEvent.sundryInvCode);
                        /*cmd.Parameters.AddWithValue("@isModified", courseEvent.isModified);
                        cmd.Parameters.AddWithValue("@isForeCastApproved", courseEvent.isForeCastApproved);
                        cmd.Parameters.AddWithValue("@isSignedOff", courseEvent.isSignedOff);*/
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    foreach (var item in lRp)
                    {
                        string resQuery = @"insert into presenter_tutor_convener(courseCode
                                            ,rtype
                                            ,resource_person_id
                                            ,session_
                                            ,hours_
                                            ,rate
                                            ,accomadation
                                            ,travelEx
                                            ,meal
                                            ,taxi
                                            ,expenseCode
                                            ,invNumber
                                            ,datePaid
                                            ,amount)
                                            values(
                                                 @courseCode
                                                ,@rtype
                                                ,@resource_person_id
                                                ,@session_
                                                ,@hours_
                                                ,@rate
                                                ,@accomadation
                                                ,@travelEx
                                                ,@meal
                                                ,@taxi
                                                ,@expenseCode
                                                ,@invNumber
                                                ,@datePaid
                                                ,@amount)";
                        using (MySqlCommand cmd = new MySqlCommand(resQuery))
                        {
                            cmd.CommandType = CommandType.Text;
                            //cmd.Parameters.AddWithValue("@id", courseInfoes.id);
                            cmd.Parameters.AddWithValue("@courseCode", item.courseCode);
                            cmd.Parameters.AddWithValue("@rtype", item.rtype);
                            cmd.Parameters.AddWithValue("@resource_person_id", item.resource_person_id);
                            cmd.Parameters.AddWithValue("@session_", item.session_);
                            cmd.Parameters.AddWithValue("@hours_", item.hours_);
                            cmd.Parameters.AddWithValue("@rate", item.rate);
                            cmd.Parameters.AddWithValue("@accomadation", item.accomadation);
                            cmd.Parameters.AddWithValue("@travelEx", item.travelEx);
                            cmd.Parameters.AddWithValue("@meal", item.meal);
                            cmd.Parameters.AddWithValue("@taxi", item.taxi);
                            cmd.Parameters.AddWithValue("@expenseCode", item.expenseCode);
                            cmd.Parameters.AddWithValue("@invNumber", item.invNumber);
                            cmd.Parameters.AddWithValue("@datePaid", item.datePaid);
                            cmd.Parameters.AddWithValue("@amount", item.amount);
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            //txn.Commit();
                        }
                    }

                    foreach (var item in lOp)
                    {
                        string resQuery = @"insert into other_expenses(courseCode
                                                    ,otherExpenseName
                                                    ,expenseCode
                                                    ,amount
                                                    ,invNumber
                                                    ,invAmount
                                                    ,datePaid
                                                    ,invExpCode
                                                    )
                                            values(
                                                 @courseCode
                                                ,@otherExpenseName
                                                ,@expenseCode
                                                ,@amount
                                                ,@invNumber
                                                ,@invAmount
                                                ,@datePaid
                                                ,@invExpCode)";
                        using (MySqlCommand cmd = new MySqlCommand(resQuery))
                        {
                            cmd.CommandType = CommandType.Text;
                            //cmd.Parameters.AddWithValue("@id", courseInfoes.id);
                            cmd.Parameters.AddWithValue("@courseCode", item.courseCode);
                            cmd.Parameters.AddWithValue("@otherExpenseName", item.otherExpenseName);
                            cmd.Parameters.AddWithValue("@expenseCode", item.expenseCode);
                            cmd.Parameters.AddWithValue("@amount", item.amount);
                            cmd.Parameters.AddWithValue("@invNumber", item.invNumber);
                            cmd.Parameters.AddWithValue("@invAmount", item.invAmount);
                            cmd.Parameters.AddWithValue("@datePaid", item.datePaid);
                            cmd.Parameters.AddWithValue("@invExpCode", item.invExpCode);
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
                return 0;
            }
            catch (Exception ex)
            {
               return 1;
            }
            finally{
                conn.Close();
            }
        }

        public string getSaveQuery()
        {
            string query = @"insert into courseevent(courseCode
                            ,courseName
                            ,aptifyId
                            ,courseStatus
                            ,group_
                            ,CPDHours
                            ,CourseLevel
                            ,co_host
                            ,CourseDurationDays
                            ,coordinator
                            ,Additional_group
                            ,country
                            ,state_
                            ,reg_metro_int
                            ,venue
                            ,suburb_city
                            ,zipcode
                            ,courseDate
                            ,StartDate
                            ,EndDate
                            ,cretedby
                            ,createdon
                            ,NoPresenters
                            ,totalConsultantIncPresenter
                            ,numberofFreePlace
                            ,minimumParticipant
                            ,averageParticipant
                            ,minimumAchieve40PerMargin
                            ,maximumAvailable
                            ,contributionOverheadPercent
                            ,participantFeeEBDistantMin
                            ,diffBWEBSP
                            ,participantPerEBDistant
                            ,participantPerEBApa
                            ,participantPerEBNonMember
                            ,participantPerNonDistant
                            ,participantPerNonApa
                            ,participantPerNonMember
                            ,actparticipantEBDistant
                            ,actparticipantEBApa
                            ,actparticipantEBNonMember
                            ,actparticipantNonDistant
                            ,actparticipantNonApa
                            ,actparticipantNonMember
                            ,sponsorshipMin
                            ,morningTeaDays
                            ,morningTeaRate
                            ,teaInvNo
                            ,teaInvAMount
                            ,teaInvDate
                            ,teaInvCode
                            ,lunchDays
                            ,lunchRate
                            ,lunchInvNo
                            ,lunchInvAMount
                            ,lunchInvDate
                            ,lunchInvCode
                            ,afternoonTeaDays
                            ,afternoonTeaRate
                            ,aTeaInvNo
                            ,aTeaInvAMount
                            ,aTeaInvDate
                            ,aTeaInvCode
                            ,venueHireDays
                            ,venueHireRate
                            ,venueInvNo
                            ,venueInvAMount
                            ,venueInvDate
                            ,venueInvCode
                            ,poolHireDays
                            ,poolHireRate
                            ,poolInvNo
                            ,poolInvAMount
                            ,poolInvDate
                            ,poolInvCode
                            ,avHireDays
                            ,avHireRate
                            ,avInvNo
                            ,avInvAMount
                            ,avInvDate
                            ,avInvCode
                            ,manualFeePerparticipant
                            ,manualInvNo
                            ,manualInvAMount
                            ,manualInvDate
                            ,manualInvCode
                            ,sundrySupplies
                            ,sundryInvNo
                            ,sundryInvAMount
                            ,sundryInvDate
                            ,sundryInvCode
                            ) 
                            values(@courseCode
                            ,@courseName
                            ,@aptifyId
                            ,@courseStatus
                            ,@group_
                            ,@CPDHours
                            ,@CourseLevel
                            ,@co_host
                            ,@CourseDurationDays
                            ,@coordinator
                            ,@Additional_group
                            ,@country
                            ,@state_
                            ,@reg_metro_int
                            ,@venue
                            ,@suburb_city
                            ,@zipcode
                            ,@courseDate
                            ,@StartDate
                            ,@EndDate
                            ,@cretedby
                            ,@createdon
                            ,@NoPresenters
                            ,@totalConsultantIncPresenter
                            ,@numberofFreePlace
                            ,@minimumParticipant
                            ,@averageParticipant
                            ,@minimumAchieve40PerMargin
                            ,@maximumAvailable
                            ,@contributionOverheadPercent
                            ,@participantFeeEBDistantMin
                            ,@diffBWEBSP
                            ,@participantPerEBDistant
                            ,@participantPerEBApa
                            ,@participantPerEBNonMember
                            ,@participantPerNonDistant
                            ,@participantPerNonApa
                            ,@participantPerNonMember
                            ,@actparticipantEBDistant
                            ,@actparticipantEBApa
                            ,@actparticipantEBNonMember
                            ,@actparticipantNonDistant
                            ,@actparticipantNonApa
                            ,@actparticipantNonMember
                            ,@sponsorshipMin
                            ,@morningTeaDays
                            ,@morningTeaRate
                            ,@teaInvNo
                            ,@teaInvAMount
                            ,@teaInvDate
                            ,@teaInvCode
                            ,@lunchDays
                            ,@lunchRate
                            ,@lunchInvNo
                            ,@lunchInvAMount
                            ,@lunchInvDate
                            ,@lunchInvCode
                            ,@afternoonTeaDays
                            ,@afternoonTeaRate
                            ,@aTeaInvNo
                            ,@aTeaInvAMount
                            ,@aTeaInvDate
                            ,@aTeaInvCode
                            ,@venueHireDays
                            ,@venueHireRate
                            ,@venueInvNo
                            ,@venueInvAMount
                            ,@venueInvDate
                            ,@venueInvCode
                            ,@poolHireDays
                            ,@poolHireRate
                            ,@poolInvNo
                            ,@poolInvAMount
                            ,@poolInvDate
                            ,@poolInvCode
                            ,@avHireDays
                            ,@avHireRate
                            ,@avInvNo
                            ,@avInvAMount
                            ,@avInvDate
                            ,@avInvCode
                            ,@manualFeePerparticipant
                            ,@manualInvNo
                            ,@manualInvAMount
                            ,@manualInvDate
                            ,@manualInvCode
                            ,@sundrySupplies
                            ,@sundryInvNo
                            ,@sundryInvAMount
                            ,@sundryInvDate
                            ,@sundryInvCode
                            )";
            return query;
        }

        public string getUpdateQuery()
        {
            string query = @"UPDATE courseevent SET 
			courseName=@courseName
			,aptifyId=@aptifyId
			,courseStatus=@courseStatus
			,group_=@group_
			,CPDHours=@CPDHours
			,CourseLevel=@CourseLevel
			,co_host=@co_host
			,CourseDurationDays=@CourseDurationDays
			,coordinator=@coordinator
			,Additional_group=@Additional_group
			,country=@country
			,state_=@state_
			,reg_metro_int=@reg_metro_int
			,venue=@venue
			,suburb_city=@suburb_city
			,zipcode=@zipcode
			,courseDate=@courseDate
			,StartDate=@StartDate
			,EndDate=@EndDate
			,modifiedby=@modifiedby
			,modifiedon=@modifiedon
			,NoPresenters=@NoPresenters
			,totalConsultantIncPresenter=@totalConsultantIncPresenter
			,numberofFreePlace=@numberofFreePlace
			,minimumParticipant=@minimumParticipant
			,averageParticipant=@averageParticipant
			,minimumAchieve40PerMargin=@minimumAchieve40PerMargin
			,maximumAvailable=@maximumAvailable
			,contributionOverheadPercent=@contributionOverheadPercent
			,participantFeeEBDistantMin=@participantFeeEBDistantMin
			,diffBWEBSP=@diffBWEBSP
			,participantPerEBDistant=@participantPerEBDistant
			,participantPerEBApa=@participantPerEBApa
			,participantPerEBNonMember=@participantPerEBNonMember
			,participantPerNonDistant=@participantPerNonDistant
			,participantPerNonApa=@participantPerNonApa
			,participantPerNonMember=@participantPerNonMember
			,actparticipantEBDistant=@actparticipantEBDistant
			,actparticipantEBApa=@actparticipantEBApa
			,actparticipantEBNonMember=@actparticipantEBNonMember
			,actparticipantNonDistant=@actparticipantNonDistant
			,actparticipantNonApa=@actparticipantNonApa
			,actparticipantNonMember=@actparticipantNonMember
			,sponsorshipMin=@sponsorshipMin
			,morningTeaDays=@morningTeaDays
			,morningTeaRate=@morningTeaRate
			,teaInvNo=@teaInvNo
			,teaInvAMount=@teaInvAMount
			,teaInvDate=@teaInvDate
			,teaInvCode=@teaInvCode
			,lunchDays=@lunchDays
			,lunchRate=@lunchRate
			,lunchInvNo=@lunchInvNo
			,lunchInvAMount=@lunchInvAMount
			,lunchInvDate=@lunchInvDate
			,lunchInvCode=@lunchInvCode
			,afternoonTeaDays=@afternoonTeaDays
			,afternoonTeaRate=@afternoonTeaRate
			,aTeaInvNo=@aTeaInvNo
			,aTeaInvAMount=@aTeaInvAMount
			,aTeaInvDate=@aTeaInvDate
			,aTeaInvCode=@aTeaInvCode
			,venueHireDays=@venueHireDays
			,venueHireRate=@venueHireRate
			,venueInvNo=@venueInvNo
			,venueInvAMount=@venueInvAMount
			,venueInvDate=@venueInvDate
			,venueInvCode=@venueInvCode
			,poolHireDays=@poolHireDays
			,poolHireRate=@poolHireRate
			,poolInvNo=@poolInvNo
			,poolInvAMount=@poolInvAMount
			,poolInvDate=@poolInvDate
			,poolInvCode=@poolInvCode
			,avHireDays=@avHireDays
			,avHireRate=@avHireRate
			,avInvNo=@avInvNo
			,avInvAMount=@avInvAMount
			,avInvDate=@avInvDate
			,avInvCode=@avInvCode
			,manualFeePerparticipant=@manualFeePerparticipant
			,manualInvNo=@manualInvNo
			,manualInvAMount=@manualInvAMount
			,manualInvDate=@manualInvDate
			,manualInvCode=@manualInvCode
			,sundrySupplies=@sundrySupplies
			,sundryInvNo=@sundryInvNo
			,sundryInvAMount=@sundryInvAMount
			,sundryInvDate=@sundryInvDate
			,sundryInvCode=@sundryInvCode
			WHERE courseCode=@courseCode";
            return query;
        }
        protected void txtActIncomeNonMemberMin_TextChanged(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static CourseEventResourceExpenses GetCourseData(string CourseCode)
        {
            string zip;

            CourseEventResourceExpenses courseEventResourceExpenses = new CourseEventResourceExpenses();
            CourseEvent courseEvent = new CourseEvent();
            List<ResourcePerson> lstResourcePerson = new List<ResourcePerson>();
            List<OtherExpenses> lstOtherExpenses = new List<OtherExpenses>();
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    using (MySqlCommand cmd = new MySqlCommand("select * from courseevent where courseCode = @courseCode"))
                    {
                        DataSet ds = new DataSet();
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@courseCode", CourseCode);
                        cmd.Connection = con;
                        con.Open();

                        MySqlDataAdapter dap = new MySqlDataAdapter(cmd);
                        dap.Fill(ds);
                        courseEvent = PopulateCourseEvent(ds);
                        con.Close();

                    }
                    using (MySqlCommand cmd = new MySqlCommand("select * from presenter_tutor_convener where courseCode = @courseCode"))
                    {
                        DataTable dt = new DataTable();
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@courseCode", CourseCode);
                        cmd.Connection = con;
                        con.Open();

                        MySqlDataAdapter dap = new MySqlDataAdapter(cmd);
                        dap.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            lstResourcePerson = PopulateResourcePersonList(dt);
                        }
                        con.Close();

                    }
                    using (MySqlCommand cmd = new MySqlCommand("select * from other_expenses where courseCode = @courseCode"))
                    {
                        DataTable dt = new DataTable();
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@courseCode", CourseCode);
                        cmd.Connection = con;
                        con.Open();

                        MySqlDataAdapter dap = new MySqlDataAdapter(cmd);
                        dap.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            lstOtherExpenses = PopulateOtherExpensesList(dt);
                        }

                        con.Close();

                    }

                    courseEventResourceExpenses.courseEvent = courseEvent;
                    courseEventResourceExpenses.ResourcePersons = lstResourcePerson;
                    courseEventResourceExpenses.OtherExpenses = lstOtherExpenses;
                }
                return courseEventResourceExpenses;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        private static List<OtherExpenses> PopulateOtherExpensesList(DataTable dt)
        {
            List<OtherExpenses> expensesList = new List<OtherExpenses>();
            foreach (DataRow dr in dt.Rows)
            {
                OtherExpenses otherExpenses = new OtherExpenses();
                otherExpenses.id = int.Parse(dr["id"].ToString());
                otherExpenses.courseCode = dr["courseCode"].ToString();
                otherExpenses.otherExpenseName = dr["otherExpenseName"].ToString();
                otherExpenses.expenseCode = dr["expenseCode"].ToString();
                otherExpenses.exPer = dr["exPer"].ToString() == "" ? 0 : Convert.ToDecimal(dr["exPer"].ToString());
                otherExpenses.amount = dr["amount"].ToString() == "" ? 0 : Decimal.Parse(dr["amount"].ToString());
                otherExpenses.invNumber = dr["invNumber"].ToString();
                otherExpenses.invAmount = dr["invAmount"].ToString() == "" ? 0 : Decimal.Parse(dr["invAmount"].ToString());
                otherExpenses.datePaid = dr["datePaid"].ToString();
                otherExpenses.invExpCode = dr["invExpCode"].ToString();
                expensesList.Add(otherExpenses);
            }
            return expensesList;
        }

        private static List<ResourcePerson> PopulateResourcePersonList(DataTable dt)
        {
            List<ResourcePerson> lstResourcePerson = new List<ResourcePerson>();
            foreach (DataRow dr in dt.Rows)
            {
                ResourcePerson resourcePerson = new ResourcePerson();
                resourcePerson.id = int.Parse(dr["id"].ToString());
                resourcePerson.courseCode = dr["courseCode"].ToString();
                resourcePerson.rtype = dr["rtype"].ToString();
                resourcePerson.resource_person_id = int.Parse(dr["resource_person_id"].ToString());
                resourcePerson.session_ = dr["session_"].ToString();
                resourcePerson.hours_ = dr["hours_"].ToString();
                resourcePerson.rate = Decimal.Parse(dr["rate"].ToString());
                resourcePerson.accomadation = Decimal.Parse(dr["accomadation"].ToString());
                resourcePerson.travelEx = Convert.ToDecimal(dr["travelEx"].ToString());
                resourcePerson.meal = Decimal.Parse(dr["meal"].ToString());
                resourcePerson.taxi = Decimal.Parse(dr["taxi"].ToString());
                resourcePerson.expenseCode = dr["expenseCode"].ToString();
                resourcePerson.invNumber = dr["invNumber"].ToString();
                resourcePerson.datePaid = dr["datePaid"].ToString();
                resourcePerson.amount = Decimal.Parse(dr["amount"].ToString());

                lstResourcePerson.Add(resourcePerson);
            }
            return lstResourcePerson;
        }

        private static CourseEvent PopulateCourseEvent(DataSet ds)
        {
            CourseEvent courseEvent = new CourseEvent();
            courseEvent.id = Convert.ToInt32(ds.Tables[0].Rows[0]["id"].ToString());
            courseEvent.courseCode = ds.Tables[0].Rows[0]["courseCode"].ToString();
            courseEvent.courseName = ds.Tables[0].Rows[0]["courseName"].ToString();
            courseEvent.aptifyId = ds.Tables[0].Rows[0]["aptifyId"].ToString();
            courseEvent.courseStatus = ds.Tables[0].Rows[0]["courseStatus"].ToString();
            courseEvent.group_ = ds.Tables[0].Rows[0]["group_"].ToString();
            courseEvent.CPDHours = Convert.ToDecimal(ds.Tables[0].Rows[0]["CPDHours"].ToString());
            courseEvent.CourseLevel = ds.Tables[0].Rows[0]["CourseLevel"].ToString();
            courseEvent.co_host = ds.Tables[0].Rows[0]["co_host"].ToString();
            courseEvent.CourseDurationDays =Convert.ToDecimal(ds.Tables[0].Rows[0]["CourseDurationDays"].ToString());
            courseEvent.coordinator = ds.Tables[0].Rows[0]["coordinator"].ToString();
            courseEvent.Additional_group = ds.Tables[0].Rows[0]["Additional_group"].ToString();
            courseEvent.country = ds.Tables[0].Rows[0]["country"].ToString();
            courseEvent.state_ = ds.Tables[0].Rows[0]["state_"].ToString();
            courseEvent.reg_metro_int = ds.Tables[0].Rows[0]["reg_metro_int"].ToString();
            courseEvent.venue = ds.Tables[0].Rows[0]["venue"].ToString();
            courseEvent.suburb_city = ds.Tables[0].Rows[0]["suburb_city"].ToString();
            courseEvent.zipcode = ds.Tables[0].Rows[0]["zipcode"].ToString();
            courseEvent.courseDate = ds.Tables[0].Rows[0]["courseDate"].ToString();
            courseEvent.StartDate = ds.Tables[0].Rows[0]["StartDate"].ToString();
            courseEvent.EndDate = ds.Tables[0].Rows[0]["StartDate"].ToString();
            courseEvent.cretedby = ds.Tables[0].Rows[0]["cretedby"].ToString();
            courseEvent.createdon = ds.Tables[0].Rows[0]["createdon"].ToString();
            courseEvent.modifiedby = ds.Tables[0].Rows[0]["modifiedby"].ToString();
            courseEvent.modifiedon = ds.Tables[0].Rows[0]["modifiedon"].ToString();
            courseEvent.forecastapprovedby = ds.Tables[0].Rows[0]["forecastapprovedby"].ToString();
            courseEvent.forecastapprovedate = ds.Tables[0].Rows[0]["forecastapprovedate"].ToString();
            courseEvent.signedoffby = ds.Tables[0].Rows[0]["signedoffby"].ToString();
            courseEvent.signedoffon = ds.Tables[0].Rows[0]["signedoffon"].ToString();
            courseEvent.NoPresenters = Convert.ToDecimal(ds.Tables[0].Rows[0]["NoPresenters"].ToString());
            courseEvent.totalConsultantIncPresenter = Convert.ToDecimal(ds.Tables[0].Rows[0]["totalConsultantIncPresenter"].ToString());
            courseEvent.numberofFreePlace = Convert.ToDecimal(ds.Tables[0].Rows[0]["numberofFreePlace"].ToString());
            courseEvent.minimumParticipant = Convert.ToDecimal(ds.Tables[0].Rows[0]["minimumParticipant"].ToString());
            courseEvent.averageParticipant = Convert.ToDecimal(ds.Tables[0].Rows[0]["averageParticipant"].ToString());
            courseEvent.minimumAchieve40PerMargin = Convert.ToDecimal(ds.Tables[0].Rows[0]["minimumAchieve40PerMargin"].ToString());
            courseEvent.maximumAvailable = Convert.ToDecimal(ds.Tables[0].Rows[0]["maximumAvailable"].ToString());
            courseEvent.contributionOverheadPercent = Convert.ToDecimal(ds.Tables[0].Rows[0]["contributionOverheadPercent"].ToString());
            courseEvent.participantFeeEBDistantMin = Convert.ToDecimal(ds.Tables[0].Rows[0]["participantFeeEBDistantMin"].ToString());
            courseEvent.diffBWEBSP = Convert.ToDecimal(ds.Tables[0].Rows[0]["diffBWEBSP"].ToString());
            courseEvent.participantPerEBDistant = Convert.ToDecimal(ds.Tables[0].Rows[0]["participantPerEBDistant"].ToString());
            courseEvent.participantPerEBApa = Convert.ToDecimal(ds.Tables[0].Rows[0]["participantPerEBApa"].ToString());
            courseEvent.participantPerEBNonMember = Convert.ToDecimal(ds.Tables[0].Rows[0]["participantPerEBNonMember"].ToString());
            courseEvent.participantPerNonDistant = Convert.ToDecimal(ds.Tables[0].Rows[0]["participantPerNonDistant"].ToString());
            courseEvent.participantPerNonApa = Convert.ToDecimal(ds.Tables[0].Rows[0]["participantPerNonApa"].ToString());
            courseEvent.participantPerNonMember = Convert.ToDecimal(ds.Tables[0].Rows[0]["participantPerNonMember"].ToString());
            courseEvent.actparticipantEBDistant = Convert.ToDecimal(ds.Tables[0].Rows[0]["actparticipantEBDistant"].ToString());
            courseEvent.actparticipantEBApa = Convert.ToDecimal(ds.Tables[0].Rows[0]["actparticipantEBApa"].ToString());
            courseEvent.actparticipantEBNonMember = Convert.ToDecimal(ds.Tables[0].Rows[0]["actparticipantEBNonMember"].ToString());
            courseEvent.actparticipantNonDistant = Convert.ToDecimal(ds.Tables[0].Rows[0]["actparticipantNonDistant"].ToString());
            courseEvent.actparticipantNonApa = Convert.ToDecimal(ds.Tables[0].Rows[0]["actparticipantNonApa"].ToString());
            courseEvent.actparticipantNonMember = Convert.ToDecimal(ds.Tables[0].Rows[0]["actparticipantNonMember"].ToString());
            courseEvent.sponsorshipMin = Convert.ToDecimal(ds.Tables[0].Rows[0]["sponsorshipMin"].ToString());
            courseEvent.morningTeaDays = Convert.ToInt32(ds.Tables[0].Rows[0]["morningTeaDays"].ToString());
            courseEvent.morningTeaRate = Convert.ToDecimal(ds.Tables[0].Rows[0]["morningTeaRate"].ToString());
            courseEvent.teaInvNo = ds.Tables[0].Rows[0]["teaInvNo"].ToString();
            courseEvent.teaInvAMount = Convert.ToDecimal(ds.Tables[0].Rows[0]["teaInvAMount"].ToString());
            courseEvent.teaInvDate = ds.Tables[0].Rows[0]["teaInvDate"].ToString();
            courseEvent.teaInvCode = ds.Tables[0].Rows[0]["teaInvCode"].ToString();
            courseEvent.lunchDays = Convert.ToInt32(ds.Tables[0].Rows[0]["lunchDays"].ToString());
            courseEvent.lunchRate = Convert.ToDecimal(ds.Tables[0].Rows[0]["lunchRate"].ToString());
            courseEvent.lunchInvNo = ds.Tables[0].Rows[0]["lunchInvNo"].ToString();
            courseEvent.lunchInvAMount = Convert.ToDecimal(ds.Tables[0].Rows[0]["lunchInvAMount"].ToString());
            courseEvent.lunchInvDate = ds.Tables[0].Rows[0]["lunchInvDate"].ToString();
            courseEvent.lunchInvCode = ds.Tables[0].Rows[0]["lunchInvCode"].ToString();
            courseEvent.afternoonTeaDays = Convert.ToInt32(ds.Tables[0].Rows[0]["afternoonTeaDays"].ToString());
            courseEvent.afternoonTeaRate = Convert.ToDecimal(ds.Tables[0].Rows[0]["afternoonTeaRate"].ToString());
            courseEvent.aTeaInvNo = ds.Tables[0].Rows[0]["aTeaInvNo"].ToString();
            courseEvent.aTeaInvAMount = Convert.ToDecimal(ds.Tables[0].Rows[0]["aTeaInvAMount"].ToString());
            courseEvent.aTeaInvDate = ds.Tables[0].Rows[0]["aTeaInvDate"].ToString();
            courseEvent.aTeaInvCode = ds.Tables[0].Rows[0]["aTeaInvCode"].ToString();
            courseEvent.venueHireDays = Convert.ToInt32(ds.Tables[0].Rows[0]["venueHireDays"].ToString());
            courseEvent.venueHireRate = Convert.ToDecimal(ds.Tables[0].Rows[0]["venueHireRate"].ToString());
            courseEvent.venueInvNo = ds.Tables[0].Rows[0]["venueInvNo"].ToString();
            courseEvent.venueInvAMount = Convert.ToDecimal(ds.Tables[0].Rows[0]["venueInvAMount"].ToString());
            courseEvent.venueInvDate = ds.Tables[0].Rows[0]["venueInvDate"].ToString();
            courseEvent.venueInvCode = ds.Tables[0].Rows[0]["venueInvCode"].ToString();
            courseEvent.poolHireDays = Convert.ToInt32(ds.Tables[0].Rows[0]["poolHireDays"].ToString());
            courseEvent.poolHireRate = Convert.ToDecimal(ds.Tables[0].Rows[0]["poolHireRate"].ToString());
            courseEvent.poolInvNo = ds.Tables[0].Rows[0]["poolInvNo"].ToString();
            courseEvent.poolInvAMount = Convert.ToDecimal(ds.Tables[0].Rows[0]["poolInvAMount"].ToString());
            courseEvent.poolInvDate = ds.Tables[0].Rows[0]["poolInvDate"].ToString();
            courseEvent.poolInvCode = ds.Tables[0].Rows[0]["poolInvCode"].ToString();
            courseEvent.avHireDays = Convert.ToInt32(ds.Tables[0].Rows[0]["avHireDays"].ToString());
            courseEvent.avHireRate = Convert.ToDecimal(ds.Tables[0].Rows[0]["avHireRate"].ToString());
            courseEvent.avInvNo = ds.Tables[0].Rows[0]["avInvNo"].ToString();
            courseEvent.avInvAMount = Convert.ToDecimal(ds.Tables[0].Rows[0]["avInvAMount"].ToString());
            courseEvent.avInvDate = ds.Tables[0].Rows[0]["avInvDate"].ToString();
            courseEvent.avInvCode = ds.Tables[0].Rows[0]["avInvCode"].ToString();
            courseEvent.manualFeePerparticipant = Convert.ToDecimal(ds.Tables[0].Rows[0]["manualFeePerparticipant"].ToString());
            courseEvent.manualInvNo = ds.Tables[0].Rows[0]["manualInvNo"].ToString();
            courseEvent.manualInvAMount = Convert.ToDecimal(ds.Tables[0].Rows[0]["manualInvAMount"].ToString());
            courseEvent.manualInvDate = ds.Tables[0].Rows[0]["manualInvDate"].ToString();
            courseEvent.manualInvCode = ds.Tables[0].Rows[0]["manualInvCode"].ToString();
            courseEvent.sundrySupplies = Convert.ToDecimal(ds.Tables[0].Rows[0]["sundrySupplies"].ToString());
            courseEvent.sundryInvNo = ds.Tables[0].Rows[0]["sundryInvNo"].ToString();
            courseEvent.sundryInvAMount = Convert.ToDecimal(ds.Tables[0].Rows[0]["sundryInvAMount"].ToString());
            courseEvent.sundryInvDate = ds.Tables[0].Rows[0]["sundryInvDate"].ToString();
            courseEvent.sundryInvCode = ds.Tables[0].Rows[0]["sundryInvCode"].ToString();
            courseEvent.isModified = ds.Tables[0].Rows[0]["isModified"].ToString();
            courseEvent.isForeCastApproved = ds.Tables[0].Rows[0]["isForeCastApproved"].ToString();
            courseEvent.isSignedOff = ds.Tables[0].Rows[0]["isSignedOff"].ToString();

            return courseEvent;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BudgetEntry");
        }
    }
}