import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(this._nome);

  Map<String, dynamic> toJson() {
    return{
        "nome": _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(this._nome, this._dependentes);

  Map<String, dynamic> toJson(){
    return{
        "nome": _nome,
        "dependentes": _dependentes.map((dependente) => dependente.toJson()).toList(),

    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(this._nomeProjeto, this._funcionarios);

  Map<String, dynamic> toJson(){
    
    return{
        "projeto":_nomeProjeto,
        "funcionarios": _funcionarios.map((funcionario)=>funcionario.toJson()).toList(),
    };
  }
}

void main() {
  var dep1 = Dependente("Lucas");
  var dep2 = Dependente("Luan");
  var dep3 = Dependente("Ryan");
  var dep4 = Dependente("Luigi");
  var dep5 = Dependente("Débora");

  var func1 = Funcionario("João", [dep1, dep2]);
  var func2 = Funcionario("Fernando", [dep3, dep4]);
  var func3 = Funcionario("Maria", [dep5]);

 var project = EquipeProjeto("Alfa", [func1, func2, func3]);

 String formatoJson = jsonEncode (project);
 print(formatoJson);
}