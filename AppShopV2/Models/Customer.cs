using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppShopV2.Models
{
    class Customer : BaseModel
    {
        public string Name { get; set; }
        public string Phone { get; set; }

        public Customer() { }
        public Customer(string name, string phone)
        {
            this.Name = name;
            this.Phone = phone;
        }
    }
}
