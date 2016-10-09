using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using ShopApp.Models;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopApp.Repository
{
    class TypeRepository : IRepository<Models.Type>
    {
        SqlConnection connection;
        List<Models.Type> list = new List<Models.Type>();

        public TypeRepository(SqlConnection connection)
        {
            this.connection = connection;
        }
        public void Create(Models.Type item)
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

        public List<Models.Type> GetAll()
        {
            connection.Open();
            //Models.Type type = new Models.Type();
            string SQL = "SELECT * FROM [dbo].[Types]";
            SqlCommand command = new SqlCommand(SQL, connection);
            SqlDataReader read = command.ExecuteReader();

            int id;
            string name;
            string phone;
            if (read.HasRows)
            {
                while (read.Read())
                {
                    id = (int)read.GetValue(0);
                    name = (string)read.GetValue(1);
                    list.Add(new Models.Type(id, name));
                }
            }

            connection.Close();
            return list;
        }

        public Models.Type GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void Save()
        {
            throw new NotImplementedException();
        }

        public void Update(Models.Type item)
        {
            throw new NotImplementedException();
        }
    }
}
