using ShopApp.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopApp.Repository
{
    class ShopDetailsRepository : IRepository<ShopDetails>
    {
        SqlConnection connection;
        List<ShopDetails> list = new List<ShopDetails>();

        public ShopDetailsRepository(SqlConnection connection)
        {
            this.connection = connection;
        }
        public void Create(ShopDetails item)
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

        public List<ShopDetails> GetAll()
        {
            connection.Open();
            Customer customer = new Customer();
            string SQL = "SELECT * FROM [dbo].[ShopDetails]";
            SqlCommand command = new SqlCommand(SQL, connection);
            SqlDataReader read = command.ExecuteReader();

            int id;
            int quantity;
            int TypeId;
            int ShopId;
            if (read.HasRows)
            {
                while (read.Read())
                {
                    id = (int)read.GetValue(0);
                    quantity = (int)read.GetValue(1);
                    ShopId = (int)read.GetValue(2);
                    TypeId = (int)read.GetValue(3);
                    list.Add(new ShopDetails(id, quantity, ShopId,TypeId));
                }
            }

            connection.Close();
            return list;
        }

        public ShopDetails GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void Save()
        {
            throw new NotImplementedException();
        }

        public void Update(ShopDetails item)
        {
            throw new NotImplementedException();
        }
    }
}
