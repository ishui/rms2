﻿namespace TiannuoPM.Data.SqlClient
{
    using System;
    using System.ComponentModel;

    [DataObject, CLSCompliant(true)]
    public class SqlContractMaterialPlanProvider : SqlContractMaterialPlanProviderBase
    {
        public SqlContractMaterialPlanProvider(string connectionString, bool useStoredProcedure, string providerInvariantName) : base(connectionString, useStoredProcedure, providerInvariantName)
        {
        }
    }
}

