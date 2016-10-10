using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppShopV2.Repository
{
    interface IRepository
    {
        List<T> GetAll<T>() where T : class ,new();
        T GetById<T>(int Id) where T : class, new();
        bool  Create<T>(T Item) where T :class;
        bool DeleteBuId<T>(int Id);
        bool DeleteItem<T>(T Item);
        bool Update<T>(T Item);

    }
}
