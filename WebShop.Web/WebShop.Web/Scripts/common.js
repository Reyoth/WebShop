var common = {};

$(document).ready(function () {
    common.bindAjaxSelect();
    common.bindDatePickers();
});

common.bindAjaxSelect = function (parentSelector) {
    var selector = parentSelector === undefined
        ? '[data-toggle="ajaxSelect"]'
        : parentSelector + ' [data-toggle="ajaxSelect"]';
    $(selector).each(function () {
        common.clearSelect($(this));
    });
    $('[data-toggle="ajaxSelect"]').not('[data-cascade-from]').each(function () {
        common.fillAjaxSelect($(this));
        $(this).on('change', function () {
            sessionStorage.setItem($(this).attr('id'), $(this).val());
            common.bindAjaxSelectCascade('#' + $(this).attr('id'));
        });
    });
};

common.bindAjaxSelectCascade = function (selector) {
    $('[data-toggle="ajaxSelect"][data-cascade-from="' + selector + '"]').each(function () {
        common.fillAjaxSelect($(this), selector);
        $(this).unbind('change');
        $(this).on('change', function () {
            sessionStorage.setItem($(this).attr('id'), $(this).val());
            common.bindAjaxSelectCascade('#' + $(this).attr('id'));
        });
        //if (callback !== undefined)
        //    callback();
    });
};

common.fillAjaxSelect = function (select, cascadeFromSelector) {
    var controlId = select.attr('id');
    var sourceUrl = select.attr('data-source-url');
    var withEmpty = select.attr('data-with-empty');
    var selectedId = select.attr('data-selected-id');
    var parentId = $(cascadeFromSelector).val();
    var emptyCheck = withEmpty ? 1 : 0;
    var fillCascade = false;

    $('[data-toggle="ajaxSelect"][data-cascade-from="#' + select.attr('id') + '"]').each(function () {
        common.clearSelect($(this));
    });

    var requestParameters = parentId === undefined
        ? { ajax: true, withEmpty: withEmpty }
        : { ajax: true, parentId: parentId, withEmpty: withEmpty };

    $.getJSON(sourceUrl, requestParameters, function (response) {
        if (response.Success === true) {
            if (response.Data.length > emptyCheck) {
                var options = [];
                $.each(response.Data, function (key, item) {
                    if (selectedId !== undefined && item.Id === selectedId) {
                        options.push('<option value="' + item.Id + '" selected>' + item.Value + '</option>');
                    } else if (sessionStorage.getItem(select.attr('id')) === item.Id) {
                        options.push('<option value="' + item.Id + '" selected>' + item.Value + '</option>');
                        fillCascade = true;
                    } else {
                        options.push('<option value="' + item.Id + '">' + item.Value + '</option>');
                    }
                });
                select.html(options.join(''));
                select.enable();

                if ((selectedId !== undefined && selectedId !== '') || fillCascade) {
                    common.bindAjaxSelectCascade('#' + controlId);
                }
            } else {
                common.clearSelect(select);
            }
        } else {
            common.clearSelect(select);
            //TODO : append error message to page.
        }
    });
};

common.clearSelect = function (select) {
    select.disable();
    select.html('');
    $('[data-toggle="ajaxSelect"][data-cascade-from="' + select.attr('id') + '"]').each(function () {
        common.clearSelect($(this));
    });
};

common.bindDatePickers = function() {
    $('.datepicker').datepicker({
        language: 'fr-FR',
        format: 'dd/mm/yyyy'
    });
    $('.datepicker').val($('.datepicker').val().replaceAll('-', '/'));
};

//var search = {};

//search.setMaintainSearch = function() {
//    $('#search')
//        .click(function () {
//            var selected = $('#Categorie').val();
//            sessionStorage.setItem('Categorie', selected);
//            selected = $('#SousCategorie').val();
//            sessionStorage.setItem('SousCategorie', selected);
//        });

//    if (sessionStorage.getItem('Categorie') !== null) {
//        $('#Categorie').val(sessionStorage.getItem('Categorie'));
//        common.bindAjaxSelectCascade('#Categorie', function() {
//            if (sessionStorage.getItem('SousCategorie') !== null)
//                $('#SousCategorie').val(sessionStorage.getItem('SousCategorie'));
//        });
//    }
//};

//$(document)
//    .ready(function() {
//        search.setMaintainSearch();
//    });

/*======================*/
/*=== jQuery plugins ===*/
/*======================*/

$.fn.disable = function () {
    if (this.is('input, select, textarea, button'))
        this.prop('disabled', true);
    else this.addClass('disabled');
    return this;
};

$.fn.enable = function () {
    this.prop('disabled', false)
        .removeClass('disabled');
    return this;
};

/*=============================*/
/*=== Javascript extensions ===*/
/*=============================*/

// ReSharper disable once NativeTypePrototypeExtending
String.prototype.replaceAll = function(searchValue, replaceValue) {
    return this.split(searchValue).join(replaceValue);
};