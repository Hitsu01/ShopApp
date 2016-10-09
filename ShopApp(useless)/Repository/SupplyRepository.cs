using ShopApp.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopApp.Repository
{

    
    class SupplyRepository : IRepository<Supply>
    {

        SqlConnection connection;
        List<Supply> list = new List<Supply>();

        public SupplyRepository(SqlConnection connection)
        {
            this.connection = connection;
        }
        public void Create(Supply item)
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

        public List<Supply> GetAll()
        {
            connection.Open();
            //Customer customer = new Customer();
            string SQL = "SELECT * FROM [dbo].[Supplys]";
            SqlCommand command = new SqlCommand(SQL, connection);
            SqlDataReader read = command.ExecuteReader();

            int id;
            DateTime DataOfSupply;
            int ItemId;
            if (read.HasRows)
            {
                while (read.Read())
                {
                    id = (int)read.GetValue(0);
                    DataOfSupply = Convert.ToDateTime(read.GetValue(1));
                    ItemId = (int)read.GetValue(2);
                    list.Add(new Supply(id, DataOfSupply, ItemId));
                }
            }

            connection.Close();
            return list;
        }

        public Supply GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void Save()
        {
            throw new NotImplementedException();
        }

        public void Update(Supply item)
        {
            throw new NotImplementedException();
        }
    }
}
