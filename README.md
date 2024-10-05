---

# README du projet GitLab Vagrant

## Prérequis

Avant de commencer, assurez-vous d'avoir installé les logiciels suivants :

**[VirtualBox](https://www.virtualbox.org/)** : un hyperviseur open source pour créer et gérer des machines virtuelles.
**[Vagrant](https://www.vagrantup.com/)** : un outil pour construire et gérer des environnements de développement virtuels.

## Ce que le projet fait

Ce projet configure une machine virtuelle avec GitLab CE (Community Edition) en utilisant Vagrant et VirtualBox. Il automatise le processus d'installation de GitLab sur une distribution Ubuntu 22.04, en configurant les paramètres nécessaires pour un fonctionnement optimal, y compris la configuration du réseau et la sécurité. Le script inclut des instructions pour installer les dépendances, configurer Let's Encrypt pour la gestion des certificats SSL, et personnaliser les paramètres de GitLab.

## Pourquoi le projet est utile

Ce projet est utile pour les développeurs et les équipes qui souhaitent déployer rapidement une instance de GitLab pour la gestion de code, l'intégration continue et le déploiement. En utilisant Vagrant, il permet de créer un environnement de développement reproductible et isolé, facilitant ainsi la collaboration entre les membres de l'équipe et réduisant les problèmes liés aux différences d'environnement. La configuration automatique des certificats SSL améliore également la sécurité des projets hébergés.

## Prise en main du projet par les utilisateurs

Pour commencer avec ce projet, suivez ces étapes :

1. **Cloner le dépôt :**
   ```bash
   git clone <URL_DU_DEPOT>
   cd <NOM_DU_DOSSIER>
   ```

2. **Lancer la machine virtuelle :**
   ```bash
   vagrant up
   ```

3. **Accéder à GitLab :**
   Une fois la machine virtuelle démarrée, ouvrez votre navigateur et allez à `http://192.168.33.25` pour accéder à l'interface de GitLab.

4. **Configurer GitLab :**
   Vous pourrez vous connecter avec les identifiants par défaut (admin / admin) et configurer votre instance selon vos besoins.

5. **Arrêter la machine virtuelle :**
   Lorsque vous avez terminé, vous pouvez arrêter la machine virtuelle avec :
   ```bash
   vagrant halt
   ```

6. **Destruction de la machine virtuelle (facultatif) :**
   Si vous souhaitez supprimer la machine virtuelle, utilisez :
   ```bash
   vagrant destroy
   ```

## Remarques

- Assurez-vous que votre réseau est configuré pour permettre l'accès à l'adresse IP `192.168.33.25`.
- La configuration de Let's Encrypt nécessite que le domaine soit correctement configuré pour pointer vers cette adresse IP.

---

N'hésite pas à ajuster ou à ajouter des informations selon tes besoins. Si tu as d'autres questions ou demandes, fais-le moi savoir !
