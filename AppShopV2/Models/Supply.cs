using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppShopV2.Models
{
    class Supply : BaseModel
    {
        public DateTime Date_Supply { get; set; }
        public int ItemId { get; set; }


        public Supply() { }
        public Supply(DateTime date, int itemId)
        {
            this.Date_Supply = date;
            this.ItemId = itemId;
        }
    }
}
