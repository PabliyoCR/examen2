using BD;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WBL
{
    public interface IPersonaService
    {
        Task<DBEntity> Create(PersonaEntity entity);
        Task<DBEntity> Delete(PersonaEntity entity);
        Task<IEnumerable<PersonaEntity>> Get();
        Task<PersonaEntity> GetById(PersonaEntity entity);
        Task<DBEntity> Update(PersonaEntity entity);
        Task<IEnumerable<PersonaEntity>> GetLista();
    }

    public class PersonaService : IPersonaService
    {
        private readonly IDataAccess sql;

        public PersonaService(IDataAccess _sql)
        {
            sql = _sql;
        }


        public async Task<IEnumerable<PersonaEntity>> Get()
        {
            try
            {
                var result = sql.QueryAsync<PersonaEntity>("PersonaObtener");

                return await result;
            }
            catch (Exception)
            {

                throw;
            }



        }
        public async Task<IEnumerable<PersonaEntity>> GetLista()
        {
            try
            {
                var result = sql.QueryAsync<PersonaEntity>("PersonaLista");

                return await result;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public async Task<PersonaEntity> GetById(PersonaEntity entity)
        {
            try
            {
                var result = sql.QueryFirstAsync<PersonaEntity>("PersonaObtener", new
                {

                    entity.IdPersona

                });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }



        }


        public async Task<DBEntity> Create(PersonaEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("PersonaInsertar", new
                {

                    entity.Cedula,
                    entity.Nombre,
                    entity.Primer_Apellido,
                    entity.Segundo_Apellido,
                    entity.FechaNacimiento,
                    entity.TieneHijos,
                    entity.Cuantos,
                    entity.Estado


                });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }



        }

        public async Task<DBEntity> Update(PersonaEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("PersonaActualizar", new
                {
                    entity.IdPersona,
                    entity.Cedula,
                    entity.Nombre,
                    entity.Primer_Apellido,
                    entity.Segundo_Apellido,
                    entity.FechaNacimiento,
                    entity.TieneHijos,
                    entity.Cuantos,
                    entity.Estado


                });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }



        }

        public async Task<DBEntity> Delete(PersonaEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("PersonaEliminar", new
                {
                    entity.IdPersona,


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
