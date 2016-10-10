using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppShopV2.Models
{
    class ShopDetails : BaseModel
    {
        public int Quantity { get; set; }
        public int ShopId { get; set; }
        public int TypeId { get; set; }

        public ShopDetails() { }

        public ShopDetails(int quantity, int shopId, int typeId)
        {
            this.Quantity = quantity;
            this.ShopId = shopId;
            this.TypeId = typeId;
        }
    }
}
