#!/usr/bin/perl -w
use strict;
use warnings;
use CGI qw(:standard);

print header('text/html;charset=UTF-8');
print start_html('Resultado de la Calculadora');

my $expression = param('expression') || ''; 

if ($expression =~ /^[\d\+\-\*\/\(\)\s\.]+$/) {
    my $resultado = eval $expression;
    if ($@) {
        print "<h2>Error en la expresión: $@</h2>";
    } else {
        print "<h2>Expresión: $expression</h2>";
        print "<h2>El resultado es: $resultado</h2>";
    }
} else {
    print "<h2>Entrada inválida. Solo se permiten números, operadores básicos y paréntesis.</h2>";
}

print end_html();
