import '../models/Project.dart';

class ProjectsRepository {
  List<Project> getProjects() {
    return [
      new Project(
          name: "Nutrivali",
          githubLink: "https://github.com/wiltonribeiro/nutrivali-app",
          imageUrl: "nutrivali.png",
          description: "Nutrivali is an App created to help people to remember the expiration date of their foods and then keep healthy and avoid waste food. The app was created with Flutter, and using as services Nutrivali Backend writed in Go and Nutrivali News Service with NodeJS writed in Typescript. The app is already avaible in Play Store."
      ),
      new Project(
          name: "Flutter Explore",
          githubLink: "https://github.com/wiltonribeiro/explore_app",
          imageUrl: "explore.png",
          description: "App concept created with Flutter using Dart programming language, inspired in Multi-Search By Categories by Cuberto. The code was built to better create a real app, identical to the inspiration and with all logic behind it. This app is using Unsplash API as service to search the photos and Shared Preferences to register the favorite user photos in the cache memory. The model's classes were created to better represent an official development, the services classes are responsible for the boundaries of the system like the API and Cache management library. I'm using BLOC pattern as an architectural pattern."
      ),
      new Project(
          name: "Flutter Hamburger",
          githubLink: "https://github.com/wiltonribeiro/hamburger_flutter",
          imageUrl: "hamburguer.png",
          description: "App concept created with Flutter inspired in Tasty Burger by Cuberto. There's no code on the backend or another web service. The app is all contained in this repository. The model's classes were created to better represent an official development, the repositories classes are simulating a web request. I'm using BLOC pattern as an architectural pattern."
      ),
      new Project(
          name: "Grocery Shop Flutter",
          githubLink: "https://github.com/wiltonribeiro/agriext-mobile",
          imageUrl: "grocery.png",
          description: "App concept created with Flutter inspired in Groceries Shopping App Interaction by Cuberto. There's no code on the backend or another web service. The app is all contained in this repository. The model's classes were created to better represent an official development, the repositories classes are simulating a web request. I'm using BLOC pattern as an architectural pattern."
      ),
      new Project(
          name: "AgriExt",
          githubLink: "https://github.com/wiltonribeiro/agriext-mobile",
          imageUrl: "agriext.png",
          description: "AgriExt is a project of the Federal University of Ceará that seeks to help local farmers save water in their plantations by accurately measuring how much water is needed for each type of planting. The application utilizes machine learning, weather station data collection and design principles supported for low literacy people, using color, representative icons and audio description for each application process and on-screen text."
      ),
      new Project(
          name: "Folium Work",
          githubLink: "https://www.folium.work",
          imageUrl: "folium.png",
          description: "Folium Work is an application that connects flexible and individual workers / entrepreneurs to customers seeking the best services in their location. We have as target audience two segments, the Client, the one who seeks in the application to find the perfect professional to solve their need, and the Worker, user who seeks in the application the exposure of their activities, ability and services as a goal to reach an audience greater and consequently greater financial return for their work. This project is currently participating in the startup acceleration program of the government of Ceará."
      ),
      new Project(
          name: "EcoPET",
          githubLink: "https://github.com/wiltonribeiro/ecoPET",
          imageUrl: "ecopet.png",
          description: "The EcoPet is a contest that aims to bring to the Federal University of Ceará - Quixadá Campus, sustainable practices that instill students and educators in projects related to the preservation of the environment, seeking new practices of ecological mobilization within the university, so the awareness and preservation of the environment are strongly discussed among the academic community. The application counts as a social network for the publication of photos with ecological appeal. Users who get the most tanned in their photos by the end of a tag's date (eg #waterday) are awarded."
      ),
      new Project(
          name: "PET - TI Website",
          githubLink: "https://github.com/wiltonribeiro/petti-website",
          imageUrl: "petsite.png",
          description: "I am a member of PET - TI at the Federal University of Ceará. This site was developed with the purpose of helping students of the university to know what the PET group does inside and outside the university. The site was developed using ReactJS."
      ),
      new Project(
          name: "My Portfolio Website",
          githubLink: "https://github.com/wiltonribeiro/wiltonribeiro.github.io",
          imageUrl: "personal.png",
          description: "Hello, as you have seen this is my personal website. All my projects have been shown here so far. The same website was built with ReactJS, and Flutter Web. This current version wal built with Flutter :)."
      ),
    ].toList();
  }
}
