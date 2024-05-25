﻿using CitySkyLine.DAL.Abstract;
using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.DAL.Concrete.EFCore
{
    public class EFCoreRecentPostDal : EFCoreGenericRepository<RecentPost, DataContext> , IRecentPostDal
    {
        
    }
}
