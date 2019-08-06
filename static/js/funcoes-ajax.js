function process_response(branches){
    branch_select = document.getElementById('branches');   
    branch_select.innerHTML = ""; 

    var option = document.createElement("option");
    // option.setAttribute = ('value', "999");
    option.value = '999';
    option.text = "Todos";
    branch_select.add(option);
    document.getElementById("branches").appendChild(option);
    

    branches.forEach(function(branch){
        var option = document.createElement("option");
        // option.setAttribute = ('value', branch.fields.cod_filial);
        option.value = branch.fields.slug;
        option.text = branch.fields.cod_filial + " - " + branch.fields.razao_social;
        branch_select.add(option);    
        document.getElementById("branches").appendChild(option);    
        
    });

    
}


function filterBranch(){
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