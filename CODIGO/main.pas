program ScientificCalculator;

uses
  SysUtils, Math;

function GetValidNumber(prompt: string): Double;
var
  input: string;
  value: Double;
  code: Integer;
begin
  repeat
    Write(prompt);
    ReadLn(input);
    Val(input, value, code);
    if code <> 0 then
      WriteLn('Entrada inválida. Por favor, insira um número válido.');
  until code = 0;
  GetValidNumber := value;
end;

procedure ShowMenu;
begin
  WriteLn('Calculadora Científica');
  WriteLn('1. Adição');
  WriteLn('2. Subtração');
  WriteLn('3. Multiplicação');
  WriteLn('4. Divisão');
  WriteLn('5. Seno');
  WriteLn('6. Cosseno');
  WriteLn('7. Exponenciação');
  WriteLn('8. Logaritmo (base 10)');
  WriteLn('9. Sair');
end;

procedure PerformAddition;
var
  a, b, result: Double;
begin
  a := GetValidNumber('Digite o primeiro número: ');
  b := GetValidNumber('Digite o segundo número: ');
  result := a + b;
  WriteLn('Resultado: ', result:0:2);
end;

procedure PerformSubtraction;
var
  a, b, result: Double;
begin
  a := GetValidNumber('Digite o primeiro número: ');
  b := GetValidNumber('Digite o segundo número: ');
  result := a - b;
  WriteLn('Resultado: ', result:0:2);
end;

procedure PerformMultiplication;
var
  a, b, result: Double;
begin
  a := GetValidNumber('Digite o primeiro número: ');
  b := GetValidNumber('Digite o segundo número: ');
  result := a * b;
  WriteLn('Resultado: ', result:0:2);
end;

procedure PerformDivision;
var
  a, b, result: Double;
begin
  a := GetValidNumber('Digite o primeiro número: ');
  repeat
    b := GetValidNumber('Digite o segundo número (diferente de zero): ');
    if b = 0 then
      WriteLn('Divisão por zero não é permitida.');
  until b <> 0;
  result := a / b;
  WriteLn('Resultado: ', result:0:2);
end;

procedure PerformSine;
var
  a, result: Double;
begin
  a := GetValidNumber('Digite o ângulo em graus: ');
  result := Sin(DegToRad(a));
  WriteLn('Resultado: ', result:0:2);
end;

procedure PerformCosine;
var
  a, result: Double;
begin
  a := GetValidNumber('Digite o ângulo em graus: ');
  result := Cos(DegToRad(a));
  WriteLn('Resultado: ', result:0:2);
end;

procedure PerformExponentiation;
var
  a, b, result: Double;
begin
  a := GetValidNumber('Digite a base: ');
  b := GetValidNumber('Digite o expoente: ');
  result := Power(a, b);
  WriteLn('Resultado: ', result:0:2);
end;

procedure PerformLogarithm;
var
  a, result: Double;
begin
  repeat
    a := GetValidNumber('Digite o número (maior que zero): ');
    if a <= 0 then
      WriteLn('O logaritmo de números menores ou iguais a zero não é definido.');
  until a > 0;
  result := Log10(a);
  WriteLn('Resultado: ', result:0:2);
end;

var
  choice: Integer;
begin
  repeat
    ShowMenu;
    Write('Escolha uma opção: ');
    ReadLn(choice);
    case choice of
      1: PerformAddition;
      2: PerformSubtraction;
      3: PerformMultiplication;
      4: PerformDivision;
      5: PerformSine;
      6: PerformCosine;
      7: PerformExponentiation;
      8: PerformLogarithm;
      9: WriteLn('Saindo...');
    else
      WriteLn('Opção inválida. Por favor, escolha uma opção válida.');
    end;
    WriteLn;
  until choice = 9;
end.
