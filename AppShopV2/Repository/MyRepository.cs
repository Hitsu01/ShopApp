using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace AppShopV2.Repository
{
    class MyRepository : IRepository
    {

        SqlConnection connection;
        string connectionString;
        private  Dictionary<Type, DbType> TypeOfData;

        public MyRepository()
        {
            connectionString = @"Data Source=DESKTOP-QC84QK0;Initial Catalog=Shop;User ID=sa;Password=1111";

            TypeOfData = new Dictionary<Type, DbType>();

            TypeOfData[typeof(DateTime)] = DbType.DateTime;
            TypeOfData[typeof(double)] = DbType.Double;
            TypeOfData[typeof(int)] = DbType.Int32;
            TypeOfData[typeof(float)] = DbType.Single;
            TypeOfData[typeof(string)] = DbType.String;
            

        }
        public List<T> GetAll<T>() where T:class, new()
        {
            List<T> list = new List<T>();
            Type type = typeof(T);
            string SQL = "sp_Get_"+type.Name+"_All";
            using (connection = new SqlConnection(connectionString))
            {

                connection.Open();
                SqlDataReader read = SqlQuery(SQL).ExecuteReader();

                if (read.HasRows)
                {
                    while (read.Read())
                    {
                        list.Add(MapModel<T>(read));
                    }


                }
            }
            return list;
        }

        public T GetById<T>(int Id) where T:class, new()
        {
            Type type = typeof(T);
            T result = null;
            string SQL = "sp_Get_" + type.Name + "_ById";
            using (connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlParameter param = new SqlParameter()
                {
                    ParameterName = "@Id",
                    Value = Id
                };


                SqlCommand command = SqlQuery(SQL);
                command.Parameters.Add(param);
                SqlDataReader read = command.ExecuteReader();


                if(read.HasRows)
                {
                    read.Read();
                    result = MapModel<T>(read);
                }
            }
            return result;
        }

        public bool Create<T>(T Item) where T : class
        {
            Type type = typeof(T);
            string SQL = "sp_Create_" + type.Name;

            using (connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlParameter []param = GetParameters<T>(Item);

                SqlCommand command = SqlQuery(SQL);
                if(param != null)
                    command.Parameters.AddRange(param);

                int x = command.ExecuteNonQuery();

                if (x > 0)
                    return true;
                else
                    return false;
            }
            
        }

        public bool DeleteBuId<T>(int Id)
        {
            Type type = typeof(T);
           
            string SQL = "sp_Delete_" + type.Name + "_ById";
            using (connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlParameter param = new SqlParameter()
                {
                    ParameterName = "@Id",
                    Value = Id
                };
                

                SqlCommand command = SqlQuery(SQL);
                command.Parameters.Add(param);
                int x = command.ExecuteNonQuery();

                if (x > 0)
                    return true;
                else
                    return false;   
            }
            
        }

        public bool DeleteItem<T>(T Item)
        {
            Type info = typeof(T);
            PropertyInfo prop = info.GetProperty("Id");
            int id = Convert.ToInt32(prop.GetValue(Item));

            return DeleteBuId<T>(id);
        }

        public bool Update<T>(T Item)
        {
            Type type = typeof(T);
            string SQL = "sp_Update_" + type.Name;
            using (connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlParameter[] param = GetParameters<T>(Item);

                SqlCommand command = SqlQuery(SQL);
                if (param != null)
                    command.Parameters.AddRange(param);

                int x = command.ExecuteNonQuery();

                if (x > 0)
                    return true;
                else
                    return false;
            }

        }

        private SqlCommand SqlQuery(string SQL)
        {
            SqlCommand command = new SqlCommand(SQL, connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            return command;
        }

        private T MapModel<T>(SqlDataReader read) where T:class, new()
        {
            Type type = typeof(T);
            T result = new T();

            foreach(var prop in type.GetProperties())
            {
               
                if (prop.PropertyType == read[prop.Name].GetType())
                    prop.SetValue(result, read[prop.Name]);
            }
            return result;
        }

        private SqlParameter[] GetParameters<T>(T param)
        {
            if (param == null)
                return null;
            PropertyInfo[] propInf = param.GetType().GetProperties();
            SqlParameter[] Result = new SqlParameter[propInf.Count()];

            int i = 0;
            if(propInf.Any())
            {
                foreach(var info in propInf)
                {
                    SqlParameter sqlParam = new SqlParameter();
                    sqlParam.ParameterName = "@" + info.Name;
                    sqlParam.SqlValue = info.GetValue(param);
                    sqlParam.DbType = TypeOfData[info.PropertyType];

                    Result[i] = sqlParam;
                    i++;
                }

            }

            return Result;
        }
    }
}
