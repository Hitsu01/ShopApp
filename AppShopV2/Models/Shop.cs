using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppShopV2.Models
{
    class Shop : BaseModel
    {
        public DateTime DateOfSale { get; set; }
        public int CustomersId { get; set; }


        public Shop() { }

        public Shop(DateTime date, int custId)
        {
            this.DateOfSale = date;
            this.CustomersId = custId;
        }
    }
}
