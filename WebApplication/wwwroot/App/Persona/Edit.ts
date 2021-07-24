namespace PersonaEdit {

    var Entity = $("#AppEdit").data("");

    var Formulario = new Vue({

        data: {
            Formulario: "#FormEdit",
            Entity: Entity,
        },

        methods: {
            RefrescarValidaciones() {
                setTimeout(() =>
                    BValidateData(this.Formulario), 200
                )
            },

        },


        mounted() {

            CreateValidator(this.Formulario);
        }

    }
    );

    Formulario.$mount("#ApppEdit");


}