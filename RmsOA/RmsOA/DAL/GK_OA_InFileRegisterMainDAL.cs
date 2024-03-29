﻿namespace RmsOA.DAL
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Text;
    using RmsOA.MODEL;

    public class GK_OA_InFileRegisterMainDAL
    {
        private SqlDataProcess _DataProcess;

        public GK_OA_InFileRegisterMainDAL(SqlConnection Connection)
        {
            this._DataProcess = new SqlDataProcess(Connection);
        }

        public GK_OA_InFileRegisterMainDAL(SqlTransaction Transaction)
        {
            this._DataProcess = new SqlDataProcess(Transaction);
        }

        private GK_OA_InFileRegisterMainModel _DataBind(int Code)
        {
            GK_OA_InFileRegisterMainModel model = new GK_OA_InFileRegisterMainModel();
            StringBuilder builder = new StringBuilder();
            builder.Append("select * from GK_OA_InFileRegisterMain ");
            builder.Append(" where Code=@Code");
            this._DataProcess.CommandText = builder.ToString();
            this._DataProcess.ProcessParametersAdd("@Code", SqlDbType.Int, 4, Code);
            SqlDataReader sqlDataReader = null;
            try
            {
                try
                {
                    sqlDataReader = this._DataProcess.GetSqlDataReader();
                    while (sqlDataReader.Read())
                    {
                        this.Initialize(sqlDataReader, model);
                    }
                }
                catch (SqlException exception)
                {
                    throw exception;
                }
            }
            finally
            {
                if (sqlDataReader != null)
                {
                    sqlDataReader.Close();
                }
            }
            return model;
        }

        private int _Delete(int Code)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("delete from GK_OA_InFileRegisterMain ");
            builder.Append(" where Code=@Code");
            this._DataProcess.CommandText = builder.ToString();
            this._DataProcess.ProcessParametersAdd("@Code", SqlDbType.Int, 4, Code);
            return this._DataProcess.RunSql();
        }

        private int _Insert(GK_OA_InFileRegisterMainModel mObj)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("insert into GK_OA_InFileRegisterMain(");
            builder.Append("SystemCode,FileCode,InFileDate,Field1)");
            builder.Append(" values (");
            builder.Append("@SystemCode,@FileCode,@InFileDate,@Field1) ");
            builder.Append("SELECT @Code = SCOPE_IDENTITY()");
            this._DataProcess.CommandText = builder.ToString();
            this._DataProcess.ProcessParametersAdd("@SystemCode", SqlDbType.VarChar, 50, mObj.SystemCode);
            this._DataProcess.ProcessParametersAdd("@FileCode", SqlDbType.VarChar, 50, mObj.FileCode);
            this._DataProcess.ProcessParametersAdd("@InFileDate", SqlDbType.DateTime, 8, mObj.InFileDate);
            this._DataProcess.ProcessParametersAdd("@Field1", SqlDbType.VarChar, 50, mObj.Field1);
            SqlParameter parameter = this._DataProcess.ProcessParametersAdd("@Code", SqlDbType.Int, 4, null);
            parameter.Direction = ParameterDirection.Output;
            this._DataProcess.RunSql();
            mObj.Code = (int) parameter.Value;
            return mObj.Code;
        }

        private List<GK_OA_InFileRegisterMainModel> _Select(GK_OA_InFileRegisterMainQueryModel qmObj)
        {
            List<GK_OA_InFileRegisterMainModel> list = new List<GK_OA_InFileRegisterMainModel>();
            StringBuilder builder = new StringBuilder();
            builder.Append("select * from GK_OA_InFileRegisterMain ");
            builder.Append(qmObj.QueryConditionStr);
            if (qmObj.SortColumns.Length == 0)
            {
                builder.Append(" ORDER BY Code desc");
            }
            else
            {
                builder.Append(" ORDER BY " + qmObj.SortColumns);
            }
            this._DataProcess.CommandText = builder.ToString();
            this._DataProcess.SqlParameters = qmObj.Parameters;
            SqlDataReader sqlDataReader = null;
            int num = 0;
            try
            {
                try
                {
                    sqlDataReader = this._DataProcess.GetSqlDataReader();
                    while (sqlDataReader.Read())
                    {
                        if ((num >= qmObj.StartRecord) && ((list.Count < qmObj.MaxRecords) || (qmObj.MaxRecords == -1)))
                        {
                            GK_OA_InFileRegisterMainModel model = new GK_OA_InFileRegisterMainModel();
                            this.Initialize(sqlDataReader, model);
                            list.Add(model);
                        }
                        num++;
                    }
                }
                catch (SqlException exception)
                {
                    throw exception;
                }
            }
            finally
            {
                if (sqlDataReader != null)
                {
                    sqlDataReader.Close();
                }
            }
            return list;
        }

        private int _Update(GK_OA_InFileRegisterMainModel mObj)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("update GK_OA_InFileRegisterMain set ");
            if (mObj.SystemCode != null)
            {
                builder.Append("SystemCode=@SystemCode,");
                this._DataProcess.ProcessParametersAdd("@SystemCode", SqlDbType.VarChar, 50, mObj.SystemCode);
            }
            if (mObj.FileCode != null)
            {
                builder.Append("FileCode=@FileCode,");
                this._DataProcess.ProcessParametersAdd("@FileCode", SqlDbType.VarChar, 50, mObj.FileCode);
            }
            if (mObj.InFileDate != DateTime.MinValue)
            {
                builder.Append("InFileDate=@InFileDate,");
                this._DataProcess.ProcessParametersAdd("@InFileDate", SqlDbType.DateTime, 8, mObj.InFileDate);
            }
            if (mObj.Field1 != null)
            {
                builder.Append("Field1=@Field1,");
                this._DataProcess.ProcessParametersAdd("@Field1", SqlDbType.VarChar, 50, mObj.Field1);
            }
            builder.Remove(builder.Length - 1, 1);
            builder.Append(" where Code=@Code");
            this._DataProcess.ProcessParametersAdd("@Code", SqlDbType.Int, 4, mObj.Code);
            this._DataProcess.CommandText = builder.ToString();
            return this._DataProcess.RunSql();
        }

        public int Delete(int Code)
        {
            return this._Delete(Code);
        }

        public int Delete(GK_OA_InFileRegisterMainModel mObj)
        {
            return this._Delete(mObj.Code);
        }

        public GK_OA_InFileRegisterMainModel GetModel(int Code)
        {
            return this._DataBind(Code);
        }

        private void Initialize(SqlDataReader reader, GK_OA_InFileRegisterMainModel obj)
        {
            if (reader.GetValue(0) != DBNull.Value)
            {
                obj.Code = reader.GetInt32(0);
            }
            if (reader.GetValue(1) != DBNull.Value)
            {
                obj.SystemCode = reader.GetString(1);
            }
            if (reader.GetValue(2) != DBNull.Value)
            {
                obj.FileCode = reader.GetString(2);
            }
            if (reader.GetValue(3) != DBNull.Value)
            {
                obj.InFileDate = reader.GetDateTime(3);
            }
            if (reader.GetValue(4) != DBNull.Value)
            {
                obj.Field1 = reader.GetString(4);
            }
        }

        public int Insert(GK_OA_InFileRegisterMainModel mObj)
        {
            return this._Insert(mObj);
        }

        public List<GK_OA_InFileRegisterMainModel> Select()
        {
            GK_OA_InFileRegisterMainQueryModel qmObj = new GK_OA_InFileRegisterMainQueryModel();
            return this._Select(qmObj);
        }

        public List<GK_OA_InFileRegisterMainModel> Select(GK_OA_InFileRegisterMainQueryModel qmObj)
        {
            return this._Select(qmObj);
        }

        public int Update(GK_OA_InFileRegisterMainModel mObj)
        {
            return this._Update(mObj);
        }
    }
}

