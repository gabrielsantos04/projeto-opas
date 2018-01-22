/**
 * Created by gabrielsantos on 12/04/17.
 */
app.controller('CadastroCartaoController',function($scope,$http,$sce, viaCEP)
{
    $scope.cartao= {};
    $scope.person = {status: false};
    $scope.card_number = "";
    $scope.csv = "";
    $scope.cpf = "";
    $scope.show_card = true;
    $scope.card_error = false;
    $scope.cpf_error = false;
    $scope.password_error = false;
    $scope.passowrod_error = false;


    $scope.consulta_cartao = function() {
        $http.get("/cadastro/validation_card",{
            params:{card_number: $scope.card_number, csv: $scope.csv}
        }).then(function success(data) {
            $scope.cartao = data.data;
            $scope.show_card = !$scope.cartao.status;
            $scope.card_error = !$scope.cartao.status;
        });
    };

    $scope.consulta_cpf = function() {
        $http.get("/cadastro/validation_cpf",{
            params:{cpf: $scope.cpf}
        }).then(function success(data) {
            $scope.person = data.data;
            $scope.cpf_error = !$scope.person.status
        });
    };

    $scope.create_card = function() {
        $http.post("/cadastro/set_cartao",{
            card: $scope.cartao.card, person: $scope.person
        }).then(function success(data) {
            if(data.status){
                //window.location.replace('/')
            }else{
                alert('teste')
            }
        });
    };



});