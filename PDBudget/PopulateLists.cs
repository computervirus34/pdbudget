using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace PDBudget
{
    public class PopulateLists
    {
        string strSql = String.Empty;
        DataReader _reader = new DataReader();
        //StringBuilder SBQueryBuilder;

        public DataTable GetPDBudgetCourseInfo()
        {
            DataTable dtCourseList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseList = _reader.GetDataTableByCommandFromStoredProc("GetPDBudgetCourseInfo", ht);
            return dtCourseList;
        }

        public DataTable GetPDBudgetSuburb(string state)
        {
            DataTable dtCourseList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseList = _reader.GetSuburbFromStoredProc("GetPDBudgetSuburbInfo", ht, state);
            return dtCourseList;
        }


        public DataTable GetParameter(string type)
        {
            DataTable dtCourseList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseList = _reader.GetParameterListByTypeFromProc("GetParameterListByType", ht, type);
            return dtCourseList;
        }

        public DataTable GetNumberParameter(string type)
        {
            DataTable dtCourseList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseList = _reader.GetNumberParameterListByTypeFromProc("GetNumberParameter", ht, type);
            return dtCourseList;
        }
        public DataTable GetResourceInfo(string type)
        {
            DataTable dtCourseList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseList = _reader.GetResourceInfoFromProc("GetResourceInfo", ht, type);
            return dtCourseList;
        }

        public DataTable GetExpenseType()
        {
            DataTable dtCourseList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseList = _reader.GetExpenseListFromProc("GetExpenseType", ht);
            return dtCourseList;
        }
        public DataTable GetPDGroupInfo()
        {
            DataTable dtGroupList = new DataTable();
            Hashtable ht = new Hashtable();
            dtGroupList = _reader.GetDataTableByCommandFromStoredProc("GetPDGroupInfo", ht);
            return dtGroupList;
        }
        public DataTable GetPDStatusInfo()
        {
            DataTable dtStatusList = new DataTable();
            Hashtable ht = new Hashtable();
            dtStatusList = _reader.GetDataTableByCommandFromStoredProc("GetPDStatusInfo", ht);
            return dtStatusList;
        }
        public DataTable GetPDStateInfo()
        {
            DataTable dtStateList = new DataTable();
            Hashtable ht = new Hashtable();
            dtStateList = _reader.GetDataTableByCommandFromStoredProc("GetPDStateInfo", ht);
            return dtStateList;
        }
        public DataTable GetPDCourseDurationDaysInfo()
        {
            DataTable dtDurationList = new DataTable();
            Hashtable ht = new Hashtable();
            dtDurationList = _reader.GetDataTableByCommandFromStoredProc("GetPDCourseDurationDaysInfo", ht);
            return dtDurationList;
        }
        public DataTable GetPDCourseHoursInfo()
        {
            DataTable dtCourseHoursList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseHoursList = _reader.GetDataTableByCommandFromStoredProc("GetPDCourseHoursInfo", ht);
            return dtCourseHoursList;
        }
        public DataTable GetPDRegionMetroInfo()
        {
            DataTable dtRegionList = new DataTable();
            Hashtable ht = new Hashtable();
            dtRegionList = _reader.GetDataTableByCommandFromStoredProc("GetPDRegionMetroInfo", ht);
            return dtRegionList;
        }
        public DataTable GetPDCourseLevelInfo()
        {
            DataTable dtCourseLevelList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseLevelList = _reader.GetDataTableByCommandFromStoredProc("GetPDCourseLevelInfo", ht);
            return dtCourseLevelList;
        }

        public DataTable GetPDPresenterInfo()
        {
            DataTable dtCourseLevelList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseLevelList = _reader.GetDataTableByCommandFromStoredProc("GetPDPresenterInfo", ht);
            return dtCourseLevelList;
        }

        public DataTable GetPDExpenseInfo()
        {
            DataTable dtCourseLevelList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseLevelList = _reader.GetDataTableByCommandFromStoredProc("GetPDExpenseInfo", ht);
            return dtCourseLevelList;
        }

        public DataTable GetPDTutorInfo()
        {
            DataTable dtCourseLevelList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseLevelList = _reader.GetDataTableByCommandFromStoredProc("GetPDTutorsInfo", ht);
            return dtCourseLevelList;
        }

        public DataTable GetPDConvenorsInfo()
        {
            DataTable dtCourseLevelList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseLevelList = _reader.GetDataTableByCommandFromStoredProc("GetPDConvenorsInfo", ht);
            return dtCourseLevelList;
        }

        public DataTable GetPDExpenseTypeInfo()
        {
            DataTable dtCourseLevelList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseLevelList = _reader.GetDataTableByCommandFromStoredProc("GetPDExpenseTypeInfo", ht);
            return dtCourseLevelList;
        }
        public DataTable GetPDOtherExpenseInfo()
        {
            DataTable dtCourseLevelList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseLevelList = _reader.GetDataTableByCommandFromStoredProc("GetPDOtherExpenseInfo", ht);
            return dtCourseLevelList;
        }

        public DataTable GetCourseEventCode()
        {
            DataTable dtCourseEventList = new DataTable();
            Hashtable ht = new Hashtable();
            dtCourseEventList = _reader.GetDataTableByCommandFromStoredProc("GetCourseEventCode", ht);
            return dtCourseEventList;
        }

    }
}