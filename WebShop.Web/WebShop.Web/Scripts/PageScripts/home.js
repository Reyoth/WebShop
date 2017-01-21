var home = {};

$(document)
    .ready(function () {
        home.bindAction();
        home.bindSearch();
        //$(document)
        //    .on('click',
        //        "#btnCreateModal",
        //        function() {
        //            //console.log("bouton create modal click");
        //            $.ajax({
        //                type: "POST",
        //                url: '@Url.Action("Create", "Personne")',
        //                data: $("#frmCreate").serialize(),
        //                success:
        //                    function(data) {
        //                        if (data.result == "ok") {
        //                            $("#myModal").modal("hide");
        //                            location.reload();
        //                        } else {
        //                            $("#myModalcontent").html(data);
        //                            $("#myModal").modal("show");
        //                        }
        //                    }
        //            });
        //        });
    });



home.bindAction = function() {
    $('[data-action]')
        .click(function() {
            //console.log("bouton create click");
            var id = $(this).attr('data-id');
            var action = $(this).attr('data-action');
            $.ajax({
                type: "GET",
                url: '/Articles/' + action + '/' + id,
                success:
                    function(data) {
                        $("#myModalcontent").html(data);
                        $("#myModal").modal("show");
                        common.bindAjaxSelect('#myModal');
                    }
            });
        });
};

home.bindSearch = function() {
    $("#search")
        .click(function() {
            //console.log("bouton create click");
            $.ajax({
                type: "GET",
                url: '/Home/Search/?categoryId=' +
                    $('#Categorie').val() +
                    '&subCategoryId=' +
                    $('#SousCategorie').val(),
                //url: Url.Action("Search","Articles"),

                success: function(response) {
                    //var articles;
                    //$('#tableau').html("") ;
                    var trHtml = '';
                    $.each(response,
                        function(i, item) {
                            trHtml += '<tr><td><img src="' +
                                item.ART_Image +
                                '" class = "imageGrid"/></td><td>' +
                                item.ART_Libelle +
                                '</td><td>' +
                                item.ART_Prix +
                                '</td><td>' +
                                item.ART_Stock +
                                '</td><td>' +
                                home.getDetailsButton(item.ART_Id) +
                                '</td></tr>';
                        });
                    $('#tableau table tbody').html(trHtml);
                    home.bindAction();
                }
            });
        });
}

home.getDetailsButton = function (articleId) {
    return '<a class="btn btn-sm btn-primary" data-id="' + articleId + '" data-action="Detail">Détails</a>';
};