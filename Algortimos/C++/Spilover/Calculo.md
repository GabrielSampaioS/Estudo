# Spilover
Objetivo do projeto é o desenvolvimento de uma simulçao de trasmição de um virus
Utilizando como base o Modelo SIR, e algumas ideias sobre o virus
Como mutação do mesmo, virulencia e infectividade

## Modelo SIR ##
O modelo SIR é um modelo bem conhecido na literatura, é uma visão de alto nivel sobre a evolução de uma população em epidemias, onde temos:
<li> Suscetível (S)  : indivíduos ainda não expostos e que podem adquirir a infecção. </li>
<li> Infectada  (I)  : indivíduos infectados, doentes ou não, que podem transmitir para outras pessoas. </li>
<li> Recuperada (R)  : indivíduos que se infectaram e se recuperaram, adquirindo imunidade </li>

<br> Inicialmente os parâmetros são estimados com base no conhecimento acumulado em epidemias anteriores ou, da própria epidemia e do seu desenvolvimento em outros locais

<br> A equação do modelo: 

![modeloSIR](https://github.com/GabrielSampaioS/Spilover/assets/89399378/e527e0df-a809-4218-b55a-4d04a6b92454)

[Explicando e aplicando o modelo-sir](#explicando-e-aplicando-o-modelo-sir)

## Vírus ##
Vamos começar com uma definição por David Quammen no livro dele: Virulência é um conceito tão relativo e caleidoscópico que alguns especialistas se recusam a usar essa palavra. Eles preferem "patogenicidade", que é quase um sinônimo, mas não exatamente. Patogenicidade é a capacidade de um micróbio de causar uma doença. Virulência é o grau mensurável da tal doença, especialmente quando a medida em relação a outras cepas de patógenos semelhantes.

<br> E um velho clichê sobre a virulência: A primeira regra de sucesso para um parasita é "não mate seus hospedeiro"
que em outras palavras é, a co-evolução entre organismos sendo infectados e organismos infecciosos tenderia sempre a uma convivência harmoniosa no sentido de garantir máxima sobrevivência para ambos os lados.
porem o que os dados vem mostrando é que na verdade a regra é "Só queime as pontes depois de atravessá-lá". O vírus Mixoma é um exemplo disso, link de um dos estudos sobre o vírus no fim do arquivo

<br> No código tentarei criar um modelo que chegue nesta conclusão, criar um modelo de virus com características como 

<li> infectividade </li>
<li> virulencia </li>
<li> Tempo de cubação</li>

<br> Entre outros parametrôs, também tentarei criar alguma lógica a respeito dos hospedeiros resevatórios para tentar criar o evento Spilover 

<br> 4 desafios básicos(não vamos nos preocuprar com essas partes no código):
<ol type="1">
<li>Como passar de um hospedeiro para outro</li>
<li>Como penetrar numa célula dentro desse hospedeiro</li>
<li>Como se apoderar do equipamento e dos recursos da célula para produzir várias cópias de si mesmo</li>
<li>Como sair novamente - sair da célula, sair do hospedeiro, e como entrar no próximo</li>
</ol>

## Explicando e Aplicando o modelo SIR ##
<br> A equação do modelo SIR: 

![modeloSIR](https://github.com/GabrielSampaioS/Spilover/assets/89399378/e527e0df-a809-4218-b55a-4d04a6b92454)
<br>onde temos:

<li> β e γ são positivos </li>
<li> β a taxa de infecção </li> 
<li> γ  a taxa de recuperação dos indivíduos, </li> 
<li> N = S + I + R = População total </li> 
OBS: neste caso o R é refente aos indivíduos recuperados MAIS os indivíduos mortos, já que o N neste caso é constante

<br> Um detalhe importante, β é a taxa de infecção entre os hospedeiros e <strong> NÂO </strong> a taxa de infecção do virus para o hospedeiro. Para isso vamos utilizar algumas outras ideas para simular o virus

<br> O modelo SIR trabalha com algumas hipóteses, antes de mostar a aplicação, vamos por partes, começando com as hipóteses:

<ol type="1">
  <li>A população em análise é muito numerosa o que permite ignorar efeitos aleatórios, devidos às diferenças entre os indivíduos e outros factores.</li>
  <li>Também assumimos que, em qualquer momento, a população é homogeneamente misturada, isto é, supomos que os infecciosos (infectados e contagiosos) e susceptíveis estão sempre distribuídos aleatoriamente na área em que a população vive (não se consideram eventuais heterogeneidades espaciais).</li>
  <li>A doenca é transmitida por proximidade ou contacto entre um infeccioso e um susceptível.</li>
  <li>Um susceptível fica infectado logo após a transmissão, isto é, ignoramos o período de latência da doença, fixando-o igual a zero.</li>
  <li>Os infectados eventualmente recuperam e, uma vez recuperados, ficam para sempre imunes (pelo menos durante o periodo em análise).</li>
  <li>Ignoramos nascimentos, mortes ou efeitos migratórios.</li>
</ol>

O modelo funciona por tempo, referente ao intervalo entre dois períodos consecutivos Δt=tn+1−tn,n=1,2,3,... supõe-se constante – é medido numa unidade de tempo apropriada (hora, dia, semana, ano, etc., conforme o contexto).

### Cálculo ###

Basicamente temos 1 equações para cada população do o modelo SIR, que são:
...


## Links utilizados de apoio neste projeto: ##
  
Modelo SIR
+ https://wp.ufpel.edu.br/fentransporte/2020/04/09/a-evolucao-epidemica-do-covid-19-modelo-sir/
+ https://wikiciencias.casadasciencias.org/wiki/index.php/Modelo_SIR_em_epidemiologia

Vírus Mixoma
  + https://doc.woah.org/dyn/portal/digidoc.xhtmlstatelessToken=GM8Xf0a_v2ti23NVK8oEEHtk8jKsNtjghHMVc27qSzE=&actionMethod=dyn%2Fportal%2Fdigidoc.xhtml%3AdownloadAttachment.openStateless

## Livros: ##

+ Contágio: Infecções de origem animal, por David Quammen (Autor)

## YouTube: ##

Modelo SIR 
+ https://www.youtube.com/watch?v=E28j6EYGTeo


