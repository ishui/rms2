﻿namespace TiannuoPM.Entities
{
    using System;

    public class ContractMaterialEventArgs : EventArgs
    {
        private ContractMaterialColumn column;
        private object value;

        public ContractMaterialEventArgs(ContractMaterialColumn column)
        {
            this.column = column;
        }

        public ContractMaterialEventArgs(ContractMaterialColumn column, object value)
        {
            this.column = column;
            this.value = value;
        }

        public ContractMaterialColumn Column
        {
            get
            {
                return this.column;
            }
        }

        public object Value
        {
            get
            {
                return this.value;
            }
        }
    }
}

