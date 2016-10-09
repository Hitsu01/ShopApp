using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using ShopApp.Repository;
using ShopApp.Models;

namespace ShopApp
{
    class Program
    {
        static void Main(string[] args)
        {
            
            UnitOfWork unit = new UnitOfWork();
            List<Item> list;// = new List<Item>();
            
          
           list = unit.Items.GetAll();
            
            foreach(var x in list)
            {
                Console.WriteLine("id = {0}, name = {1}, id1 = {2}, {3}, {4}, {5}",x.Id, x.Name, x.Price, x.Quantity, x.Size, x.TypeId);
            }

            
            /*
            SqlConnection connection;
            string connectionString = @"Data Source=DESKTOP-QC84QK0;Initial Catalog=Shop;User ID=sa;Password=1111";
            //string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string SQL = "SELECT * FROM [dbo].[Shops]";
            DateTime date = new DateTime() ;
            using (connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(SQL,connection);
                SqlDataReader read = command.ExecuteReader();

                if(read.HasRows)
                {
                    while (read.Read())
                   {
                        object x = read.GetValue(0);
                        date = Convert.ToDateTime(read.GetValue(1));
                        object z = read.GetValue(2);
                        Console.WriteLine("x = {0}, y = {1}, z = {2}", x, date, z);
                   }
                   
                    
                }
            }
            */
            Console.ReadKey();
        }
    }
}
