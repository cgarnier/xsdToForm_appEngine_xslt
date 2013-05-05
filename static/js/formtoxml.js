function btnTestClick() {
    var ch;
    $('#theform').children("fieldset").each(function () {
        ch = parcours($(this));

    });
    $('#result').val(ch);

}
$(document).ready(function () {
    $('.addbtn').click(function () {
        var clo = $(this).next().clone();
       $(this).parent().append(clo);

    });

    $('#rform').submit(function () {
        var ch;
        alert('ok');
        $('#theform').children("fieldset").each(function () {
            ch = parcours($(this));

        });
        $('#result').val(ch);
    });
});


function parcours(elem) {
    var res = '', attr = '', elems = '';
    res += '<' + elem.children("legend").text() + '';


    elem.children("p").has("input").each(function () {
        if ($(this).attr("class") && $(this).attr("class") == 'attribute')
            attr += ' ' + $(this).find("input").attr("name") + "=\"" + $(this).find("input").val() + "\"";
        else
            elems += '<' + $(this).find("input").attr("name") + '>' +
                $(this).find("input").val() +
                '</' + $(this).find("input").attr("name") + '>';
    });
    elem.children("p").has("textarea").each(function () {
        elems += '<' + $(this).find("textarea").attr("name") + '>' +
            $(this).find("textarea").val() +
            '</' + $(this).find("textarea").attr("name") + '>';
    });
    elem.children("p").has("select").each(function () {
        elems += '<' + $(this).find("select").attr("name") + '>' +
            $(this).find("select").val() +
            '</' + $(this).find("select").attr("name") + '>';
    });

    res += attr + '>' + elems;
    $(elem).children("fieldset").each(function () {
        res += parcours($(this));

    });
    res += '</' + elem.children("legend").text() + '>';
    return res;

}
function transformToXml() {

    $('#transRes').xslt({xmlUrl: 'static/xsl/test.xml', xslUrl: 'static/xsl/form.xsl'});

    alert($('#transRes').html);

}

