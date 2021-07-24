using BD;
using Entity;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WBL
{
    public interface IDireccionService
    {
        Task<DBEntity> Create(DireccionEntity entity);
        Task<DBEntity> Delete(DireccionEntity entity);
        Task<IEnumerable<DireccionEntity>> Get();
        Task<DireccionEntity> GetById(DireccionEntity entity);
        Task<DBEntity> Update(DireccionEntity entity);
    }

    public class DireccionService : IDireccionService
    {
        private readonly IDataAccess sql;

        public DireccionService(IDataAccess _sql)
        {
            sql = _sql;
        }


        public async Task<IEnumerable<DireccionEntity>> Get()
        {
            try
            {
                var result = sql.QueryAsync<DireccionEntity,
                    CatalogoProvinciaEntity,
                    CatalogoCantonEntity,
                    CatalogoDistritoEntity,
                    PersonaEntity
                    >("DireccionObtener","IdCatalogoProvincia, IdCatalogoCanton, IdCatalogoDistrito, IdPersona");

                return await result;
            }
            catch (Exception EX)
            {

                throw;
            }
        }


        public async Task<DireccionEntity> GetById(DireccionEntity entity)
        {
            try
            {
                var result = sql.QueryFirstAsync<DireccionEntity>("DireccionObtener", new
                {
                    entity.IdDireccion
                });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }
        }



        public async Task<DBEntity> Create(DireccionEntity entity)
        {
            try
            {
                

                var result = sql.ExecuteAsync("DireccionInsertar", new
                {
                    entity.DireccionExacta,
                    entity.IdPersona,
                    entity.IdCatalogoProvincia,
                    entity.IdCatalogoCanton,
                    entity.IdCatalogoDistrito,
                    entity.Estado,

                });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }
        }


        public async Task<DBEntity> Update(DireccionEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("DireccionActualizar", new
                {
                    entity.IdDireccion,
                    entity.DireccionExacta,
                    entity.IdPersona,
                    entity.IdCatalogoProvincia,
                    entity.IdCatalogoCanton,
                    entity.IdCatalogoDistrito,
                    entity.Estado,
                });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }
        }


        public async Task<DBEntity> Delete(DireccionEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("DireccionEliminar", new
                {
                    entity.IdDireccion,
                });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
