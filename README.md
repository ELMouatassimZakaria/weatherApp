# weatherApp
## Getting Started

L’application est décomposée en 2 modules :
- Une partie Composant (WeatherNetworking) : Récupère les informations météo depuis une API
- Une partie UI (Application) : Affiche les informations provenant du composant

  L’application est composée de 3 écrans :
  - Une liste affichant la liste des villes ajoutées par utilisateur
    
  - Une vue pour ajouter une ville
  
  - Une vue détail affichant les différentes informations météo d’une ville.
 
  ## Architeture

 * Pour implémenter le projet, j'ai opté pour le design pattern MVVM.

 ## Mode offline.

   l'application  Persiste les données afin de pouvoir l'utiliser en mode offline.

  ## Unit test.
  
  L'application est testée unitairement pour la partie "Composant WeatherNetworking", ainsi que la partie "Application" avec l'utilisation   du framework XCTest.


  ## Diagrammes de séquence

  Diagrammes de séquence le Composant  Météo(WeatherNetworking):
 
 Vous trouverez sur le lien le diagramme de séquence du composant WeatherNetworking, ainsi que la documentation pour son utilisation : [[lien](https://docs.google.com/document/d/1_DJZDQFohidakwHFoRa1SKzlSTNfTF911cIsdIqCE40/edit#heading=h.hxrmuzl83p56)].
 
