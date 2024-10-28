# README du projet GitLab x Vagrant

## Prérequis

Avant de commencer, assurez-vous d'avoir installé les logiciels suivants :

- **[VirtualBox](https://www.virtualbox.org/)** : un hyperviseur open source pour créer et gérer des machines virtuelles.
- **[Vagrant](https://www.vagrantup.com/)** : un outil pour construire et gérer des environnements de développement virtuels.

## Ce que le projet fait

Ce projet configure une machine virtuelle avec GitLab CE (Community Edition) en utilisant Vagrant et VirtualBox. Il automatise le processus d'installation de GitLab sur une distribution Ubuntu 22.04, en configurant les paramètres nécessaires pour un fonctionnement optimal, y compris la configuration du réseau et la sécurité. Le script inclut des instructions pour installer les dépendances, configurer Let's Encrypt pour la gestion des certificats SSL, et personnaliser les paramètres de GitLab.

## Pourquoi le projet est utile

Ce projet est utile pour les développeurs et les équipes qui souhaitent déployer rapidement une instance de GitLab pour la gestion de code, l'intégration continue et le déploiement. En utilisant Vagrant, il permet de créer un environnement de développement reproductible et isolé, facilitant ainsi la collaboration entre les membres de l'équipe et réduisant les problèmes liés aux différences d'environnement. La configuration automatique des certificats SSL améliore également la sécurité des projets hébergés.

## Prise en main du projet par les utilisateurs

Pour commencer avec ce projet, suivez ces étapes :

1. **Cloner le dépôt :**
   ```bash
   git clone https://github.com/Arrrman/vagrantgitlab.git
   cd vagrantgitlab
   ```

3. **Modifier le fichier de configuration de GitLab :**
   Vous devez modifier la ligne suivante dans le fichier `Vagrantfile` :
   ```ruby
   sed -i "s|external_url 'http://gitlab.example.com'|external_url 'https://your.domain.local'|" /etc/gitlab/gitlab.rb
   ```
   Remplacez `https://your.domain.local` par le domaine que vous souhaitez.

3. **Lancer la machine virtuelle :**
   ```bash
   vagrant up
   ```

4. **Accéder à GitLab :**
   Une fois la machine virtuelle démarrée, ouvrez votre navigateur et allez à `http://192.168.33.25` ou `https://your.domain.local` pour accéder à l'interface de GitLab.

5. **Configurer GitLab :**
   Vous pourrez vous connecter avec les identifiants par défaut `root` et le mot de passe est disponible en faisant un `cat /etc/gitlab/initial_root_password` ansi vous pouvez configurer votre instance selon vos besoins.

6. **Arrêter la machine virtuelle :**
   Lorsque vous avez terminé, vous pouvez arrêter la machine virtuelle avec :
   ```bash
   vagrant halt
   ```

7. **Destruction de la machine virtuelle :**
   Si vous souhaitez supprimer la machine virtuelle, utilisez :
   ```bash
   vagrant destroy
   ```

## Remarques

- Assurez-vous que votre réseau est configuré pour permettre l'accès à l'adresse IP `192.168.33.25` sinon à vous de définir l'IP selon vos caractéristique.
- La configuration de Let's Encrypt nécessite que le domaine soit correctement configuré pour pointer vers cette adresse IP.
- Une redirection de ports sur le 80 et 443 peut être nécessaire

## Configuration des Runners

Les runners GitLab ont été correctement configurés pour exécuter nos jobs CI/CD. Ils sont essentiels pour l'automatisation de nos processus de développement.

![Runners GitLab configurés](images/runners.png)

## Pipeline CI/CD

Notre pipeline CI/CD a été configuré avec succès et fonctionne comme prévu. Il automatise le processus de build, de test et de déploiement de notre application.

![Pipeline CI/CD réussi](images/pipeline.png)

## Tests de Fumée

Les tests de fumée ont été implémentés et exécutés avec succès, garantissant le bon fonctionnement de base de notre application après chaque déploiement.

![Tests de fumée réussis](images/smoke_tests.png)

## Authors

- [@Arrrman](https://www.github.com/Arrrman)
