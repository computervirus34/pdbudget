using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PDBudget
{
    public class DataReader
    {
        private SqlConnection AppConn = null;
        private MySqlConnection MysqlCon = null;

        public DataReader()
        {
        }

        public static SqlConnection GetProjectConnection(string strServer, string strDB)
        {
            SqlConnection ConnAccounts = new SqlConnection();
            ConnAccounts.ConnectionString = "Data Source=" + strServer + ";Initial Catalog=" + strDB + ";User ID=sa;Password=sql2003";
            ConnAccounts.Open();
            return ConnAccounts;
        }

        public object ExecuteScalar(string strSQL)
        {
            OpenAppConnection();
            try
            {
                SqlCommand cmd = new SqlCommand(strSQL, AppConn);
                cmd.CommandType = CommandType.Text;
                cmd.CommandTimeout = 300;// 5 mins

                return cmd.ExecuteScalar();
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                AppConn.Close();
            }
        }
        public object ExecuteScalar(string strSQL, SqlConnection Conn)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(strSQL, Conn);
                cmd.CommandType = CommandType.Text;
                cmd.CommandTimeout = 300;// 5 mins
                return cmd.ExecuteScalar();

            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public SqlDataReader GetDataReaderByCommand(string strSQL)
        {
            OpenAppConnection();
            try
            {
                SqlCommand cmd = new SqlCommand(strSQL, AppConn);
                cmd.CommandType = CommandType.Text;
                cmd.CommandTimeout = 300;// 5 mins
                SqlDataReader dReader = cmd.ExecuteReader();
                return dReader;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                AppConn.Close();
            }
        }

        public SqlDataReader GetDataReaderByCommand(string strSQL, SqlConnection Conn)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(strSQL, Conn);
                cmd.CommandType = CommandType.Text;
                cmd.CommandTimeout = 300;// 5 mins
                SqlDataReader dReader = cmd.ExecuteReader();
                return dReader;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }


        public DataTable GetDataTableByCommand(string strSQL)
        {
            OpenAppConnection();
            try
            {
                SqlCommand cmd = new System.Data.SqlClient.SqlCommand(strSQL, AppConn);
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandTimeout = 300;// 5 mins
                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                AppConn.Close();
            }
        }
        public DataSet GetDataSetByCommand(string strSQL)
        {
            OpenAppConnection();
            try
            {
                SqlCommand cmd = new System.Data.SqlClient.SqlCommand(strSQL, AppConn);
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandTimeout = 300;// 5 mins
                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                AppConn.Close();
            }
        }

        public DataTable GetDataTableByCommand(string tableName, string strFilter)
        {
            OpenAppConnection();
            try
            {
                string strSQL = "SELECT * FROM " + tableName + " WHERE " + strFilter;
                SqlCommand cmd = new System.Data.SqlClient.SqlCommand(strSQL, AppConn);
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandTimeout = 300;// 5 mins
                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                AppConn.Close();
            }
        }
        public DataTable GetDataTableByCommand(string strSQL, SqlConnection Conn)
        {
            try
            {
                SqlCommand cmd = new System.Data.SqlClient.SqlCommand(strSQL, Conn);
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandTimeout = 300;// 5 mins
                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

        }

        public DataTable GetDataTableByCommand(string tableName, string strFilter, SqlConnection Conn)
        {
            try
            {
                string strSQL = "SELECT * FROM " + tableName + " WHERE " + strFilter;
                SqlCommand cmd = new System.Data.SqlClient.SqlCommand(strSQL, Conn);

                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandTimeout = 300;// 5 mins
                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

        }


        /*public DataTable GetDataTableByCommandFromStoredProc(string spName, Hashtable parameters)
        {
            OpenAppConnection();

            try
            {
                SqlCommand cmd = new SqlCommand(spName, AppConn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 300;// 5 mins
                if (parameters != null && parameters.Count > 0)
                {
                    foreach (string parametername in parameters.Keys)
                    {
                        cmd.Parameters.Add(parametername, parameters[parametername]);
                    }
                }//if(parameters!= null && parameters.Count>0)

                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            { CloseAppConnection(); }

        }*/

        public DataTable GetParameterListByTypeFromProc(string spName, Hashtable parameters,string type)
        {
            OpenMysqlConnection();

            try
            {
                MySqlCommand cmd = new MySqlCommand(spName, MysqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@type", type);
                cmd.CommandTimeout = 300;// 5 mins
                /*if (parameters != null && parameters.Count > 0)
                {
                    foreach (string parametername in parameters.Keys)
                    {
                        cmd.Parameters.Add(parametername, parameters[parameters]);
                    }
                }//if(parameters!= null && parameters.Count>0)
                */
                DataSet ds = new DataSet();
                MySqlDataAdapter adp = new MySqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            { CloseMysqlConnection(); }

        }

        public DataTable GetNumberParameterListByTypeFromProc(string spName, Hashtable parameters, string type)
        {
            OpenMysqlConnection();

            try
            {
                MySqlCommand cmd = new MySqlCommand(spName, MysqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@type", type);
                cmd.CommandTimeout = 300;// 5 mins
                /*if (parameters != null && parameters.Count > 0)
                {
                    foreach (string parametername in parameters.Keys)
                    {
                        cmd.Parameters.Add(parametername, parameters[parameters]);
                    }
                }//if(parameters!= null && parameters.Count>0)
                */
                DataSet ds = new DataSet();
                MySqlDataAdapter adp = new MySqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            { CloseMysqlConnection(); }

        }
        public DataTable GetResourceInfoFromProc(string spName, Hashtable parameters, string type)
        {
            OpenMysqlConnection();

            try
            {
                MySqlCommand cmd = new MySqlCommand(spName, MysqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@type", type);
                cmd.CommandTimeout = 300;// 5 mins
                /*if (parameters != null && parameters.Count > 0)
                {
                    foreach (string parametername in parameters.Keys)
                    {
                        cmd.Parameters.Add(parametername, parameters[parameters]);
                    }
                }//if(parameters!= null && parameters.Count>0)
                */
                DataSet ds = new DataSet();
                MySqlDataAdapter adp = new MySqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            { CloseMysqlConnection(); }

        }
        public DataTable GetExpenseListFromProc(string spName, Hashtable parameters)
        {
            OpenMysqlConnection();

            try
            {
                MySqlCommand cmd = new MySqlCommand(spName, MysqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@type", type);
                cmd.CommandTimeout = 300;// 5 mins
                /*if (parameters != null && parameters.Count > 0)
                {
                    foreach (string parametername in parameters.Keys)
                    {
                        cmd.Parameters.Add(parametername, parameters[parameters]);
                    }
                }//if(parameters!= null && parameters.Count>0)
                */
                DataSet ds = new DataSet();
                MySqlDataAdapter adp = new MySqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            { CloseMysqlConnection(); }

        }
        public DataTable GetSuburbFromStoredProc(string spName, Hashtable parameters, string state)
        {
            OpenMysqlConnection();

            try
            {
                MySqlCommand cmd = new MySqlCommand(spName, MysqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state", state);
                cmd.CommandTimeout = 300;// 5 mins
                DataSet ds = new DataSet();
                MySqlDataAdapter adp = new MySqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            { CloseMysqlConnection(); }

        }
        public DataTable GetDataTableByCommandFromStoredProc(string spName, Hashtable parameters)
        {
            OpenMysqlConnection();

            try
            {
                MySqlCommand cmd = new MySqlCommand(spName, MysqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 300;// 5 mins
                /*if (parameters != null && parameters.Count > 0)
                {
                    foreach (string parametername in parameters.Keys)
                    {
                        cmd.Parameters.Add(parametername, parameters[parameters]);
                    }
                }//if(parameters!= null && parameters.Count>0)
                */
                DataSet ds = new DataSet();
                MySqlDataAdapter adp = new MySqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            { CloseMysqlConnection(); }

        }


        public DataTable GetDataTableByCommandFromStoredProc(string spName, Hashtable parameters, SqlConnection Conn)
        {

            try
            {
                SqlCommand cmd = new SqlCommand(spName, Conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 300;// 5 mins
                if (parameters != null && parameters.Count > 0)
                {
                    foreach (string parametername in parameters.Keys)
                    {
                        cmd.Parameters.Add(parametername, parameters[parametername]);
                    }
                }//if(parameters!= null && parameters.Count>0)

                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }


        }

        public DataSet GetDataSetByStoredProc(string spName, Hashtable parameters)
        {
            OpenAppConnection();

            try
            {
                SqlCommand cmd = new SqlCommand(spName, AppConn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 300;// 5 mins
                if (parameters != null && parameters.Count > 0)
                {
                    foreach (string parametername in parameters.Keys)
                    {
                        //cmd.Parameters.Add(parametername, parameters[parametername]);
                        SqlParameter param = new SqlParameter("@" + parametername, parameters[parametername]);
                        cmd.Parameters.Add(param);
                    }
                }

                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally { CloseAppConnection(); }

        }



        public long GetMaxNo(string strTable, string strField, string strWhere)
        {
            OpenAppConnection();

            try
            {
                SqlCommand CmdMax = new SqlCommand(string.Format("SELECT ISNULL(MAX({0}),0) FROM {1} WHERE {2}", strField, strTable, strWhere), AppConn);
                long lngMaxno = Convert.ToInt64(CmdMax.ExecuteScalar());
                return lngMaxno;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                CloseAppConnection();

            }

        }


        public long GetMaxNo(string tableName, string columnName)
        {
            OpenAppConnection();
            try
            {
                SqlCommand CmdMax = new SqlCommand(string.Format("SELECT ISNULL(MAX({0}),0) FROM {1}", columnName, tableName), AppConn);
                long lngMaxno = Convert.ToInt64(CmdMax.ExecuteScalar());

                return lngMaxno;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                CloseAppConnection();
            }
        }

        public long GetMaxNo(string tableName, string columnName, SqlConnection Conn)
        {
            try
            {
                SqlCommand CmdMax = new SqlCommand(string.Format("SELECT ISNULL(MAX({0}),0) FROM {1}", columnName, tableName), Conn);
                long lngMaxno = Convert.ToInt64(CmdMax.ExecuteScalar());
                return lngMaxno;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        private void OpenAppConnection()
        {
            string ConnectionString = ConfigReader.AppConnString;
            if (!ConnectionString.Equals(""))
            {
                AppConn = new SqlConnection(ConnectionString);
                if (AppConn.State != ConnectionState.Open)
                {
                    AppConn.Open();
                }
            }
        }
        private void CloseAppConnection()
        {
            if (AppConn.State == ConnectionState.Open)
            {
                AppConn.Close();
            }
        }

        private void OpenMysqlConnection()
        {
            string ConnectionString = ConfigReader.MysqlConnString;
            if (!ConnectionString.Equals(""))
            {
                MysqlCon = new MySqlConnection(ConnectionString);
                if (MysqlCon.State != ConnectionState.Open)
                {
                    MysqlCon.Open();
                }
            }
        }
        private void CloseMysqlConnection()
        {
            if (MysqlCon.State == ConnectionState.Open)
            {
                MysqlCon.Close();
            }
        }

        public SqlConnection GetConnection(string connectionString)
        {
            if (!connectionString.Equals("") && connectionString != null)
            {
                SqlConnection Conn = new SqlConnection(connectionString);
                return Conn;
            }
            return null;
        }
        public void CloseConnection(SqlConnection Conn)
        {
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
            }
        }


        public DataTable GetDataTableByCommandFromStoredProc(string spName, Hashtable parameters, SqlConnection Conn, int commandTimeOut)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(spName, Conn);
                cmd.CommandTimeout = commandTimeOut;
                cmd.CommandType = CommandType.StoredProcedure;

                /*if (parameters != null && parameters.Count > 0)
                {
                    foreach (string parametername in parameters.Keys)
                    {
                        cmd.Parameters.Add(parametername, parameters[parametername]);
                    }
                }//if(parameters!= null && parameters.Count>0)*/

                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
    }
}