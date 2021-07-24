"use strict";
var PersonaGrid;
(function (PersonaGrid) {
    if (MensajeApp != "") {
        Toast.fire({
            icon: "success", title: MensajeApp
        });
    }
    function OnClickEliminar(id) {
        ComfirmAlert("Desea eliminar el registro?", "Eliminar", "warning", "#3085d6", "#d33")
            .then(function (result) {
            if (result.isConfirmed) {
                window.location.href = "Persona/Grid?handler=Eliminar&id=" + id;
            }
        });
    }
    PersonaGrid.OnClickEliminar = OnClickEliminar;
    $("#GridView").DataTable();
})(PersonaGrid || (PersonaGrid = {}));
//# sourceMappingURL=Grid.js.map