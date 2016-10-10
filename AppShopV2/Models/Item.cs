using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppShopV2.Models
{
    class Item : BaseModel
    {
        public string Name { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public string Size { get; set; }
        public int TypeId { get; set; }


        public Item() { }

        public Item(string name, double price, int quantity, string size, int typeId)
        {
            this.Name = name;
            this.Price = price;
            this.Quantity = quantity;
            this.Size = size;
            this.TypeId = typeId;
        }
    }
}
