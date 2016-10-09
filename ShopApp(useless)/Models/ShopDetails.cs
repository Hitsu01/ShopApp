using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopApp.Models
{
    class ShopDetails
    {
        public int Id { get; set; }
        public int Quantity { get; set; }
        public int ShopId { get; set; }
        public int TypeId { get; set; }

        public ShopDetails(int id, int qua, int shopId, int typeId)
        {
            Id = id;
            Quantity = qua;
            ShopId = shopId;
            TypeId = typeId;
        }
    }
}
