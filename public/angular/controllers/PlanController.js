app.controller('plan_controller',function($scope){
	$scope.show_address = false;

	$scope.edit_number = false;
	$scope.show_number = false;
	$scope.show_phone = false;
	$scope.show_terms = false;
	$scope.exibir_endereco = true;
	
	
	$scope.exibir_numero = false;
	$scope.btn_continuar = false;
	$scope.continue_btn = false;

	$scope.edit_address = false;
	$scope.editar_numero = false;

	$scope.btn_endereco = true;

	$scope.initial_btn = true;

	$scope.endereco;
	$scope.telefone;

	$scope.initial = function(){
		$scope.initial_btn = false;
		$scope.show_address = true;
	}


	$scope.endereco_errado = function(){
		$scope.btn_endereco = false;
		$scope.edit_address = true;
		$scope.show_address = false;
	}

	$scope.mostrar_numero = function(){
		$scope.btn_endereco = false;
		$scope.show_address = false;
		$scope.show_number = !$scope.show_number;

	}

	$scope.reset_form = function(){
		$scope.endereco_errado();
		$scope.show_phone = false;
		$scope.btn_continuar = false;
		$scope.continue_btn = true;
		$("#continue_s").hide();

	}

	$scope.continue_s = function(){
		$scope.show_phone = false;
		$("#continue_s").show();

	}

	$scope.editar_endereco = function(){
		$scope.exibir_numero = !$scope.exibir_numero;
		$scope.editar_numero = true;
	}

	$scope.informar_telefone = function(){
		$scope.edit_address = !$scope.edit_address;
		$scope.show_phone = !$scope.show_phone;
		$scope.btn_continuar = !$scope.btn_continuar;
		$scope.edit_address = false;
		$scope.editar_numero = false;
		$scope.show_number = false;

	}

});