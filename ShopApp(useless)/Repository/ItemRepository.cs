using ShopApp.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopApp.Repository
{
    class ItemRepository : IRepository<Item>
    {
        SqlConnection connection;
        List<Item> list = new List<Item>();

        public ItemRepository(SqlConnection connection)
        {
            this.connection = connection;
        }
        public void Create(Item item)
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

        public List<Item> GetAll()
        {
            connection.Open();
            string SQL = "SELECT * FROM [dbo].[Items]";
            SqlCommand command = new SqlCommand(SQL, connection);
            SqlDataReader read = command.ExecuteReader();

            int Id;
            string Name;
            double Price;
            int Quantity;
            string Size;
            int TypeId;

            if(read.HasRows)
            {
                while(read.Read())
                {
                    Id = (int)read.GetValue(0);
                    Name = (string)read.GetValue(1);
                    Price = Convert.ToDouble(read.GetValue(2));
                    Quantity = (int)read.GetValue(3);
                    Size = (string)read.GetValue(4);
                    TypeId = (int)read.GetValue(5);
                    list.Add(new Item(Id,Name,Price,Quantity,Size,TypeId));
                }
            }

            return list;
        }

        public Item GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void Save()
        {
            throw new NotImplementedException();
        }

        public void Update(Item item)
        {
            throw new NotImplementedException();
        }
    }
}
