"use strict";
var App;
(function (App) {
    var AxiosProvider;
    (function (AxiosProvider) {
        //export const GuardarEmpleado = () => axios.get<Entity.DBEntity>("aplicacion").then(({data})=>data );
        AxiosProvider.DireccionEliminar = function (id) { return axios.delete("Direccion/Grid?handler=Eliminar&id" + id).then(function (_a) {
            var data = _a.data;
            return data;
        }); };
        AxiosProvider.DireccionGuardar = function (entity) { return axios.post("Direccion/Edit").then(function (_a) {
            var data = _a.data;
            return data;
        }); };
        AxiosProvider.DireccionChangeProvincia = function (entity) { return axios.post("Direccion/Edit?handler=ChangeProvincia", entity).then(function (_a) {
            var data = _a.data;
            return data;
        }); };
        AxiosProvider.DireccionChangeCanton = function (entity) { return axios.post("Direccion/Edit?handler=ChangeCanton", entity).then(function (_a) {
            var data = _a.data;
            return data;
        }); };
        AxiosProvider.DireccionChangeDistrito = function (entity) { return axios.post("Direccion/Edit?handler=ChangeDistrito", entity).then(function (_a) {
            var data = _a.data;
            return data;
        }); };
    })(AxiosProvider = App.AxiosProvider || (App.AxiosProvider = {}));
})(App || (App = {}));
//# sourceMappingURL=AxiosProvider.js.map