using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopApp.Repository
{
    class UnitOfWork : IDisposable
    {
        private string connectionString = @"Data Source=DESKTOP-QC84QK0;Initial Catalog=Shop;User ID=sa;Password=1111";
        private SqlConnection connection;

        private CustomerRepository _customerRepository;
        private ShopRepository _shopRepository;
        private TypeRepository _typeRepository;
        private ShopDetailsRepository _shopDetialsRepository;
        private SupplyRepository _supplyRepository;
        private ItemRepository _itemRepository;

        public UnitOfWork()
        {
            connection = new SqlConnection(connectionString);
        }

        public CustomerRepository Customers
        {
            get
            {
                if (_customerRepository == null)
                    _customerRepository = new CustomerRepository(connection);

                return _customerRepository;
            }
        }

        public ShopRepository Shops
        {
            get
            {
                if (_shopRepository == null)
                    _shopRepository = new ShopRepository(connection);
                return _shopRepository;
            }
        }

        public TypeRepository Types
        {
            get
            {
                if (_typeRepository == null)
                    _typeRepository = new TypeRepository(connection);

                return _typeRepository;
            }
        }

        public ShopDetailsRepository ShopDetails
        {
            get
            {
                if (_shopDetialsRepository == null)
                    _shopDetialsRepository = new ShopDetailsRepository(connection);

                return _shopDetialsRepository;
            }
        }

        public SupplyRepository Supplys
        {
            get
            {
                if (_supplyRepository == null)
                    _supplyRepository = new SupplyRepository(connection);

                return _supplyRepository;
            }
        }

        public ItemRepository Items
        {
            get
            {
                if (_itemRepository == null)
                    _itemRepository = new ItemRepository(connection);

                return _itemRepository;
            }
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}
