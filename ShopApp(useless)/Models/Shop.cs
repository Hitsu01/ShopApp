using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopApp.Models
{
    class Shop
    {
        public int Id { get; set; }
        public DateTime DateOfSale { get; set; }
        public int CustomersId { get; set; }

        public Shop() { }
        public Shop(int id, DateTime date, int CustId)
        {
            Id = id;
            DateOfSale = date;
            CustomersId = CustId;
        }
           


    }
}
