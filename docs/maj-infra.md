---
title: MAJ Infra
---

# Mise à jour de l'infrastructure

En modifiant le terraform afin d'ajouter de nouvelles ressources on peut relancer un plan grâce à la commande :
```bash
terraform plan
```

Vérifier le résultat obtenu et une fois valider :
```bash
terraform apply
```

{% info %}

```bash
# commande pour valider le terraform
terraform validate

# commande pour formatter et indenté correctement les fichiers terraform
terraform fmt
```
