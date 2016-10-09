using ShopApp.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopApp.Repository
{
    class CustomerRepository : IRepository<Customer>
    {
        SqlConnection connection;
        List<Customer> list = new List<Customer>();
        public CustomerRepository(SqlConnection connection)
        {
            this.connection = connection;
           
        }
        public void Create(Customer item)
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

        public List<Customer> GetAll()
        {
            connection.Open();
            Customer customer = new Customer();
            string SQL = "SELECT * FROM [dbo].[Customers]";
            SqlCommand command = new SqlCommand(SQL, connection);
            SqlDataReader read = command.ExecuteReader();

            int id;
            string name;
            string phone;
            if (read.HasRows)
            {
                while (read.Read())
                {
                    //id = (int)read["Id"];
                    //name = (string)read.GetValue(1);
                    //phone = (string)read.GetValue(2);
                    //list.Add(new Customer(id, name, phone));
                    list.Add(new Customer()
                    {
                        Id = (int)read["Id"],
                        Name = (string)read.GetValue(1),
                        Phone = (string)read.GetValue(2)
                    });
                }
            }

            connection.Close();
            return list;
        }

        public Customer GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void Save()
        {
            throw new NotImplementedException();
        }

        public void Update(Customer item)
        {
            throw new NotImplementedException();
        }

    }
}
