using AppShopV2.Models;
using AppShopV2.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace AppShopV2.Factory
{
    class ObjectFactory
    {
        private List<BaseModel> list = new List<BaseModel>();
        MyRepository repository = new MyRepository();

        public void CreateCustomer(string name, string phone)
        {
            list.Add(new Customer(name, phone));
        }

        public void CreateTypeItem(string name)
        {
            list.Add(new TypeItem(name));
        }
   
        public void CreateItem(string name, double price, int quantity, string size, int typeId)
        {
            list.Add(new Item(name, price, quantity, size, typeId));
        }


        public void CreateShop(DateTime date, int custId)
        {
            list.Add(new Shop(date, custId));
        }

        public void CreateShopDetails(int quantity, int shopId, int typeId)
        {
            list.Add(new ShopDetails(quantity, shopId, typeId));
        }

        public void CreateSupply(DateTime date, int itemId)
        {
            list.Add(new Supply(date, itemId));
        }

        public void SaveChange()
        {

            
            MethodInfo mInfo;
            foreach (var x in list)
            {
                mInfo = repository.GetType().GetMethod("Create").MakeGenericMethod(new Type[] { x.GetType() });
                mInfo.Invoke(this, new object[] { x });
            }

            list.Clear();
        }
    }
}
