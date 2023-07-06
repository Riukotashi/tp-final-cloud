---
title: "Rapport"
---

# Les étapes pour réaliser le devoir

1. Créer le repot GitHub pour le groupe
2. Installer Terraform en local
3. Installer VirtualBox sur nos machines respectifs
4. Télécharger les images ubuntu-server et créer une vm sur chaque post
5. Vérifier que les deux VM créée communique entre elle
6. Installer les outils nécessaires sur les vm (clefs ssh, Terraform, aws configuration pour la sauvegarde des states sur un S3...)
7. Faire une installation de DevStack (version alléger d'OpenStack) à la main afin de se rendre compte des étapes nécessaires à faire dans le Terraform
8. Faire le Terraform pour déployer l'OpenStack
9. Vérifier que tout fonctionne sur l'OpenStack
10. Faire le Terraform en testant en même temps avec des étapes manuels le déploiement des deux machines Ubuntu
11. Tout détruire
12. Tout redeployer
13. Vérifier

{% :warning: Ces étapes sont un résumé %}

Les détailles sur ces étapes qui sont plus de la documentation sont inclues dans les différentes pages prévues à cet effet

{% end %}



# Les choix de conception


## Utilisation de DevStack

Plus léger et plus pertinent pour les tests d'installation en effet nous ne sommes pas dans un environnement de production.


## S3 pour save les states

Utilisation d'un S3 sur AWS afin de sauvegarder les states en dehors des VM, autant mettent les bonnes pratiquent dès le départ des différentes conception de la solution.


## Faire une première fois les étapes à la main avant Terraform

Afin d'éviter une perte de temps sur des étapes qu'on aurait pu louper pendant l'installation de base.



# Difficultés rencontrées


## Réseau des vm au sein d'OpenStack

De la VM OpenStack, nous n'arrivons pas à nous connecter en ssh sur les vm créer sur l'OpenStack

{% error %}

La virtualisation dans la virtualisation

{% end %}
