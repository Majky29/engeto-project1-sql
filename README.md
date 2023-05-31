# engeto-project1-sql
Riešenie prvého projektu kurzu Dátovej akadémie Engeto

## 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
Z dlhodobého hľadiska mzdy stúpali vo všetkých odvetviach, avšak v každom odvetví sa vyskytol prípad, kedy priemerná mzda klesla medzi jednotlivými rokmi. Jedinou výnimkou je Spracovateľský priemysel (C) a Ostatné činnosti (S), ktoré zaznamenali rast priemernej mzdy každý nameraný rok. 

## 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
Množstvo potravín, ktoré je možné je kúpiť, závisí od priemerných platov a ceny potravín v danom porovnateľnom období. Preto som zvolil reprezentáciu odpovede vo forme tabuliek.

Chlieb v prvom porovnateľnom období
<img src="https://github.com/Majky29/engeto-project1-sql/blob/main/Obrazky/1.png" alt="Alt text" title="Chlieb v prvom porovnateľnom období">

Mlieko v prvom porovnateľnom období
<img src="https://github.com/Majky29/engeto-project1-sql/blob/main/Obrazky/1.png" alt="Alt text" title="Mlieko v prvom porovnateľnom období">

Chlieb v poslednom porovnateľnom období
<img src="https://github.com/Majky29/engeto-project1-sql/blob/main/Obrazky/1.png" alt="Alt text" title="Chlieb v poslednom porovnateľnom období">

Mlieko v poslednom porovnateľnom období
<img src="https://github.com/Majky29/engeto-project1-sql/blob/main/Obrazky/1.png" alt="Alt text" title="Mlieko v poslednom porovnateľnom období">

## 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
Ceny potravín sa medzi rokmi pohybovali veľmi divoko, či už jedným alebo druhým smerom. Z dát súdim, že najpomalšie zdražuje pivo. Za zmienku stojí aj šunkový salám. 

## 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
Vzhľadom na veľký počet zamestnaní, potravín a ich veľmi rôzne nárasty medzi rokmi, rozhodol som sa spriemerovať hodnoty nárastov platov a cien potravín za jednotlivé roky a následne medzi nimi spraviť rozdiel.

Podľa tohto scenáru mi vychádza, že jediný rok, kedy bol medziročný nárast potravín väčší ako 10%, bol rok 2008-2009, kedy bol rozdiel medzi priemerom nárastov cien potravín a nárastov platov 11,61%. Toho roku šli potraviny dole v priemere o 7,53%. pričom platy zamestnancov boli zvýšené v priemere o 4,08%.

## 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
Roky, kedy HDP Českej republiky výraznejšie stúplo (bavme sa viac ako 5%), boli 2007, 2015 a 2017.
V týchto rokoch bol a taktiež v roku po boli zaznamenané pomerne výrazne zvýšenia priemerných platov.
Z týchto rokov potraviny výrazne zdraželi v roku 2007 (v priemere 14,7%) a v roku 2017 (v priemere 9.05%)
