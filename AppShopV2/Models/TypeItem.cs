using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppShopV2.Models
{
    class TypeItem : BaseModel
    {
        public string Name { get; set; }

        public TypeItem() { }

        public TypeItem(string name)
        {
            this.Name = name;
        }
    }

}
