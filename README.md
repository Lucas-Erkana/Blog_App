<a name="readme-top"></a>
<h1> Blog App</h1>


# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 Rails Blog App ](#-My-Blog-App-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [🚀 Live Demo ](#-live-demo-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [❓ FAQ ](#-faq-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 Blog App <a name="about-project"></a>

> The Blog app will be a classic example of a blog website. It is a Microverse project where they required me to create a fully functional website that will show the list of posts and empower readers to interact with them by adding comments and liking posts.

## 🛠 Built With <a name="built-with"></a>
### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Ruby On Rails</summary>
  <ul>
    <li><a href="">Postgresql</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Add User, Post, Like & Comment**
- **List all Users, Posts, Likes & Comments**
- **Sign up**
- **Log in**
- **Reset Password**
- 
<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- Mac or PC
- Code Editor (Vs Code)
- Terminal
- Install [ruby 3.2.2](https://www.ruby-lang.org/en/documentation/installation/) on your computer
- Install [rails](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm#) on your computer
- Install [postgreSQL](https://www.postgresql.org/download/) on your computer

### Setup

Clone this repository to your desired folder:

```sh
  cd your-folder
  https://github.com/Lucash2022/Blog_App.git
```

### Install

Install this project with:

- GitHub Actions
- Linters
  - Rubocop
- Ruby On Rails

### Usage

- Run `bundle install` in the terminal from the root folder of the project.
- Run `rails db:create` in the terminal from the root folder of the project.
- Run `rails db:migrate` in the terminal from the root folder of the project.
- Run the app with `rails c` in the terminal from the root folder of the project.
- Create a new user
```sh
User.create(name: 'Lucas', bio: 'Full stack developer from Namibia', photo: 'https://ca.slack-edge.com/T47CT8XPG-U03PBVD9PAS-26c072588661-512', posts_counter: 0)
```
- Run the server with `rails s` in the terminal from the root folder of the project.


### Test

```sh
  rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Lucas Erkana**

- GitHub: [@Lucash2022](https://github.com/Lucash2022)
- Twitter: [@Lucas_David_22](https://twitter.com/@Lucas_David_22)
- LinkedIn: [Lucas Erkana](https://www.linkedin.com/in/lucas-erkana/)
- Frontend Mentor - [@Lucash2022](https://www.frontendmentor.io/profile/Lucash2022)

👤 **Saba Ahmad**

- GitHub: [@SabaAhmad404](https://github.com/SabaAhmad404)
- LinkedIn: [Saba Ahmad](https://www.linkedin.com/in/saba-ahmad-97b938244/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Create Users**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/lucash2022/Blog-app/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, please leave a ⭐️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank Microverse for providing the reading materials that aided me during the project development

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ <a name="faq"></a>

- **Can I use this code?**

  - yes, it is open source. Feel free to fork it.

- **Can I contribute to this project?**

  - Contact me so I can add you as a collaborator. Alternatively you can leave an issue, it will be well appreciated.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
