using System;
using System.Data;
using System.Data.SqlClient;

namespace MagazinOnline.Utils
{
    public static class UtilsDb
    {
        public static DataTable GetData(string sqlString)
        {
            try
            {
                DataTable dtResult = new DataTable();

                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["VanzariDB"].ConnectionString;

                SqlConnection conn = new SqlConnection(connString);
                SqlCommand cmd = new SqlCommand(sqlString, conn);
                conn.Open();

                // create data adapter
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                // this will query your database and return the result to your datatable
                da.Fill(dtResult);
                conn.Close();
                da.Dispose();

                return dtResult;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw new Exception(e.Message);
            }

        }

        public static int InsertData(string sqlString)
        {

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["VanzariDB"]
                .ConnectionString;

            using (SqlConnection cnn = new SqlConnection(connString))
            {
                try
                {
                    // Open the connection to the database. 
                    // This is the first critical step in the process.
                    // If we cannot reach the db then we have connectivity problems
                    cnn.Open();

                    // Prepare the command to be executed on the db
                    using (SqlCommand cmd = new SqlCommand(sqlString, cnn))
                    {
                        // Let's ask the db to execute the query
                        int rowsAdded = cmd.ExecuteNonQuery();
                        return rowsAdded;
                    }

                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    throw new Exception(e.Message);
                }
            }
        }
        public class ElementCos
        {
            public string IdProdus { get; set; }
            public string Cantitate { get; set; }
        }
    }
}