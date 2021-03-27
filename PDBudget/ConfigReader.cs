using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PDBudget
{
    public class ConfigReader
    {
        public ConfigReader()
        {
            //
            // TODO: Add constructor logic here
            //

        }
       
        public static string LoginConnString
        {
            get
            {

                if (System.Configuration.ConfigurationManager.AppSettings[AppConstants.CONN_STRING] != null)
                {
                    return System.Configuration.ConfigurationManager.AppSettings[AppConstants.CONN_STRING];
                }
                return "";
            }
        }

        public static string AppConnString
        {
            get
            {
                string strConnectionString = "";
                if (System.Configuration.ConfigurationManager.AppSettings[AppConstants.CONN_STRING] != null)
                {
                    return System.Configuration.ConfigurationManager.AppSettings[AppConstants.CONN_STRING];
                }
                return strConnectionString;
            }
        }

        public static string MysqlConnString
        {
            get
            {
                string strConnectionString = "";
                if (System.Configuration.ConfigurationManager.ConnectionStrings["MysqlConnection"] != null)
                {
                    return System.Configuration.ConfigurationManager.ConnectionStrings["MysqlConnection"].ToString();
                }
                return strConnectionString;
            }
        }

        public static string GetFromAppSettings(string key)
        {
            if (System.Configuration.ConfigurationManager.AppSettings[key] != null)
            {
                return System.Configuration.ConfigurationManager.AppSettings[key];
            }
            return string.Empty;
        }  
    }
}