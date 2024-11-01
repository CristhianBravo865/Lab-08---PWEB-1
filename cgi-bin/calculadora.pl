#!/usr/bin/perl -w
use strict;
use warnings;
use CGI qw(:standard);

print header('text/html;charset=UTF-8');
print start_html(
    -title => 'Resultado de la Calculadora',
    -style => {-src => '../css/styles.css'},
);
print <<'HTML';
    <header>
        <img src="../images/fips-logo.png" alt="Logo Universidad">
    </header>
    <main>
        <h1>Resultado de la Calculadora</h1>
HTML

my $expression = param('expression') || ''; 

if ($expression =~ /^[\d\+\-\*\/\(\)\s\.]+$/) {
    my $resultado = eval $expression;
    if ($@) {
        print "<h2>Error en la expresión: $@</h2>";
    } else {
        print <<HTML;
        <div class="calculadora-container">
            <h2>Expresión: $expression</h2>
            <h2>El resultado es: $resultado</h2>
        </div>
HTML
    }
} else {
    print "<h2>Entrada inválida. Solo se permiten números, operadores básicos y paréntesis.</h2>";
}

print <<'HTML';
    </main>
    <footer>
        <p>Cristhian Bravo</p>
    </footer>
HTML

print end_html();
