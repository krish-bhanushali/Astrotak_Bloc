<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
***
***
***
*** To avoid retyping too much info. Do a search and replace for the following:
*** github_username, repo_name, twitter_handle, email, project_title, project_description
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/krish-bhanushali/Astrotak_Bloc">
    <img src="assets/logo.png" alt="Logo" width="80" height="80">
  </a>
    <h2 align="center">Astrotak</h2>
  <h3 align="center">App to find and talk with well-known astrologers</h3>
   <h4 align="center">By</h4>
  <h3 align="center">Krish Bhanushali</h3>
   <h3 align="center">PANDIT DEENDAYAL ENERGY UNIVERSITY ,GANDHINAGAR </h3>

  


  <p align="center">
    The journey of building this app was amazing and I learned a lot.
   </p>
    <br />
    <a href="https://github.com/krish-bhanushali/Astrotak_Bloc"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/krish-bhanushali/Astrotak_Bloc">View Demo</a>
    ·
    <a href="https://github.com/krish-bhanushali/Astrotak_Bloc/issues">Report Bug</a>
    ·
    <a href="https://github.com/krish-bhanushali/Astrotak_Bloc/issues">Request Feature</a>
 
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Difficulties Faced</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Things that can be improved upon</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project




<h6 align="center">Goals Achieve in the Project</h6>

<p>
Use of Bloc architecture is demonstrated and consist of two screens:
- Panchang Screen : that is home page by default takes today's date or can be altered, 
Supports a suggestion box for location autocomplete made using custom overlay.
Results in Panchang and displays beautifully 

</p>
<p>

- Talk to Astrologer Screen: 
Fetches Astrologers on the app start. 
Functionalities:
- 1. Search : User Can Search an astrologer from name, skills, language
- 2. Filter : Here I have assumed only static filters as no documentation or end point was provided for the languages or skills so I have assumed English,Hindi as Languages and Falit Jyotish,Astrology as skills
- 3. Sort : Sort Functionality is implement based on price and experience from high to low or low to high
</p>

### Difficulties Faced
- I spent most of the time figuring about type_ahead package as it dealt with only futures no way possible to display the search results as blocs returned stream which only got updated when it got data so autocomplete was having a lag 
(Solved using a custom overlay and building using streams(nice Idea for a package))

- Bloc is bit lengthy but its super assuring as although there are lots of boilerplate stuff its just states and events that would only happen no unpredictable things

- Failed to manage time but I will make this as a task and improve my code as well
- It was at first difficult to transfer from getx to bloc as my whole code needed an architecture and thinking I also spent a lot of time to how I can mitigate the custom error with response from base layer to bloc and display on the ui








<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Things that can be improved upon

- UI can be improved, as I only focused on functionality
- App Size can be reduced by use of SVGs 
- Catched Network Image Can be used for Astrologer Images
- Pull to refresh for Astrologer fetching
- Documentation can be improved
- Profile of astrologer can be shared using share_plus
- Deeplinking can be done to go to astrologer profile directly that is a astrologers can then generate qr codes for this
- Many Corner Cases are pending and can be handled easily as we now know all the states
- Tests are to be written 
- Internet states can also be handled
- local caching can be done for search when there is no internet
- push notifications, feedbacks and updates features can be introduced 


### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/krish-bhanushali/Astrotak_Bloc.git
   ```
2. cd to the folder
3. ```sh code .```

4. ```sh flutter pub get```
5. Fix Imports
6. ```sh flutter run```




<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/krish-bhanushali/Astrotak_Bloc/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

If you become a Collaborator Please Refer `Collaborator` for more information 



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

I solve doubts at Stack overflow -  [Ping Me whenever you need](https://stackoverflow.com/users/13220817/krish-bhanushali)
Your Name - [@twitter_handle](https://twitter.com/krishbhanushal8) - bhanushali123krish@gmail.com

Project Link: [https://github.com/krish-bhanushali/Astrotak_Bloc](https://github.com/krish-bhanushali/Astrotak_Bloc)









<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/krish-bhanushali/DMatrix.svg?style=for-the-badge
[contributors-url]: https://github.com/krish-bhanushali/DMatrix/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/krish-bhanushali/DMatrix.svg?style=for-the-badge
[forks-url]: https://github.com/krish-bhanushali/DMatrix/network/members
[stars-shield]: https://img.shields.io/github/stars/krish-bhanushali/DMatrix.svg?style=for-the-badge
[stars-url]: https://github.com/krish-bhanushali/DMatrix/stargazers
[issues-shield]: https://img.shields.io/github/issues/krish-bhanushali/DMatrix.svg?style=for-the-badge
[issues-url]: https://github.com/krish-bhanushali/DMatrix/issues
[license-shield]: https://img.shields.io/github/license/krish-bhanushali/DMatrix.svg?style=for-the-badge
[license-url]: https://github.com/krish-bhanushali/DMatrix/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/krish-bhanushali/