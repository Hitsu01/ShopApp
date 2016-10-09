using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopApp.Models
{
    class Item
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public string Size { get; set; }
        public int TypeId { get; set; }

        public Item(int id, string name, double price, int quantity, string size, int typeId)
        {
            this.Id = id;
            this.Name = name;
            this.Price = price;
            this.Quantity = quantity;
            this.Size = size;
            this.TypeId = typeId;
        }

    }
}
