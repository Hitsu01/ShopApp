using ShopApp.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopApp.Repository
{
    class ShopRepository : IRepository<Shop>
    {

        SqlConnection connection;
        List<Shop> list = new List<Shop>();

        public ShopRepository(SqlConnection connection)
        {
            this.connection = connection;
           
        }
        public void Create(Shop item)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public List<Shop> GetAll()
        {
            connection.Open();
            Customer customer = new Customer();
            string SQL = "SELECT * FROM [dbo].[Shops]";
            SqlCommand command = new SqlCommand(SQL, connection);
            SqlDataReader read = command.ExecuteReader();

            int id;
            DateTime data;
            int CustomersId;
            if (read.HasRows)
            {
                while (read.Read())
                {
                    id = (int)read.GetValue(0);
                    data = Convert.ToDateTime(read.GetValue(1));
                    CustomersId = (int)read.GetValue(2);
                    list.Add(new Shop(id, data, CustomersId));
                }
            }

            connection.Close();

            return list;
        }

        public Shop GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void Save()
        {
            throw new NotImplementedException();
        }

        public void Update(Shop item)
        {
            throw new NotImplementedException();
        }
    }
}
