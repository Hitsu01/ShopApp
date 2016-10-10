using System;
using AppShopV2.Repository;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppShopV2.Models;
using AppShopV2.Factory;

namespace AppShopV2
{
    class Program
    {
        static void Main(string[] args)
        {




            ObjectFactory f = new ObjectFactory();

            f.CreateCustomer("Hitsu", "888");
            f.CreateTypeItem("testType");
            f.SaveChange();


            MyRepository rep = new MyRepository();
            List<Customer> list = rep.GetAll<Customer>();

            foreach (var x in list)
            {
                Console.WriteLine("Id = {2}, Name  = {0}, Phone = {1}", x.Name, x.Phone, x.Id);
            }

            List<TypeItem> list2 = rep.GetAll<TypeItem>();

            foreach (var x in list2)
            {
                Console.WriteLine("Name  = {0}", x.Name);
            }
            Console.ReadLine();
        }
    }
}
