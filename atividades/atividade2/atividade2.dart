// Agregação e Composição
import 'dart:convert';


class Dependente {
 late String _nome;


 Dependente(String nome) {
   this._nome = nome;
 }


 Map<String, dynamic> toJson() {
   return {
     "nome": _nome,
   };
 }
}


class Funcionario {
 late String _nome;
 late List<Dependente> _dependentes;


 Funcionario(String nome, List<Dependente> dependentes) {
   this._nome = nome;
   this._dependentes = dependentes;
 }


 Map<String, dynamic> toJson() {
   return {
     "nome": _nome,
     "dependentes": _dependentes.map((d) => d.toJson()).toList(),
   };
 }
}


class EquipeProjeto {
 late String _nomeProjeto;
 late List<Funcionario> _funcionarios;


 EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
   _nomeProjeto = nomeprojeto;
   _funcionarios = funcionarios;
 }


 Map<String, dynamic> toJson() {
   return {
     "nomeProjeto": _nomeProjeto,
     "funcionarios": _funcionarios.map((f) => f.toJson()).toList(),
   };
 }
}


void main() {


 Dependente dependente1 = new Dependente("Dependente1");
 Dependente dependente2 = new Dependente("Dependente1");
 Dependente dependente3 = new Dependente("Dependente1");


 Funcionario funcionario1 = new Funcionario("Funcionario1", [dependente1]);
 Funcionario funcionario2 = new Funcionario("Funcionario2", [dependente2]);
 Funcionario funcionario3 = new Funcionario("Funcionario3", [dependente3]);


 List<Funcionario> funcionarioList = [funcionario1, funcionario2, funcionario3];


 EquipeProjeto equipe = new EquipeProjeto("App de Compras", funcionarioList);


 String jsonStr = jsonEncode(equipe.toJson());


 print(jsonStr);


 // 1. Criar varios objetos Dependentes
 // 2. Criar varios objetos Funcionario
 // 3. Associar os Dependentes criados aos respectivos
 //    funcionarios
 // 4. Criar uma lista de Funcionarios
 // 5. criar um objeto Equipe Projeto chamando o metodo
 //    contrutor que da nome ao projeto e insere uma
 //    coleção de funcionario
 // 6. Printar no formato JSON o objeto Equipe Projeto.
}




