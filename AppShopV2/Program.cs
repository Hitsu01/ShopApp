using System;
using AppShopV2.Repository;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppShopV2.Models;

namespace AppShopV2
{
    class Program
    {
        static void Main(string[] args)
        {




            MyRepository ob = new MyRepository();
           
            List<Customer> list;
            //TypeItem ob2 = new TypeItem() { Id = 1001, Name = "TestUpdate"};

            
            //Console.WriteLine(ob.Update<Customer>(ob2));
            list = ob.GetAll<Customer>();
            
            
            foreach(var x in list)
            {
                Console.WriteLine("Id = {0}, Name = {1}, phone = ", x.Id, x.Name, x.Phone);
            }
           
            
            Console.ReadLine();
        }
    }
}
