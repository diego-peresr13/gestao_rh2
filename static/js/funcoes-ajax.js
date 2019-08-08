function getCookie(name)
{
    var cookieValue = null;
    if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?

            if (cookie.substring(0, name.length + 1) == (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

function process_response(branches) {
    branch_select = document.getElementById('branches');
    branch_select.innerHTML = "";

    var option = document.createElement("option");
    // option.setAttribute = ('value', "999");
    option.value = '999';
    option.text = "Todos";
    branch_select.add(option);
    document.getElementById("branches").appendChild(option);


    branches.forEach(function (branch) {
        var option = document.createElement("option");
        // option.setAttribute = ('value', branch.fields.cod_filial);
        option.value = branch.fields.slug;
        option.text = branch.fields.cod_filial + " - " + branch.fields.razao_social;
        branch_select.add(option);
        document.getElementById("branches").appendChild(option);

    });


}


function filterBranch() {
    companyId = document.getElementById('companies').value;

    $.ajax({
        type: 'GET',
        url: 'filterBranch/',
        data: {
            param: companyId
        },

        success: function (result) {
            process_response(result);
            $('#message').text('Filiais Selecionadas');

        }
    })
}

function CallProcessoExec() {
    company = document.getElementById('companies').value;
    branch = document.getElementById('branches').value;
    BeginDate = document.getElementById('dataIni').value;
    EndDate = document.getElementById('dataFim').value;
    token = getCookie('csrftoken');
    url2 = $("#Url").attr("data-url");
    console.log(url2);   

    $.ajax({        
        type: 'POST',
        url: 'CallProcessoExec/',
        data: {
            csrfmiddlewaretoken: token,
            Company: company,
            Branch: branch,
            BeginDate: BeginDate,
            EndDate: EndDate        
        },        
        success: function (data) {
            window.location.href = url2;
            console.log(data);
        },
        error: function () {
            // alert('Deu Erro');
            console.log('Deu Erro');
        }
    })
}