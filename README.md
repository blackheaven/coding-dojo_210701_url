# Url matcher
https://www.meetup.com/fr-FR/Software-Craftsmanship-Lyon/events/278895156/

Sujet: Url Matcher
---------------------------------------
Ce sujet est adapté aux débutants en TDD, n'hésitez pas à participer pour découvrir cette approche.
---------------------------------------

Pour perfectionner votre outil de test vous devez fabriquer un outil permettant de retrouver le première URL correspondant à une recherche dans une liste.

Les URLs sont les endpoints de WebServices appelés pendant une campagne de tests :

* /invoices
* /invoices/42/products
* /customers
* ...

Les recherches se font en recherchant des parties d'URLs :

* invoices
* invoices, products
* ...

Une URL ne correspond à la recherche que si elle contient tous les termes dans le même ordre. Avec nos 3 urls précédentes on aurait donc :

invoices -> /invoices
inv -> /invoices
invoics -> résultat vide (typo dans la recherche)
invoices, products -> /invoices/42/products
products, invoices -> résultat vide (pas dans le bon ordre)

Pour compiler : https://docs.haskellstack.org/en/stable/README/
