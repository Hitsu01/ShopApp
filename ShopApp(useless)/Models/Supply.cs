using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopApp.Models
{
    class Supply
    {
        public int Id { get; set; }
        public DateTime DateOfSupply { get; set; }
        public int ItemsId { get; set; }

        public Supply(int id, DateTime Date, int itemsId)
        {
            this.Id = id;
            this.DateOfSupply = Date;
            this.ItemsId = itemsId;
        }

    }
}
