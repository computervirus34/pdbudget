using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace PDBudget
{
    public class FillList
    {
        private void addRow(DataTable dt)
        {
            DataRow dRow = dt.NewRow();
            dt.Rows.Add(dRow);
        }

        public DataTable Populate(DataSet DDLData, string ValueField, string TextField, bool extraTop, string toptext, int topvalue)
        {
            DataTable dtDropDown = new DataTable();
            dtDropDown.Columns.Add(new DataColumn("ItemValue", typeof(int)));
            dtDropDown.Columns.Add(new DataColumn("ItemText", typeof(string)));

            // add an extra line at the top of the list
            if (extraTop == true)
            {
                DataRow dRow = dtDropDown.NewRow();
                dRow["ItemValue"] = topvalue;
                dRow["itemText"] = toptext;
                dtDropDown.Rows.Add(dRow);
            }

            // add list contents from the Dataset
            foreach (DataRow myRow in DDLData.Tables[0].Rows)
            {
                DataRow dRow = dtDropDown.NewRow();
                dRow["ItemValue"] = myRow[ValueField];
                dRow["ItemText"] = myRow[TextField];
                dtDropDown.Rows.Add(dRow);

            }
            return dtDropDown;
        }

        public DataTable Populate(DataSet DDLData, string ValueField, string TextField, bool extraTop, string toptext, string topvalue)
        {
            DataTable dtDropDown = new DataTable();
            dtDropDown.Columns.Add(new DataColumn("ItemValue", typeof(string)));
            dtDropDown.Columns.Add(new DataColumn("ItemText", typeof(string)));

            // add an extra line at the top of the list
            if (extraTop == true)
            {
                DataRow dRow = dtDropDown.NewRow();
                dRow["ItemValue"] = topvalue;
                dRow["itemText"] = toptext;
                dtDropDown.Rows.Add(dRow);
            }

            // add list contents from the Dataset
            foreach (DataRow myRow in DDLData.Tables[0].Rows)
            {
                DataRow dRow = dtDropDown.NewRow();
                dRow["ItemValue"] = myRow[ValueField];
                dRow["ItemText"] = myRow[TextField];
                dtDropDown.Rows.Add(dRow);

            }
            return dtDropDown;
        }

        public DataTable Populate(DataTable DDLData, string ValueField, string TextField, bool extraTop, string toptext, string topvalue)
        {
            DataTable dtDropDown = new DataTable();
            dtDropDown.Columns.Add(new DataColumn("ItemValue", typeof(string)));
            dtDropDown.Columns.Add(new DataColumn("ItemText", typeof(string)));

            // add an extra line at the top of the list
            if (extraTop == true)
            {
                DataRow dRow = dtDropDown.NewRow();
                dRow["ItemValue"] = topvalue;
                dRow["itemText"] = toptext;
                dtDropDown.Rows.Add(dRow);
            }

            // add list contents from the Dataset
            foreach (DataRow myRow in DDLData.Rows)
            {
                DataRow dRow = dtDropDown.NewRow();
                dRow["ItemValue"] = myRow[ValueField];
                dRow["ItemText"] = myRow[TextField];
                dtDropDown.Rows.Add(dRow);

            }
            return dtDropDown;
        }
        public DataTable Populate(DataTable DDLData, string ValueField, string TextField, bool extraTop, string toptext, int topvalue)
        {
            DataTable dtDropDown = new DataTable();
            dtDropDown.Columns.Add(new DataColumn("ItemValue", typeof(int)));
            dtDropDown.Columns.Add(new DataColumn("ItemText", typeof(string)));

            // add an extra line at the top of the list
            if (extraTop == true)
            {
                DataRow dRow = dtDropDown.NewRow();
                dRow["ItemValue"] = topvalue;
                dRow["itemText"] = toptext;
                dtDropDown.Rows.Add(dRow);
            }

            // add list contents from the Dataset
            foreach (DataRow myRow in DDLData.Rows)
            {
                DataRow dRow = dtDropDown.NewRow();
                dRow["ItemValue"] = myRow[ValueField];
                dRow["ItemText"] = myRow[TextField];
                dtDropDown.Rows.Add(dRow);

            }
            return dtDropDown;
        }
        public DataTable Populate(DataSet DDLData, string ValueField, string TextField, string TextField1, bool extraTop, string toptext, int topvalue)
        {
            DataTable dtDropDown = new DataTable();
            dtDropDown.Columns.Add(new DataColumn("ItemValue", typeof(int)));
            dtDropDown.Columns.Add(new DataColumn("ItemText", typeof(string)));

            // add an extra line at the top of the list
            if (extraTop == true)
            {
                DataRow dRow = dtDropDown.NewRow();
                dRow["ItemValue"] = topvalue;
                dRow["itemText"] = toptext;
                dtDropDown.Rows.Add(dRow);
            }

            // add list contents from the Dataset
            foreach (DataRow myRow in DDLData.Tables[0].Rows)
            {
                DataRow dRow = dtDropDown.NewRow();
                dRow["ItemValue"] = myRow[ValueField];
                dRow["ItemText"] = myRow[TextField] + "." + myRow[TextField1];
                dtDropDown.Rows.Add(dRow);

            }
            return dtDropDown;
        }
        public DataTable Populate(DataTable DDLData, string ValueField, string TextField, string TextField1, bool extraTop, string toptext, int topvalue)
        {
            DataTable dtDropDown = new DataTable();
            dtDropDown.Columns.Add(new DataColumn("ItemValue", typeof(int)));
            dtDropDown.Columns.Add(new DataColumn("ItemText", typeof(string)));

            // add an extra line at the top of the list
            if (extraTop == true)
            {
                DataRow dRow = dtDropDown.NewRow();
                dRow["ItemValue"] = topvalue;
                dRow["itemText"] = toptext;
                dtDropDown.Rows.Add(dRow);
            }

            // add list contents from the Dataset
            foreach (DataRow myRow in DDLData.Rows)
            {
                DataRow dRow = dtDropDown.NewRow();
                dRow["ItemValue"] = myRow[ValueField];
                dRow["ItemText"] = myRow[TextField] + ":" + myRow[TextField1];
                dtDropDown.Rows.Add(dRow);

            }
            return dtDropDown;
        }
        public void PopulateDDL(DataTable DDLData, DropDownList ddl, string ValueField, string TextField, bool extraTop, string toptext, string topvalue)
        {
            DataTable dtDropDown = new DataTable();
            dtDropDown.Columns.Add(new DataColumn("ItemValue", typeof(string)));
            dtDropDown.Columns.Add(new DataColumn("ItemText", typeof(string)));

            // add an extra line at the top of the list
            if (extraTop == true)
            {
                DataRow dRow = dtDropDown.NewRow();
                try
                {
                    dRow["ItemValue"] = topvalue;
                }
                catch (Exception ex)
                {
                    dRow["ItemValue"] = "-1";
                }
                try
                {
                    dRow["itemText"] = toptext;
                }
                catch (Exception ex)
                {
                    dRow["itemText"] = "";
                }
                dtDropDown.Rows.Add(dRow);
            }

            // add list contents from the Dataset
            foreach (DataRow myRow in DDLData.Rows)
            {
                DataRow dRow = dtDropDown.NewRow();
                dRow["ItemValue"] = myRow[ValueField];
                dRow["ItemText"] = myRow[TextField];
                dtDropDown.Rows.Add(dRow);
            }
            ddl.DataSource = dtDropDown;
            ddl.DataTextField = "itemText";
            ddl.DataValueField = "itemValue";
            ddl.DataBind();
        }
    }
}