namespace DireccionEdit {
    var Entity = $("#AppEdit").data("entity");

    var Formulario = new Vue({

        data: {
            Formulario: "#FormEdit",
            Entity: Entity,
            CantonLista: [],
            DistritoLista: [],
        },

        methods: {

            OnChangeProvincia() {
                Loading.fire("Cargando...")

                App.AxiosProvider.DireccionChangeProvincia(this.Entity).then(
                    data => {
                        Loading.close();
                        this.CantonLista=data

                    }

                );

            },

            OnChangeCanton() {
                Loading.fire("Cargando...")

                App.AxiosProvider.DireccionChangeCanton(this.Entity).then(
                    data => {
                        Loading.close();
                        this.DistritoLista = data

                    }

                );

            },

            Save() {

                if (BValidateData(this.Formulario)) {
                    Loading.fire("Guardando..");

                    console.log(this.Entity)
                    debugger

                    App.AxiosProvider.DireccionGuardar(this.Entity).then(
                        data => {
                            Loading.close();

                            if (data.CodeError == 0) {
                                Toast.fire({ title: "Se guardó satisfactoriamente", icon: "success" }).then(() => window.location.href = "Direccionn/Grid");

                            } else {

                                Toast.fire({ title: data.MsgError, icon: "error" })
                            }

                        }

                    );

                                    }
                else {

                    Toast.fire({ title: "Por favor complete los campos requeridos", icon: "error" });
                }
                            }
                    },


        mounted() {

            CreateValidator(this.Formulario);
        },
        created() {
            this.OnChangeProvincia();
            this.OnChangeCanton();
        }
    }
    );

    Formulario.$mount("#AppEdit");


}